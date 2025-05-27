CREATE TABLE classroom (
	building        varchar(15),
	room_number     varchar(7),
	capacity        numeric(4,0),
	primary key (building, room_number)
);

CREATE TABLE department (
	dept_name       varchar(20), 
	building        varchar(15), 
	budget          numeric(12,2) check (budget > 0),
	primary key (dept_name)
);

CREATE TABLE course (
	course_id       varchar(8), 
	title           varchar(50), 
	dept_name       varchar(20),
	credits         numeric(2,0) check (credits > 0),
	primary key (course_id),
	foreign key (dept_name) references department
		on delete set null
);

CREATE TABLE instructor (
	ID              varchar(5), 
	name            varchar(20) not null, 
	dept_name       varchar(20), 
	salary          numeric(8,2) check (salary > 29000),
	primary key (ID),
	foreign key (dept_name) references department
		on delete set null
);

CREATE TABLE section (
	course_id       varchar(8), 
	sec_id          varchar(8),
	semester        varchar(6) check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
	year            numeric(4,0) check (year > 1701 and year < 2100), 
	building        varchar(15),
	room_number     varchar(7),
	time_slot_id    varchar(4),
	primary key (course_id, sec_id, semester, year),
	foreign key (course_id) references course
		on delete cascade,
	foreign key (building, room_number) references classroom
		on delete set null
);

CREATE TABLE teaches (
	ID              varchar(5), 
	course_id       varchar(8),
	sec_id          varchar(8), 
	semester        varchar(6),
	year            numeric(4,0),
	primary key (ID, course_id, sec_id, semester, year),
	foreign key (course_id, sec_id, semester, year) references section
		on delete cascade,
	foreign key (ID) references instructor
		on delete cascade
);

CREATE TABLE student (
	ID              varchar(5), 
	name            varchar(20) not null, 
	dept_name       varchar(20), 
	tot_cred        numeric(3,0) check (tot_cred >= 0),
	primary key (ID),
	foreign key (dept_name) references department
		on delete set null
);

CREATE TABLE takes (
	ID              varchar(5), 
	course_id       varchar(8),
	sec_id          varchar(8), 
	semester        varchar(6),
	year            numeric(4,0),
	grade           varchar(2),
	primary key (ID, course_id, sec_id, semester, year),
	foreign key (course_id, sec_id, semester, year) references section
		on delete cascade,
	foreign key (ID) references student
		on delete cascade
);

CREATE TABLE advisor (
	s_ID            varchar(5),
	i_ID            varchar(5),
	primary key (s_ID),
	foreign key (i_ID) references instructor (ID)
		on delete set null,
	foreign key (s_ID) references student (ID)
		on delete cascade
);

CREATE TABLE time_slot (
	time_slot_id    varchar(4),
	day             varchar(1),
	start_hr        numeric(2) check (start_hr >= 0 and start_hr < 24),
	start_min       numeric(2) check (start_min >= 0 and start_min < 60),
	end_hr          numeric(2) check (end_hr >= 0 and end_hr < 24),
	end_min         numeric(2) check (end_min >= 0 and end_min < 60),
	primary key (time_slot_id, day, start_hr, start_min)
);

CREATE TABLE prereq (
	course_id       varchar(8), 
	prereq_id       varchar(8),
	primary key (course_id, prereq_id),
	foreign key (course_id) references course
		on delete cascade,
	foreign key (prereq_id) references course
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


-- Find the average instructors’ salaries of those departments where the average salary is greater than $42,000. 

select dept_name, avg_salary
from (select dept_name, avg (salary) as avg_salary
           from instructor
           group by dept_name)
where avg_salary > 42000;




SELECT dept_name , avg(salary) as avg_salary 
FROM instructor 
Group by dept_name
having avg(salary) > 42000;



with new_avg_salary as(
    
    SELECT dept_name , avg(salary) as avg_salary 
    FROM instructor 
    Group by dept_name
)
SELECT dept_name,avg_salary 
FROM new_avg_salary
where avg_salary > 42000;
 

-- Find the names of each instructor, along with their salary and the average salary in their department


WITH new_avg_salary AS (
    SELECT dept_name, AVG(salary) AS avg_salary
    FROM instructor
    GROUP BY dept_name
)
SELECT I.name, I.salary, N.avg_salary
FROM instructor I , new_avg_salary N
WHERE I.dept_name = N.dept_name;


SELECT I.name, I.salary, 
    (
    SELECT AVG(salary) 
    FROM instructor 
    WHERE dept_name = I.dept_name
    ) 
    AS avg_salary
    
FROM instructor I;



SELECT I.name, I.salary, N.avg_salary
FROM instructor I, (
    SELECT dept_name, AVG(salary) AS avg_salary
    FROM instructor
    GROUP BY dept_name
) N
WHERE I.dept_name = N.dept_name;


SELECT name, salary, avg_salary
FROM instructor natural join (
    SELECT dept_name, AVG(salary) AS avg_salary
    FROM instructor
    GROUP BY dept_name
);


-- Lists all departments along with the number of instructors in each department

select dept_name, 
             (select count(*) 
                 from instructor 
                where department.dept_name = instructor.dept_name)
             as num_instructors
         from department;

SELECT dept_name,count(*) 
FROM instructor
GROUP BY dept_name;



select name
        from instructor
        where  salary * 10 > 
             (select budget  from department 
                where department.dept_name = instructor.dept_name);        

SELECT name 
FROM instructor,department
WHERE department.dept_name = instructor.dept_name and
      salary*10 > department.budget;


CREATE TABLE inst_dup AS
SELECT * FROM instructor;


SELECT * FROM inst_dup;


 


SELECT i.name AS instructor_name
FROM instructor i
JOIN teaches t ON i.ID = t.ID
JOIN section s ON t.course_id = s.course_id AND t.sec_id = s.sec_id AND t.semester = s.semester AND t.year = s.year
JOIN takes ta ON s.course_id = ta.course_id AND s.sec_id = ta.sec_id AND s.semester = ta.semester AND s.year = ta.year
WHERE s.year = 2017
GROUP BY i.name
HAVING COUNT(ta.ID) > 2;


SELECT i.name AS instructor_name
FROM instructor i,
     teaches t,
     section s,
     takes ta
WHERE i.ID = t.ID
  AND t.course_id = s.course_id
  AND t.sec_id = s.sec_id
  AND t.semester = s.semester
  AND t.year = s.year
  AND s.course_id = ta.course_id
  AND s.sec_id = ta.sec_id
  AND s.semester = ta.semester
  AND s.year = ta.year
  AND s.year = 2017
  AND t.semester = "Fall"
GROUP BY i.name
HAVING COUNT(ta.ID) > 5;


SELECT i.name AS instructor_name
FROM instructor i
WHERE i.ID IN (
    SELECT t.ID
    FROM teaches t
    INNER JOIN section s ON t.course_id = s.course_id
                        AND t.sec_id = s.sec_id
                        AND t.semester = s.semester
                        AND t.year = s.year
    INNER JOIN takes ta ON s.course_id = ta.course_id
                       AND s.sec_id = ta.sec_id
                       AND s.semester = ta.semester
                       AND s.year = ta.year
    WHERE s.year = 2017
      AND t.semester = 'Fall'
    GROUP BY t.ID
    HAVING COUNT(ta.ID) > 5
);


DELETE FROM inst_dup
WHERE ID IN (
    SELECT t.ID
    FROM teaches t
    INNER JOIN section s ON t.course_id = s.course_id
                        AND t.sec_id = s.sec_id
                        AND t.semester = s.semester
                        AND t.year = s.year
    INNER JOIN takes ta ON s.course_id = ta.course_id
                       AND s.sec_id = ta.sec_id
                       AND s.semester = ta.semester
                       AND s.year = ta.year
    WHERE s.year = 2017
      AND t.semester = 'Fall'
    GROUP BY t.ID
    HAVING COUNT(ta.ID) > 5
);




SELECT t1.id,count(distinct t2.id) 
FROM teaches t1,takes t2
Where t1.course_id = t2.course_id and t1.semester = 'Fall' and t1.year = 2017
group by t1.id;

DELETE FROM inst_dup
where id in (
SELECT t1.id 
FROM teaches t1,takes t2
Where t1.course_id = t2.course_id 
    and t1.semester = t2.semester
    and t1.year = t2.year 
    and t1.semester = 'Fall' 
    and t1.year = 2017    
group by t1.id
having count(distinct t2.id) > 5
);



CREATE TABLE dept_dup AS
SELECT * FROM department;


SELECT * FROM dept_dup;

UPDATE dept_dup 
set budget = budget * 2;



UPDATE dept_dup 
set budget = budget * 3
WHERE budget > 150000;

UPDATE dept_dup
SET budget = CASE 
               WHEN budget > 500000 THEN budget / 3
               WHEN budget > 300000 THEN budget / 3
               ELSE budget / 2
             END;


-- Increase dept budget 10% where capacity is greater 50

UPDATE department
SET budget = budget * 1.10
WHERE dept_name IN (
    SELECT dept_name
    FROM classroom
    WHERE capacity > 50
);