DROP DATABASE IF EXISTS employe_dept;
CREATE DATABASE IF NOT EXISTS  employe_dept;
USE  employe_dept;

-- STRUCTURE DE LA TABLE dept


CREATE TABLE dept (
  DEPTNO int(10) UNSIGNED NOT NULL,
  DNAME varchar(50) NOT NULL,
  LOC varchar(150) NOT NULL
) 
ENGINE = InnoDB
 CHARSET utf8
 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- STRUCTURE DE LA TABLE emp
--

CREATE TABLE `emp` (
  EMPNO int(10) UNSIGNED NOT NULL,
  ENAME varchar(50) NOT NULL,
  JOB varchar(50) NOT NULL,
  MGR int(10) UNSIGNED DEFAULT NULL,
  HIREDATE date NOT NULL,
  SAL decimal(8,2) NOT NULL,
  COMM int(11) DEFAULT NULL,
  DEPTNO int(10) UNSIGNED NOT NULL
) 
ENGINE = InnoDB
 CHARSET utf8
 COLLATE utf8_general_ci;
-- Déchargement des données de la table `dept`
--

INSERT INTO `dept` (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEWYORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');


-- Déchargement des données de la table `emp`
--

INSERT INTO `emp` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', '800.00', NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', '1600.00', 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', '1250.00', 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', '2975.00', NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-11-28', '1250.00', 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', '2850.00', NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-07-09', '2450.00', NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', '3000.00', NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', '5000.00', NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', '1500.00', 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', '1100.00', NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', '950.00', NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', '3000.00', NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', '1300.00', NULL, 10);
COMMIT;


--  PREMIERE PARTIE 

-- QUESTION 1 : Donner nom, job, numéro et salaire de tous les employés, puis seulement des employés du département 10


SELECT `ENAME`,`JOB`,`EMPNO`,`SAL` FROM `emp` ; 

SELECT `ENAME`,`JOB`,`EMPNO`FROM `emp` WHERE `DEPTNO`=10 ; 

-- QESTION 2 : Donner nom, job et salaire des employés de type MANAGER dont le salaire est supérieur à 2800

SELECT `ENAME`,`JOB`,`EMPNO`FROM `emp` WHERE  `JOB`='MANAGER' AND `SAL`> 2800 ; 

-- QUESTION 3:

SELECT `JOB` FROM `emp` WHERE `JOB`= 'MANAGER' AND DEPTNO != 30;

-- QUESTION 4 : Liste des employés de salaire compris entre 1200 et 1400

SELECT * FROM `emp`  WHERE `SAL` BETWEEN 1200 AND 1400;

--  QUESTION 5 : Liste des employés des départements 10 et 30 classés dans l'ordre alphabétique 

SELECT `ENAME` FROM `emp`    WHERE `DEPTNO` IN(10,30)  ORDER BY `ENAME` ;

-- QUESTION 6 Liste des employés du département 30 classés dans l'ordre des salaires croissants

SELECT `ENAME` FROM `emp`    WHERE `DEPTNO` IN(30)  ORDER BY `SAL`ASC  ;

-- QUESTION 7 Liste de tous les employés classés par emploi et salaires décroissants

SELECT `ENAME` FROM `emp`    WHERE `DEPTNO`  ORDER BY (`JOB`)  ;

-- QUESTION 8 Liste des différents emplois

SELECT DISTINCT `JOB` FROM `emp` ORDER BY JOB ;

-- OU BIEN 

SELECT  `JOB`, COUNT(*), ROUND(AVG(`SAL`),2)  AS `SALAIRE MOYEN` FROM `emp` GROUP BY `JOB`;

-- QUESTION 9: Donner le nom du département où travaille ALLEN 

SELECT   dept.DNAME FROM emp INNER JOIN dept ON emp.DEPTNO  WHERE ENAME  = 'allen' ; 

SELECT dept.DNAME FROM  emp,dept WHERE emp.DEPTNO =dept.DEPTNO AND  ENAME ='ALLEN' ;
                                                                

-- QUESTION 10 : Liste des employés avec nom du département, nom, job, salaire classés par noms de départements et par salaires décroissants.

 SELECT `DNAME`,`ENAME`,`JOB`,`SAL` FROM `emp` INNER JOIN `dept`   ORDER BY  (`DNAME`) AND  (`SAL`)DESC;
 
 -- QUESTION 11 : Liste des employés vendeurs (SALESMAN) avec affichage de nom, salaire, commissions, salaire + commissions

SELECT `ENAME`,`SAL`,`COMM`,(`SAL` + `COMM`) FROM `emp` WHERE `JOB`= 'SALESMAN' ;



-- QUESTION 12  Liste des employés du département 20: nom, job, date d'embauche sous forme VEN 28 FEV 1997'
SET lc_time_names = `fr_FR` ;
SELECT `ENAME`,`JOB`,DATE_FORMAT(HIREDATE,'%a %e %b %Y') FROM `emp` WHERE `DEPTNO` IN(20)  ORDER BY (`ENAME`)    ; 

-- QUESTION 13 : Donner le salaire le plus élevé par département

SELECT DNAME, dept.DEPTNO, MAX(SAL) AS `SALAIRE MAX` FROM `emp`,`dept` WHERE dept.deptno=emp.deptno GROUP BY DNAME ,dept.DEPTNO;

-- QUESTION 14 : Donner département par département masse salariale, nombre d'employés, salaire moyen par type d'emploi.

                                                                 

-- QUESTION 15 :Même question mais on se limite aux sous-ensembles d'au moins 2 employés

-- QUESTION 16 : Liste des employés (Nom, département, salaire) de même emploi que JONES

SELECT job,ename,dname,sal FROM emp,dept WHERE emp.deptno = dept.deptno AND JOB=(SELECT JOB FROM emp where ename = 'JONES');



-- DEUXIEME PARTIE   
-- QUESTION 5 :
SELECT ename FROM dept.DEPTNO inner join emp.DEPTNO where loc= 'DALLAS';











