CREATE DATABASE TiposDeDatos;
USE TiposDeDatos;

DROP TABLE IF EXISTS `flotantes`;

CREATE TABLE IF NOT EXISTS `flotantes` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `float` FLOAT NOT NULL,
    `double` DOUBLE NOT NULL,
    `decimal_d_mayor_cero` DECIMAL(10,2) NOT NULL,
    `decimal_d_igual_cero` DECIMAL(10,0) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE=MyISAM AUTO_INCREMENT = 3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `flotantes` (
    `float`,
    `double`,
    `decimal_d_mayor_cero`,
    `decimal_d_igual_cero`
) 
VALUES (
    3.14159265358979323846264338327950288419716939937,
    3.14159265358979323846264338327950288419716939937,
    3.14159265358979323846264338327950288419716939937,
    3.14159265358979323846264338327950288419716939937
);

DROP TABLE IF EXISTS `decimal_table`;

CREATE TABLE IF NOT EXISTS `decimal_table`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `field_2.1` DECIMAL(2,1) DEFAULT NULL,
    `field_8.2` DECIMAL(8,2) DEFAULT NULL,
    `field_10.2` DECIMAL(10,2) DEFAULT NULL,
    `field_10.4` DECIMAL(10,4) DEFAULT NULL,
    PRIMARY KEY(`id`)
)ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `collation_case` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `utf8_unicode_ci` CHAR(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
    `latin1_general_cs` CHAR(10) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
    `ascii_general_ci` CHAR(10) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
    `utf8_bin` CHAR(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
    `latin1_bin` CHAR(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
    `ascii_bin` CHAR(10) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `collation_case` 
    (`utf8_unicode_ci`, `latin1_general_cs`, `ascii_general_ci`, `utf8_bin`, `latin1_bin`, `ascii_bin`)
VALUES 
    ('palabra', 'palabra', 'palabra', 'palabra', 'palabra', 'palabra');

INSERT INTO `collation_case` 
    (`utf8_unicode_ci`, `latin1_general_cs`, `ascii_general_ci`, `utf8_bin`, `latin1_bin`, `ascii_bin`)
VALUES 
    ('N', 'N', 'N', 'N', 'N', 'N');

INSERT INTO `collation_case` 
    (`utf8_unicode_ci`, `latin1_general_cs`, `utf8_bin`, `latin1_bin`, `ascii_bin`)
VALUES 
    ('Ñ', 'Ñ', 'Ñ', 'Ñ', 'Ñ');

INSERT INTO `collation_case` 
    (`utf8_unicode_ci`, `latin1_general_cs`, `utf8_bin`, `latin1_bin`)
VALUES 
    ('ñ', 'ñ', 'ñ', 'ñ');


SELECT *
FROM collation _case
WHERE utf8_unicode_ci
LIKE '%N%';

SELECT *
FROM collation_case
WHERE utf8_unicode_ci
LIKE '%ñ%';

SELECT *
FROM collation_case
WHERE utf8_unicode_ci
LIKE '%Ñ%';

DROP TABLE IF EXISTS `los_spanish`;

CREATE TABLE IF NOT EXISTS `los_spanish` (
    `utf8_spanish_ci` VARCHAR(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
    `utf8_spanish2_ci` VARCHAR(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `los_spanish` (`utf8_spanish_ci`, `utf8_spanish2_ci`)
VALUES
  ('Año', 'Año'),
  ('Cortes', 'Cortes'),
  ('Cruz', 'Cruz'),
  ('Chollo', 'Chollo'),
  ('Llorar', 'Llorar'),
  ('Lámina', 'Lámina'),
  ('Loreto', 'Loreto'),
  ('Dedo', 'Dedo');

SELECT `utf8_spanish_ci`
FROM `los_spanish`
ORDER BY `utf8_spanish_ci`;

SELECT `utf8_spanish2_ci`
FROM `los_spanish`
ORDER BY `utf8_spanish2_ci`;