-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2021 at 02:23 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universityinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `label`, `hours`) VALUES
(1001, 'C', 40),
(1002, 'C++', 48),
(1003, 'Java', 60),
(1004, 'Python', 60),
(1005, 'HTML', 48),
(1006, 'Computer Science', 50),
(1031, 'C#', 48),
(1032, 'CSS', 40),
(1033, 'PHP', 50),
(1034, 'Advance Java', 56),
(1035, 'JavaScript', 52),
(1036, 'Data Science', 56);

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_score` double NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`student_id`, `course_id`, `student_score`, `description`) VALUES
(1, 1002, 75, 'Good'),
(2, 1001, 92, 'Very Good'),
(3, 1003, 98, 'Well done'),
(8, 1032, 65, 'not bad'),
(9, 1004, 74, 'Good'),
(12, 1004, 79, 'Good'),
(13, 1006, 87, 'Good'),
(29, 1003, 85, 'Good'),
(29, 1004, 90, 'Very Good'),
(13, 1005, 90, 'Very Good'),
(14, 1005, 81, 'Good'),
(2, 1006, 90, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `sex` varchar(7) NOT NULL,
  `birthdate` date NOT NULL,
  `phone` varchar(14) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `sex`, `birthdate`, `phone`, `address`) VALUES
(1, 'Oliver', 'Jake', 'male', '1989-08-04', '12343456456', 'Birmingham'),
(2, 'Connor', 'Harry', 'male', '1987-07-21', '12343456456', 'Leeds'),
(3, 'Jacob', 'Harry', 'male', '1995-07-18', '55442545356', 'Glasgow'),
(8, 'Amelia', 'Margaret', 'female', '1998-07-17', '856623264', 'Glasgow'),
(9, 'George', 'Reece', 'male', '1998-11-02', '155525656662', 'Liverpool'),
(12, 'Olivia', 'Samantha', 'female', '1997-11-11', '15282258555', 'Liverpool'),
(13, 'Poppy', 'Joanne', 'female', '1995-05-16', '15282258555', 'North Lanarkshire'),
(14, 'Oscar', 'Harry', 'female', '2002-08-21', '2545245', 'Leeds'),
(26, 'William', 'Damian', 'Male', '1996-01-17', '2545245255', 'South Lanarkshire'),
(27, 'Damian', 'William', 'male', '1997-01-23', '254575454', 'Kingston-upon-Hull'),
(28, 'Lily', 'Michelle', 'female', '1997-01-09', '78515485585', 'South Gloucestershire'),
(29, 'Sophie', 'Tracy', 'female', '1997-07-10', '155825822828', 'Derby'),
(30, 'Merry', 'joss', 'female', '1996-08-09', '2451245454', 'north east'),
(31, 'Wabe', 'dave', 'Male', '1998-08-13', '32545454554', '10B/ Bromley ');

-- --------------------------------------------------------

--
-- Table structure for table `students_attendance`
--

CREATE TABLE `students_attendance` (
  `student_id` int(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `attendance` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_attendance`
--

INSERT INTO `students_attendance` (`student_id`, `first_name`, `last_name`, `date`, `attendance`) VALUES
(1, 'Oliver', 'Jake', '2021-01-14', 'Present'),
(2, 'Connor', 'Harry', '2021-01-14', 'Present'),
(3, 'Jacob', 'Harry', '2021-01-14', 'Present'),
(8, 'Amelia', 'Margaret', '2021-01-14', 'Present'),
(9, 'George', 'Reece', '2021-01-14', 'Present'),
(12, 'Olivia', 'Samantha', '2021-01-14', 'Present'),
(13, 'Poppy', 'Joanne', '2021-01-14', 'Present'),
(14, 'Oscar', 'Harry', '2021-01-14', 'Present'),
(26, 'William', 'Damian', '2021-01-14', 'Present'),
(27, 'Damian', 'William', '2021-01-14', 'Present'),
(28, 'Lily', 'Michelle', '2021-01-14', 'Absence'),
(29, 'Sophie', 'Tracy', '2021-01-14', 'Absence'),
(1, 'Oliver', 'Jake', '2021-08-08', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(30) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `gender`, `date`, `dept`, `phone`, `address`) VALUES
(1024, 'Noah', 'male', '1978-08-16', 'Java', '85689568655', 'Bath & North East Somerset'),
(1025, 'Liam', 'male', '1977-06-11', 'C', '57654657654', 'North East Lincolnshire'),
(1026, 'Mason', 'male', '1977-06-22', 'C++', '15558885582', 'North East Lincolnshire'),
(1027, 'William', 'male', '1977-06-22', 'HTML', '552154252552', 'Aylesbury Vale'),
(1028, 'Emma', 'female', '1975-06-12', 'PHP', '251755555252', 'Birmingham'),
(1029, 'Daniel', 'male', '1979-10-16', 'Python', '2154782251', 'Glasgow'),
(1030, 'Sophia', 'female', '1979-10-16', 'CSS', '152545255252', 'Edinburgh'),
(1031, 'Michael', 'male', '1983-12-15', 'Advance Java', '24512525255', 'Edinburgh'),
(1032, 'Ava', 'female', '1983-08-19', 'Advance Java', '44548867534', 'Tower Hamlets'),
(1033, 'Joanne', 'female', '1979-05-08', 'Java', '88858548855', 'Barnet');

-- --------------------------------------------------------

--
-- Table structure for table `teachers_attendance`
--

CREATE TABLE `teachers_attendance` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dept` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `attendance` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers_attendance`
--

INSERT INTO `teachers_attendance` (`id`, `name`, `dept`, `date`, `attendance`) VALUES
(1024, 'Noah', 'Java', '2021-08-09', 'Present'),
(1025, 'Liam', 'C', '2021-08-09', 'Present'),
(1026, 'Mason', 'C++', '2021-08-09', 'Absence'),
(1027, 'William', 'HTML', '2021-08-09', 'Present'),
(1028, 'Emma', 'PHP', '2021-08-09', 'Present'),
(1029, 'Daniel', 'Python', '2021-08-09', 'Present'),
(1031, 'Michael', 'Advance Java', '2021-08-09', 'Absence'),
(1031, 'Michael', 'Advance Java', '2021-08-09', 'Present'),
(1030, 'Sophia', 'CSS', '2021-08-01', 'Present'),
(1024, 'Noah', 'Java', '2021-08-16', 'Present'),
(1025, 'Liam', 'C', '2021-08-16', 'Present'),
(1026, 'Mason', 'C++', '2021-08-16', 'Present'),
(1027, 'William', 'HTML', '2021-08-16', 'Absence'),
(1028, 'Emma', 'PHP', '2021-08-16', 'Present'),
(1029, 'Daniel', 'Python', '2021-08-16', 'Present'),
(1030, 'Sophia', 'CSS', '2021-08-16', 'Present'),
(1031, 'Michael', 'Advance Java', '2021-08-16', 'Present'),
(1032, 'Ava', 'Java', '2021-08-16', 'Absence'),
(1033, 'Joanne', 'Java', '2021-08-16', 'Present'),
(1024, 'Noah', 'Java', '2021-08-08', 'Present'),
(1025, 'Liam', 'C', '2021-08-15', 'Present'),
(1026, 'Mason', 'C++', '2021-08-15', 'Absence');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_name`, `password`) VALUES
(1, 'admin', 'admin'),
(9, 'admin2', 'admin2'),
(10, 'admin3', 'admin3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD KEY `fk_score_student` (`student_id`),
  ADD KEY `fk_score_course` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_attendance`
--
ALTER TABLE `students_attendance`
  ADD KEY `fk_student_students_attendance` (`student_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers_attendance`
--
ALTER TABLE `teachers_attendance`
  ADD KEY `fk_teacher_teachers_attendance` (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1035;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `fk_score_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_score_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students_attendance`
--
ALTER TABLE `students_attendance`
  ADD CONSTRAINT `fk_student_students_attendance` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers_attendance`
--
ALTER TABLE `teachers_attendance`
  ADD CONSTRAINT `fk_teacher_teachers_attendance` FOREIGN KEY (`id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
