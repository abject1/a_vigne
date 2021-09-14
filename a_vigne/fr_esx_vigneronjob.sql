INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_vigne','Vigneron',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_vigne','Vigneron', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_vigne', 'Vigneron', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('vigne', 'Vigneron', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('vigne',0,'recrue','Intérimaire', 500, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',1,'novice','Vigneron', 750, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',2,'cdisenior',"Chef d'équipe", 1200, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	('vigne',3,'boss','Patron', 1600,'{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}','{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}')
;


INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('raisin_blanc', 'Raisin Blanc', 100, 0, 1),
	('raisin_rouge', 'Raisin Rouge', 100, 0, 1),
	('jus_raisin', 'Jus de raisin', 50, 0, 1),
	('grand_cru', 'Grand cru', 15, 0, 1),
	('vin_blanc', 'Vin Blanc', 25, 0, 1),
	('vin_rouge', 'Vin Rouge', 25, 0, 1),
	('champagne', 'Champagne', 15, 0, 1),
	('barquette_raisin', 'Barquette de raisin', 60, 0, 1),
	('water', 'eau', 100, 0, 1),
	('levure', 'Levure', 100, 0, 1),
	('barquette_vide', 'Barquette vide', 250, 0, 1),
;

