CREATE DATABASE database0;
USE database0; /* use database */
show tables;  /* show all table */
DESC members;  /* show table */
DROP TABLE table; /* delete table */
SELECT * FROM members WHERE email="daraz.leon@gmail.com";
ALTER TABLE nom_table ADD ... -- permet d'ajouter quelque chose (une colonne par exemple)

ALTER TABLE nom_table DROP ... -- permet de retirer quelque chose

ALTER TABLE nom_table CHANGE ...
ALTER TABLE nom_table MODIFY ... -- permettent de modifier une colonne

CREATE TABLE Test_tuto (
    id INT NOT NULL,
    nom VARCHAR(10) NOT NULL,
        PRIMARY KEY(id)
);

-- set primary key
ALTER TABLE tableName
  ADD PRIMARY KEY (id); --or Drugid, whichever you want it to be PK

-- add collumn
ALTER TABLE nom_table
  ADD COLUMN nom_colonne description_colonne;

-- add collumn
ALTER TABLE Test_tuto
  DROP COLUMN date_insertion;

-- EDITING collumn
ALTER TABLE Test_tuto
  CHANGE old new VARCHAR(10) NOT NULL;
                  -- type

-- PLANTAE EXAMPLE

CREATE DATABASE testdb;

USE testdb;

CREATE TABLE PLANTAE (
  name VARCHAR(10) NOT NULL,
  type VARCHAR(10) NOT NULL,
  level INT NOT NULL,
  PRIMARY KEY(name)
);

INSERT INTO PLANTAE VALUES ('Plantae', 'Kingdom', '0');

SELECT name, type, level FROM PLANTAE WHERE name='Plantae';
