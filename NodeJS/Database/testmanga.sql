-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 03:21 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testmanga`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `ID` int(11) NOT NULL,
  `Link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`ID`, `Link`) VALUES
(1, 'http://192.168.1.7:3000/dragonball.png'),
(2, 'http://192.168.1.7:3000/doreamon.png'),
(3, 'http://192.168.1.7:3000/adventuretime.png');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Name`) VALUES
(1, 'COMEDY'),
(2, 'Ecchi'),
(3, 'Historical'),
(4, 'Manhwa'),
(5, 'Medical'),
(6, 'Romance'),
(7, 'Shoujo'),
(8, 'Slice of life'),
(9, 'Tragedy'),
(10, 'Cooking'),
(11, 'Action'),
(12, 'Fantasy'),
(13, 'Horror'),
(14, 'Martial arts'),
(15, 'Mystery'),
(16, 'School life'),
(17, 'Shoujo a'),
(18, 'Smut'),
(19, 'Webtoons'),
(20, 'Adult'),
(21, 'Doujinshi'),
(22, 'Gender bender'),
(23, 'Jose'),
(24, 'Mature'),
(25, 'One shot'),
(26, 'Sci fi'),
(27, 'Shounen'),
(28, 'Sports'),
(29, 'Yaoi'),
(30, 'Adventure'),
(31, 'Drama'),
(32, 'Harem'),
(33, 'Manhua'),
(34, 'Mecha'),
(35, 'Psychological'),
(36, 'Seinen'),
(37, 'Shounen ai'),
(38, 'Supernatural'),
(39, 'Yuri'),
(40, 'Top Read'),
(41, 'Completed'),
(42, 'Newest'),
(43, 'Ongoing'),
(44, 'Latest'),
(45, 'Drop'),
(46, 'Superhero');

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `MangaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ID`, `Name`, `MangaID`) VALUES
(3, 'Chapter 1 : Bloomers and the Monkey King', 1),
(4, 'Chapter 2 : No Balls!!', 1),
(7, 'Chapter 3 : Sea Monkeys', 1),
(8, 'Chapter 4 : They Call Him the Turtle Hermit!', 1),
(9, 'Chapter 5 : Oo! Oo! Oolong!', 1),
(10, 'Chapter 6 : So Longm OoLong!!', 1),
(11, 'Chapter 7 :Yamcha and Pu\'ar', 1),
(12, 'Chapter 8 : One, Two,Yamcha-cha', 1),
(13, 'Vol.1 Chapter 1 : All The Way From A Future World', 3),
(14, 'Vol 0 chapter 1.1', 3),
(15, 'Vol.1 chapter 2 : Prophecy Of Doraemon', 3),
(16, 'Vol.1 chapter 3 : Transforming Biscuit', 3),
(17, 'Vol.1 chapter 4 : Operation: Secret Spy', 3),
(18, 'Vol.1 chapter 5 : Kobe Abe', 3),
(19, 'Vol.1 chapter 6 : Antique Competition', 3),
(20, 'Vol.1 chapter 7 : Peko Peko Grasshopper', 3),
(23, 'Vol.1 chapter 8 : Chin Up To The Ancestors', 3),
(24, 'Vol.1 chapter 9 : Hunting Shades', 3),
(27, 'Vol.1 chapter 10 : Flattering Lipsticks', 3),
(28, 'Vol.1 chapter 11 : Full Points For Once In A Life Time', 3),
(29, 'Doraemon vol.1 chapter 12 : Operation: Propose', 3),
(30, 'Vol.1 chapter 13 : OO Will ^ ^ With XX', 3),
(31, 'Vol.1 chapter 14 : Hot Hot In The Snow', 3),
(32, 'Vol.1 chapter 15 : A Ghost Of The Lamp\'s Smoke', 3),
(35, 'Doraemon vol.1 chapter 16 : Run! Uma-Take', 3),
(36, 'Vol.2 chapter 17 : Test Memorizing Toast', 3);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `ID` int(11) NOT NULL,
  `Link` text NOT NULL,
  `ChapterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`ID`, `Link`, `ChapterID`) VALUES
(1, 'http://1.bp.blogspot.com/-3-CZvfWT2uM/Vp2-JqYQAcI/AAAAAAAAAAY/JequG8dRuFU/s1600/Doraemon%252Bv01%252Bc01%252B%252B04.jpg', 13),
(2, 'http://4.bp.blogspot.com/-vsvYJKCZL6M/Vp2-J3GXnKI/AAAAAAAAAAg/pV3vM4NdDLw/s1600/Doraemon%252Bv01%252Bc01%252B%252B05.jpg', 13),
(3, 'http://3.bp.blogspot.com/-OrHRh1yj8TM/Vp2-Kb1cWBI/AAAAAAAAAAo/HCQbazwzdBc/s1600/Doraemon%252Bv01%252Bc01%252B%252B06.jpg', 13),
(4, 'http://4.bp.blogspot.com/-UxfVBXwmujE/Vp2-KRfOxjI/AAAAAAAAAAs/l-TnIxhsm3s/s1600/Doraemon%252Bv01%252Bc01%252B%252B07.jpg', 13),
(5, 'http://3.bp.blogspot.com/-JvSXNt5X_M0/Vp2-Kys8WWI/AAAAAAAAAA0/NW4l1uojSME/s1600/Doraemon%252Bv01%252Bc01%252B%252B08.jpg', 13),
(6, 'http://3.bp.blogspot.com/-WV_UKVt7Pmo/Vp2-LHDad6I/AAAAAAAAAA8/FkzBLRGRVjs/s1600/Doraemon%252Bv01%252Bc01%252B%252B09.jpg', 13),
(7, 'http://4.bp.blogspot.com/-QJkwwyh5a6Q/Vp2-LZg2vzI/AAAAAAAAABA/J1-tgl4auwI/s1600/Doraemon%252Bv01%252Bc01%252B%252B10.jpg', 13),
(8, 'http://2.bp.blogspot.com/-STSSUTXr50s/Vp2-L8VhjkI/AAAAAAAAABM/7ZuaXxN4nPA/s1600/Doraemon%252Bv01%252Bc01%252B%252B11.jpg', 13),
(9, 'http://1.bp.blogspot.com/-aha_GdDwmBA/Vp2-L374lKI/AAAAAAAAABU/hS52ISnOvX8/s1600/Doraemon%252Bv01%252Bc01%252B%252B12.jpg', 13),
(10, 'http://3.bp.blogspot.com/-LK5EqICaYHk/Vp2-MRHedzI/AAAAAAAAABY/9a91AW_A8a4/s1600/Doraemon%252Bv01%252Bc01%252B%252B13.jpg', 13),
(11, 'http://3.bp.blogspot.com/-ffrOqfeBBZw/Vp2-MjUqEGI/AAAAAAAAABk/-5viR0lBz6o/s1600/Doraemon%252Bv01%252Bc01%252B%252B14.jpg', 13),
(12, 'http://1.bp.blogspot.com/-0pZX7iPjcgE/Vp2-M7_WZwI/AAAAAAAAABo/YkUqLSbda3Q/s1600/Doraemon%252Bv01%252Bc01%252B%252B15.jpg', 13),
(13, 'http://4.bp.blogspot.com/-deZB1sJFnJ4/Vp2-NHl36bI/AAAAAAAAABw/ZzkfueKmVLE/s1600/Doraemon%252Bv01%252Bc01%252B%252B16.jpg', 13),
(14, 'http://4.bp.blogspot.com/-De0227xOCsQ/Vp2-NjVL4fI/AAAAAAAAAB4/3kl3nK4CIV8/s1600/Doraemon%252Bv01%252Bc01%252B%252B17.jpg', 13),
(15, 'http://4.bp.blogspot.com/-6-CBipKXy60/Vp2-Nsj3t0I/AAAAAAAAAB8/uL_LUZvaDgc/s1600/Doraemon%252Bv01%252Bc01%252B%252B18.jpg', 13),
(16, 'http://192.168.1.7:3000/doreamon.png', 13),
(17, 'http://192.168.1.7:3000/doreamon.png', 13),
(18, 'http://192.168.1.7:3000/doreamon.png', 13),
(19, 'http://192.168.1.7:3000/doreamon.png', 13),
(21, 'http://192.168.1.7:3000/doreamon.png', 14),
(22, 'http://192.168.1.7:3000/doreamon.png', 14);

-- --------------------------------------------------------

--
-- Table structure for table `manga`
--

CREATE TABLE `manga` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manga`
--

INSERT INTO `manga` (`ID`, `Name`, `Image`) VALUES
(1, 'Dragon Ball', 'https://images-na.ssl-images-amazon.com/images/I/81-1jqVHePL.jpg'),
(2, 'The Amazing Spider-Man (1963)', 'https://2.bp.blogspot.com/UyIClw5KWvyrIHioRjGeqaX3BdNRLF0jdlZTHesIxLZy6zX9zOwY26UrF6w5j_v5rGakyQxdPfoi=s1600'),
(3, 'Doraemon', 'https://www.anime-planet.com/images/manga/covers/doraemon-1060.jpg'),
(4, 'Spider-Man', 'https://t1.bdtcdn.net/photos/2020/09/5f733bd8e44c100c0aec2ef8_800x0xcover_tfOUpkJg.jpg'),
(5, 'The Invincible Iron Man', 'https://cdn.shopify.com/s/files/1/0882/5118/products/Invincible-Iron-Man-Number-1-2137789_1024x1024.jpeg?v=1442250415'),
(6, 'Ant-Man & The Wasp', 'https://i.pinimg.com/originals/66/41/b1/6641b10b731f0140a90c5a7fa641daf9.jpg'),
(7, 'Marvel Zombies', 'http://1.bp.blogspot.com/-vNUqD-HUcdQ/Vp5GXqrP7fI/AAAAAAAAIEE/OSIFYvS3D7k/s1600/0.jpg'),
(8, 'Super Hero Adventures', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWBY9fuCKhnDI-wwoXwJ6zF1O6x9ELBaE7Y4YwAK1LahojieB'),
(9, 'Cable', 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/494347/494347._SX1280_QL80_TTD_.jpg'),
(10, 'X-Force', 'https://ss-images.catscdn.vn/2018/05/31/2921811/x-men_92_vol_1_3_textless.jpg'),
(11, 'X-men Wolverine', 'https://darksidecomics.s3.us-east-2.amazonaws.com/previews/AUG181583.jpg?lastmod=1533154926'),
(12, 'DC Essential Graphic Novels 2016', 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/332255/332255._SX1280_QL80_TTD_.jpg'),
(13, 'Aqua Man', 'https://d1466nnw0ex81e.cloudfront.net/n_iv/600/3723215.jpg'),
(14, 'Variant Covers', 'https://pbs.twimg.com/media/EFPYoSeWsAE4qkG.jpg'),
(15, 'Batman', 'http://4.bp.blogspot.com/-UVWO6oyjJqU/U_3jLJzL3MI/AAAAAAAEnhQ/_SyLqkLRvVo/s1600/-000.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mangacategory`
--

CREATE TABLE `mangacategory` (
  `MangaID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mangacategory`
--

INSERT INTO `mangacategory` (`MangaID`, `CategoryID`) VALUES
(1, 11),
(1, 30),
(2, 11),
(2, 30),
(2, 46),
(3, 1),
(3, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MangaID` (`MangaID`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChapterID` (`ChapterID`);

--
-- Indexes for table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mangacategory`
--
ALTER TABLE `mangacategory`
  ADD PRIMARY KEY (`MangaID`,`CategoryID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `manga`
--
ALTER TABLE `manga`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`MangaID`) REFERENCES `manga` (`ID`);

--
-- Constraints for table `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`ChapterID`) REFERENCES `chapter` (`ID`);

--
-- Constraints for table `mangacategory`
--
ALTER TABLE `mangacategory`
  ADD CONSTRAINT `mangacategory_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `mangacategory_ibfk_2` FOREIGN KEY (`MangaID`) REFERENCES `manga` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
