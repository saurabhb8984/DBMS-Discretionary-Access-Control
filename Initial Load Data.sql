
-- Insert values in user_role
INSERT INTO user_role (RoleName, Description)
VALUES ("dba","create,modify,drop permission");
INSERT INTO user_role (RoleName, Description)
VALUES ("datareader","data read rights");
INSERT INTO user_role (RoleName, Description)
VALUES ("datawriter","data write rights");


-- Insert values in privilege
INSERT INTO privilege (PName, PType)
VALUES ( "Create Schema","Account Privilege");
INSERT INTO privilege ( PName, PType)
VALUES ("Create Table","Account Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Drop Schema","Account Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Drop Table","Account Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Select","Relation Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Insert","Relation Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Update","Relation Privilege");
INSERT INTO privilege (PName, PType)
VALUES ( "Delete","Relation Privilege");


-- Insert values in user_account
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('S.', "1111", "Botre", "469-996-1398", "dba");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('K.',"1111", "Kamble", "469-996-1111", "db_datareader");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('T.', "1111", "Mehtre", "469-996-1222", "db_datawriter");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('S.', "1111", "Harel", "469-268-1222", "db_datawriter");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('N.', "1111", "Gholap", "569-132-1222", "db_datareader");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('N.', "1111", "Patil", "215-543-8978", "db_datawriter");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('R.', "1111", "Suryavanshi", "515-897-2145", "db_datareader");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('A.', "1111", "Thakur", "665-147-8523", "db_datareader");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('A.', "1111", "Salvi", "459-753-9632", "db_datawriter");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('M.', "1111", "Sherkar", "976-898-7897", "db_datawriter");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('N.', "1111", "Shah", "988-113-8398", "dba");
INSERT INTO user_account (Initial, Password, Lname, Phone, RoleName)
VALUES ('D.', "1111", "Kale", "565-789-4567", "dba");

-- Insert values in tables
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("dependent","company", 12);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("dept_locations","company", 12);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("employee","company", 12);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("project","company", 12);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("department","company", 12);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("student","university", 1);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("course","university", 1);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("grades","university", 11);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("instructor","university", 11);
INSERT INTO tables (TableName, DBName, OwnerId)
VALUES ("course_grades","university", 11);


-- Insert values in ROLE_PRIVILEGE
INSERT INTO ROLE_PRIVILEGE (PrivilegeId, RoleName)
VALUES ( 1,"DBA");
INSERT INTO ROLE_PRIVILEGE (PrivilegeId, RoleName)
VALUES ( 2,"DBA");
INSERT INTO ROLE_PRIVILEGE (PrivilegeId, RoleName)
VALUES ( 3,"DBA");
INSERT INTO ROLE_PRIVILEGE (PrivilegeId, RoleName)
VALUES ( 4,"DBA");

-- Insert values in TABLE_PRIVILEGE
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("employee","company",6 ,"db_datawriter");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("department","company",7 ,"db_datawriter");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dependent","company", 8,"db_datawriter");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dept_locations","company", 5,"db_datareader");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("project","company", 6,"db_datawriter");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("employee","company",5 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("department","company",5 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dependent","company", 5,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dept_locations","company", 5,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("project","company", 5,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("employee","company",6 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("department","company",6 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dependent","company", 6,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dept_locations","company", 6,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("project","company", 6,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("employee","company",7 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("department","company",7 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dependent","company", 7,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dept_locations","company", 7,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("project","company", 7,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("employee","company",8 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("department","company",8 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dependent","company", 8,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("dept_locations","company", 8,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("project","company", 8,"dba");


INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("student","university",5 ,"db_datareader");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course","university", 6,"db_datawriter");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("grades","university", 5,"db_datareader");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("instructor","university", 7,"db_datawriter");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course_grades","university",8 ,"db_datawriter");


INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("student","university",5 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course","university", 5,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("grades","university", 5,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("instructor","university", 5,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course_grades","university",5 ,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("student","university",6 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course","university", 6,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("grades","university", 6,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("instructor","university", 6,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course_grades","university",6 ,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("student","university",7 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course","university", 7,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("grades","university", 7,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("instructor","university", 7,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course_grades","university",7 ,"dba");

INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("student","university",8 ,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course","university", 8,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("grades","university", 8,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("instructor","university", 8,"dba");
INSERT INTO TABLE_PRIVILEGE (TableName, DBName, PrivilegeId, RoleName)
VALUES ("course_grades","university",8 ,"dba");









