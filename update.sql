UPDATE employee SET adresa='Mun.Arad,Jud.Arad';
UPDATE employee SET adresa='Mun.Timisoara,Jud.Timis'
WHERE id in(1,3,6);

UPDATE employee SET adresa='Mun.Buzias,Jud.Timis'
WHERE nume='Ceapa';

SELECT * FROM employee;


UPDATE drona
SET timp_zbor='02:00:00', 
	inaltime_zbor=50,
	sarcina_utila=4 
	where model='Matris 30';

SELECT * FROM drona;