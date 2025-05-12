

insert into classroom values ('Packard', '101', '500');
insert into classroom values ('Painter', '514', '10');
insert into classroom values ('Taylor', '3128', '70');
insert into classroom values ('Watson', '100', '30');
insert into classroom values ('Watson', '120', '50');
insert into department values ('Biology', 'Watson', '90000');
insert into department values ('Comp. Sci.', 'Taylor', '100000');
insert into department values ('Elec. Eng.', 'Taylor', '85000');
insert into department values ('Finance', 'Painter', '120000');
insert into department values ('History', 'Painter', '50000');
insert into department values ('Music', 'Packard', '80000');
insert into department values ('Physics', 'Watson', '70000');
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instructor values ('12121', 'Wu', 'Finance', '90000');
insert into instructor values ('15151', 'Mozart', 'Music', '40000');
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
insert into instructor values ('32343', 'El Said', 'History', '60000');
insert into instructor values ('33456', 'Gold', 'Physics', '87000');
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instructor values ('58583', 'Califieri', 'History', '62000');
insert into instructor values ('76543', 'Singh', 'Finance', '80000');
insert into instructor values ('76766', 'Crick', 'Biology', '72000');
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');
insert into section values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B');
insert into section values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A');
insert into section values ('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');
insert into section values ('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F');
insert into section values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'E');
insert into section values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'A');
insert into section values ('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D');
insert into section values ('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B');
insert into section values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C');
insert into section values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A');
insert into section values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C');
insert into section values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B');
insert into section values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C');
insert into section values ('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D');
insert into section values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A');
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2017');
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2018', null);
insert into advisor values ('00128', '45565');
insert into advisor values ('12345', '10101');
insert into advisor values ('23121', '76543');
insert into advisor values ('44553', '22222');
insert into advisor values ('45678', '22222');
insert into advisor values ('76543', '45565');
insert into advisor values ('76653', '98345');
insert into advisor values ('98765', '98345');
insert into advisor values ('98988', '76766');
insert into time_slot values ('A', 'M', '8', '0', '8', '50');
insert into time_slot values ('A', 'W', '8', '0', '8', '50');
insert into time_slot values ('A', 'F', '8', '0', '8', '50');
insert into time_slot values ('B', 'M', '9', '0', '9', '50');
insert into time_slot values ('B', 'W', '9', '0', '9', '50');
insert into time_slot values ('B', 'F', '9', '0', '9', '50');
insert into time_slot values ('C', 'M', '11', '0', '11', '50');
insert into time_slot values ('C', 'W', '11', '0', '11', '50');
insert into time_slot values ('C', 'F', '11', '0', '11', '50');
insert into time_slot values ('D', 'M', '13', '0', '13', '50');
insert into time_slot values ('D', 'W', '13', '0', '13', '50');
insert into time_slot values ('D', 'F', '13', '0', '13', '50');
insert into time_slot values ('E', 'T', '10', '30', '11', '45 ');
insert into time_slot values ('E', 'R', '10', '30', '11', '45 ');
insert into time_slot values ('F', 'T', '14', '30', '15', '45 ');
insert into time_slot values ('F', 'R', '14', '30', '15', '45 ');
insert into time_slot values ('G', 'M', '16', '0', '16', '50');
insert into time_slot values ('G', 'W', '16', '0', '16', '50');
insert into time_slot values ('G', 'F', '16', '0', '16', '50');
insert into time_slot values ('H', 'W', '10', '0', '12', '30');
insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');


COMMIT;


-- (*) means all attributes

SELECT * FROM student;

SELECT name FROM student;





-- Eliminate duplicates use distinct

-- Find the names of all departments with instructor and remove duplicates 


SELECT  dept_name FROM instructor;

SELECT distinct dept_name FROM instructor;


--- another way using groupp by

SELECT dept_name FROM instructor GROUP BY dept_name;





-- arithmetic operation to a column

SELECT ID,name,dept_name,salary/12 FROM instructor;



--- Where clause

--- Find all instructors in Comp. Sci. dept with salary > 80000

SELECT name FROM instructor WHERE dept_name = 'Comp. Sci.' and salary > 80000;



--- Cartesian/ Cross to connect two tables

SELECT * FROM instructor, teaches;


--- For all instructors who have taught some course, find their names and the course ID of the courses they taught

SELECT name, course_id 
FROM instructor,teaches
WHERE instructor.ID = teaches.ID;

--- Find the course ID,semester,year and title of each course offered by the Comp. Sci. department

SELECT section.course_id,semester,year,title 
FROM section,course
WHERE section.course_id = course.course_id and dept_name = 'Comp. Sci.';



--- Natural Join

SELECT * FROM instructor NATURAL JOIN teaches;


-- List the names of instructors along with course ID of the courses that they taught

SELECT name, course_id 
FROM instructor NATURAL JOIN teaches;

-- List the names of instructors along with the titles of the courses that they teach

SELECT name,title FROM instructor NATURAL JOIN teaches,course
WHERE teaches.course_id = course.course_id;

-- another way 
SELECT name,title FROM (instructor NATURAL JOIN teaches)
JOIN course USING (course_id);




-- Rename Operation

SELECT ID,name,salary/12 as monthly_salary FROM instructor;



--- Find the names of all instructors who gave a higher salary than some instructor in 'Comp. Sci.'

SELECT DISTINCT T.name 
FROM instructor T ,instructor S
WHERE T.salary > S.salary and S.dept_name = 'Comp. Sci.';


--- Another way of doing this


SELECT name
FROM instructor
WHERE salary > ANY (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
);


-- another way 
SELECT T.name
FROM instructor T
WHERE EXISTS (
    SELECT 1
    FROM instructor S
    WHERE S.dept_name = 'Comp. Sci.'
      AND T.salary > S.salary
);




--- String Operations

---  Find the names of all instructors whose name includes the substring 'dar';

SELECT name FROM instructor 
WHERE name like '%dar%';

SELECT name FROM instructor 
WHERE name like '____';



--- Order BY

--- List in alphabetic order the names of all instructors

SELECT name FROM instructor ORDER BY name;

SELECT name FROM instructor ORDER BY name desc;

SELECT name,dept_name FROM instructor ORDER BY dept_name, name;


 
--- Find the names of all instructors with salary between $90,000 and $100,000 (that is, ≥ $90,000 and ≤ $100,000)

SELECT name FROM instructor 
WHERE salary between 90000 and 100000;



-- Find the instructors who teach and are from Biology department

SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches.ID
  AND dept_name = 'Biology';


SELECT instructor.name, teaches.course_id
FROM instructor
JOIN teaches ON instructor.ID = teaches.ID
WHERE instructor.dept_name = 'Biology';




--- SET Operations

-- Find courses that ran in Fall 2017 or in Spring 2018

SELECT * FROM section;


(select course_id from section where semester = 'Fall' and year = 2017)
union
(select course_id from section where semester = 'Spring' and year = 2018);


-- another way

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
  OR course_id  IN (
    SELECT course_id
    FROM section
    WHERE semester = 'Spring' AND year = 2018
  );


-- another way

SELECT DISTINCT s1.course_id
FROM section s1
WHERE s1.semester = 'Fall' AND s1.year = 2017
  OR EXISTS (
    SELECT 1
    FROM section s2
    WHERE s2.semester = 'Spring' AND s2.year = 2018
      AND s2.course_id = s1.course_id
  );


-- Find courses that ran in Fall 2017 and in Spring 2018

 
(select course_id from section where semester = 'Fall' and year = 2017)
intersect
(select course_id from section where semester = 'Spring' and year = 2018);


-- another way 

SELECT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
  AND course_id  IN (
    SELECT course_id
    FROM section
    WHERE semester = 'Spring' AND year = 2018
  );


-- another way

SELECT s1.course_id
FROM section s1
WHERE s1.semester = 'Fall' AND s1.year = 2017
  AND  EXISTS (
    SELECT 1
    FROM section s2
    WHERE s2.semester = 'Spring' AND s2.year = 2018
      AND s2.course_id = s1.course_id
  );


-- Find courses that ran in Fall 2017 not in Spring 2018
(SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017)
EXCEPT
(SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018);


-- another way

SELECT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
  AND course_id NOT IN (
    SELECT course_id
    FROM section
    WHERE semester = 'Spring' AND year = 2018
  );


-- another way

SELECT s1.course_id
FROM section s1
WHERE s1.semester = 'Fall' AND s1.year = 2017
  AND NOT EXISTS (
    SELECT 1
    FROM section s2
    WHERE s2.semester = 'Spring' AND s2.year = 2018
      AND s2.course_id = s1.course_id
  );




--- NUll Values

--- Find all instructors whose salary is null

SELECT name FROM instructor WHERE salary IS NULL;




--- Aggregate Functions 


SELECT avg(salary) FROM instructor
WHERE dept_name = 'Comp. Sci.';


-- Find the total number of instructors who teach a course in the Spring 2018 semester

SELECT count(ID) FROM teaches
WHERE semester = 'Spring' and year = '2018';


-- here distinct uses if an instructor teaches more than one courses

SELECT count(distinct ID) FROM teaches
WHERE semester = 'Spring' and year = '2018';


-- Find the average salary of instructors in each department

select dept_name, avg (salary) as avg_salary_dept_wise
from instructor
group by dept_name;

-- Find the average salary of instructors of all departments

select avg (salary) as avg_salary
from instructor;




-- Find the number of instructors in each department who teach a course in the Spring 2018 semester.

select dept_name, count (distinct ID) as instr_count
from instructor natural join teaches
where semester = 'Spring' and year = 2018
group by dept_name;


-- another way

SELECT * FROM teaches;
SELECT * FROM instructor;
select instructor.dept_name, count (distinct instructor.ID) as instr_count
from instructor, teaches
where instructor.ID = teaches.ID and semester = 'Spring' and year = 2018
group by instructor.dept_name;


-- another way

SELECT instructor.dept_name, COUNT(DISTINCT instructor.ID) AS instr_count
FROM instructor
JOIN teaches ON instructor.ID = teaches.ID
WHERE teaches.semester = 'Spring' AND teaches.year = 2018
GROUP BY instructor.dept_name;



-- Find the names and average salaries of all departments whose average salary is greater than 42000


select dept_name, avg (salary)
from instructor
group by dept_name
having avg (salary) > 42000;


-- another way

SELECT dept_name, avg_salary
FROM (
    SELECT dept_name, AVG(salary) AS avg_salary
    FROM instructor
    GROUP BY dept_name
) 
WHERE avg_salary > 42000;


-- another way 

WITH dept_avg AS (
  SELECT dept_name, AVG(salary) AS avg_salary
  FROM instructor
  GROUP BY dept_name
)
SELECT dept_name, avg_salary
FROM dept_avg
WHERE avg_salary > 42000;




-- For each course section offered in 2017, find the average total credits
-- (tot_cred) of all students enrolled in the section, if the section had at
-- least 2 students.


select course_id, semester, year, sec_id, avg (tot_cred)
from takes natural join student
where year = 2017
group by course_id, semester, year, sec_id
having count (ID) >= 2;


-- another way

SELECT * FROM takes;

SELECT * FROM student;

select course_id, semester, year, sec_id, avg (tot_cred)
from takes, student
where year = 2017 and takes.ID = student.ID
group by course_id, semester, year, sec_id
having count (student.ID) >= 2;

-- another way 

SELECT course_id, semester, year, sec_id, AVG(tot_cred) AS avg_cred
FROM (
    SELECT takes.course_id, takes.semester, takes.year, takes.sec_id, student.tot_cred
    FROM takes
    JOIN student ON takes.ID = student.ID
    WHERE takes.year = 2017
)
GROUP BY course_id, semester, year, sec_id
HAVING COUNT(*) >= 2;

-- another way

WITH takes_students AS (
  SELECT takes.course_id, takes.semester, takes.year, takes.sec_id, student.tot_cred
  FROM takes
  JOIN student ON takes.ID = student.ID
  WHERE takes.year = 2017
)

SELECT course_id, semester, year, sec_id, AVG(tot_cred) AS avg_tot_cred
FROM takes_students
GROUP BY course_id, semester, year, sec_id
HAVING COUNT(*) >= 2;





-- Find courses offered in Fall 2017 and in Spring 2018



select distinct course_id
from section
where semester = 'Fall' and year= 2017 and
course_id in (select course_id
from section
where semester = 'Spring' and year= 2018);



-- Find courses offered in Fall 2017 but not in Spring 2018

select distinct course_id
from section
where semester = 'Fall' and year= 2017 and
course_id not in (select course_id
from section
where semester = 'Spring' and year= 2018);



Select distinct name
from instructor
Where name not in ('Mozart', 'Einstein');


-- Find the total number of (distinct) students who have taken course
-- sections taught by the instructor with ID 10101

select count (distinct ID)
from takes
where (course_id, sec_id, semester, year) 
in (select course_id, sec_id, semester, year
from teaches
where teaches.ID= 10101); 


-- another way


select count (distinct T.ID)
from takes T , teaches s
where 
T.course_id = s.course_id and
T.sec_id = s.sec_id and
T.semester = s.semester and
T.year = s.year and
s.ID = 10101;


-- another way

SELECT COUNT(DISTINCT takes.ID) AS student_count
FROM takes
JOIN teaches
  ON takes.course_id = teaches.course_id
 AND takes.sec_id = teaches.sec_id
 AND takes.semester = teaches.semester
 AND takes.year = teaches.year
WHERE teaches.ID = 10101;



-- Find names of instructors with salary greater than that of some (at
-- least one) instructor in the Biology department.


select distinct T.name
from instructor T, instructor  S
where T.salary > S.salary and S.dept_name = 'Biology';

-- another way 

select name
from instructor
where salary > some (select salary
                        from instructor
                        where dept_name = 'Biology');


-- Find the names of all instructors whose salary is greater than the
-- salary of all instructors in the Biology department.


select name
from instructor
where salary > all (select salary
                        from instructor
                        where dept_name = 'Biology');



-- Find the departments that have the highest average salary.


select dept_name
from instructor
group by dept_name
having avg (salary) >= all (select avg (salary)
                                 from instructor
                                 group by dept_name);




-- Find all courses taught in both the Fall 2017 semester and in the Spring 2018 semester


select course_id
from section S
where semester = 'Fall' and year= 2017 and
                exists (select * from section  T
                       where semester = 'Spring' and year= 2018
                               and S.course_id= T.course_id);


-- Find all students who have taken all courses offered in the Finance department.

select distinct S.ID, S.name
from student S
where not exists ( (select course_id from course

                   where dept_name = 'Finance')
                   except
                  (select T.course_id from takes  T
                   where S.ID = T.ID));



-- Find all courses that were offered at most once in 2018
SELECT course_id
FROM section
GROUP BY course_id
HAVING COUNT(DISTINCT year) = 1 AND MAX(year) = 2018;


-- another way 

SELECT DISTINCT course_id
FROM section S
WHERE S.year = 2018
  AND NOT EXISTS (
    SELECT 1 FROM section R
    WHERE R.course_id = S.course_id AND R.year <> 2018
  );

-- another way

SELECT T.course_id
FROM course  T
WHERE 1 = (
  SELECT COUNT(R.course_id)
  FROM section  R
  WHERE T.course_id = R.course_id
    AND R.year = 2018
);


-- Find all courses that were offered at least twice in 2018

SELECT course_id
FROM section
WHERE year = 2018
GROUP BY course_id
HAVING COUNT(*) >= 2;


SELECT DISTINCT s1.course_id
FROM section s1
JOIN section s2
  ON s1.course_id = s2.course_id
 AND s1.year = 2018
 AND s2.year = 2018
 AND s1.sec_id <> s2.sec_id;




-- Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.

select dept_name, avg_salary
from (select dept_name, avg (salary) as avg_salary
                from instructor
                group by dept_name)
where avg_salary > 42000;


-- Find the names of each instructor, along with their salary and the average salary in their department

SELECT name, salary,
  (SELECT AVG(I2.salary)
   FROM instructor I2
   WHERE I2.dept_name = I1.dept_name) AS avg_salary
FROM instructor I1;



-- Find all departments with the maximum budget

with max_budget (value) as
    (select max(budget)
    from department)

select budget
from department, max_budget
where department.budget = max_budget.value;


-- Find all departments where the total salary is greater than the average of the total salary at all departments

with dept_total (dept_name, value) as
(select dept_name, sum(salary)
from instructor
group by dept_name),

dept_total_avg(value) as
(select avg(value)
from dept_total)


select dept_name
from dept_total, dept_total_avg
where dept_total.value >= dept_total_avg.value;



-- Lists all departments along with the number of instructors in each department

select dept_name,
(select count(*)
from instructor
where department.dept_name = instructor.dept_name)
as num_instructors
from department;

