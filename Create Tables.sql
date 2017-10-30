-- CREATE SCHEMA `security` ;



CREATE TABLE USER_ROLE
(
RoleName     varchar(20)  NOT NULL,
Description  varchar(50),
PRIMARY KEY  (RoleName)
);


CREATE TABLE PRIVILEGE -- Note change auto_increment added
(
PrivilegeId   INT AUTO_INCREMENT,
PName         VARCHAR(20),
PType         VARCHAR(20),
PRIMARY KEY   (PrivilegeId)
);


CREATE TABLE USER_ACCOUNT
(
IDNo         int          NOT NULL    AUTO_INCREMENT,
Password     varchar(12),
Initial      char(2),
Lname        varchar(20),
Phone        varchar(12),
RoleName     varchar(20),
PRIMARY KEY  (IDNo),
FOREIGN KEY  (RoleName)     REFERENCES USER_ROLE (RoleName)
);


CREATE TABLE TABLES
(
TableName    varchar(20),
DBName       varchar(15),
OwnerId      int,
PRIMARY KEY  (TableName, DBName),
FOREIGN KEY  (OwnerId)      REFERENCES USER_ACCOUNT (IDNo)
);


CREATE TABLE ROLE_PRIVILEGE
(
PrivilegeId   int,
RoleName      varchar(20),
PRIMARY KEY   (PrivilegeId, RoleName),
FOREIGN KEY   (PrivilegeId) REFERENCES PRIVILEGE (PrivilegeId),
FOREIGN KEY   (RoleName)    REFERENCES USER_ROLE (RoleName)
);


CREATE TABLE TABLE_PRIVILEGE
(
TableName     varchar(20),
DBName        varchar(15),
PrivilegeId   int,
RoleName      varchar(20),
PRIMARY KEY   (TableName, DBName, PrivilegeId, RoleName),
FOREIGN KEY   (TableName, DBName)   REFERENCES TABLES (TableName, DBName),
FOREIGN KEY   (PrivilegeId)         REFERENCES PRIVILEGE (PrivilegeId),
FOREIGN KEY   (RoleName)            REFERENCES USER_ROLE (RoleName)
);
