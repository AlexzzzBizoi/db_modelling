alter table employee
add column age integer not null default 0;

select avg(age) :: integer as medie from employee;

select count(id) as nr_angajati from employee;
select count(distinct nume) as nr_angajati from employee;

select min(age) as varsta_minima from employee;
select max(age) as varsta_maxima from employee;

select sum(age) as varsta_total from employee;
select sum(age)/count(*) as medie from employee;

select avg(age):: integer as medie_varsta, count(*) as nr_angajati, 
min(age) as varsa_minima, max(age) as varsta_maxima, sum(age) as varsta_total 
from employee;

select count(*) as nr_angajati from employee where age<40 and sex='M';

select sex, count(*) from employee 
where age<40
group by sex;

select sex, count(*), age from employee 
group by sex, age
having age<40;

select sex, count(*) from employee 
where age<40
group by sex
having count(*)>3 and sex ='F';

