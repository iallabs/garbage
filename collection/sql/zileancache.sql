BEGIN;

/*
    Zilean Cache Databases
*/

CREATE DATABASE zileancache;

USE zileancache;

ALTER TABLE `zilean_sessions` AUTO_INCREMENT = 0;

CREATE TABLE `zilean_moves_history` (
  `move_id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `timed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `module` VARCHAR(25) NOT NULL,
  `class` VARCHAR(25),
  `function` VARCHAR(25) NOT NULL,
  `arguments` JSON,
  `out_put` JSON,
  `run_time` INT(15),
  `success` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`move_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `zilean_moves_history` AUTO_INCREMENT = 0;

CREATE TABLE `zilean_backups_history` (
  `backup_id` INT(8) unsigned  NOT NULL AUTO_INCREMENT,
  `database` VARCHAR(30) NOT NULL,
  `timed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `working_directory` VARCHAR(50) NOT NULL,
  `backup_file` VARCHAR(30) NOT NULL,
  `run_time` INT(15),
  `success` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`backup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `zilean_backups_history` AUTO_INCREMENT = 0;

CREATE TABLE `zilean_migration_history` (
  `migration_id` INT(8) unsigned NOT NULL AUTO_INCREMENT,
  `database` VARCHAR(30) NOT NULL,
  `timed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `backup_file` VARCHAR(50) NOT NULL,
  `run_time` INT(15),
  `success` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`backup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `zilean_directory_backups` AUTO_INCREMENT = 0;

COMMIT;
