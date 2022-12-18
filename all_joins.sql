select * from clients
inner join projects
on clients.id=projects.clients_id;

select * from clients
left join projects
on clients.id=projects.clients_id;

select * from clients
right join projects
on projects.clients_id=clients.id;

select * from projects
right join clients
on projects.clients_id=clients.id;

select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects
on operator_drona_projects.projects_id=projects.id;

select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
left join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
right join projects
on operator_drona_projects.projects_id=projects.id;

select * from employee
left join operator_drona
on employee.id=operator_drona.employee_id
left join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
left join projects
on operator_drona_projects.projects_id=projects.id;

select * from employee
right join operator_drona
on employee.id=operator_drona.employee_id
right join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
right join projects
on operator_drona_projects.projects_id=projects.id;

select c.nume as nume_client, p.nume as nume_proiect, p.start_date, p.end_date from clients c
inner join projects p
on c.id=p.clients_id;

select c.nume as nume_client, p.nume as nume_proiect, p.start_date, p.end_date from clients c
left join projects p
on c.id=p.clients_id;

select c.nume as "nume client", p.nume as nume_proiect, p.start_date, p.end_date from clients c
right join projects p
on c.id=p.clients_id;

select count(*) from projects
right join clients
on projects.clients_id=clients.id;

select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects
on operator_drona_projects.projects_id=projects.id
where employee.sex='F';

select * from operator_drona
inner join
(
	select * from employee where sex='F'
) as e
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects
on operator_drona_projects.projects_id=projects.id;

create table angajati_proiecte_feminin as
select employee.nume as nume_angajat, employee.prenume, employee.cnp, p.nume as "nume proiect", p.start_date, p.end_date from employee
inner join operator_drona 
on employee.id=operator_drona.employee_id and employee.sex='F'
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
where employee.sex='F';

select * from angajati_proiecte_feminin;

create view angajati_proiecte_view as
select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects
on operator_drona_projects.projects_id=projects.id;

select count(*), p.start_date from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
left join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
left join projects as p
on operator_drona_projects.projects_id=p.id
where employee.sex='F'
group by start_date
having p.start_date > '2022-11-27';



