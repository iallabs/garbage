BEGIN;

/*
    Zilean System Database
*/

CREATE DATABASE IF NOT EXISTS zileansystem;

USE zileansystem;

CREATE TABLE `zilean_env` (
  `default_mode` VARCHAR(25) NOT NULL,
  `working_directory` VARCHAR(50) NOT NULL,
  `mysql_connector_use_pure` BOOLEAN DEFAULT 1,
  `recording_sessions` BOOLEAN DEFAULT 1,
  `recording_pen_history` BOOLEAN DEFAULT 1,
  `recording_fails` BOOLEAN DEFAULT 1,
  `recording_intern_jobs` BOOLEAN DEFAULT 1,
  `recording_backups` BOOLEAN DEFAULT 1,
  `default_backup_type` VARCHAR(10) DEFAULT 'default',
  PRIMARY KEY (`default_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `zilean_env` (`default_mode`)
VALUES (
  'zilean_default_mode'
);

CREATE TABLE `zilean_linked_databases` (
  `database` VARCHAR(25) NOT NULL,
  `linked_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `id_backups` JSON,
  PRIMARY KEY (`database`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

COMMIT;
