//popular listings section on the home page
let currentImage = 0

      showImage(currentImage)
      setInterval(()=>{
        if(currentImage==3){
          currentImage = 0
        }else{
          currentImage++
        }
        showImage(currentImage)
      },3000)

      function showImage(index){
        document.querySelectorAll(".images-grid").forEach(grid=>{
        const images = grid.querySelectorAll("img")
        images.forEach(img=>{
          img.style.display = "none"
        })
        console.log("hiddd");
        images[index].style.display= "block"
      })

      }
//end of the popular listings section      