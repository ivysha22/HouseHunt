//connect to express js
const express = require("express");
const session = require("express-session");
const server = express();
const mysql = require("mysql");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs"); // bcrypt declaration after we npm install bcrypt
const salt = bcrypt.genSaltSync(3);
const { Agent } = require("http");
const multer = require("multer");
const upload = multer({ dest: "public/listingimages" });
const profile = multer({ dest: "public/profilepic" });
require('dotenv').config()
// Import MySQL
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "househunt",
});
// Connect to MySQL and handle errors
connection.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);

    // Redirect to the 500 error page if there's a connection error
    return server.get("/", (req, res) => {
      res.render("500.ejs"); // Redirect to the predefined /500 route
    });
  }
  console.log("Connected to MySQL database.");
});

//express-session
server.use(
  session({
    secret: "ivy",
    resave: false,
    saveUninitialized: false,
  })
);

// Session middleware
server.use((req, res, next) => {
  res.locals.user = req.session.user;
  res.locals.isLoggedIn = req.session.isLoggedIn;
  if (req.path == "/account" && req.session.role == "owner") {
    res.locals.modify = true;
  }

  if (
    !req.session.isLoggedIn &&
    [
      "/account",
      "/profile",
      "/update-profile",
      "/addnewproperty",
      "/myproperties",
    ].includes(req.path)
  ) {
    res.render("401.ejs");
  } else {
    if (
      req.session.role !== "admin" &&
      ["/adminsonly", "/agent", "/owner"].includes(req.path)
    ) {
      res.render("401.ejs");
    } else {
      next();
    }
  }
});

// Parse incoming JSON requests
server.use(bodyParser.json());

// Set up EJS,middleware and public folder
server.set("view engine", "ejs");
server.use(express.static("PUBLIC"));
server.use(express.urlencoded({ extended: true }));

// Home route
server.get("/", (req, res) => {
  console.log("home/root/index/landing page");
  res.render("home.ejs");
});

// about route
server.get("/about", (req, res) => {
  console.log("about page");
  res.render("about.ejs");
});

// listings route
server.get("/listings", (req, res) => {
  console.log("listings page");
  res.render("listings.ejs");
});

//contact route
server.get("/contact", (req, res) => {
  console.log("contact page");
  res.render("contact.ejs");
});

//contact post route
server.post("/contact", (req, res) => {
  const { name, email, phone, message } = req.body;

  const sql =
    "INSERT INTO contact (name, email, phone, message) VALUES (?, ?, ?, ?)";
  const values = [name, email, phone, message];

  connection.query(sql, values, (err, result) => {
    if (err) {
      console.error("Error saving the message:", err);
      res.status(500).send("Something went wrong!");
    } else {
      res.render("result.ejs", { name: name });
    }
  });
});

//signup get route representing the login and signup forms
server.get("/signup", (req, res) => {
  res.render("signup.ejs");
});

// signup post route and authenticate the user information with the data present in the database
server.post("/signup", profile.single("profile"), (req, res) => {
  const {
    id,
    fullname,
    email,
    contact,
    agency,
    address,
    businessname,
    password,
    role,
  } = req.body;
  console.log(req.body);

  const hashedPassword = bcrypt.hashSync(password, salt);

  let sql = "";
  if (role === "agent") {
    sql = `INSERT INTO agent (agents_id, fullname, email, contact, agency, password)
           VALUES (${id}, "${fullname}", "${email}", "${contact}", "${agency}", "${hashedPassword}","${req.file.filename}")`;
  } else if (role === "client") {
    sql = `INSERT INTO client (client_id, fullname, email, contact, address, password)
           VALUES (${id}, "${fullname}", "${email}", "${contact}", "${address}", "${hashedPassword}","${req.file.filename}")`;
  } else if (role === "owner") {
    sql = `INSERT INTO owner (owner_id, fullname, email, contact, address, businessname, password,PROFILE)
           VALUES (${id}, "${fullname}", "${email}", "${contact}", "${address}", "${businessname}", "${hashedPassword}","${req.file.filename}")`;
  } else {
    return res.redirect("/signup?error=role");
  }

  connection.query(sql, (error) => {
    if (error) {
      res.render("500.ejs");
    } else {
      res.redirect("/login?message=Signup successful! Please log in.");
    }
  });
});
//now the code takes  you to the login page

//login get route
server.get("/login", (req, res) => {
  if (req.session.isLoggedIn) {
    return res.redirect("/account");
  } else {
    const message = req.query.err
      ? "Registration failed! Please try again."
      : null;
    res.locals.success = req.query.message;
    console.log("GET /login message:", message); // Debugging
    res.render("login.ejs", { message, LoginError: null });
  }
});

//login post route
server.post("/login", express.urlencoded({ extended: true }), (req, res) => {
  const { loginemail, pass, role } = req.body;

  if (
    loginemail ===process.env.ADMIN_EMAIL &&
    pass === process.env.ADMIN_PASS &&
    role === "admin"
  ) {
    req.session.isLoggedIn = true;
    req.session.user = { email: process.env.ADMIN_EMAIL, fullname: "Admin" };
    req.session.role = "admin";
    return res.redirect("/adminsonly");
  }

  let emailCheck = "";
  if (role === "agent") {
    emailCheck = `SELECT * FROM agent WHERE email = ?`;
  } else if (role === "client") {
    emailCheck = `SELECT * FROM client WHERE email = ?`;
  } else if (role === "owner") {
    emailCheck = `SELECT * FROM owner WHERE email = ?`;
  } else {
    return res.render("login.ejs", {
      LoginError: "Incorrect email or password. Try again!",
    });
  }

  connection.query(emailCheck, [loginemail], (err, data) => {
    if (err) {
      return res.status(500).render("500.ejs");
    }

    if (data.length === 0 || !bcrypt.compareSync(pass, data[0].password)) {
      return res.render("login.ejs", {
        LoginError: "Incorrect email or password. Try again!",
        message: null,
      });
    }

    req.session.isLoggedIn = true;
    req.session.user = data[0];
    req.session.role = role;
    res.redirect("/account");
  });
});
//done admin can now login and  redirect to admin page

//admin get route
server.get("/adminsonly", (req, res) => {
  res.render("admins.ejs");
});

//account get route
server.get("/account", (req, res) => {
  // req.session.role --- ejs
  if (req.session.role === "agent") {
    res.render("agent.ejs", { agent: req.session.user });
  } else if (req.session.role === "owner") {
    res.render("owner.ejs", { owner: req.session.user });
  } else if (req.session.role === "client") {
    res.render("client.ejs", { client: req.session.user });
  } else res.render("admin.ejs");
});

server.get("/profile", (req, res) => {
  //selec
  connection.query(
    `select * from owner where owner_id = ${req.session.user.owner_id}`,
    (err, data) => {
      if (err) return res.status(500).render("500.ejs");
      console.log(profile);
      if (req.query.updateSuccess) {
        res.render("profile.ejs", {
          profile: data[0],
          Updatesuccess: "Changes saved succesfully!!",
        });
      } else {
        res.render("profile.ejs", { profile: data[0] });
      }
    }
  );
});


server.post("/update-profile",profile.single("profile"), (req, res) => {
  const { fullname, email, contact, address, businessname } = req.body;
  const Updatesql = `UPDATE owner SET PROFILE=?,fullname = ?, email = ?, contact = ?, address = ?,businessname = ? WHERE owner_id = ?`;
  const params = [
    req.file.filename,
    fullname,
    email,
    contact,
    address,
    businessname,
    req.session.user.owner_id,
  ];
  console.log("Session User:", req.session.user); // Check the session user
  connection.query(Updatesql, params, (err, data) => {
    if (err) {
      return res.status(500).render("500.ejs");
    }
    return res.redirect("/profile?updateSuccess=true");
  });
});

server.get("/addnewproperty", (req, res) => {
  connection.query(`SELECT * FROM agent `, (err, data) => {
    if (err) {
      return res.status(500).render("500.ejs");
    } else {
      if (req.query.updateSuccess) {
        //const firstImage = uploadimages[0];
        res.render("newproperty.ejs", {
          data,
          Updatesuccess: "Property added successfully!!!",
        });
      } else {
        console.log(data);

        res.render("newproperty.ejs", { data: data });
      }
    }
  });
});

server.post("/addnewproperty", upload.array("uploadimages"), (req, res) => {
  const {
    myAgent,
    price,
    propertyname,
    propertyaddress,
    propertytype,
    beds,
    garden,
    swimming,
    backyard,
    balcony,
    gym,
    parking,
    housekeeping,
    elevator,
    pet_friendly,
  } = req.body;

  const uploadimages = req.files.map((file) => file.path);

  const outdoorFeatures = [
    garden && "Garden",
    swimming && "Swimming",
    backyard && "Backyard",
    balcony && "Balcony",
  ]
    .filter(Boolean)
    .join(", ");

  const amenities = [
    gym && "Gym",
    parking && "Parking",
    housekeeping && "Housekeeping",
    elevator && "Elevator",
    pet_friendly && "Pet-Friendly",
  ]
    .filter(Boolean)
    .join(", ");

  const sql = `
    INSERT INTO listings (owner_id,agents_id,price, businessname, location, property, bedrooms, outdoor, amenities, listingimages)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?)`;

  const values = [
    req.session.user.owner_id,
    myAgent,
    price,
    propertyname,
    propertyaddress,
    propertytype,
    beds,
    outdoorFeatures,
    amenities,
    uploadimages.join(", "),
  ];

  console.log(values);

  connection.query(sql, values, (err, result) => {
    if (err) {
      return res.status(500).render("500.ejs");
    } else {
      res.redirect("/addnewproperty?updateSuccess=1");
    }
  });
});

server.get("/myproperties", (req, res) => {
  const ownersid = req.session.user.owner_id;
  const sql = `SELECT * FROM listings WHERE owner_id = ?`;
  connection.query(sql,[ownersid] ,(err, results) => {
    if (err) {
      return res.status(500).render("500.ejs");
    } else {
      res.render("myproperties.ejs", { results });
    }
  });
});

server.get("/logout", (req, res) => {
  req.session.destroy((err) => {
    if (err) return res.status(500).render("500.ejs");
    res.redirect("/");
  });
});

//500 route
server.get("/500", (req, res) => {
  res.status(500).render("500.ejs"); // Render the 500.ejs template with status 500
});

//404 route
server.get("*", (req, res) => {
  console.log("unidentified route");
  res.render("404.ejs");
});

// Start the server
server.listen(3001, () => console.log("starting server on port 3001"));
