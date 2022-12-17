select * from employee
inner join operator_drona
on employee.id=operator_drona.employee_id
inner join drona
on operator_drona.drona_id=drona_id;


select * from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d_id;


select e.nume, e.prenume, e.cnp, d.model, d.inaltime_zbor, d.timp_zbor from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id;

select * from employee where id in
(
	select employee_id from operator_drona where drona_id in
	(
		select id from drona
	)
);

select e.nume, e.prenume, e.cnp, d.model, d.inaltime_zbor, d.timp_zbor from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id
where d.model='Agras T10';

select count(*) as angajati_autorizati, d.model from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id
group by d.model;

select e.nume, count(*) from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id
group by e.nume;

select count(*) from 
(
select e.nume, e.prenume, e.cnp, d.model, d.inaltime_zbor, d.timp_zbor from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id
) as a1;

select nume, prenume, model, inaltime_zbor from 
(
select e.nume, e.prenume, e.cnp, d.model, d.inaltime_zbor, d.timp_zbor from employee as e
inner join operator_drona as od
on e.id=od.employee_id
inner join drona as d
on od.drona_id=d.id
) as a1;

