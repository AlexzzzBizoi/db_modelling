create or replace procedure add_drones(model_p varchar(50), timp_zbor_p time, inaltime_zbor_p integer, sarcina_utila_p integer)
language plpgsql
as
$$
begin
insert into drona(model, timp_zbor, inaltime_zbor, sarcina_utila) values (model_p, timp_zbor_p, inaltime_zbor_p, sarcina_utila_p);
end
$$;

create or replace procedure update_drone_model(old_name varchar(50), new_name varchar(50))
language plpgsql
as
$$
begin
update drona
set model=new_name
where model=old_name;
end
$$;

create or replace procedure update_project_dates(id_p integer, start_date_p date, end_date_p date)
language plpgsql
as
$$
begin
update projects set start_date=start_date_p, end_date=end_date_p
where id=id_p;
end
$$;

create or replace procedure delete_projectfromrange(start_date_p date, end_date_p date)
language plpgsql
as
$$
begin
delete from projects where start_date<=start_date_p and end_date>=end_date_p;
end
$$;

create or replace function get_projects_count()
returns bigint
language sql
as
$$
select count(*) from projects as nr_proiecte;
$$;

create or replace function get_projects_info(project_id_p integer)
returns projects
language sql
as
$$
select * from projects where id=project_id_p;
$$;

create or replace procedure add_new_entry_to_generated(cnp_p varchar (13))
language plpgsql
as
$$
begin
insert into generated
SELECT av.*,e.adresa FROM 
(
	select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
	inner join operator_drona
	on e.id=operator_drona.employee_id
	inner join operator_drona_projects
	on operator_drona.id=operator_drona_projects.operator_drona_id
	inner join projects p
	on operator_drona_projects.projects_id=p.id
	) as av
	inner join employee as e
	on av.cnp=e.cnp
	where e.cnp=cnp_p;
end
$$;

create or replace procedure update_name(cnp_p varchar(13), adresa_p varchar(30))
language plpgsql
as
$$
begin
update generated set adresa=adresa_p 
where nume_angajat in (
					select nume_angajat from angajati_proiecte_view WHERE cnp =cnp_p 
					);
end
$$;

create or replace procedure delete_from_generated(cnp_p varchar(13))
language plpgsql
as
$$
begin
delete from generated where nume_angajat in (
select nume_angajat from angajati_proiecte_view where cnp=cnp_p
);
end
$$;


					


