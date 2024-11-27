--
-- Base de datos: `uni_2023_students`
--

--
-- Estructura de tabla para la tabla `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4'),
('BIO-301', 'Genetics', 'Biology', '4'),
('BIO-399', 'Computational Biology', 'Biology', '3'),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4'),
('CS-190', 'Game Design', 'Comp. Sci.', '4'),
('CS-315', 'Robotics', 'Comp. Sci.', '3'),
('CS-319', 'Image Processing', 'Comp. Sci.', '3'),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3'),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3'),
('FIN-201', 'Investment Banking', 'Finance', '3'),
('HIS-351', 'World History', 'History', '3'),
('MU-199', 'Music Video Production', 'Music', '3'),
('PHY-101', 'Physical Principles', 'Physics', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building` (`building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `instructor`
--

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00'),
('12121', 'Wu', 'Finance', '90000.00'),
('15151', 'Mozart', 'Music', '40000.00'),
('22222', 'Einstein', 'Physics', '95000.00'),
('32343', 'El Said', 'History', '60000.00'),
('33456', 'Gold', 'Physics', '87000.00'),
('45565', 'Katz', 'Comp. Sci.', '75000.00'),
('58583', 'Califieri', 'History', '62000.00'),
('76543', 'Singh', 'Finance', '80000.00'),
('76766', 'Crick', 'Biology', '72000.00'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00'),
('98345', 'Kim', 'Elec. Eng.', '80000.00');

-- Estructura de tabla para la tabla `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES
('00128', 'Zhang', 'Comp. Sci.', '102'),
('12345', 'Shankar', 'Comp. Sci.', '32'),
('19991', 'Brandt', 'History', '80'),
('23121', 'Chavez', 'Finance', '110'),
('44553', 'Peltier', 'Physics', '56'),
('45678', 'Levy', 'Physics', '46'),
('54321', 'Williams', 'Comp. Sci.', '54'),
('55739', 'Sanchez', 'Music', '38'),
('70557', 'Snow', 'Physics', '56'),
('76543', 'Brown', 'Comp. Sci.', '58'),
('76653', 'Aoi', 'Elec. Eng.', '60'),
('98765', 'Bourikas', 'Elec. Eng.', '98'),
('98988', 'Tanaka', 'Biology', '120');

--
-- Estructura de la table takes
--

DROP TABLE IF EXISTS `takes`;
CREATE TABLE IF NOT EXISTS `takes` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES
('00128', 'CS-101', '1', 'Fall', '2017', 'A'),
('00128', 'CS-347', '1', 'Fall', '2017', 'A-'),
('12345', 'CS-101', '1', 'Fall', '2017', 'C'),
('12345', 'CS-190', '2', 'Spring', '2017', 'A'),
('12345', 'CS-315', '1', 'Spring', '2018', 'A'),
('12345', 'CS-347', '1', 'Fall', '2017', 'A'),
('19991', 'HIS-351', '1', 'Spring', '2018', 'B'),
('23121', 'FIN-201', '1', 'Spring', '2018', 'C+'),
('44553', 'PHY-101', '1', 'Fall', '2017', 'B-'),
('45678', 'CS-101', '1', 'Fall', '2017', 'F'),
('45678', 'CS-101', '1', 'Spring', '2018', 'B+'),
('45678', 'CS-319', '1', 'Spring', '2018', 'B'),
('54321', 'CS-101', '1', 'Fall', '2017', 'A-'),
('54321', 'CS-190', '2', 'Spring', '2017', 'B+'),
('55739', 'MU-199', '1', 'Spring', '2018', 'A-'),
('76543', 'CS-101', '1', 'Fall', '2017', 'A'),
('76543', 'CS-319', '2', 'Spring', '2018', 'A'),
('76653', 'EE-181', '1', 'Spring', '2017', 'C'),
('98765', 'CS-101', '1', 'Fall', '2017', 'C-'),
('98765', 'CS-315', '1', 'Spring', '2018', 'B'),
('98988', 'BIO-101', '1', 'Summer', '2017', 'A'),
('98988', 'BIO-301', '1', 'Summer', '2018', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teaches`
--

DROP TABLE IF EXISTS `teaches`;
CREATE TABLE IF NOT EXISTS `teaches` (
  `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sec_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Volcado de datos para la tabla `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('76766', 'BIO-101', '1', 'Summer', '2017'),
('76766', 'BIO-301', '1', 'Summer', '2018'),
('10101', 'CS-101', '1', 'Fall', '2017'),
('45565', 'CS-101', '1', 'Spring', '2018'),
('83821', 'CS-190', '1', 'Spring', '2017'),
('83821', 'CS-190', '2', 'Spring', '2017'),
('10101', 'CS-315', '1', 'Spring', '2018'),
('45565', 'CS-319', '1', 'Spring', '2018'),
('83821', 'CS-319', '2', 'Spring', '2018'),
('10101', 'CS-347', '1', 'Fall', '2017'),
('98345', 'EE-181', '1', 'Spring', '2017'),
('12121', 'FIN-201', '1', 'Spring', '2018'),
('32343', 'HIS-351', '1', 'Spring', '2018'),
('15151', 'MU-199', '1', 'Spring', '2018'),
('22222', 'PHY-101', '1', 'Fall', '2017');


