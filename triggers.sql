create table drona_history as
select * from drona;

delete from drona_history;
alter table drona_history add column changed_on timestamp;
select * from drona_history;

create or replace function drona_history()
returns trigger
language plpgsql
as
$$
begin
if old.model <> new.model then
	insert into drona_history(id, model, timp_zbor, inaltime_zbor, sarcina_utila, changed_on) 
	values(old.id, old.model, old.timp_zbor, old.inaltime_zbor, old.sarcina_utila, now());
end if;
return new;
end;
$$;

create trigger change_detection
before update 
on drona
for each row
execute procedure drona_history();

create or replace function drona_history()
returns trigger
language plpgsql
as
$$
begin
	insert into drona_history(id, model, timp_zbor, inaltime_zbor, sarcina_utila, changed_on) 
	values(old.id, old.model, old.timp_zbor, old.inaltime_zbor, old.sarcina_utila, now());
return new;
end;
$$;

update drona set model='My new drona model' where id=7;

select * from drona;
select * from drona_history;