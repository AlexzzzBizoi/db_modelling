select * from employee where id in(
select employee_id from operator_drona where drona_id=5
);

select * from employee where id in 
(
	select employee_id from operator_drona where drona_id= 
	(
		select id from drona where model='Agras T10' 
	)
);

update employee set adresa='Mun.Timisoara,Jud.Timis' where id in
(
	select employee_id from operator_drona where drona_id=
	(
		select id from drona where model='Agras T10'
	)
);

delete from operator_drona where employee_id in
(
	select employee_id from operator_drona where drona_id=
	(
		select id from drona where model='Agras T10'
	)
);



