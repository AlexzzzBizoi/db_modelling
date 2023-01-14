create view first_view as 
select * from employee;

select * from first_view;

create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;

select * from angajati_proiecte_view;

select nume_angajat, cnp from angajati_proiecte_view;

select * from angajati_proiecte_view as av
inner join employee as e
on av.cnp=e.cnp;

select av.*, e.adresa from angajati_proiecte_view as av
inner join employee as e
on av.cnp=e.cnp;

create table generated as
select av.*, e.adresa from angajati_proiecte_view as av
inner join employee as e
on av.cnp=e.cnp;

insert into generated
select av.*, e.adresa from angajati_proiecte_view as av
inner join employee as e
on av.cnp=e.cnp;

update generated set adresa = 'Mun.Timisoara, Jud. Timis' where nume_angajat = 'Adriana';

update generated set adresa = 'Mun. Timisoara, Jud. Timis' 
where nume_angajat =(
					select distinct nume_angajat from angajati_proiecte_view where cnp='1897654402100'
					);

update generated set adresa = 'Mun. Timisoara, Jud. Timis' 
where nume_angajat in(
					select nume_angajat from angajati_proiecte_view where cnp='1897654402100'
					);
					
update generated set adresa = 'Mun. Timisoara, Jud. Timis' 
where nume_angajat =(
select distinct nume_angajat from
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) as t
where t.cnp='1897654402100'
);

delete from generated where nume_angajat in (
select nume_angajat from angajati_proiecte_view where cnp='1897654402100'
);

create view drone_cu_senzori as
select d.*, ds.senzori_id from drona as d
left join drona_senzori as ds
on d.id=ds.drona_id;

select * from drone_cu_senzori;

select model, count(*) as senzori from drone_cu_senzori
group by model;

select model, nume from drone_cu_senzori as dcs
inner join senzori as s
on dcs.id=s.id;

select * from drone_cu_senzori;

select distinct model, nume from drone_cu_senzori as dcs
left join operator_drona_projects as odp
on dcs.id=odp.id
left join projects as p
on odp.projects_id=p.id;

create view operatori_pentru_drone as
select e.id, e.nume, e.prenume, e.cnp, od.drona_id, p.nume as proiect from employee as e
left join operator_drona as od
on e.id=od.employee_id
left join operator_drona_projects as odp
on od.id=odp.operator_drona_id
left join projects as p
on odp.projects_id=p.id;

select * from operatori_pentru_drone;

select distinct nume, count(*) as nr_licente from operatori_pentru_drone
group by drona_id, nume;

create table proiecte_cu_drona as
select * from operatori_pentru_drone where proiect is not null;

select * from proiecte_cu_drona;

insert into proiecte_cu_drona select * from operatori_pentru_drone where proiect is null;

select * from operatori_pentru_drone;

delete from proiecte_cu_drona where id in(
	select distinct id from operatori_pentru_drone where proiect is null
);

select distinct id from operatori_pentru_drone where proiect is null;











