CREATE TABLE IF NOT EXISTS tip_parc(
	id serial PRIMARY KEY NOT null,
	type varchar(20) not null,
	description varchar(400)
);

-- INSERT DATA INTO TABLE AFTER CREATE
INSERT INTO tip_parc(type,description) VALUES
					('Parc National','Arie protejata infiintata confrom regulament Romsilva'),
					('Parc natural','Arie naturala protejata conform OUG Life Natura 2000'),
					('Stiintifica', 'Rezervatie apartinand UVT, Departament Geografie'),
					('Sit Natura 2000', 'Sit cartat si fundamentat conform Life Natura 2000 Project');

					
--UPDATE DATA IF REQUIRED
UPDATE tip_parc SET
	type='Rez stiintifica',
	description='Rezervatie apartinand UVT, Departament Geografie & FMI'
WHERE type='Stiintifica'
