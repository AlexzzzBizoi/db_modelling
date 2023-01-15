INSERT INTO drona(model,timp_zbor,inaltime_zbor,sarcina_utila)VALUES('Matris 30','02:20:10','70','2');

call add_drones('Matris 31','02:20:10','70','2');

call update_drone_model('Matris 30', 'Matris 50');

select * from drona;

call update_project_dates(1, '2023-01-15', '2023-12-15');

select * from projects where id=1;

call delete_projectfromrange('2023-01-16', '2023-12-14');

select get_projects_count();

select * from get_projects_count();

select * from get_projects_info(1);

select nume, description from get_projects_info(1);

select * from generated;

call add_new_entry_to_generated('1985204517760');

call update_name('1985204517760','Sibiu');

call delete_from_generated('1897654402100');


