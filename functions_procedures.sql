create function deactivate_unpaid_accounts() returns void

language sql

as $$
	
	update generated set prenume = 'Adriana';
	
$$;

select deactivate_unpaid_accounts();

create procedure update_adress()

language sql

as $$
	
	update generated set adresa = 'Mun.Arad, Jud. Arad';
	
$$;

call update_adress();


create  function account_type_count(cnp text) returns integer
language plpgsql
as $$
	declare account_count integer;
begin
	select count(*) into account_count
	from generated
	where generated.cnp=$1;
	
	return account_count;
end;

$$;

select account_type_count();

create  function account_type_count(cnp text) returns integer
language plpgsql
as $$
	declare account_count integer;
begin
	select count(*) into account_count
	from generated
	inner join employee as e
	on e.id=generated.id
	where generated.cnp=$1 and e.id=$2;
	
	return account_count;
end;

$$;

select account_type_count(1,2);

