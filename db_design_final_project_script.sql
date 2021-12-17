DROP TABLE IF EXISTS `db_design`.`weapons`;
DROP TABLE IF EXISTS `db_design`.`characters`;
DROP TABLE IF EXISTS `db_design`.`users`;
DROP TABLE IF EXISTS `db_design`.`elements`;
DROP TABLE IF EXISTS `db_design`.`weapon_types`;

CREATE TABLE `db_design`.`elements` (
	element VARCHAR(20) NOT NULL, PRIMARY KEY(element));

INSERT INTO elements(element) VALUES ('Pyro');
INSERT INTO elements(element) VALUES ('Cyro');
INSERT INTO elements(element) VALUES ('Electro');
INSERT INTO elements(element) VALUES ('Anemo');
INSERT INTO elements(element) VALUES ('Geo');
INSERT INTO elements(element) VALUES ('Hydro');

CREATE TABLE `db_design`.`weapon_types` (
	weapon_type VARCHAR(20) NOT NULL, PRIMARY KEY(weapon_type));

INSERT INTO weapon_types(weapon_type) VALUES ('Bow');
INSERT INTO weapon_types(weapon_type) VALUES ('Polearm');
INSERT INTO weapon_types(weapon_type) VALUES ('Sword');
INSERT INTO weapon_types(weapon_type) VALUES ('Claymore');
INSERT INTO weapon_types(weapon_type) VALUES ('Catalyst');

CREATE TABLE `db_design`.`users` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(45) NULL,
    `lastName` VARCHAR(45) NULL,
    `username` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NULL,
    `dateOfBirth` DATE NULL,
    PRIMARY KEY (`id`));

INSERT INTO users VALUES(NULL, 'Dylan', 'Huang', 'dylanhuang', 'apple01', 'huang.dy@northeastern.edu', DATE('2021-01-08'));
INSERT INTO users VALUES(NULL, 'Trevor', 'Lau', 'trevorlau', 'banana02', 'lau.tr@northeastern.edu', DATE('2021-11-15'));

CREATE TABLE `db_design`.`weapons` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	`weapon_type` VARCHAR(20) NULL,
	`level` INT NULL,
	`refinement_level` INT NULL,
	`rarity` INT NULL,
	`base_attack` INT NULL,
	`ability_name` VARCHAR(45) NULL,
	`ability_description` VARCHAR(500) NULL,
	`character_id` INT NULL UNIQUE,
	PRIMARY KEY (`id`),
	CONSTRAINT `weapon_to_weapon_type`
		FOREIGN KEY (`weapon_type`)
		REFERENCES `db_design`.`weapon_types` (`weapon_type`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);

INSERT INTO weapons VALUES(NULL, 'Black Tassel', 'Polearm', 60, 5, 3, 234, 'Bane of Soft', 'Increases DMG against slimes by 80%', 1);
INSERT INTO weapons VALUES(NULL, 'Festering Desire', 'Sword', 60, 5, 4, 327, 'Undying Admiration', 'Increases Elemental Skill DMG by 32%', 2);
INSERT INTO weapons VALUES(NULL, 'Skyward Pride', 'Claymore', 90, 1, 5, 674, 'Sky-ripping Dragon Spine', 'Increases all DMG by 8%', 3);
INSERT INTO weapons VALUES(NULL, 'Emerald Orb', 'Catalyst', 1, 1, 1, 40, 'Rapids', 'Upon causing a Reaction, increases ATK by 20%', 4);

CREATE TABLE `db_design`.`characters` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	`level` INT NULL,
	`rarity` INT NULL,
	`attack` INT NULL,
	`health` INT NULL,
	`weapon_type` VARCHAR(20) NULL,
	`element` VARCHAR(20) NULL,
	`user_id` INT NULL,
	`weapon_id` INT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `character_to_weapon_type`
		FOREIGN KEY (`weapon_type`)
		REFERENCES `db_design`.`weapon_types` (`weapon_type`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `character_to_element`
		FOREIGN KEY (`element`)
		REFERENCES `db_design`.`elements` (`element`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `character_to_user`
		FOREIGN KEY (`user_id`)
		REFERENCES `db_design`.`users` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `character_to_weapon`
		FOREIGN KEY (`weapon_id`)
		REFERENCES `db_design`.`weapons` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);
   
INSERT INTO characters VALUES(NULL, 'Zhongli', 90, 5, 892, 54610, 'Polearm', 'Geo', 1, 1);
INSERT INTO characters VALUES(NULL, 'Bennett', 80, 4, 875, 28661, 'Sword', 'Pyro', 1, 2);
INSERT INTO characters VALUES(NULL, 'Eula', 81, 5, 1899, 20470, 'Claymore', 'Cyro', 2, 3);
INSERT INTO characters VALUES(NULL, 'Lisa', 20, 4, 209, 2661, 'Catalyst', 'Electro', 2, 4);

