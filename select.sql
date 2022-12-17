SELECT 2;

SELECT 2+2;

SELECT NOW();

SELECT * FROM employee

SELECT nume, prenume, cnp from employee;

SELECT nume, prenume, cnp, NOW() FROM employee;

SELECT nume as "nume_angajat", prenume as "prenume_angajat", cnp as "CNP", NOW() as "data_raport" from employee;

SELECT nume, prenume, cnp as "CNP", NOW() as "data_raport" from employee as "e";

SELECT nume, prenume, cnp as "CNP", NOW() as "data_raport", (id * 3)/2 as "id_angajat" from employee as "e";

--filtrare rezultate cu where

select * from employee where id=3;

select nume, prenume, cnp from employee where id=3;

select nume, prenume from employee where id=3;

select * from employee where id in(3,10,13);

select * from employee where id<=10;

select * from employee where id=3 or prenume='Marian';

select * from employee where id not in(3,10,13);

select * from employee where id in(3,10,13);

select * from employee where (nume='Vasile' and id>3 or id=19) and adresa='Mun.Arad,Jud.Arad';

select * from employee where nume like('%r%');

select * from employee where nume like('P%');

SELECT nume, prenume, cnp as "CNP", NOW() as "data_raport", (id * 3)/2 as "id_angajat" from employee as "e"
where e.nume='Andronescu';

SELECT employee.nume as "nume_angajat", employee.prenume as "prenume_angajat", employee.cnp as "CNP", NOW() as "data_raport" from employee;

create table employee_extended as
SELECT nume as "nume_angajat", prenume as "prenume_angajat", cnp as "CNP", NOW() as "data_raport" from employee;

create view employee_extended_view as
SELECT nume as "nume_angajat", prenume as "prenume_angajat", cnp as "CNP", NOW() as "data_raport" from employee;

select * from employee_extended;

select model, timp_zbor from
(
select *,now() as "acum" from drona
) as Temp_table;















