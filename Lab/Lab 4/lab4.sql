CREATE TABLE classroom (
    building      VARCHAR2(15),
    room_number   VARCHAR2(7),
    capacity      NUMBER(4,0),
    CONSTRAINT pk_classroom PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name     VARCHAR2(20),
    building      VARCHAR2(15),
    budget        NUMBER(12,2) CHECK (budget > 0),
    CONSTRAINT pk_department PRIMARY KEY (dept_name)
);

CREATE TABLE course (
    course_id     VARCHAR2(8),
    title         VARCHAR2(50),
    dept_name     VARCHAR2(20),
    credits       NUMBER(2,0) CHECK (credits > 0),
    CONSTRAINT pk_course PRIMARY KEY (course_id),
    CONSTRAINT fk_course_dept FOREIGN KEY (dept_name) REFERENCES department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE instructor (
    ID            VARCHAR2(5),
    name          VARCHAR2(20) NOT NULL,
    dept_name     VARCHAR2(20),
    salary        NUMBER(8,2) CHECK (salary > 29000),
    CONSTRAINT pk_instructor PRIMARY KEY (ID),
    CONSTRAINT fk_instructor_dept FOREIGN KEY (dept_name) REFERENCES department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE section (
    course_id     VARCHAR2(8),
    sec_id        VARCHAR2(8),
    semester      VARCHAR2(6) CHECK (semester IN ('Fall', 'Winter', 'Spring', 'Summer')),
    year          NUMBER(4,0) CHECK (year > 1701 AND year < 2100),
    building      VARCHAR2(15),
    room_number   VARCHAR2(7),
    time_slot_id  VARCHAR2(4),
    CONSTRAINT pk_section PRIMARY KEY (course_id, sec_id, semester, year),
    CONSTRAINT fk_section_course FOREIGN KEY (course_id) REFERENCES course (course_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_section_classroom FOREIGN KEY (building, room_number) REFERENCES classroom (building, room_number)
        ON DELETE SET NULL
);

CREATE TABLE teaches (
    ID            VARCHAR2(5),
    course_id     VARCHAR2(8),
    sec_id        VARCHAR2(8),
    semester      VARCHAR2(6),
    year          NUMBER(4,0),
    CONSTRAINT pk_teaches PRIMARY KEY (ID, course_id, sec_id, semester, year),
    CONSTRAINT fk_teaches_section FOREIGN KEY (course_id, sec_id, semester, year)
        REFERENCES section (course_id, sec_id, semester, year)
        ON DELETE CASCADE,
    CONSTRAINT fk_teaches_instructor FOREIGN KEY (ID) REFERENCES instructor (ID)
        ON DELETE CASCADE
);

CREATE TABLE student (
    ID            VARCHAR2(5),
    name          VARCHAR2(20) NOT NULL,
    dept_name     VARCHAR2(20),
    tot_cred      NUMBER(3,0) CHECK (tot_cred >= 0),
    CONSTRAINT pk_student PRIMARY KEY (ID),
    CONSTRAINT fk_student_dept FOREIGN KEY (dept_name) REFERENCES department (dept_name)
        ON DELETE SET NULL
);

CREATE TABLE takes (
    ID            VARCHAR2(5),
    course_id     VARCHAR2(8),
    sec_id        VARCHAR2(8),
    semester      VARCHAR2(6),
    year          NUMBER(4,0),
    grade         VARCHAR2(2),
    CONSTRAINT pk_takes PRIMARY KEY (ID, course_id, sec_id, semester, year),
    CONSTRAINT fk_takes_section FOREIGN KEY (course_id, sec_id, semester, year)
        REFERENCES section (course_id, sec_id, semester, year)
        ON DELETE CASCADE,
    CONSTRAINT fk_takes_student FOREIGN KEY (ID) REFERENCES student (ID)
        ON DELETE CASCADE
);

CREATE TABLE advisor (
    s_ID          VARCHAR2(5),
    i_ID          VARCHAR2(5),
    CONSTRAINT pk_advisor PRIMARY KEY (s_ID),
    CONSTRAINT fk_advisor_instructor FOREIGN KEY (i_ID) REFERENCES instructor (ID)
        ON DELETE SET NULL,
    CONSTRAINT fk_advisor_student FOREIGN KEY (s_ID) REFERENCES student (ID)
        ON DELETE CASCADE
);

CREATE TABLE time_slot (
    time_slot_id  VARCHAR2(4),
    day           VARCHAR2(1),
    start_hr      NUMBER(2) CHECK (start_hr >= 0 AND start_hr < 24),
    start_min     NUMBER(2) CHECK (start_min >= 0 AND start_min < 60),
    end_hr        NUMBER(2) CHECK (end_hr >= 0 AND end_hr < 24),
    end_min       NUMBER(2) CHECK (end_min >= 0 AND end_min < 60),
    CONSTRAINT pk_time_slot PRIMARY KEY (time_slot_id, day, start_hr, start_min)
);

CREATE TABLE prereq (
    course_id     VARCHAR2(8),
    prereq_id     VARCHAR2(8),
    CONSTRAINT pk_prereq PRIMARY KEY (course_id, prereq_id),
    CONSTRAINT fk_prereq_course FOREIGN KEY (course_id) REFERENCES course (course_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_prereq_prereq FOREIGN KEY (prereq_id) REFERENCES course (course_id)
);



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


CREATE TABLE inst_dup AS
SELECT * FROM instructor;


SELECT * FROM inst_dup;



SELECT count(*),count(salary),min(salary),max(salary),avg(salary),sum(salary),sum(salary)/count(*),sum(salary)/count(salary) FROM inst_dup;


UPDATE inst_dup
SET salary = NULL
WHERE dept_name = 'Comp. Sci.';

SELECT * FROM inst_dup;

SELECT count(*),count(salary),min(salary),max(salary),avg(salary),sum(salary),sum(salary)/count(*),sum(salary)/count(salary) FROM inst_dup;


-- wrong syntax
-- SELECT count(distinct*),count(salary),min(salary),max(salary),avg(salary),sum(salary),sum(salary)/count(*),sum(salary)/count(salary) FROM inst_dup;


UPDATE inst_dup 
SET salary = NULL;

SELECT count(*),count(salary),min(salary),max(salary),avg(salary),sum(salary),sum(salary)/count(*),sum(salary)/count(salary) FROM inst_dup;



-- Find courses offered in Fall 2009 and in Spring 2010

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
  AND course_id IN (
      SELECT course_id
      FROM section
      WHERE semester = 'Spring' AND year = 2018
  );

-- Find courses offered in Fall 2009 but not in Spring 2010

SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2017
  AND course_id not IN (
      SELECT course_id
      FROM section
      WHERE semester = 'Spring' AND year = 2018
  );


SELECT course_id
FROM section s
WHERE semester = 'Fall' AND year = 2017
   AND exists (SELECT *
    FROM section T
    WHERE semester = 'Spring' AND year = 2018
)

SELECT course_id
FROM section s
WHERE semester = 'Fall' AND year = 2017
   AND exists (SELECT *
    FROM section T
    WHERE semester = 'Spring' AND year = 2018
    and s.course_id = T.course_id
)



SELECT * FROM section;


SELECT count(ID) from takes
where (course_id,sec_id,semester,year) in
(select course_id,sec_id,semester,year
    from teaches
    where teaches.id = 10101
    )

SELECT count(distinct ID) from takes
where (course_id,sec_id,semester,year) in
(select course_id,sec_id,semester,year
    from teaches
    where teaches.id = 10101
)

SELECT * FROM takes;

SELECT  ID,course_id from takes
where (course_id,sec_id,semester,year) in
(select course_id,sec_id,semester,year
    from teaches
    where teaches.id = 10101
    )

SELECT distinct ID from takes
where (course_id,sec_id,semester,year) in
(select course_id,sec_id,semester,year
    from teaches
    where teaches.id = 10101
)

SELECT COUNT(DISTINCT t.ID)
FROM takes t
JOIN teaches s 
 ON t.course_id = s.course_id
 AND t.sec_id = s.sec_id
 AND t.semester = s.semester
 AND t.year = s.year
WHERE s.ID = 10101;

SELECT COUNT(DISTINCT t.ID) FROM takes t ,teaches s where 
    t.course_id = s.course_id and 
    t.sec_id = s.sec_id and 
    t.semester = s.semester and 
    t.year = s.year and 
    s.ID = 10101;

SELECT COUNT(DISTINCT takes.ID)
FROM takes
JOIN teaches using (course_id,sec_id,semester,year)
WHERE teaches.ID = 10101;

SELECT COUNT(DISTINCT ID)
FROM takes
NATURAL JOIN teaches
WHERE ID = 10101;

-- Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.

select distinct T.name
from instructor T, instructor S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

select T.name
from instructor T, instructor S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

SELECT name,salary from instructor 
    where salary > some(select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary >= some(select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary < some(select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name
FROM instructor
WHERE salary > SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
)
INTERSECT
SELECT name
FROM instructor
WHERE salary < SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
);



SELECT name
FROM instructor
WHERE salary >= SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
)
INTERSECT
SELECT name
FROM instructor
WHERE salary < SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
);


SELECT name
FROM instructor
WHERE salary >= SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
)
INTERSECT
SELECT name
FROM instructor
WHERE salary <= SOME (
    SELECT salary
    FROM instructor
    WHERE dept_name = 'Comp. Sci.'
);


SELECT name,salary from instructor 
    where salary = some(select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary in (select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary = some(select salary from instructor 
    where dept_name ='Comp. Sci.')
INTERSECT
SELECT name,salary from instructor 
    where salary in (select salary from instructor 
    where dept_name ='Comp. Sci.');

SELECT name,salary from instructor 
    where salary <> some(select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary not in (select salary from instructor 
    where dept_name ='Comp. Sci.')

-- =some and in same but <>some and not in is not same

SELECT name,salary from instructor 
    where salary > all (select salary from instructor 
    where dept_name ='Comp. Sci.')


 SELECT name,salary from instructor 
    where salary >= all (select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary < all (select salary from instructor 
    where dept_name ='Comp. Sci.')
    
SELECT name,salary from instructor 
    where salary <= all (select salary from instructor 
    where dept_name ='Comp. Sci.')

SELECT name,salary from instructor 
    where salary > all (select salary from instructor 
    where dept_name ='Biology')


SELECT name,salary from instructor 
    where salary >= all (select salary from instructor 
    where dept_name ='Biology')


SELECT name,salary from instructor 
    where salary = all (select salary from instructor 
    where dept_name ='Biology')
    
SELECT name,salary from instructor 
    where salary <> all (select salary from instructor 
    where dept_name ='Biology')


SELECT DISTINCT st.ID, st.name
FROM student st
WHERE NOT EXISTS (
    (SELECT course_id
     FROM course
     WHERE dept_name = 'Biology')
    MINUS
    (SELECT T.course_id
     FROM takes T
     WHERE T.ID = st.ID)
);


SELECT DISTINCT st.ID, st.name
FROM student st
WHERE NOT EXISTS (
    (SELECT course_id
     FROM course
     WHERE dept_name = 'Finance')
    MINUS
    (SELECT T.course_id
     FROM takes T
     WHERE T.ID = st.ID)
);

SELECT DISTINCT st.ID, st.name
FROM student st
WHERE NOT EXISTS (
    (SELECT course_id
     FROM course
     WHERE dept_name = 'History')
    MINUS
    (SELECT T.course_id
     FROM takes T
     WHERE T.ID = st.ID)
);

SELECT DISTINCT st.ID, st.name
FROM student st
WHERE NOT EXISTS (
    (SELECT course_id
     FROM course
     WHERE dept_name = 'Elec. Eng.')
    MINUS
    (SELECT T.course_id
     FROM takes T
     WHERE T.ID = st.ID)
);

SELECT * FROM department;


-- Find all courses that were offered at most once in 2009
SELECT T.course_id
FROM course T
WHERE 1 = (
    SELECT COUNT(R.course_id)
    FROM section R
    WHERE T.course_id = R.course_id
      AND R.year = 2009
);

SELECT T.course_id
FROM course T
WHERE 1 != (
    SELECT COUNT(R.course_id)
    FROM section R
    WHERE T.course_id = R.course_id
      AND R.year = 2009
);


-- Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.

SELECT dept_name, avg_salary
from (SELECT dept_name, avg (salary) as avg_salary
           from instructor
           group by dept_name)
where avg_salary > 42000;


SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;


-- result renaming relation not work in oracle 

-- select dept_name, avg_salary
-- from (select dept_name, avg (salary) 
--            from instructor
--            group by dept_name) 
--            as dept_avg (dept_name,  avg_salary);
--  where avg_salary > 42000;


WITH dept_avg AS (
    SELECT dept_name, AVG(salary) AS avg_salary
    FROM instructor
    GROUP BY dept_name
)
SELECT dept_name, avg_salary
FROM dept_avg
WHERE avg_salary > 42000;
