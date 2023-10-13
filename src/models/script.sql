



1.
========================
CREATE TABLE ROLES(
	ID int primary key auto_increment, 
	roleName varchar(100) unique
);

2.
=============================
CREATE TABLE UNIT_TYPE(
	ID int primary key auto_increment,
	TypeName varchar(200) unique
);

3.
=============================
CREATE TABLE WORK_UNIT(
	ID int primary key auto_increment,
	unitName varchar(200),
    parentUnit int,
    unitType int,
    FOREIGN KEY(parentUnit) REFERENCES WORK_UNIT(ID),
    FOREIGN KEY(unitType) REFERENCES UNIT_TYPE(ID)
);

4.
=============================
CREATE TABLE USERS(
    ID int primary key auto_increment,
    fullName varchar(200),
    emailId varchar(30),
    passCode varchar(100),
    isAuditor boolean,
    unitID int,
    responsibility int,
    userRole int,
    FOREIGN KEY(unitId) REFERENCES Work_Unit(ID)
);


5.
=============================
CREATE TABLE USER_ROLES(
userID int,
roleID int,
FOREIGN KEY(userID) REFERENCES USERS(ID),
FOREIGN KEY(roleID) REFERENCES ROLES(ID)
);



6.
=============================
CREATE TABLE AUDIT_OBJECT(
	ID int primary key auto_increment,
    objectName varchar(50) unique,
    objectDescription varchar(5000),
    auditObjectives varchar(5000),
    category int default null,
    createdBy int,
    creation_time Date,
    FOREIGN KEY (createdBy) REFERENCES USERS(ID)
);


7.
=============================

CREATE TABLE AUDIT_TYPE(
ID INT PRIMARY KEY AUTO_INCREMENT,
typeName varchar(200)
);

8.
=============================
create table AUDITABLE_AREA(
	ID int primary key auto_increment,
    objectID int,
    areaName varchar(50),
    area_description varchar(500),
    abject_id int,
    FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
); 



9.
=============================
create table CHECKLIST(
	ID int primary key auto_increment,
    chl_name varchar(200),
    chl_description varchar(500),
    objectives varchar(500),
    relatedRisk varchar(500),
    expected_controls varchar(5000),
    auditObject int,
	auditbale_area int,
    FOREIGN KEY (auditObject) REFERENCES AUDIT_OBJECT(ID),
    FOREIGN KEY (auditbale_area) REFERENCES AUDITABLE_AREA(ID)
);


10.
=============================
CREATE TABLE AUDIT_PLAN (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PlanTitile VARCHAR(100),
    PlanAuditYear int,
    AuditObject int,
    AuditType int,
    PlanApprovalStatus VARCHAR(50),
    PlanState VARCHAR(50),
    AuditState VARCHAR(50),
    DateCreated DATE,
    RiskScore double,
    RiskLevel VARCHAR(50),
    PlanCreatedBy int,
    PlanCreationMethod VARCHAR(50),
    PlanCreationTime TIMESTAMP,
    PlanApprovedBy int,
    PlanApprovalTime TIMESTAMP,
    quarterID int,
    schedule_startDate date,
    schedule_endDate date,
    schedule_auditeesOrganID int,
    schedule_dateCompleted date,
    schedule_currentStatus varchar(200),
    schedule_totalcost double,
    schedule_involvesTravel boolean,
    schedule_approvalStatus date,
    schedule_createdAt date,
    schedule_cretedBY int,
    RectificationStatus int,
    FOREIGN KEY (AuditObject) REFERENCES AUDIT_OBJECT(ID),
    FOREIGN KEY (AuditType) REFERENCES AUDIT_TYPE(ID),
    FOREIGN KEY (PlanCreatedBy) REFERENCES USERS(ID),
    FOREIGN KEY (PlanApprovedBy) REFERENCES USERS(ID),
    FOREIGN KEY (schedule_cretedBY) REFERENCES USERS(ID)
);

11.
=============================
create table SCHEDULE_MEMEBERS(
    planID int,
    auditorID int,
    responsibility int,
    active_status boolean,
    audit_status Varchar(30),
    perdium int,
    primary key(planId,auditorID),
    FOREIGN KEY (planId) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (auditorID) REFERENCES USERS(ID)
);


12.
=============================
create table RISK_ITEM(
	ID int primary key AUTO_INCREMENT,
    riskItemName varchar(50),
    strategicObjectiveLink int,
    risk_type varchar(50)
);


13.
=============================
create table RISK_AUDIT_UNIVERSE(
	planID int,
    riskItemID int,
    likelyHood int,
    impact int,
    isWaited boolean,
    percentage double,
    score double,
    primary key(planID,riskItemID),
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (riskItemID) REFERENCES RISK_ITEM(ID)
);



14.
=============================
create table AUDIT_PROJECT(
    planID int primary key,
    dateCreated date,
    messageOnActivation varchar(5000),
    sartDate date,
    endDate date,
    contactPerson int,
    currentStatus int,
    engamentStatus int,
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (contactPerson) REFERENCES USERS(ID)
);


15.
=============================
Create table AUDIT_PROGRAM(
    planID int primary key,
    objectID int,
    auditHistory varchar(5000),
    objectives varchar(5000),
    methodology varchar(5000),
    startDate Date,
    endDate date,
    creator int,
    approver int, 
    approvalStatus int,
    commentOnProgram int,
    submittedForApprovals boolean,
    FOREIGN KEY (creator) REFERENCES USERS(ID),
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
	FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
);


16.
=============================
CREATE TABLE WBS(
    ID int primary key auto_increment,
    planID int,
    programID int,
    taskDescription varchar(1000),
    startDate date,
    endDate date,
    totalDate double,
    creator int,
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (programID) REFERENCES AUDIT_PROGRAM(planID),
    FOREIGN KEY (creator) REFERENCES USERS(ID)
);


17.
=============================
create table Finding(
    ID int primary key auto_increment,
    planID int,
    projectID int,
    auditArea int,
    auiditProgram int,
    findig varchar(2000),
    descriptions varchar(1000),
    checklistID int,
    Creiateria varchar(2000),
    impacts varchar(2000),
    couse int,
    recomendations varchar(2000),
    auditeesResponse varchar(2000),
    auditeesResponseSubmitted boolean,
    auditorJustifications varchar(2000),
    findingsEvidencePath varchar(2000),
    rectificationEvidence varchar(200),
    rectificationStatus int,
    rectifcationPercentage double,
    isFullyREctified boolean,
    findinStatus int,
	FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
	FOREIGN KEY (projectID) REFERENCES AUDIT_PROJECT(planID),
    FOREIGN KEY (auditArea) REFERENCES AUDITABLE_AREA(ID),
    FOREIGN KEY (auiditProgram) REFERENCES AUDIT_PROGRAM(planID)
);


18.
=============================
CREATE TABLE REPORT(
planID int primary key,
introductions varchar(5000),
prograId int,
generalObjectives varchar(2000),
methodology varchar(2000),
scope varchar(2000),
FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
FOREIGN KEY (prograId) REFERENCES AUDIT_PROGRAM(planID)
);

19.
=============================

CREATE TABLE REPORT_SUMMARY(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    reportID int,
    summary varchar(2000),
	FOREIGN KEY (reportID) REFERENCES REPORT(planID)
);

20.
=============================
CREATE TABLE SPESIFIC_OBJECTIVES(
ID INT PRIMARY KEY AUTO_INCREMENT,
reportID int,
objective varchar(2000),
FOREIGN KEY (reportID) REFERENCES REPORT(planID)
)
21.
========================================
CREATE TABLE BUDGET_YEAR(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    LABEL VARCHAR(40) unique,
    start_date Date unique,
    end_Date date unique,
    currentYear boolean
);
22.
====================================================
CREATE TABLE AUDIT_OBJECT_OBJECTIVES(
	ID int primary key  AUTO_INCREMENT,
    objectID int,
    objective varchar(2000),
    FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
    
);





CREATE TABLE ROLES(
	ID int primary key auto_increment, 
	roleName varchar(100) unique
);
CREATE TABLE UNIT_TYPE(
	ID int primary key auto_increment,
	TypeName varchar(200) unique
);
CREATE TABLE WORK_UNIT(
	ID int primary key auto_increment,
	unitName varchar(200),
    parentUnit int,
    unitType int,
    FOREIGN KEY(parentUnit) REFERENCES WORK_UNIT(ID),
    FOREIGN KEY(unitType) REFERENCES UNIT_TYPE(ID)
);
INSERT INTO WORK_UNIT(unitName) VALUES('INTERNAL AUDIT PROCESS');
CREATE TABLE USERS(
    ID int primary key auto_increment,
    fullName varchar(200),
    emailId varchar(30),
    passCode varchar(100),
    isAuditor boolean,
    unitID int,
    responsibility int,
    userRole int,
    FOREIGN KEY(unitId) REFERENCES Work_Unit(ID)
);
CREATE TABLE USER_ROLES(
userID int,
roleID int,
FOREIGN KEY(userID) REFERENCES USERS(ID),
FOREIGN KEY(roleID) REFERENCES ROLES(ID)
);
CREATE TABLE AUDIT_OBJECT(
	ID int primary key auto_increment,
    objectName varchar(50) unique,
    objectDescription varchar(5000),
    auditObjectives varchar(5000),
    category int default null,
    createdBy int,
    creation_time Date,
    FOREIGN KEY (createdBy) REFERENCES USERS(ID)
);

CREATE TABLE AUDIT_OBJECT_OBJECTIVES(
	ID int primary key  AUTO_INCREMENT,
    objectID int,
    objective varchar(2000),
    FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
    
);

CREATE TABLE AUDIT_TYPE(
ID INT PRIMARY KEY AUTO_INCREMENT,
typeName varchar(200)
);
create table AUDITABLE_AREA(
	ID int primary key auto_increment,
    objectID int,
    areaName varchar(50),
    area_description varchar(500),
    abject_id int,
    FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
); 
create table CHECKLIST(
	ID int primary key auto_increment,
    chl_name varchar(200),
    chl_description varchar(500),
    objectives varchar(500),
    relatedRisk varchar(500),
    expected_controls varchar(5000),
    auditObject int,
	auditbale_area int,
    FOREIGN KEY (auditObject) REFERENCES AUDIT_OBJECT(ID),
    FOREIGN KEY (auditbale_area) REFERENCES AUDITABLE_AREA(ID)
);
CREATE TABLE BUDGET_YEAR(
ID INT PRIMARY KEY AUTO_INCREMENT,
LABEL VARCHAR(40) unique,
start_date Date unique,
end_Date date unique,
currentYear boolean
);
CREATE TABLE AUDIT_PLAN (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PlanTitile VARCHAR(100),
    PlanAuditYear int,
    AuditObject int,
    AuditType int,
    PlanApprovalStatus VARCHAR(50),
    PlanState VARCHAR(50),
    AuditState VARCHAR(50),
    DateCreated DATE,
    RiskScore double,
    RiskLevel VARCHAR(50),
    PlanCreatedBy int,
    PlanCreationMethod VARCHAR(50),
    PlanCreationTime TIMESTAMP,
    PlanApprovedBy int,
    PlanApprovalTime TIMESTAMP,
    quarterID int,
    schedule_startDate date,
    schedule_endDate date,
    schedule_auditeesOrganID int,
    schedule_dateCompleted date,
    schedule_currentStatus varchar(200),
    schedule_totalcost double,
    schedule_involvesTravel boolean,
    schedule_approvalStatus date,
    schedule_createdAt date,
    schedule_cretedBY int,
    RectificationStatus int,
    FOREIGN KEY (AuditObject) REFERENCES AUDIT_OBJECT(ID),
    FOREIGN KEY (AuditType) REFERENCES AUDIT_TYPE(ID),
    FOREIGN KEY (PlanCreatedBy) REFERENCES USERS(ID),
    FOREIGN KEY (PlanApprovedBy) REFERENCES USERS(ID),
    FOREIGN KEY (schedule_cretedBY) REFERENCES USERS(ID)
);
create table SCHEDULE_MEMEBERS(
    planID int,
    auditorID int,
    responsibility int,
    active_status boolean,
    audit_status Varchar(30),
    perdium int,
    primary key(planId,auditorID),
    FOREIGN KEY (planId) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (auditorID) REFERENCES USERS(ID)
);
create table RISK_ITEM(
	ID int primary key AUTO_INCREMENT,
    riskItemName varchar(50),
    strategicObjectiveLink int,
    risk_type varchar(50)
);
create table RISK_AUDIT_UNIVERSE(
	planID int,
    riskItemID int,
    likelyHood int,
    impact int,
    isWaited boolean,
    percentage double,
    score double,
    primary key(planID,riskItemID),
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (riskItemID) REFERENCES RISK_ITEM(ID)
);
create table AUDIT_PROJECT(
    planID int primary key,
    dateCreated date,
    messageOnActivation varchar(5000),
    sartDate date,
    endDate date,
    contactPerson int,
    currentStatus int,
    engamentStatus int,
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (contactPerson) REFERENCES USERS(ID)
);
Create table AUDIT_PROGRAM(
    planID int primary key,
    objectID int,
    auditHistory varchar(5000),
    objectives varchar(5000),
    methodology varchar(5000),
    startDate Date,
    endDate date,
    creator int,
    approver int, 
    approvalStatus int,
    commentOnProgram int,
    submittedForApprovals boolean,
    FOREIGN KEY (creator) REFERENCES USERS(ID),
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
	FOREIGN KEY (objectID) REFERENCES AUDIT_OBJECT(ID)
);
CREATE TABLE WBS(
    ID int primary key auto_increment,
    planID int,
    programID int,
    taskDescription varchar(1000),
    startDate date,
    endDate date,
    totalDate double,
    creator int,
    FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
    FOREIGN KEY (programID) REFERENCES AUDIT_PROGRAM(planID),
    FOREIGN KEY (creator) REFERENCES USERS(ID)
);
create table Finding(
    ID int primary key auto_increment,
    planID int,
    projectID int,
    auditArea int,
    auiditProgram int,
    findig varchar(2000),
    descriptions varchar(1000),
    checklistID int,
    Creiateria varchar(2000),
    impacts varchar(2000),
    couse int,
    recomendations varchar(2000),
    auditeesResponse varchar(2000),
    auditeesResponseSubmitted boolean,
    auditorJustifications varchar(2000),
    findingsEvidencePath varchar(2000),
    rectificationEvidence varchar(200),
    rectificationStatus int,
    rectifcationPercentage double,
    isFullyREctified boolean,
    findinStatus int,
	FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
	FOREIGN KEY (projectID) REFERENCES AUDIT_PROJECT(planID),
    FOREIGN KEY (auditArea) REFERENCES AUDITABLE_AREA(ID),
    FOREIGN KEY (auiditProgram) REFERENCES AUDIT_PROGRAM(planID)
);
CREATE TABLE REPORT(
planID int primary key,
introductions varchar(5000),
prograId int,
generalObjectives varchar(2000),
methodology varchar(2000),
scope varchar(2000),
FOREIGN KEY (planID) REFERENCES AUDIT_PLAN(ID),
FOREIGN KEY (prograId) REFERENCES AUDIT_PROGRAM(planID)
);
CREATE TABLE REPORT_SUMMARY(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    reportID int,
    summary varchar(2000),
	FOREIGN KEY (reportID) REFERENCES REPORT(planID)
);
CREATE TABLE SPESIFIC_OBJECTIVES(
ID INT PRIMARY KEY AUTO_INCREMENT,
reportID int,
objective varchar(2000),
FOREIGN KEY (reportID) REFERENCES REPORT(planID)
)

18:03:51	INSERT INTO WORK_UNIT(unitName) VALUES('INTERNAL AUDIT PROCESS')	
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`ams`.`work_unit`, CONSTRAINT `work_unit_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `users` (`unitID`))	0.0078 sec


INSERT INTO RISK_AUDIT_UNIVERSE (planID , riskItemID , likelyHood , impact , isWaited , percentage , score) VALUES("1" , "2" , "3" , "3" , "0" , "0" , "9")























