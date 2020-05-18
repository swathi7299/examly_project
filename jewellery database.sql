-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 03:39 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jewellery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_mailid` varchar(50) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_phno` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_mailid`, `admin_password`, `admin_name`, `admin_phno`) VALUES
(1, 'swathiseetha@gmail.com', 'swathi123', 'swathi', 9874598652);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `product_id`, `added_date`) VALUES
(2, 2, '21D12341', '2020-05-06'),
(42, 7, '19B12340', '2020-05-14'),
(73, 4, '21D12341', '2020-03-19'),
(77, 4, '19A12350', '2020-04-16'),
(79, 8, '21D12341', '2020-03-19'),
(83, 8, '19D12340', '2020-02-17'),
(101, 3, '19A12350', '2020-02-28'),
(102, 3, '21D12341', '2020-02-12'),
(107, 7, '20A123451', '2020-02-23'),
(108, 7, '21D12341', '2020-03-13'),
(111, 10, '21D12341', '2020-01-31'),
(112, 10, '19Z01230', '2020-02-05'),
(113, 11, '19A12350', '2020-01-11'),
(114, 11, '20D12340', '2020-03-25'),
(115, 11, '20D12340', '2020-03-17'),
(123, 1, '18Z01230', '2020-05-07'),
(124, 1, '19A12350', '2020-03-06'),
(125, 1, '19D12340', '2020-04-16'),
(126, 10, '19A12350', '2020-05-07'),
(127, 10, '20G12340', '2020-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `cartamount`
--

CREATE TABLE `cartamount` (
  `cartamount_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartamount`
--

INSERT INTO `cartamount` (`cartamount_id`, `customer_id`, `total_price`) VALUES
(8, 1, '116822.00'),
(9, 1, '94561.00'),
(10, 1, '94561.00'),
(11, 1, '94561.0'),
(12, 1, '104024.0'),
(13, 1, '94561.0'),
(14, 6, '122559.0'),
(15, 6, '122559.0'),
(16, 7, '94561.0'),
(17, 7, '33513.0'),
(18, 1, '22261.0'),
(19, 1, '101532.0'),
(20, 1, '103900.0'),
(21, 1, '99293.0'),
(22, 4, '136442.0'),
(23, 4, '9507.0'),
(24, 4, '189122.0'),
(25, 4, '202142.0'),
(26, 8, '117342.0'),
(27, 6, '125227.0'),
(28, 1, '23969.0'),
(29, 1, '89605.0'),
(30, 3, '117342.0'),
(31, 1, '9507.0'),
(32, 1, '43668.0'),
(33, 9, '111699.0'),
(34, 6, '210279.0'),
(35, 7, '158740.0'),
(36, 8, '109677.0'),
(37, 10, '27109.0'),
(38, 11, '132627.0'),
(39, 11, '170693.0'),
(40, 1, '86896.0'),
(41, 1, '9463.0'),
(42, 4, '117342.0'),
(43, 4, '117342.0'),
(44, 1, '9507.0'),
(45, 1, '33513.0'),
(46, 1, '137537.0'),
(47, 1, '3024.0');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL,
  `min_value` int(11) NOT NULL,
  `max_value` int(11) NOT NULL,
  `discount` varchar(20) NOT NULL,
  `discount_val` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offer_id`, `min_value`, `max_value`, `discount`, `discount_val`) VALUES
(3, 0, 5000, '2%', 0.02),
(4, 5000, 10000, '3%', 0.03),
(5, 10000, 25000, '5%', 0.05),
(6, 25000, 50000, '7%', 0.07),
(7, 50000, 75000, '9%', 0.09),
(8, 75000, 100000, '12%', 0.12),
(9, 100000, 300000, '15%', 0.15),
(10, 300000, 1000000, '17%', 0.17);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--
-- Error reading structure for table jewellery.order: #1932 - Table 'jewellery.order' doesn't exist in engine
-- Error reading data for table jewellery.order: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `jewellery`.`order`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--
-- Error reading structure for table jewellery.orders: #1932 - Table 'jewellery.orders' doesn't exist in engine
-- Error reading data for table jewellery.orders: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `jewellery`.`orders`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `order_summary`
--

CREATE TABLE `order_summary` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_summary`
--

INSERT INTO `order_summary` (`order_id`, `product_id`, `customer_id`, `order_date`) VALUES
(9, '21D12341', 4, '2020-05-09'),
(11, '19A12350', 4, '2020-01-24'),
(13, '21D12341', 8, '2020-03-14'),
(15, '20A123451', 6, '2020-03-20'),
(16, '20C12340', 6, '2020-04-10'),
(17, '19D12340', 8, '2020-03-18'),
(26, '19A12350', 3, '2020-03-18'),
(27, '21D12341', 3, '2020-05-01'),
(31, '19C12341', 9, '2019-09-21'),
(32, '19E12341', 9, '2020-03-19'),
(33, '21B12340', 6, '2020-05-08'),
(34, '20A123451', 7, '2020-03-17'),
(35, '21D12341', 7, '2020-02-29'),
(38, '21D12341', 10, '2020-01-19'),
(40, '19A12350', 11, '2020-01-17'),
(41, '20D12340', 11, '2020-02-07'),
(42, '20D12340', 11, '2020-01-10'),
(50, '18Z01230', 1, '2020-04-22'),
(53, '19A12350', 10, '2020-02-08'),
(54, '20G12340', 10, '2020-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` varchar(30) NOT NULL,
  `card_name` text NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `card_expmonth` text NOT NULL,
  `card_expyear` int(6) NOT NULL,
  `card_cvv` int(6) NOT NULL,
  `paymentdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `customer_id`, `total_price`, `card_name`, `card_number`, `card_expmonth`, `card_expyear`, `card_cvv`, `paymentdate`) VALUES
(3, 1, '', 'swathi', 98745632100, 'May', 2022, 756, '2019-09-03 17:44:12'),
(4, 1, '(436345.0,)', '', 0, '', 0, 0, '0000-00-00 00:00:00'),
(5, 1, '(580327.0,)', '', 0, '', 0, 0, '0000-00-00 00:00:00'),
(6, 1, '(94561.0,)', '', 0, '', 0, 0, '0000-00-00 00:00:00'),
(7, 1, '(116822.0,)', '', 0, '', 0, 0, '0000-00-00 00:00:00'),
(8, 1, '(116822.0,)', '', 0, '', 0, 0, '0000-00-00 00:00:00'),
(9, 6, '', 'vinitha', 123423458934, 'august', 2039, 983, '2019-09-04 12:13:46'),
(10, 1, '', 'swathi', 667895412563, 'May', 2022, 746, '2019-09-05 15:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `porder`
--

CREATE TABLE `porder` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phonenumber` bigint(20) NOT NULL,
  `address` varchar(500) NOT NULL,
  `town` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `country` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `porder`
--

INSERT INTO `porder` (`order_id`, `customer_id`, `name`, `phonenumber`, `address`, `town`, `city`, `state`, `pincode`, `country`, `order_date`) VALUES
(10, 4, 'sahashra', 8974563101, 'Raja street', 'Ambur', 'Vellore', 'Tamil Nadu', 635802, 'India', '2020-04-02 16:59:17'),
(12, 8, 'Seethapathy', 9787635241, 'Nallam Street', 'Ariyalur', 'Ariyalur', 'Tamil Nadu', 635963, 'India', '2020-02-14 23:25:15'),
(13, 6, 'vinitha', 9874587451, 'amman street', 'erode', 'erode', 'Tamil Nadu', 635060, 'India', '2020-05-18 10:42:59'),
(14, 1, 'swathi', 9685742130, ' balaji street', 'ekkathuthangal', 'chennai', 'Tamil Nadu', 653002, 'India', '2020-04-17 17:56:05'),
(15, 3, 'geethika', 9638527441, 'raja street', 'ambur', 'vellore', 'Tamil Nadu', 635802, 'India', '2020-02-13 18:40:03'),
(16, 1, 'swathi', 9638527410, 'Raja Street', 'ambur ', 'vellore', 'tn', 63582, 'Indian', '2020-03-03 11:27:36'),
(17, 9, 'Yoga', 8659321478, 'Pallavan Street', 'Perundurai', 'erode', 'tamil nadu', 653241, 'India', '2020-03-21 14:31:29'),
(18, 6, 'vinitha', 9874563210, 'Tagore', 'athur', 'salem', 'tn', 693524, 'India ', '2020-01-21 15:09:12'),
(19, 6, 'vinitha', 9638527410, 'Pallavan ', 'salem', 'salem', 'tn', 635802, 'India', '2020-05-01 15:10:08'),
(20, 7, 'kavitha', 9787324541, 'Balaji Street', 'ambur ', 'vellore ', 'tn', 635802, 'India', '2020-02-21 15:14:46'),
(21, 10, 'kalpana', 9047782973, 'ramco cements quarters', 'ariyalur', 'ariyalur', 'tamil nadu', 635241, 'India', '2020-04-20 11:16:53'),
(22, 11, 'sathish', 9638527410, 'govinda street', 'ariyalur', 'ariyalur', 'tamil nadu ', 635729, 'India', '2020-03-25 11:35:27'),
(23, 11, 'sathish', 9638527410, 'govinda street', 'ariyalur', 'ariyalur', 'tamil nadu ', 635729, 'India', '2020-05-05 11:35:36'),
(24, 1, 'swathi', 9632874105, 'balu street', 'ambur', 'vellore', 'tamilnadu', 635241, 'India', '2020-04-09 11:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text NOT NULL,
  `product_category` text NOT NULL,
  `product_ornament` text NOT NULL,
  `product_purity` float(5,2) NOT NULL,
  `product_size` int(6) NOT NULL,
  `product_quantity` int(6) NOT NULL,
  `product_quantityinstock` int(6) NOT NULL,
  `product_weight` float(5,2) NOT NULL,
  `product_makingprice` double(10,2) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_image` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_category`, `product_ornament`, `product_purity`, `product_size`, `product_quantity`, `product_quantityinstock`, `product_weight`, `product_makingprice`, `product_price`, `product_image`) VALUES
(' 21E12341', 'Traditional_Glory_Silver_Pendant', 'This precious and resplendent silver pendant features a majestic design in oxidized silver with delicate detailing and embellished with red and green synthetic stones. This lovely piece of silver jewellery makes for great statement piece when paired with elegant evening wear.', 'Silver', 'Pendants', 92.50, 7, 26, 23, 24.75, 100.00, 4167.00, 0x27),
('18Z01230', 'Sleek_And_Shiny_Dangler_Silver_Earrings', 'This dainty silver shield encircled with pretty pair of gold coated earrings features delicate hook attached to a pretty motif with delicate detailing forged in silver. This adorable piece of silver jewellery is a classic addition to your jewellery collection.', 'Silver', 'Elena', 92.50, 0, 21, 20, 33.49, 88.00, 3024.00, 0x27),
('18Z01231', 'Silver_necklace_Elena', 'Silver necklace elena and bright ', 'Silver', 'Elena', 92.50, 0, 30, 25, 15.36, 400.00, 4500.00, 0x27),
('18Z01232', 'Fashion Hangings_Style_Oxidized_Silver_Bangles', 'This dainty silver shield encircled with pretty pair of gold coated earrings features delicate hook attached to a pretty motif with delicate detailing forged in silver. This adorable piece of silver jewellery is a classic addition to your jewellery collection.', 'Silver', 'Elena', 92.50, 0, 3, 1, 42.20, 400.00, 3524.00, 0x27),
('19A12350', 'The_Varika_Enameled_Gold_Bangles', 'This hitting to your jewellery collections majestic and whimsical piece of semiprecious jewellery features bangle crafted in gold and embellished with precious semiprecious on which nestle a trio of dainty butterfly pattern forged in gold with dainty detailing. This quaint gold and semiprecious bangle makes for a charming add', 'Gold', 'Bangles', 22.00, 12, 20, 12, 24.33, 10302.00, 94561.00, 0x27),
('19A12351', 'Twinkle_Style_Rhodium_Polished_Gold_Bangle', 'This dramatically designed gold necklace features an intricately designed pendant with a gold floral motif with a white stone studded center, nestled in a circle of tiny white stones and bordered by multicoloured petal pattern with a white stone dangling from its bottom, the pendant is also flanked by beautifully designed gold motifs and held on a gold chain featuring little circles and gold beads.This stunning jewellery necklace is a great addition to your gold jewellery collection.', 'Gold', 'Bangles', 22.00, 10, 30, 20, 32.78, 14332.00, 137669.00, 0x27),
('19AB12340', 'Gold_Eye_Style_Studded_Bracelet', 'Shiny and beautiful this precious gold bracelet features a pretty motif forged in gold and embellished with white stones. This delightful piece of gold jewellery is a lovely choice to use as office wear jewellery.', 'Gold', 'Bracelets', 22.00, 7, 16, 10, 32.78, 14332.00, 137669.00, 0x27),
('19B12340', 'Interloped_Golden_Circle_Slim_Chain', 'This glamorous piece of gold jewellery features a sleek gold chain peppered with dainty bronze and silver coloured bands attached to a single lustrous pearl pendant from which flu teresa cluster of delicate gold chains with dainty gold tassels at its end. This delightful piece is a classic and charming addition to your jewellery collection.', 'Gold', 'Chains', 22.00, 7, 15, 10, 7.90, 3976.00, 33513.00, 0x27),
('19B12341', 'Debonair_Multi_Tone_Slim_Gold_Chain', 'This dainty and svelte gold bracelet,crafted with an alternating pattern of gold and silver beads on two dainty gold strands is great way to infuse a dash of charm into your look. This lovely piece of gold jewellery is a great buy for your office wear jewellery collection as well.', 'Gold', 'Chains', 22.00, 7, 30, 25, 8.08, 4053.00, 34161.00, 0x27),
('19B12342', 'Fashionable_Chain_With_Gold_Ball_Chain', 'This delightful and charming piece of gold jewellery features a pretty gold chain dotted with lustrous pearls and attached to a dainty pendant in floral motif forged in gold and embellished with white semiprecious stones with green and pink stones in the center.', 'Gold', 'Chains', 22.00, 16, 27, 25, 8.00, 3500.00, 35000.00, 0x27),
('19C12340', 'Golden_Blooming_Beauty_Gold_Earring', 'This delicate pair of gold earrings features a dainty blooming flower motif forged in gold with a beautiful pink stone studded center flanked by a filigree design of gold and studded with white stones. With a dainty dew drop motif fluttering from below it. This enchanting piece of gold jewellery is a great addition to your jewellery collection.', 'Gold', 'Earrings', 22.00, 11, 26, 20, 5.23, 2607.00, 22261.00, 0x27),
('19C12341', 'Swirl_Of_Fantasy_Gold_Earring', 'This alluring and pretty pair of gold earrings feature a trio of gilded swirls nestled on a beautiful motif forged in gold and studded with white semiprecious stones. The pretty dangler features a trio of slender gold chains attached to dainty golden balls complimenting the beauty of this beautiful piece of gold jewellery.', 'Gold', 'Earrings', 22.00, 10, 18, 10, 5.06, 2914.00, 20524.00, 0x27),
('19D12340', 'Dual_Toned_Hearts_Gold_Necklace', 'This precious and delightful gold necklace features a series of hearts in alternating pattern one forged in fold and the other embellished with white semiprecious stones with a dainty dew drop pattern studded with white semiprecious stones. This lovely piece of gold jewellery is a great gifting choice', 'Gold', 'Necklace', 22.00, 8, 20, 19, 21.77, 12443.00, 86896.00, 0x27),
('19D12341', 'Floral_Fantasy_Gold_Necklace', 'This enchanting and lovely gold and semiprecious necklace features pretty chain with paisley shaped motifs within which is nestled a dainty flower forged in gold and studded with semiprecious and attached to a lovely pendant shaped like sleek dew drop crafted in gold with dainty flower motif nestled within it and on top of it studded with semiprecious s. This lovely piece of semiprecious jewellery when paired with elegant evening wear is guaranteed to make you the cynosure of all eyes.', 'Gold', 'Necklace', 22.00, 9, 14, 12, 19.58, 11117.00, 86598.00, 0x27),
('19E12340', 'Studded_Tear_Drop_Gold_Pendant', 'This ravishing gold pendant features lovely dew drop pattern with beautiful detailing forged in gold and complimented by dainty dew drop motifs studded with white and pink semiprecious stones. This lovely piece of gold jewellery when paired with elegant evening wear is guaranteed to win you a lot of compliments.', 'Gold', 'Pendants', 22.00, 18, 16, 12, 3.35, 2017.00, 14427.00, 0x27),
('19E12341', 'Pretty_Gilded_Blocks_Gold_Pendant', 'This lovely and chic gold pendant features a pretty circle embellished with tiny shimmering white semiprecious stones within which is nestled a beautiful pattern embellished with dainty golden blocks below which flutters a dew drop pattern with white and red semiprecious stones. This enchanting piece of gold jewellery makes for a charming addition to your wedding jewellery collection.', 'Gold', 'Pendants', 22.00, 12, 21, 20, 6.13, 13710.00, 91175.00, 0x27),
('19F12340', 'Floral_Sparkle_Diamond_And_Gold_Ring', 'This ethereal and pretty piece of diamond jewellery features a pretty floral motif studded with precious diamonds and flanked by bands studded with sparkling diamonds and held together by a sleek gold band. This lovely piece of diamond jewellery makes for a lovely choice.', 'Gold', 'Rings', 22.00, 12, 17, 15, 2.52, 4720.00, 29883.00, 0x27),
('19F12341', 'Gilded_Beads_Gold_Ring', 'Adorn yourself with something dramatic by wearing this stunning gold ring, featuring a row of tiny golden beads flanked by two dainty leaf motifs held on slim gold bands which fuse together to one sleek gold band which holds it together. This adorable piece of gold jewellery is a great way to raise your style quotient when you pair it with elegant evening wear.', 'Gold', 'Rings', 22.00, 11, 10, 10, 2.70, 1753.00, 12243.00, 0x27),
('19Z01230', 'Arianna_Silver_Hook_Drops_Earrings', '-', 'Silver', 'Gina', 92.50, 0, 4, 1, 21.63, 50.00, 1708.00, 0x27),
('19Z01231', 'Swirling_Circle_Silver_Hook_Drops_Earrings', '-', 'Silver', 'Gina', 92.50, 0, 5, 6, 20.30, 100.00, 2530.00, 0x27),
('19Z01232', 'Classical_Oxidized_Balls_Type_Silver_Bangles', '-', 'Silver', 'Gina', 92.50, 0, 5, 3, 32.34, 200.00, 6321.00, 0x27),
('20A123451', 'Petite_Delight_Diamond_And_Gold_Bangle', 'This simple yet exquisite piece of diamond jewellery features a pretty bangle forged in gold and studded with tiny sparkling diamonds giving it an ethereal beauty. This lovely piece of diamond jewellery is ideal to be used as office wear jewellery as well.', 'Diamond', 'Bangles', 18.00, 7, 20, 15, 8.01, 15514.00, 125227.00, 0x27),
('20C12340', 'Lustrous_Teardrop_Diamond_Earring', 'This gorgeous pair of diamond earrings patterned in a teardrop shape and embellished with tiny, shimmering diamonds ia visual delight. This exquisite piece of diamond jewelry will complement both traditional and western outfits and is classic addition to your wedding jewellery collection.', 'Diamond', 'Earrings', 22.00, 10, 20, 15, 4.49, 8016.00, 82432.00, 0x27),
('20C12341', 'Luminous_Lotus_Diamond_Earring', 'Adorn yourself with this quaint pair of diamond earrings featuring a pair of pretty lotus shaped petals forged in gold with a tiny diamond nestled in each petal and flanked by dainty diamond studded floral motifs on the top and bottom.This adorable piece of diamond jewelry makes for great gifting choice and can also be used as office wear jewellery.', 'Diamond', 'Earrings', 22.00, 12, 23, 20, 2.45, 4375.00, 29860.00, 0x27),
('20D12340', 'Oval_Enamour_Diamond_Necklace', 'Chic and stylish this beautiful piece of diamond jewellery features a brilliant oval cut diamond encircled by a band of glittering diamond stones. This delightful diamond necklace when paired with a slim gold chain will work as a great piece of office wear jewellery.', 'Diamond', 'Necklace', 18.00, 12, 20, 15, 3.42, 6620.00, 38066.00, 0x27),
('20D12341', 'Shimmering_Leaves_Diamond_Necklace', 'This lovely piece of diamond jewellery features a lovely dew drop pattern studded with shimmery white diamonds and flanked with a cluster of leaves embellished with shimmering diamonds. This exquisite diamond necklace is a great choice when you buy jewellery online, as it suits most outfits.', 'Diamond', 'Necklace', 18.00, 12, 30, 24, 5.31, 10283.00, 53838.00, 0x27),
('20E12340', 'Precious_Fan_Diamond_Necklace', 'This beautiful and delightful piece of diamond jewellery features an exquisite fan pattern studded with shimmering diamond stones with a wheel pattern embellished with tiny white stones. This lovely diamond necklace when paired with elegant evening wear will infuse charm and beauty to your look.', 'Diamond', 'Pendants', 18.00, 12, 10, 5, 6.13, 13710.00, 91175.00, 0x27),
('20E12341', 'Triple_Delight_Diamond_Pendant', 'Make a stunning style statement with this exquisite diamond pendant with a trip of beautiful dew drop patterns, studded with dazzling diamonds with a brilliant pear cut diamond nestled inside each motif. This exquisite piece of diamond jewellery when paired with elegant party wear is a guaranteed show stopper and a charming addition to your jewellery collection.', 'Diamond', 'Pendants', 18.00, 12, 24, 20, 1.06, 9271.00, 97859.00, 0x27),
('20F12340', 'Traditional_Drama_Diamond_Ring', 'This stunner of a diamond ring features a simple yet chic traditional motif embellished with precious diamonds and held together by a sleek gold band. This precious piece of diamond jewellery is a great choice as office wear jewellery also due to its understated elegance.', 'Diamond', 'Rings', 18.00, 11, 23, 20, 2.86, 4971.00, 27998.00, 0x27),
('20F12341', 'Shimmering_Single_Bud_Diamond_Ring', 'This delicately crafted diamond ring features a single flower pattern studded with precious diamonds on a dainty stem studded with brilliant cut diamonds and held together on a sleek gold band with a dainty swirl. This delightful piece of diamond jewellery is an ideal choice as office wear jewellery when paired with elegant studs', 'Diamond', 'Rings', 18.00, 10, 20, 17, 2.46, 6541.00, 87456.00, 0x27),
('20G12340', 'Traditional_Beauty_Diamond_Nose_Stud', 'Traditionally designed with a trio of precious diamonds nestled on top of a quaint rhombus pattern with a single diamond in its center this lovely diamond nose stud is delight to adorn. This alluring piece of diamond jewellery makes for a lovely birthday gift and can easily be ordered', 'Diamond', 'Nosepins', 18.00, 3, 20, 18, 0.39, 2662.00, 9507.00, 0x27),
('20G12341', 'Studded_Heart_Diamond_Nose_Stud', 'This beautiful piece of diamond jewellery featuring a dainty heart motif forged in gold, within which are nestled a trio of precious diamonds is confluence of traditional and modern design sensibilities. This charming diamond nose stud will enhance the elegance of any outfit you pair it with and are a lovely addition to your jewellery collection.', 'Diamond', 'Nosepins', 18.00, 1, 23, 21, 0.26, 2281.00, 12291.00, 0x27),
('21A12340', 'Gilded_Lustre_Silver_Bangles', 'This exotic and pretty pair of silver bangles with a sleek gold plated body embellished with white semiprecious stones.This lovely piece of silver jewellery makes for great addition to your work wear jewellery collection.', 'Silver', 'Bangles', 92.50, 9, 24, 20, 45.67, 50.00, 9463.00, 0x27),
('21A12341', 'Crimson_Aura_Silver_Bangles', 'This ethereal and enchanting pair of silver bangles features oval shaped milky white synthetic stones embellished on a silver body and a pretty floral design studded with red synthetic stones in the center. This lovely piece of silver jewellery is a great choice when you buy jewellery online.', 'Silver', 'Bangles', 92.50, 8, 20, 16, 48.66, 200.00, 10082.00, 0x27),
('21A12342', 'Orion_Silver_Bangle', 'Adorn your hands with a bevy of stars in the galaxy with these shimmering white stone studded semi precious stones classic and exquisite pair of bangles are an essential addition to your wardrobe due to its classic appeal and versatility.', 'Silver', 'Bangles', 92.50, 9, 24, 21, 29.72, 300.00, 4650.00, 0x27),
('21A12343', 'Machine_Cut_Work_Mens_Silver_Kada', 'This exotic and pretty pair of silver bangles with a sleek gold plated body embellished with white semiprecious stones.This lovely piece of silver jewellery makes for great addition to your work wear jewellery collection.', 'Silver', 'Bangles', 92.50, 9, 23, 20, 37.67, 200.00, 5097.00, 0x27),
('21A12344', 'Crimson_Dots_Silver_Bangles', 'This elegant and pretty pair of silver bangles features a sleek gold plated body studded with tiny crimson coloured semi precious stones. This alluring piece of silver jewellery makes for a charming addition to your silver jewellery collection.', 'Silver', 'Bangles', 28.65, 9, 25, 21, 85.65, 400.00, 7890.00, 0x27),
('21B12340', 'Hesche_Style_Silver_Chain', 'Make a stunning style statement with this exquisite diamond pendant with a trip of beautiful tear drop patterns, studded with dazzling diamonds with a brilliant pear cut diamond nestled inside each motif . This exquisite piece of diamond jewellery when paired with elegant party wear is a guaranteed show stopper and a charming addition to your jewellery collection.', 'Silver', 'Chains', 92.50, 0, 26, 24, 20.88, 100.00, 2620.00, 0x27),
('21B12341', 'Silver_Oval_Shaped_Balls_Chain', 'Make a stunning style statement with this exquisite diamond pendant with a trip of beautiful tear drop patterns, studded with dazzling diamonds with a brilliant pear cut diamond nestled inside each motif . This exquisite piece of diamond jewellery when paired with elegant party wear is a guaranteed show stopper and a charming addition to your jewellery collection.', 'Silver', 'Chains', 92.50, 9, 24, 21, 18.87, 100.00, 2368.00, 0x27),
('21C12340', 'Etched_Leaflet_Silver_Earrings', 'Simple yet quaint this elegant pair of silver earrings features a dainty leaf pattern with delicate etched work. This pretty piece of silver jewellery is simple and stylish enough to be used as office wear jewellery.', 'Silver', 'Earrings', 92.50, 15, 30, 25, 4.87, 50.00, 1233.00, 0x27),
('21C12341', 'Chandelier_Silver_Earrings', 'These gorgeous earrings features a dainty oval stud attached to a stunning dangler pattern. Flaunt this glamorous piece of silver jewellery at your next special occasion and sit back and enjoy the compliments.', 'Silver', 'Earrings', 92.50, 6, 29, 27, 16.35, 500.00, 7400.00, 0x27),
('21D12341', 'Oxidized_Silver_Statement_Pendant_Long_Necklace', 'This lovely diamond ring features a square design in a nested pattern embellished with precious diamonds and a single diamond solitaire studded in the center. This lovely piece of diamond jewellery makes for a lovely birthday gift and can easily be ordered from jewellery shopping websites.', 'Silver', 'Necklace', 92.50, 10, 34, 32, 27.53, 600.00, 22781.00, 0x27),
('21E12340', 'Magnificent_Horse_Silver_Pendant', 'This regal looking silver pendant features lovely motif forged in silver and embellished with white synthetic stones within which is nestled a lovely gold plated horse motif on a black background nestled in a circle of white stones. This ravishing piece of silver jewellery when paired with elegant evening wear will make you look and feel like a diva.', 'Silver', 'Pendants', 92.50, 0, 14, 12, 5.20, 50.00, 1051.00, 0x27),
('21F12340', 'Kiara_Silver_Ring', 'With its stylish, chic design and smooth finish this classic silver jewellery ring makes for the perfect work jewellery. This beautiful and versatile fashion ring which will suit any outfit you wear is a great addition to your work wear jewellery collection.', 'Silver', 'Rings', 92.50, 10, 15, 13, 3.40, 200.00, 1500.00, 0x27),
('21F12341', 'Jagged_Wonder_Silver_Ring', 'This appealing and pretty silver ring features a unique jagged pattern forged in silver and held together by a sleek band of silver. This pretty and precious piece of silver jewellery makes for a charming addition to your jewellery collection.\r\n', 'Silver', 'Rings', 92.50, 17, 15, 12, 12.36, 600.00, 1503.00, 0xffd8ffe000104a46494600010100000100010000ffdb0084000906070d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0f0d0d0d0d1511161615111515181d3420181a311b1515213221252a372e2e2e172b3f383332372839302f010a0a0a0e0d0e151010163719171a2d2b2d2b2e2b2b2b2d2b2d2b2b2d2b2b2b372b2d372b3737372d2b2d2b2b2b2b2b2b2b2b2b2d2b2b2b2b2b2b2b2b2b2d2b2bffc000110800e100e103012200021101031101ffc4001b00010101010101010100000000000000000001050403020607ffc400321000020102050205030206030000000000000102031104051221314151132261819132527106231462a1c1d1f03342b1ffc4001501010100000000000000000000000000000001ffc4001511010100000000000000000000000000000001ffda000c03010002110311003f00fee200000850000000000000000000002000000000000000000000000000000000280200000000000000000000000000000000000000000000000000000000a0100000000000000000000000000000000000000000000000000000000500000200001e188c5c29b8c5ddce6ed18455e4dff6f738734c5d494bf87a1f5c959ce2fcd17dbd36ea75607011a2af7d751ab3a8f9fc203ac000000000000000000000000000000078e2b151a4a2e69e96ece495d45f4b9eb1926ae9a6bba7742514d34d269ab34f74d18b8bc3cf0b3f1a8b93a7c4a9b7e557b5bdbd79036c1e586acaa414d755bae6cfaa3d4000000000a00021f35a7a63297db172b7e11f47962ffe39f3f4be1a8bb5b7b37b20327f4d79d54aae32d5e238c75ddda2d27b3ebcff00436ccec89c1d16e9c651839caca6d392e3aa344b400040000000000000000000000000000024e0a49c64ae9ab34faa28030ff4f557e262693525a66da72eb14ecbaedc1b864e5d283c557518494d397892734d4aef6b47d8d62d000100140000010f8c453d709c3ee84a3bf1bab1e840317f4b4af4ea2528ca0a69c1c6fba6b9fc706d18392d2547135a929271f328a4f6bad32b5adb34a66f16800080000000000000000000000000000001e18fa9a28d595ed6a73b3f5b6c0647e9e8eaad889b946534f4c92bdf79369fe367f06f193fa730ea14a72ba729d492935776707a6cdf5dd3358b40004000a008500405201f9fcc28aa38ea5594ade2cb5ca3abb28539bb75d9c3e0fd01979fe0955a6a7ab4ca96af35ede495af1f951f83b32fa9aa8d36dea928a8cdff003c7697f5451d000200000000000502000000000000000018ff00a9ea254145bb272d52f369fdb8a6dbbf4e86c1878ec3c7138b8c5cfc908e99437b4acd4a71f5d9aff5160d4cbf0aa8528524efa75394bee9ca4e527f2d9d0010000050400000000007cd6a4a709425f4ce2e2ff0d19591c274a55694e4dbbb96e92dd3b3715d571feb35cc2cc294e862635e16d126a52e7796d19457ab567bf628dd001000000000000000000000000000007c569e884a4da5a62e5793b2565d599791611c5d4ab3726e4dc63aeda96f793f77ff0087de7f39b842953b5ea49bb3bf9b4efa36effd8eccbf0de0d28439695e6fbcdef27f2ca3a000400000290a040000000039734c3caad0a9084b4cf6941ff3c64a514fd2e91d400cbc831529d3d138ca2e1bc3575a6dbb2f6b58d430b32ad3c2e2a138c7f6eb277d2beaa8aee707f98f993ef0f536e954538c671778c92945f74d6c5a3e800400000000000000000000024a4926dec926dfa2298f9fe60e9af0a9a72a8f4b715bb7a9e9843d2f2e5f64c0f1cb555af8b75e6a50853bb516f9728da117f88b93b7791bc7860683a74a1076d4a29cdc55939bfa9fc9ee000000000504000000000000007962a82ab0707b758cbac66b892f5b99793e2f44a5879ece13942cf6709dee97ac5a7aa2ff002b946c99b9be5fe25aac3cb5a096eb99c13be9bf7e6df928d20666479cd2c642f0979a37524d38bbad9ecf74efcae86990000000000a40000000a424e6a29ca4d2495db7c24079e2b10a941c9abbe2315cca4f846664f0f1a73c4cbcd173fdb7ff0049c92d2ea457dbcc53e5adfb1c94f150cceb4e14dcbc1c34b4d5696cdb5bc2ff007717edee7e8a11514a314a318a4924ac925c248a3e8801000005200001401000000000000000061e372854aad4c5e1568ab394255525b49c5ef34babd374d75f6dfbb2ccd69625795a534da946f7dd2574be57c9dc65e37278b93ad41ba55edcc5f926fa371e2fd9ff00928d406451ce744952c5254ea5979ace3093f7f5e3766b4649aba774f86b820a0000000001c598669470eaf396fbda2b7949f6496edfa203aea548c13949a515bb6cc39e2e58ea9e1506952a736aacacdeeaeb9ee9f4dfd6cd6df7e0d6c6bbd472a58771da114e136df5d57bf1d6cad766b61b0d4e8c1429c23082e14558a3cb2ccbe8e128c2850868a705b756df5937d59d40100000000000000028100000000000000000000796270b4eb4745584671ed257385e06b51bff000d51e86a29529c9350b7366d3e96f834c018f4332c5424a388c24d2fbe8feec17baddfc25b9eef3bc3a8eb72928ddabca2e1ba766b7f54cd13e5d28377718b7decae51c54739c34f569a97d3bb4936edec7957ce124bc2a552b397d2a295ed6faacdf069c6297092fc2b0514af6495f9b2e48335d3c56229daa69c2ddfd309ca73947b392b38aef6dfd4b80c9a952b4e76ad592b78b28a568ddb492ecafd4d200000000000000000000000a428100000000000000000000000000000028100000140100000148000000148000000000000000000000000000000000000000000000000000000000000050400000000000a0000001014010a0010a0002000014010a0010a001000000000140100007fffd9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `customerid` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mailid` varchar(30) NOT NULL,
  `phno` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`customerid`, `customer_name`, `password`, `mailid`, `phno`) VALUES
(1, 'swathi', 'Swathi123', 'swathiseetha@gmail.com', 9874563210),
(2, 'Sahashra', 'Sahashra123', 'sahashra12@gmail.com', 7895415230),
(3, 'Geethika', 'Geethika123', 'geethika@gmail.com', 9587435410),
(4, 'sahashra', 'sahashra@123', 'sahashra@gmail.com', 9874632510),
(6, 'Vinitha', 'Vinitha16', 'vinithaa@gmail.com', 9807654312),
(7, 'kavitha', 'Kavitha@123', 'kavitha@gmail.com', 8794563210),
(8, 'Seethapathy', 'Seetha@123', 'seethapathy@gmail.com', 9787635241),
(9, 'yoga', 'Yoga_123', 'yoga@gmail.com', 9874512354),
(10, 'kalpana', 'Kalpana@123', 'kalapna@gmail.com', 9047785973),
(11, 'sathish', 'Sathish@123', 'sathish@gmail.com', 9942698512),
(12, 'Sindhu', 'Sindhu@124', 'sindhu@rediffmail.com', 9635224410),
(13, 'subha', 'Subha@123', 'suba@gmail.com', 6896412301);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `cartamount`
--
ALTER TABLE `cartamount`
  ADD PRIMARY KEY (`cartamount_id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `order_summary`
--
ALTER TABLE `order_summary`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `porder`
--
ALTER TABLE `porder`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`customerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `cartamount`
--
ALTER TABLE `cartamount`
  MODIFY `cartamount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_summary`
--
ALTER TABLE `order_summary`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `porder`
--
ALTER TABLE `porder`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `customerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `user` (`customerid`);

--
-- Constraints for table `order_summary`
--
ALTER TABLE `order_summary`
  ADD CONSTRAINT `order_summary_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `order_summary_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `user` (`customerid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
