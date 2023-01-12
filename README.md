<h1> Database Assignment </h1>
<hr>
<strong>Please note that the data inside here is completely fictional, and not meant to discredit any institution.*</strong>
The .sql file here contains the queries used to create the database. Please execute them in a <em>per batch basis</em>, the queries are separated
by newlines to indicate a new batch. In some sections, it is assumed that the national_exams database has already been used using the 
<code>USE national_exams;</code> command. 

<br>

<h1> Structure </h1>
This database has 3 tables: School, Student, and Exam, modelling a national exam database. 
Each student belongs to a school, and each exam belongs to a specific student.
<br>
For school, the columns are SchoolID(PK), SchoolName, SchoolAddress, SchoolPrincipal, and SchoolPhone. Each containing the obvious data.
This models a real life school.
<br>
For student, the columns are StudentID(PK), SchoolID(FK), StudentName, and StudentGender. The SchoolID links the students to their respective schools.
<br>
For Exam, this has an ExamID(PK), StudentID(FK), ExamType, ExamDate, and ExamSCore. ExamType only contains SCIE(nces), MATH, and LANG(uage). 

