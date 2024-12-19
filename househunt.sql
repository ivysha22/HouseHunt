-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 02:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `househunt`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agents_id` int(11) NOT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `agency` varchar(100) DEFAULT NULL,
  `PROFILE` varchar(255) DEFAULT 'avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agents_id`, `fullname`, `email`, `contact`, `password`, `agency`, `PROFILE`) VALUES
(1, 'John Doe', 'johndoe@example.com', '0712345678', NULL, NULL, 'avatar.jpg'),
(2, 'Jane Smith', 'janesmith@example.com', '0723456789', NULL, NULL, 'avatar.jpg'),
(3, 'Alice Johnson', 'alicejohnson@example.com', '0734567890', NULL, NULL, 'avatar.jpg'),
(2135, 'Jordan Doe', 'jordan@gmail.com', '0798912929', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'DreamScape Realty', 'b2da0044d0ce242e8ffab74f97ec202c'),
(2243, 'Omari Jana', 'omari@gmail.com', '0723093092', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'Elite Haven Group', '3da5641c91d0378e4de65ffb33863d16'),
(12324, 'Zane Maverick', 'zane@gmail.com', '0723830920', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'Gateway Agency', '5e75290eea4f461a1cb119db6ff0d1f9'),
(34298, 'Tyler Quota', 'tyler@gmail.com', '0719029092', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'Vista Agency', '217d1c5f0e11349f8dbe1072761c520c'),
(42151, 'Amani Novari', 'amani@gmail.com', '073203993', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'New Leaf Real Estate', '28299898170593476f9f24d8b412d793'),
(122243, 'Aria Williamson', 'aria@gmail.com', '073209039', '$2a$04$sM23EfU/RBKV3DcNYHpnWu3C.6FUCf9EoLFmJi14pzovt.6TrlRN2', 'NextNest Agency', '1c8aa7a2bdbd2125159359e86d9d03f8');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `contact` varchar(35) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `PROFILE` varchar(255) DEFAULT 'avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `fullname`, `email`, `contact`, `address`, `password`, `PROFILE`) VALUES
(0, 'Freya', 'freya@gmail.com', '0789898989', '145 Caren', '$2a$04$80bphqAfIG0j37b6Ua6NB.3k2.Whgt07nUlExRlBx.kFczvW02cAm', 'c4443b114c2fdcc0bc64a30925222bbf'),
(1, 'Willis Raburu', 'willisraburu@gmail.com', '0712345678', '523 Main Street, Elgonview', NULL, 'avatar.jpg'),
(2, 'Lupita John', 'lupitajohn@gmail.com', '0723456789', '456 Uganda Road, Annex', NULL, 'avatar.jpg'),
(3, 'Barry Johnson', 'barryjohnson@gmail.com', '0734567890', '789 Oak Lane, Roady', NULL, 'avatar.jpg'),
(123, 'grace', 'grace@gmail.com', '123334444', '1234455', '$2a$04$zRsQ//dCO9F6FJ1fZpMpJOCXmWaJZIV9etkh4l9SGPNi/IPHizK6i', 'avatar.jpg'),
(767, 'yty', 'a@a.b', 'ugyhg', 'jbj', '$2a$04$9YBE9PCKedwQzfDxdwbpvOtCNEHkLo5Dxp7W5HmqyJ6aDxhe6V8KW', 'avatar.jpg'),
(1111, 'row', 'r@gmail.com', '072982123', 'ruaka', '$2a$04$VfzzlVV8523t4cBt23fjtuzs8oYDMXK/SoB5FYiSBhSr.1pDJ/1Z2', 'avatar.jpg'),
(2222, 'angel', 'angel@gmail.com', '079327983', '12345', '$2a$04$VfzzlVV8523t4cBt23fjtuzs8oYDMXK/SoB5FYiSBhSr.1pDJ/1Z2', 'avatar.jpg'),
(2345, 'p', 'p@gmail.com', '1234567', '123435', '$2a$04$MiWQj4o88.UIjhebOnbjX.nV/Ev2TSR9jJjSJ/4U1aux2CzIvukxy', 'avatar.jpg'),
(5555, 'caren joy', 'joy@gmail.com', '0765663434234234', '123 eldy', '$2a$04$4VtjRs6wi/QOAKC0zEb83.HQVoi9A6TVdNN68tEeaqTirucyNQ6Hq', 'avatar.jpg'),
(7676, 'ututy', 'a@d.b', 'uiii', 'hvh', '$2a$04$9YBE9PCKedwQzfDxdwbpvOMM99FFmtF/ziGr076GEB1IbvBs0Gtpe', 'avatar.jpg'),
(12213, 'res', 'res@gmail.com', '089782378', '1332 ffse', '$2a$04$ONXPp2wC1hmNvkLLyzskZ.Hsn4ZSMcvUsE72WzspjuBcqwcF6e9gO', 'avatar.jpg'),
(12324, 'qwerdf', 'q@gmail.com', '123456', '2134567', '$2a$04$kOazCwjBVRzy62aCvRr4MuLbYK4LL4Xo5U130Xu4ybIRv0H.dpvQK', 'avatar.jpg'),
(12345, 'ivysha', 'ivy@gmail.com', '07289038', '123 ruaka', '$2a$04$JtQAnmi1M3PFi/eT0pN3YO2XOfG/SYrltOzf3buKmNnGQDaQ0.qPu', '7f5bcbb2126e56005b7e4e4a9962276e'),
(123445, 'Kim Kardashian', 'kim@gmail.com', '07098734673', '123 street', '$2a$04$rg5ix0f7t5ao/b/430JZceW7LDNw7mxseuuW3W0FIfgFQym3WfvIW', 'a452e1f4d1ae1e67a446879d18fd9a17'),
(1223343, 'yy', 'yy@gmail.com', '0897654', '1231425367', '$2a$04$dwCd0UU3nP89bF6IOpGt..RU5i/G0B0XwoszwWIGOyl3CNPk21sei', 'avatar.jpg'),
(12235134, 'sha', 'icy@gmail.com', '224365367', '212453647', '$2a$04$7TlKrzYEZKkl22iNq3qh9OW8zjVKX2y2ncrVh.e2uRFo9ylGmdnjK', 'avatar.jpg'),
(12345678, 'ivan', 'ivan@gmail.com', '0734567890', '1234354', '$2a$04$ta7adsuXC3asrelp9ZIiuOmDwLUyTuX5CUeuWSu7N2SebI7e18dcK', 'avatar.jpg'),
(123245365, 'valentine', 'val@gmail.com', '0798765432', '123 Heaven', '$2a$04$O9/n1ry5doJ/AgElOHJ3d.l340VM/VnDDymCu1g6/nCOdUB42mcf6', 'avatar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `phone`, `message`) VALUES
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('ivy sha', 'ivysha22@gmail.com', '0719250361', 'Great service I love the house!!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('sharon ivy', 'sharoncherop228@gmail.com', '0719250361', 'thankyou for the great services!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('Doreen', 'doreen@gmail.com', '0729228373', 'Thanks the agent was nice and gave me everything i needed!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('shaa', 'sha@gmail.com', '07188822892092', 'thankss!!!'),
('ivy', 'ivy@gmail.com', '07896564545', 'thankyouuu!!!!'),
('domingo', 'domingo@gmail.com', '072928292', 'great!!!!'),
('nelly', 'nelly@gmail.com', '07209378783', 'great service!!!\r\n'),
('loreen', 'loe@gmail.com', '0782654525', 'thanks found a home!!!'),
('sam', 'sm@gmail.com', '0789765432', 'thanks!!');

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `agents_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `bedrooms` int(11) DEFAULT NULL,
  `availability` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `businessname` varchar(100) DEFAULT NULL,
  `property` varchar(50) DEFAULT NULL,
  `outdoor` varchar(100) DEFAULT NULL,
  `amenities` varchar(100) DEFAULT NULL,
  `listingimages` text DEFAULT 'avatar.jpg',
  `listing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`agents_id`, `owner_id`, `client_id`, `location`, `bedrooms`, `availability`, `price`, `businessname`, `property`, `outdoor`, `amenities`, `listingimages`, `listing_id`) VALUES
(2, 12345, NULL, '540 Kipchamo', 1, NULL, 20000, 'Lewis Estates', 'apartment', 'Swimming, Balcony', 'Gym, Parking', '045edfc3921ce41ef23de1dc596cbf37,ffe838c9c6b87da93a27ffba6a97318d,ff43ca2d929b7d4f96ab083e8b7e27d4,8741a71bfaec62a2e72e64cb430a1a67', 37),
(12324, 1234455, NULL, 'Pioneer', 0, NULL, 15000, 'PrimePath Realty', 'studio', '', 'Parking', 'ddaea713aae97eeb78f7986071cf66db,68651e8e2bf3c8f311bb0c7bd222aacf,0b87aa4a4e658713e64b4e98ef10e247,514a0f95be1760937e2d4765435ca609', 38),
(12324, 1234455, NULL, 'Elgon View', 2, NULL, 2000000, 'Golden Key', 'house', 'Garden', '', '6bcc196f03ef2fe6b87252dfefb7a154,7f70d9fcc8ecf1725f5264eea5806407,d68be58aea5002ed517ea8e9654971e9,bc1315af93efc3e356d78eb5b81cedd8', 39),
(12324, 1234455, NULL, 'Kapsoya', 2, NULL, 40000, 'Horizon Home Seekers', 'apartment', '', 'Elevator', 'f39e742f8987b15e622fc083f28421a4,a182f746a4904829d35048c5199226b2,9726ac86eafede0eba255d9e85c93c28,336261d50455030450dba51aa3adb70d', 40),
(122243, 12345, NULL, 'West Indies', 2, NULL, 1000000, 'Urban Nest Realty', 'townhouse', 'Garden', '', '99db2a153e1805b7b6e70592015bfd0f,d8db42b49f56ba72d3c6b422775bf796,060d55b16e1dd8dcf9e0e12451bf09a3,59202658b83cbcac0a4f1fc9822e9ee9', 41),
(122243, 12345, NULL, 'Racecourse', 2, NULL, 1500000, 'Summit Realty Group', 'condo', 'Balcony', 'Parking', 'cd8c367c4d36811687fab35b094d224a,beae13a155efe106eba01bffaaaa0a17,909e9baeb106c14dce8bdb5faa1ee459,095fb21cef653dedf4318994d3e68e33', 42),
(122243, 12345, NULL, 'Maili Nne', 3, NULL, 2500000, 'Dreamscape Properties', 'house', 'Garden', 'Parking', 'f34ed922e151e0e2940d68c668f122e8,9444acfc4f796d671e69b6157349db90,6a830811e268d76e896c0fd182889c37,385be418e57507704985afd862b2195c', 43),
(2135, 12345, NULL, 'Huruma', 1, NULL, 1200000, 'Landmark Realty Co.', 'condo', 'Swimming', 'Gym', 'cd3f43522537d8bfbbdf8ac7b2f813d2,b51ae8d2853e551e83a0a00b130ccc91,12a52c0a00cf889a69e3d5286796c6e5,4610dfb0e701700bf741c082a731e6cb', 44),
(2135, 12345, NULL, 'Kimumu', 1, NULL, 20000, 'Gateway Estates', 'apartment', 'Garden, Swimming', 'Elevator', '099cb1ec71810642c3385b70153741da,785c99a5fb6b566d03203e58da038ed0,32dd5da575348081ab332a1b87baabd2,85473e1da4a671e6114e1d4b2f0342f2', 45),
(2, 5431, NULL, 'Annex', 2, NULL, 13000000, 'Homeward Bound Realty', 'condo', 'Garden, Swimming', 'Parking, Housekeeping', '75c7b94ad049e9db36cc1b716a125519,56f5eb1802fb4fae4b8dc11f997c3def,ce04df00d9e07e59bfff420e833a18ce,de8562fa355dc83ae9a8e967b4c9e36d', 46),
(2, 5431, NULL, 'Chepkoilel', 1, NULL, 30000, 'Vista Living Agency', 'apartment', 'Garden, Swimming', 'Elevator', 'a324a4fee47432850914bc209eb5b4cc,a12809c0743c007ce3f9a54dc99f78ce,9817affd333929945d3fdfd33af0d248,790ab4cd32b0ef4aa8bb79d0cc1c6a5c', 47),
(2, 5431, NULL, 'Outspan', 2, NULL, 1500000, 'Harborstone Realty', 'house', 'Backyard', 'Parking', '69cfc6d95bd4b4c3518fa4ef876580b1,e1f6f3816a37456029b985a9e70ea3e0,c53ba620b4bfcc6e2b7b0a3cfeacc2c3,317e5fb316520fc1bb68b9982303cf2d', 48),
(34298, 4655555, NULL, 'Kipkorgot', 2, NULL, 1000000, 'Elite Haven Group', 'townhouse', 'Swimming, Backyard', 'Parking', '1c53edc74174ae581511aa4be7cf4ec9,f93cbd73743f6a3dc1fc59fdd13eb050,4128d3c3209c36fc6b54404e4740c832,fcd6c7a644ab6133d838c091276b2a12', 49),
(34298, 4655555, NULL, 'Ziwa', 0, NULL, 10000, 'New Leaf Real Estate', 'studio', 'Balcony', 'Parking', '24fdf605ce42456981f8a65514ce8533,b06899a2b7fb66d379aca4cf558822ed,1c79ae98dbddd3eadfaf2b1dc77b1046,78c9d56b99a19e2716619acab099ffc7', 50),
(34298, 4655555, NULL, 'Outspan', 2, NULL, 30000, 'Timberline Properties', 'apartment', 'Swimming', 'Gym', '8aaf38d8942452ef84a38c0183ad44ac,b6b1f471670ae3aa347b34098c089bdc,ee7c68c3903b97175b18e50ebe6b6f1b,e2849a4b76015c99c94e8ae4eb977a58', 51),
(2243, 1455, NULL, 'Kapsoya', 3, NULL, 3000000, 'TrueNorth Realty', 'house', 'Garden, Swimming', 'Parking', 'edc32bd92affa0a34d152ce9d85c3548,f920ba7ad23e7b9e42f11d42237d88be,db1953e2705f2a25c81f6b7097069523,4cd98add4a6e3b6a31f1a97794aa366f', 52),
(2243, 1455, NULL, 'West Indies', 2, NULL, 1300000, 'Sapphire Living Agency', 'condo', 'Backyard', 'Housekeeping, Elevator', '471a1d30040a76581310b898ecdbaaec,20af510bf083ad348ea43f72f98cd4d9,c90350a9738f731e898395a414f20f70,9fb693343b9f9b724eef62bd92552aa4', 53),
(2243, 1455, NULL, 'Pioneer', 1, NULL, 20000, 'Sunrise Villas', 'apartment', 'Balcony', 'Housekeeping, Elevator', '22b02fb1b8b58ffc786fd8fd62351dbc,d5ade80121a5eebf697a31f4f2bdf280,561763638f276d513f60e4055260c0ce,fd56b6200ecbd62756912d754116a138', 54),
(42151, 1455, NULL, 'Racecourse', 1, NULL, 15000, 'Bluebell Retreat', 'apartment', 'Swimming', 'Gym, Elevator', '9b33a6ee23ac81449cbabf0af5af9794,95f09f8a9389e60df4c441e5db4aa72f,4612457616d26127cd31d001b11133ea,83c10b8af410052bbb64d78cae893460', 55),
(42151, 1455, NULL, 'Huruma ', 0, NULL, 10000, 'Lakeside Manor', 'studio', '', '', '931c7ee5c434d15f1097d84b12ac9772,5b75c25102a25795f31fbf8eb0852aff,aa56f9b3bae6172a3d12c16a7da3761e,6a911fde65b55328ad052ba732a352d8', 56),
(42151, 1455, NULL, 'Annex ', 2, NULL, 1600000, 'Hilltop Estates', 'house', 'Garden', 'Parking, Elevator', '781495dd79f785ea92dd8a8929a2e2e6,ce153a8b3b81014ce7e2bc257d2d1418,b5e03eee8adda80b45f4ea5b678b17e4,28d7ef3279002d4854825bd79062ecee', 57),
(3, 4309404, NULL, 'Kapsoya', 1, NULL, 15000, 'Golden Horizon', 'apartment', 'Swimming', 'Gym, Parking', '07db2f2546447dd16651dd11d545ddf0,423000b61243ab05d0a2001ad32c39a4,88c7f06274e20af0d89d108d53683fd5,3f358afc2eaa229ccd42354d426e3735', 58),
(3, 4309404, NULL, 'Pioneer', 0, NULL, 10000, 'Aspen Creek Residences', 'studio', '', 'Parking', '2eee35b6d3744e9c55037095d9839727,352b0264c28687a1956a15d80df90356,9affc95f28b0e9928300dc07d27d25f6,f3cc7cdb436a02dc52e65ec6f5af63e8', 59),
(1, 4309404, NULL, 'Pioneer', 2, NULL, 1600000, 'Willowbrook Homes', 'house', 'Garden', '', 'bf36f14510c313119a5fea84338f9cfb,527f3717226b246b40b454be24b936ea,9518f5884034038d625ba0b2af32be27,781af050603680c2b20ea5a05347a50f', 60);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `recipient`, `message`, `timestamp`) VALUES
(1, 'lewis', 'ivy', 'hi ivy', '2024-11-23 16:22:28'),
(2, 'lewis', 'ivy', 'hi ivy', '2024-11-23 16:22:37'),
(3, 'lewis@gmail.com', 'johndoe@gmail.com', 'hi john ', '2024-11-23 16:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `businessname` varchar(100) DEFAULT NULL,
  `PROFILE` varchar(255) DEFAULT 'avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `fullname`, `email`, `contact`, `address`, `password`, `businessname`, `PROFILE`) VALUES
(1, 'Ivy Sha', 'ivysha@gmail.com', '0712345678', '523 Main Street, Kambikuku', NULL, NULL, 'avatar.jpg'),
(2, 'Dylan Njoroge', 'dylannjoroge@gmail.com', '0723456789', '456 Uganda Road, Rehema', NULL, NULL, 'avatar.jpg'),
(3, 'Marion Chela', 'marionchela@gmail.com', '0734567890', '789 Oak Lane, Marura', NULL, NULL, 'avatar.jpg'),
(1455, 'Grace', 'grace@gmail.com', '072930938', '92390 moana', '$2a$04$dHyPOpkiFxmA47lzQkvRaO/lW5nYO0886kUldaqOCOD0MUl1/x6L.', 'Grace International', '4c41f5bb034f5181b67cb7ae72b0d759'),
(5431, 'Freyar', 'freya@gmail.com', '0789898989', '145 Caren', '$2a$04$e7bvtnYO51Ol9ft6oRwTjuFXtvyh8BiYeKwVf8HuPj.lx3JWR1SPG', 'Freya Properties', 'd62c13bb3b21321fc54a0d979c0947db'),
(12345, 'lewis kibet', 'lewis@gmail.com', '0717481718', '21345', '$2a$04$SFXiWjjjQ7vBXCbYylIaAeapkuwzbHf9RvCX2yRjlZcWO3ufBwye6', 'Lewis International', '1d4a06805461a0fabfae05ccb4dd1c28'),
(1234455, 'billy', 'billy@gmail.com', '0709876345', '123 fifa', '$2a$04$jAhNnctLzaAVr7hwGU952O4BliQewY.vxNNYWxmWA3.sxForKkbRi', 'Fifa International', '55f071c4fb5477f02ad56e9338204289'),
(4309404, 'Nova', 'nova@gmail.com', '07289398', '213 Jamboni', '$2a$04$dHyPOpkiFxmA47lzQkvRaO/lW5nYO0886kUldaqOCOD0MUl1/x6L.', 'Nova International', '090613718fd84b76da69489a568fda21'),
(4655555, 'Henry', 'henry@gmail.com', '0720930913', '323 Beyond ', '$2a$04$dHyPOpkiFxmA47lzQkvRaO/lW5nYO0886kUldaqOCOD0MUl1/x6L.', 'Henry Properties Limited', '6ffc8d8264b24c6be00eeb00a004b80f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agents_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD UNIQUE KEY `listing_id` (`listing_id`),
  ADD KEY `agents_id` (`agents_id`),
  ADD KEY `seller_id` (`owner_id`),
  ADD KEY `buyers_id` (`client_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `listing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `listings_ibfk_1` FOREIGN KEY (`agents_id`) REFERENCES `agent` (`agents_id`),
  ADD CONSTRAINT `listings_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  ADD CONSTRAINT `listings_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
