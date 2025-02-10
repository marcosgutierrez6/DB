DROP TABLE IF EXISTS `student`;

CREATE TABLE IF NOT EXISTS `student` (
    `ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `tot_cred` decimal(3,0) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY `dept_name` (`dept_name`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `student_test` AS SELECT * FROM `student`;

ALTER TABLE `student_test` ADD PRIMARY KEY (`ID`);

DROP TABLE `student_test`;