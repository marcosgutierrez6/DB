# Índice

1. [Comandos Terminal](#comandos-terminal)
   - [Introducción](#introducción)
   - [Mostrar Variables](#mostrar-variables)
   - [Mostrar Bases de Datos](#mostrar-bases-de-datos)
   - [Crear Bases de Datos](#crear-bases-de-datos)
   - [Importar Bases de Datos](#importar-bases-de-datos)
   - [Acceder a MySQL Admin](#acceder-a-mysql-admin)
2. [Consultas SQL](#consultas-sql)
   - [Diferencia con NOT EXISTS](#diferencia-con-not-exists)
3. [DDL (Data Definition Language)](#ddl)
4. [DML (Data Manipulation Language)](#dml)
   - [DML Intermedio](#dml-intermedio)
5. [SQL Avanzada](#sql-avanzada)

---

# Comandos Terminal

## Introducción
En esta sección encontrarás comandos útiles para interactuar con MySQL desde la terminal. Incluye operaciones como visualizar configuraciones, administrar bases de datos y acceder a MySQL como administrador.

---

## Mostrar Variables
Consulta variables específicas del sistema en MySQL, como el puerto configurado:

```SQL
SHOW VARIABLES WHERE variable_name = 'port';
```

## Mostrar Bases de Datos
Muestra una lista de todas las bases de datos disponibles en el sistema:
```SQL
SHOW DATABASES;
```

## Crear Bases de Datos
Crea una nueva base de datos en el sistema MySQL:
```SQL
CREATE DATABASE nombre_de_la_base;
```

## Importar Bases de Datos
Importa una base de datos desde un archivo SQL. Asegúrate de reemplazar los valores entre paréntesis:
```SQL
sudo mysql -u root -p [nombre_de_base_de_datos] < [archivo.sql]
```

## Acceder a MySQL Admin
Inicia sesión en MySQL como administrador para gestionar bases de datos y tablas:
```SQL
sudo mysql -u root -p
```
Una vez dentro, selecciona una base de datos y visualiza sus tablas:
```SQL
USE nombre_de_la_base;
SHOW TABLES;
```


### Consultas SQL

Diferencia => Not exists

1. select s.name from student as s where major="Computer Science";

2. select s.name from student as s where s.major="Mathematics" union select ps.name from student as ps where ps.major="Computer Science";

3. select * from student as s cross join instructor as i;

4. select major from student intersect select major from instructor;

5. select i.name from instructor as i where not exists(select * from instructor as ins where ins.instructor_id=i.instructor_id and ins.major="Computer Science");

5.1 select i.name from instructor i where not exists(select * from instructor ins where ins.instructor_id=i.instructor_id and ins.major="Computer Science");

5.2 select i.name from instructor i where not exists(select 1 from instructor ins where ins.instructor_id=i.instructor_id and ins.major="Computer Science");

6. select * from student natural join enrollments;

6.1 select * from student natural join enrollments; -> No hace natural join, solo producto cartesiano, no descarta duplicados.

7. SELECT * FROM student LEFT OUTER JOIN enrollments ON student.student_id = enrollments.student_id;

7.1 SELECT * FROM student RIGHT OUTER JOIN enrollments ON student.student_id = enrollments.student_id;

8. SELECT AVG(salary) AS promedio FROM instructor i GROUP BY department_id;

9. SELECT count(i.name) from instructor as i;


### DDL

1. DESC (tabla);
```sql
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

```

### DML
```sql
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
```

### DML 2
Π Proyeccion -> SELECT DISTINCT
σ Select where
˄ AND
🇻 OR
ρ Renombrar

1. SELECT DISTINCT * FROM instructor;
2. SELECT * FROM instructor WHERE ID > 33456;
3. LIKE 'Pel%';
4. LIKE '%ha%';
5. ORDER BY
6. ASC -> Ascendente
7. DESC -> Descendente
Rangos -> WHERE BETWEEN == (A>=B) AND (A<=C)
```SQL
SELECT * FROM `student`
WHERE dept_name LIKE
'Comp. S_i.' EL _ sustituye un caracter

CREATE VIEW END AS SELECT * FROM instructor WHERE SALARY<98000;
```

## DML INTERMEDIO

1. Insertar -> INSERT INTO `instructor`(`ID`, `name`, `dept_name`, `salary`)
VALUES (98763,'Hitman','Comp. Sci.','20023.00');
```SQL
insert into instructor values(01, 'jusep', 'Finance', 90000);

INSERT INTO profesor SELECT * FROM instructor WHERE ID > 32343 AND ID < 45565 ;
insert into instructor select ID, name, dept_name, 18000 from   student where   dept_name = 'Music';
insert into instructor select * from student where dept_name = 'Music';
```

2. Actualizar -> UPDATE `instructor` SET `name`='Hitman-II', `dept_name`='Comp. Sci.', `salary`='20023' WHERE `ID`=98763 ;
 
#### Dar un aumento salarial del 5% a todos los instructores.
```SQL
update instructor set salary = salary * 1.05;
```
#### Dar un aumento salarial del 5% a los instructores que ganen menos de 70000
```SQL
update instructor set salary = salary * 1.05 where salary < 70000;
```
#### Dar un aumento salarial del 5% a los instructores cuyo salario sea inferior al promedio.
```SQL
update instructor set salary = salary * 1.05 where salary < (SELECT * FROM (SELECT avg(salary) FROM instructor)tempSalary);
```

3. Borrar -> DELETE FROM instructor WHERE dept_name= 'Finance’;
```SQL
delete from instructor where dept_name in (select dept_name from department where building = 'Watson');
delete from instructor where salary < (SELECT * FROM (select avg(salary) from instructor)tmpSalary);
```

4. Producto Cartesiano ->  SELECT * FROM student,instructor;
```SQL
SELECT * FROM student,instructor;
SELECT * FROM student CROSS JOIN instructor;
```

5. Union -> SELECT * FROM `student` UNION SELECT * FROM `instructor` WHERE dept_name = 'Finance';
```SQL
SELECT * FROM `student` UNION SELECT * FROM `instructor` WHERE dept_name = 'Finance';
```

## SQL Avanzada

```SQL
SELECT user, host FROM information_schema.processlist;

DELIMITER $$

DROP PROCEDURE IF EXISTS `test_comparison`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_comparison`()
BEGIN
    SELECT * FROM `instructor` WHERE `salary` = 87000;
    SELECT * FROM `instructor` WHERE `salary` <> 87000;
    SELECT * FROM `instructor` WHERE `salary` < 87000;
    SELECT * FROM `instructor` WHERE `salary` <= 87000;
    SELECT * FROM `instructor` WHERE `salary` > 87600;
    SELECT * FROM `instructor` WHERE `salary` = 87000;
END$$

DELIMITER ;

CALL test_comparison();
```