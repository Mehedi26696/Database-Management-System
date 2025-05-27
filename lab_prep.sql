
SELECT * FROM instructor;

--- Problem1:

--- Find the names of all instructors in the Computer Science department who have a salary greater than $70,000


--- First basic way

SELECT name FROM instructor 
WHERE dept_name = 'Comp. Sci.' and salary > 70000;

--- INNER JOIN -- ON

SELECT i.name
FROM instructor i
JOIN department d ON i.dept_name = d.dept_name
WHERE i.salary > 70000 AND d.dept_name = 'Comp. Sci.';


-- NATURAL JOIN

SELECT name
FROM instructor
NATURAL JOIN department
WHERE salary > 70000 AND dept_name = 'Comp. Sci.';

--- Cartesian Cross

SELECT i.name
FROM instructor i, department d
WHERE i.dept_name = d.dept_name
  AND i.salary > 70000
  AND d.dept_name = 'Comp. Sci.';

--- Scalar Sub Query

SELECT name
FROM instructor
WHERE salary > 70000
  AND dept_name = (
    SELECT dept_name
    FROM department
    WHERE dept_name = 'Comp. Sci.');

--- Using IN

SELECT name
FROM instructor
WHERE salary > 70000
  AND dept_name IN (
    SELECT dept_name
    FROM department
    WHERE dept_name = 'Comp. Sci.'
  );

--- Using Exists

SELECT i.name
FROM instructor i
WHERE i.salary > 70000
  AND EXISTS (
    SELECT 1
    FROM department d
    WHERE d.dept_name = 'Comp. Sci.'
      AND d.dept_name = i.dept_name
  );

--- Using Cross Join

SELECT i.name
FROM instructor i
CROSS JOIN department d
WHERE i.salary > 70000
  AND i.dept_name = d.dept_name
  AND d.dept_name = 'Comp. Sci.';


--- Using With

WITH cs_dept AS (
  SELECT dept_name FROM department WHERE dept_name = 'Comp. Sci.'
)
SELECT i.name
FROM instructor i
JOIN cs_dept c ON i.dept_name = c.dept_name
WHERE i.salary > 70000;



--- Problem2:
--- Retrieve the names of all instructors, along with their department names and department building name

--- cartesian cross 
SELECT i.name,d.dept_name,d.building
FROM instructor i , department d
WHERE i.dept_name = d.dept_name;


--- inner join

SELECT i.name,d.dept_name,d.building
FROM instructor i
JOIN department d ON i.dept_name = d.dept_name;


--- Natural Join

SELECT name,dept_name,building
FROM instructor
NATURAL JOIN department;

--- Scaller Subquery

SELECT i.name, i.dept_name,
       (SELECT d.building
        FROM department d
        WHERE d.dept_name = i.dept_name) AS building
FROM instructor i;


--- CROSS Join

SELECT i.name, d.dept_name, d.building
FROM instructor i
CROSS JOIN department d
WHERE i.dept_name = d.dept_name;

---Using

SELECT name, dept_name, building
FROM instructor
JOIN department USING (dept_name);

--- Using IN
SELECT i.name, i.dept_name,
       (SELECT d.building
        FROM department d
        WHERE d.dept_name = i.dept_name) AS building
FROM instructor i
WHERE i.dept_name IN (
  SELECT dept_name FROM department
);

--- Using With

WITH dept_info AS (
  SELECT dept_name, building FROM department
)
SELECT i.name, i.dept_name, d.building
FROM instructor i
JOIN dept_info d ON i.dept_name = d.dept_name;


--- Problem3:
--- For all instructors in the university who have taught some course, find their names and the course ID of all courses they taught

--- Cartesian Cross
SELECT name,course_id
FROM instructor i, teaches t
WHERE i.ID = t.ID;

--- Inner Join

SELECT name,course_id
FROM instructor i 
join teaches t
on i.ID = t.ID;

--- natural join

SELECT name,course_id
FROM instructor natural join teaches;


--- using 

SELECT name,course_id
FROM instructor join teaches using(ID);


--- Using With

WITH taught_courses AS (
  SELECT ID, course_id FROM teaches
)
SELECT i.name, t.course_id
FROM instructor i
JOIN taught_courses t ON i.ID = t.ID;


--- CROSS Join

SELECT i.name, t.course_id
FROM instructor i
CROSS JOIN teaches t
WHERE i.ID = t.ID;


--- Problem4:

--- Find the names of all instructors whose salary is greater than at least one instructor in the Biology department.

--- using cartesian cross
SELECT S.name, S.salary 
FROM instructor S , instructor T
WHERE S.salary > T.salary and T.dept_name = 'Biology';

--- some 


select name
from instructor
where salary > some (select salary
                from instructor
                where dept_name = 'Biology');

 
--- using sub query

SELECT name
FROM instructor
WHERE salary > ANY (
  SELECT salary
  FROM instructor
  WHERE dept_name = 'Biology'
);

--- Exists
SELECT i.name
FROM instructor i
WHERE EXISTS (
  SELECT 1
  FROM instructor b
  WHERE b.dept_name = 'Biology'
    AND i.salary > b.salary
);

--- Join ON

SELECT DISTINCT i.name
FROM instructor i
JOIN instructor b ON i.salary > b.salary
WHERE b.dept_name = 'Biology';

--- Cross Join

SELECT DISTINCT i.name
FROM instructor i
CROSS JOIN instructor b
WHERE b.dept_name = 'Biology'
  AND i.salary > b.salary;


--- Using with

WITH bio_salaries AS (
  SELECT salary FROM instructor WHERE dept_name = 'Biology'
)
SELECT DISTINCT i.name
FROM instructor i, bio_salaries b
WHERE i.salary > b.salary;


--- Problem5:

--- Find the names of all departments whose building name includes the substring 'Watson'.

select dept_name
from department
where building like '%Watson%';


--- Problem6:
--- Find the names of all instructors with salary between $90,000 and $100,000

--- using between
SELECT name
FROM instructor
WHERE salary BETWEEN 90000 AND 100000;

--- and 
SELECT name
FROM instructor
WHERE salary >= 90000 AND salary <= 100000;


--- Problem7:
--- Find courses that ran in Fall 2017 or in Spring 2018

--- where....or 
SELECT DISTINCT course_id
FROM section
WHERE (semester = 'Fall' AND year = 2017)
   OR (semester = 'Spring' AND year = 2018);

--- Union

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
UNION
SELECT DISTINCT course_id
FROM section
WHERE semester = 'Spring' AND year = 2018;

--- Exists
SELECT DISTINCT s.course_id
FROM section s
WHERE EXISTS (
  SELECT 1
  FROM dual
  WHERE (s.semester = 'Fall' AND s.year = 2017)
     OR (s.semester = 'Spring' AND s.year = 2018)
);

--- in

select distinct course_id
from section
where semester = 'Fall' and year= 2017 and course_id in (select course_id
                                 from section
                                 where semester = 'Spring' and year= 2018);

--- With

WITH valid_terms AS (
  SELECT 'Fall' AS semester, 2017 AS year FROM dual
  UNION
  SELECT 'Spring', 2018 FROM dual
)
SELECT DISTINCT s.course_id
FROM section s
JOIN valid_terms vt
ON s.semester = vt.semester AND s.year = vt.year;




--- Problem8:
--- Find courses that ran in Fall 2017 and in Spring 2018

--- where....and
SELECT DISTINCT course_id
FROM section
WHERE (semester = 'Fall' AND year = 2017)
   AND (semester = 'Spring' AND year = 2018);

--- Union

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
INTERSECT
SELECT DISTINCT course_id
FROM section
WHERE semester = 'Spring' AND year = 2018;

--- in

select distinct course_id
from section
where semester = 'Fall' and year= 2017 and course_id  not in (select course_id
                                 from section
                                 where semester = 'Spring' and year= 2018);

--- Exists
SELECT DISTINCT s.course_id
FROM section s
WHERE EXISTS (
  SELECT 1
  FROM dual
  WHERE (s.semester = 'Fall' AND s.year = 2017)
     AND (s.semester = 'Spring' AND s.year = 2018)
);

--- With

WITH valid_terms AS (
  SELECT 'Fall' AS semester, 2017 AS year FROM dual
  INTERSECT
  SELECT 'Spring', 2018 FROM dual
)
SELECT DISTINCT s.course_id
FROM section s
JOIN valid_terms vt
ON s.semester = vt.semester AND s.year = vt.year;


--- With

WITH fall_2017 AS (
  SELECT course_id FROM section WHERE semester = 'Fall' AND year = 2017
),
spring_2018 AS (
  SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2018
)
SELECT course_id FROM fall_2017
INTERSECT
SELECT course_id FROM spring_2018;


---problem9:
---Find the average salary of instructors in the Computer Science department 

--- direct
SELECT AVG(salary) AS avg_salary
FROM instructor
WHERE dept_name = 'Comp. Sci.';

--- sub query

SELECT (
  SELECT AVG(salary)
  FROM instructor
  WHERE dept_name = 'Comp. Sci.'
) AS avg_salary
FROM dual;


--- with

WITH cs_instructors AS (
  SELECT salary
  FROM instructor
  WHERE dept_name = 'Comp. Sci.'
)
SELECT AVG(salary) AS avg_salary
FROM cs_instructors;


--- Problem10:
--- Find the total number of instructors who teach a course in the Spring 2018 semester

--- 
SELECT COUNT(DISTINCT ID) AS num_instructors
FROM teaches
WHERE semester = 'Spring' AND year = 2018;

--- Exists
SELECT COUNT(*)
FROM instructor i
WHERE EXISTS (
  SELECT 1
  FROM teaches t
  WHERE t.ID = i.ID
    AND t.semester = 'Spring'
    AND t.year = 2018
);

--- IN

SELECT COUNT(*)
FROM instructor
WHERE ID IN (
  SELECT ID
  FROM teaches
  WHERE semester = 'Spring' AND year = 2018
);

--- With

WITH spring18_teachers AS (
  SELECT DISTINCT ID
  FROM teaches
  WHERE semester = 'Spring' AND year = 2018
)
SELECT COUNT(*) AS num_instructors
FROM spring18_teachers;


--- Problem11:
--- Find the average salary of instructors in each department

--- Group By

SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name;

--- With

WITH dept_salaries AS (
  SELECT dept_name, salary
  FROM instructor
)
SELECT dept_name, AVG(salary) AS avg_salary
FROM dept_salaries
GROUP BY dept_name;



--- Problem12:
--- Find the number of instructors in each department who teach a course in the Spring 2018 semester.

--- using natural join

select dept_name, count (distinct ID) as instr_count
	from instructor natural join teaches
	where semester = 'Spring' and year = 2018
	group by dept_name;

--- Using JOIN

SELECT i.dept_name, COUNT(DISTINCT i.ID) AS num_instructors
FROM instructor i
JOIN teaches t ON i.ID = t.ID
WHERE t.semester = 'Spring' AND t.year = 2018
GROUP BY i.dept_name;

--- Using with
WITH spring2010_teaches AS (
  SELECT DISTINCT ID
  FROM teaches
  WHERE semester = 'Spring' AND year = 2018
)
SELECT i.dept_name, COUNT(*) AS num_instructors
FROM instructor i
JOIN spring2010_teaches t ON i.ID = t.ID
GROUP BY i.dept_name;

--- Using EXISTS

SELECT i.dept_name, COUNT(*) AS num_instructors
FROM instructor i
WHERE EXISTS (
  SELECT 1 FROM teaches t
  WHERE t.ID = i.ID
    AND t.semester = 'Spring'
    AND t.year = 2018
)
GROUP BY i.dept_name;


--- scalar subquery

SELECT DISTINCT i.dept_name,
  (SELECT COUNT(DISTINCT t.ID)
   FROM teaches t
   JOIN instructor i2 ON i2.ID = t.ID
   WHERE i2.dept_name = i.dept_name
     AND t.semester = 'Spring' AND t.year = 2018
  ) AS num_instructors
FROM instructor i;


--- Problem13:
--- Find the names and average salaries of all departments whose average salary is greater than 42000

---Using having

SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;

SELECT d.dept_name, AVG(i.salary) AS avg_salary
FROM instructor i
JOIN department d ON i.dept_name = d.dept_name
GROUP BY d.dept_name
HAVING AVG(i.salary) > 42000;


--- with

WITH dept_avg_salary AS (
  SELECT dept_name, AVG(salary) AS avg_salary
  FROM instructor
  GROUP BY dept_name
)
SELECT dept_name, avg_salary
FROM dept_avg_salary
WHERE avg_salary > 42000;

--- Sub query

SELECT DISTINCT i.dept_name,
       (SELECT AVG(salary)
        FROM instructor i2
        WHERE i2.dept_name = i.dept_name) AS avg_salary
FROM instructor i
WHERE (SELECT AVG(salary)
       FROM instructor i2
       WHERE i2.dept_name = i.dept_name) > 42000;


--- Problem14:
--- For each course section offered in 2017, find the average total credits (tot_cred) of all students enrolled in the section, if the section had at least 2 students. 

--- Natural Join

select course_id, semester, year, sec_id, avg (tot_cred)
	from takes natural join student
	where year = 2017
	group by course_id, semester, year, sec_id
	having count (ID) >= 2;

--- join

SELECT t.course_id, t.sec_id, t.semester, t.year,
       AVG(s.tot_cred) AS avg_tot_cred
FROM takes t
JOIN student s ON t.ID = s.ID
WHERE t.year = 2017
GROUP BY t.course_id, t.sec_id, t.semester, t.year
HAVING COUNT(*) >= 2;

SELECT sec.course_id, sec.sec_id, sec.semester, sec.year,
       AVG(st.tot_cred) AS avg_tot_cred
FROM section sec
JOIN takes t ON sec.course_id = t.course_id
            AND sec.sec_id = t.sec_id
            AND sec.semester = t.semester
            AND sec.year = t.year
JOIN student st ON t.ID = st.ID
WHERE sec.year = 2017
GROUP BY sec.course_id, sec.sec_id, sec.semester, sec.year
HAVING COUNT(*) >= 2;


--- With

WITH enrolled_students AS (
  SELECT t.course_id, t.sec_id, t.semester, t.year, s.tot_cred
  FROM takes t
  JOIN student s ON t.ID = s.ID
  WHERE t.year = 2017
)
SELECT course_id, sec_id, semester, year, AVG(tot_cred) AS avg_tot_cred
FROM enrolled_students
GROUP BY course_id, sec_id, semester, year
HAVING COUNT(*) >= 2;


--- Sub Query

SELECT DISTINCT t.course_id, t.sec_id, t.semester, t.year,
       (SELECT AVG(s.tot_cred)
        FROM takes t2
        JOIN student s ON t2.ID = s.ID
        WHERE t2.course_id = t.course_id
          AND t2.sec_id = t.sec_id
          AND t2.semester = t.semester
          AND t2.year = t.year
          AND t2.year = 2017
        GROUP BY t2.course_id, t2.sec_id, t2.semester, t2.year
        HAVING COUNT(*) >= 2
       ) AS avg_tot_cred
FROM takes t
WHERE t.year = 2017;



--- Problem15:
--- Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 10101

--- in 
select count (distinct ID)
from takes
where (course_id, sec_id, semester, year) in (select course_id, sec_id, semester, year
                                 from teaches
                                 where teaches.ID= 10101);
--- join 

SELECT COUNT(DISTINCT tks.ID) AS total_students
FROM teaches t
JOIN takes tks ON t.course_id = tks.course_id
              AND t.sec_id = tks.sec_id
              AND t.semester = tks.semester
              AND t.year = tks.year
WHERE t.ID = '10101';

--- exists

SELECT COUNT(DISTINCT tks.ID) AS total_students
FROM takes tks
WHERE EXISTS (
  SELECT 1
  FROM teaches t
  WHERE t.ID = '10101'
    AND t.course_id = tks.course_id
    AND t.sec_id = tks.sec_id
    AND t.semester = tks.semester
    AND t.year = tks.year
);


--- with

WITH taught_sections AS (
  SELECT course_id, sec_id, semester, year
  FROM teaches
  WHERE ID = '10101'
)
SELECT COUNT(DISTINCT tks.ID) AS total_students
FROM takes tks
JOIN taught_sections ts ON tks.course_id = ts.course_id
                        AND tks.sec_id = ts.sec_id
                        AND tks.semester = ts.semester
                        AND tks.year = ts.year;




--- Problem16:
-- Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.

--- Using all

SELECT name
FROM instructor
WHERE salary > ALL (
  SELECT salary
  FROM instructor
  WHERE dept_name = 'Biology'
);

--- Exists
SELECT i1.name
FROM instructor i1
WHERE NOT EXISTS (
  SELECT 1
  FROM instructor i2
  WHERE i2.dept_name = 'Biology'
    AND i1.salary <= i2.salary
);


--- scaler subquery

SELECT name
FROM instructor
WHERE salary > (
  SELECT MAX(salary)
  FROM instructor
  WHERE dept_name = 'Biology'
);



-- with

WITH bio_max AS (
  SELECT MAX(salary) AS max_salary
  FROM instructor
  WHERE dept_name = 'Biology'
)
SELECT name
FROM instructor, bio_max
WHERE salary > bio_max.max_salary;



 

-- Problem17:
-- Find the departments that have the highest average salary

--- using all

select dept_name
from instructor
group by dept_name
having avg (salary) >= all (select avg (salary)
                      from instructor
                      group by dept_name);

--- with 
WITH dept_avg AS (
  SELECT dept_name, AVG(salary) AS avg_salary
  FROM instructor
  GROUP BY dept_name
),
max_avg AS (
  SELECT MAX(avg_salary) AS max_salary FROM dept_avg
)
SELECT dept_name
FROM dept_avg, max_avg
WHERE dept_avg.avg_salary = max_avg.max_salary;

 

--- Problem18:
-- Find all students who have taken all courses offered in the Biology department.

-- Using exists and minus
SELECT s.ID, s.name
FROM student s
WHERE NOT EXISTS (
  SELECT c.course_id
  FROM course c
  WHERE c.dept_name = 'Finance'
  MINUS
  SELECT t.course_id
  FROM takes t
  WHERE t.ID = s.ID
);




--- Problem19:
-- Find all courses that were offered at most once in 2017

--- having
SELECT course_id
FROM section
WHERE year = 2017
GROUP BY course_id
HAVING COUNT(*) <= 1;


--- With

WITH section_counts AS (
  SELECT course_id, COUNT(*) AS cnt
  FROM section
  WHERE year = 2017
  GROUP BY course_id
)
SELECT course_id
FROM section_counts
WHERE cnt <= 1;

--- NOT Exists

SELECT DISTINCT s1.course_id
FROM section s1
WHERE year = 2017
  AND NOT EXISTS (
    SELECT 1
    FROM section s2
    WHERE s2.course_id = s1.course_id
      AND s2.year = 2017
      AND s2.sec_id <> s1.sec_id
  );




