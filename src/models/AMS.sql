-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 17, 2023 at 01:17 PM
-- Server version: 8.0.26
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `AUDITABLE_AREA`
--

CREATE TABLE `AUDITABLE_AREA` (
  `ID` int NOT NULL,
  `objectID` int DEFAULT NULL,
  `areaName` varchar(50) DEFAULT NULL,
  `area_description` varchar(500) DEFAULT NULL,
  `abject_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDITABLE_AREA`
--

INSERT INTO `AUDITABLE_AREA` (`ID`, `objectID`, `areaName`, `area_description`, `abject_id`) VALUES
(1, 1, 'some area name', 'is', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_OBJECT`
--

CREATE TABLE `AUDIT_OBJECT` (
  `ID` int NOT NULL,
  `objectName` varchar(50) DEFAULT NULL,
  `objectDescription` varchar(5000) DEFAULT NULL,
  `auditObjectives` varchar(5000) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `creation_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_OBJECT`
--

INSERT INTO `AUDIT_OBJECT` (`ID`, `objectName`, `objectDescription`, `auditObjectives`, `category`, `createdBy`, `creation_time`) VALUES
(1, 'Network Administration', 'A system administration audit, also known as a system audit or IT audit, is a process of evaluating and assessing the effectiveness, security, and compliance of an organization\'s computer systems and network infrastructure. The goal of the audit is to identify any vulnerabilities, weaknesses, or potential risks in the systems and to ensure that they are properly managed and controlled.', 'Here are some key areas typically covered in a system administration audit:\r\n\r\nUser Accounts and Access Control: This involves reviewing user account management practices, including the creation, modification, and deletion of user accounts. It also includes assessing the effectiveness of access controls, such as password policies, multi-factor authentication, and role-based access.\r\n\r\nSystem Configuration: The audit examines the configuration of servers, network devices, and other system components to ensure they are properly set up and aligned with security best practices. This includes reviewing system hardening, patch management, and configuration management processes.\r\n\r\nSystem Monitoring and Logging: The audit assesses the organization\'s monitoring and logging practices to determine if there are adequate mechanisms in place for detecting and responding to security incidents. This includes reviewing log retention policies, log analysis tools, and the effectiveness of intrusion detection and prevention systems.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_OBJECT_OBJECTIVES`
--

CREATE TABLE `AUDIT_OBJECT_OBJECTIVES` (
  `ID` int NOT NULL,
  `objectID` int DEFAULT NULL,
  `objective` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_OBJECT_OBJECTIVES`
--

INSERT INTO `AUDIT_OBJECT_OBJECTIVES` (`ID`, `objectID`, `objective`) VALUES
(1, 1, 'To perform this task in deatail and ');

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_PLAN`
--

CREATE TABLE `AUDIT_PLAN` (
  `ID` int NOT NULL,
  `PlanTitile` varchar(100) DEFAULT NULL,
  `PlanAuditYear` int DEFAULT NULL,
  `AuditObject` int DEFAULT NULL,
  `AuditType` int DEFAULT NULL,
  `PlanApprovalStatus` varchar(50) DEFAULT NULL,
  `PlanState` varchar(50) DEFAULT NULL,
  `AuditState` varchar(50) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `RiskScore` double DEFAULT NULL,
  `RiskLevel` varchar(50) DEFAULT NULL,
  `PlanCreatedBy` int DEFAULT NULL,
  `PlanCreationMethod` varchar(50) DEFAULT NULL,
  `PlanCreationTime` timestamp NULL DEFAULT NULL,
  `PlanApprovedBy` int DEFAULT NULL,
  `PlanApprovalTime` timestamp NULL DEFAULT NULL,
  `quarterID` int DEFAULT NULL,
  `schedule_startDate` date DEFAULT NULL,
  `schedule_endDate` date DEFAULT NULL,
  `schedule_auditeesOrganID` int DEFAULT NULL,
  `schedule_dateCompleted` date DEFAULT NULL,
  `schedule_currentStatus` varchar(200) DEFAULT NULL,
  `schedule_totalcost` double DEFAULT NULL,
  `schedule_involvesTravel` tinyint(1) DEFAULT NULL,
  `schedule_approvalStatus` date DEFAULT NULL,
  `schedule_createdAt` date DEFAULT NULL,
  `schedule_cretedBY` int DEFAULT NULL,
  `RectificationStatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_PLAN`
--

INSERT INTO `AUDIT_PLAN` (`ID`, `PlanTitile`, `PlanAuditYear`, `AuditObject`, `AuditType`, `PlanApprovalStatus`, `PlanState`, `AuditState`, `DateCreated`, `RiskScore`, `RiskLevel`, `PlanCreatedBy`, `PlanCreationMethod`, `PlanCreationTime`, `PlanApprovedBy`, `PlanApprovalTime`, `quarterID`, `schedule_startDate`, `schedule_endDate`, `schedule_auditeesOrganID`, `schedule_dateCompleted`, `schedule_currentStatus`, `schedule_totalcost`, `schedule_involvesTravel`, `schedule_approvalStatus`, `schedule_createdAt`, `schedule_cretedBY`, `RectificationStatus`) VALUES
(1, 'Infomation System Audit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_PROGRAM`
--

CREATE TABLE `AUDIT_PROGRAM` (
  `planID` int NOT NULL,
  `objectID` int DEFAULT NULL,
  `auditHistory` varchar(5000) DEFAULT NULL,
  `objectives` varchar(5000) DEFAULT NULL,
  `methodology` varchar(5000) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `approver` int DEFAULT NULL,
  `approvalStatus` int DEFAULT NULL,
  `commentOnProgram` int DEFAULT NULL,
  `submittedForApprovals` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_PROGRAM`
--

INSERT INTO `AUDIT_PROGRAM` (`planID`, `objectID`, `auditHistory`, `objectives`, `methodology`, `startDate`, `endDate`, `creator`, `approver`, `approvalStatus`, `commentOnProgram`, `submittedForApprovals`) VALUES
(1, 1, 'New in the ', 'the objectives of this audit is to perform ', 'we follow the methodology that will increase our performance in conducting the audit work this includes ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_PROJECT`
--

CREATE TABLE `AUDIT_PROJECT` (
  `planID` int NOT NULL,
  `dateCreated` date DEFAULT NULL,
  `messageOnActivation` varchar(5000) DEFAULT NULL,
  `sartDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `contactPerson` int DEFAULT NULL,
  `currentStatus` int DEFAULT NULL,
  `engamentStatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_PROJECT`
--

INSERT INTO `AUDIT_PROJECT` (`planID`, `dateCreated`, `messageOnActivation`, `sartDate`, `endDate`, `contactPerson`, `currentStatus`, `engamentStatus`) VALUES
(1, '2023-07-10', 'Please prepare the audit programs for the assingne task considerin the risk and schedule of the audit work ', '2023-07-04', '2023-07-13', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_TYPE`
--

CREATE TABLE `AUDIT_TYPE` (
  `ID` int NOT NULL,
  `typeName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AUDIT_TYPE`
--

INSERT INTO `AUDIT_TYPE` (`ID`, `typeName`) VALUES
(1, 'IT Audit');

-- --------------------------------------------------------

--
-- Table structure for table `BUDGET_YEAR`
--

CREATE TABLE `BUDGET_YEAR` (
  `ID` int NOT NULL,
  `LABEL` varchar(40) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_Date` date DEFAULT NULL,
  `currentYear` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BUDGET_YEAR`
--

INSERT INTO `BUDGET_YEAR` (`ID`, `LABEL`, `start_date`, `end_Date`, `currentYear`) VALUES
(1, 'Fiscal Year 2023/24', '2023-07-01', '2024-06-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `CHECKLIST`
--

CREATE TABLE `CHECKLIST` (
  `ID` int NOT NULL,
  `chl_name` varchar(200) DEFAULT NULL,
  `chl_description` varchar(500) DEFAULT NULL,
  `objectives` varchar(500) DEFAULT NULL,
  `relatedRisk` varchar(500) DEFAULT NULL,
  `expected_controls` varchar(5000) DEFAULT NULL,
  `auditObject` int DEFAULT NULL,
  `auditbale_area` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CHECKLIST`
--

INSERT INTO `CHECKLIST` (`ID`, `chl_name`, `chl_description`, `objectives`, `relatedRisk`, `expected_controls`, `auditObject`, `auditbale_area`) VALUES
(1, 'Sdf', 'this is done unig update', 'sdf', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Finding`
--

CREATE TABLE `Finding` (
  `ID` int NOT NULL,
  `planID` int DEFAULT NULL,
  `projectID` int DEFAULT NULL,
  `auditArea` int DEFAULT NULL,
  `auiditProgram` int DEFAULT NULL,
  `findig` varchar(2000) DEFAULT NULL,
  `descriptions` varchar(1000) DEFAULT NULL,
  `checklistID` int DEFAULT NULL,
  `Creiateria` varchar(2000) DEFAULT NULL,
  `impacts` varchar(2000) DEFAULT NULL,
  `couse` int DEFAULT NULL,
  `recomendations` varchar(2000) DEFAULT NULL,
  `auditeesResponse` varchar(2000) DEFAULT NULL,
  `auditeesResponseSubmitted` tinyint(1) DEFAULT NULL,
  `auditorJustifications` varchar(2000) DEFAULT NULL,
  `findingsEvidencePath` varchar(2000) DEFAULT NULL,
  `rectificationEvidence` varchar(200) DEFAULT NULL,
  `rectificationStatus` int DEFAULT NULL,
  `rectifcationPercentage` double DEFAULT NULL,
  `isFullyREctified` tinyint(1) DEFAULT NULL,
  `findinStatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Finding`
--

INSERT INTO `Finding` (`ID`, `planID`, `projectID`, `auditArea`, `auiditProgram`, `findig`, `descriptions`, `checklistID`, `Creiateria`, `impacts`, `couse`, `recomendations`, `auditeesResponse`, `auditeesResponseSubmitted`, `auditorJustifications`, `findingsEvidencePath`, `rectificationEvidence`, `rectificationStatus`, `rectifcationPercentage`, `isFullyREctified`, `findinStatus`) VALUES
(1, 1, 1, 1, 1, 'Please clearly indicate the Findings only as such ', 'long description of the foindings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `REPORT`
--

CREATE TABLE `REPORT` (
  `planID` int NOT NULL,
  `introductions` varchar(5000) DEFAULT NULL,
  `prograId` int DEFAULT NULL,
  `generalObjectives` varchar(2000) DEFAULT NULL,
  `methodology` varchar(2000) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `REPORT`
--

INSERT INTO `REPORT` (`planID`, `introductions`, `prograId`, `generalObjectives`, `methodology`, `scope`) VALUES
(1, 'Cooperative Bank Of oromia ', 1, 'the Objective of this audit report ', 'Interview', 'the scope of this audit work is limited to');

-- --------------------------------------------------------

--
-- Table structure for table `REPORT_SUMMARY`
--

CREATE TABLE `REPORT_SUMMARY` (
  `ID` int NOT NULL,
  `reportID` int DEFAULT NULL,
  `summary` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `REPORT_SUMMARY`
--

INSERT INTO `REPORT_SUMMARY` (`ID`, `reportID`, `summary`) VALUES
(1, NULL, 'the Installed system is not working properly and ');

-- --------------------------------------------------------

--
-- Table structure for table `RISK_AUDIT_UNIVERSE`
--

CREATE TABLE `RISK_AUDIT_UNIVERSE` (
  `planID` int NOT NULL,
  `riskItemID` int NOT NULL,
  `likelyHood` int DEFAULT NULL,
  `impact` int DEFAULT NULL,
  `isWaited` tinyint(1) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RISK_AUDIT_UNIVERSE`
--

INSERT INTO `RISK_AUDIT_UNIVERSE` (`planID`, `riskItemID`, `likelyHood`, `impact`, `isWaited`, `percentage`, `score`) VALUES
(1, 1, 3, 3, 0, 0, 9),
(1, 2, 3, 3, 0, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `RISK_ITEM`
--

CREATE TABLE `RISK_ITEM` (
  `ID` int NOT NULL,
  `riskItemName` varchar(50) DEFAULT NULL,
  `strategicObjectiveLink` int DEFAULT NULL,
  `risk_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `RISK_ITEM`
--

INSERT INTO `RISK_ITEM` (`ID`, `riskItemName`, `strategicObjectiveLink`, `risk_type`) VALUES
(1, 'Confidence', NULL, NULL),
(2, 'Confidentiality', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ROLES`
--

CREATE TABLE `ROLES` (
  `ID` int NOT NULL,
  `roleName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ROLES`
--

INSERT INTO `ROLES` (`ID`, `roleName`) VALUES
(2, 'Audit Director'),
(1, 'Audit Manager'),
(3, 'Auditor'),
(6, 'Director'),
(5, 'Manager'),
(4, 'President');

-- --------------------------------------------------------

--
-- Table structure for table `SCHEDULE_MEMEBERS`
--

CREATE TABLE `SCHEDULE_MEMEBERS` (
  `planID` int NOT NULL,
  `auditorID` int NOT NULL,
  `responsibility` int DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL,
  `audit_status` varchar(30) DEFAULT NULL,
  `perdium` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `SCHEDULE_MEMEBERS`
--

INSERT INTO `SCHEDULE_MEMEBERS` (`planID`, `auditorID`, `responsibility`, `active_status`, `audit_status`, `perdium`) VALUES
(1, 1, NULL, 0, '0', 4000);

-- --------------------------------------------------------

--
-- Table structure for table `SPESIFIC_OBJECTIVES`
--

CREATE TABLE `SPESIFIC_OBJECTIVES` (
  `ID` int NOT NULL,
  `reportID` int DEFAULT NULL,
  `objective` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `SPESIFIC_OBJECTIVES`
--

INSERT INTO `SPESIFIC_OBJECTIVES` (`ID`, `reportID`, `objective`) VALUES
(1, NULL, 'this is the objectives');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT_TYPE`
--

CREATE TABLE `UNIT_TYPE` (
  `ID` int NOT NULL,
  `TypeName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UNIT_TYPE`
--

INSERT INTO `UNIT_TYPE` (`ID`, `TypeName`) VALUES
(5, 'Branch Grade 1'),
(6, 'Branch Grade 2'),
(7, 'Branch Grade 3'),
(8, 'Branch Grade 4'),
(2, 'President Office'),
(3, 'Process/vp'),
(9, 'Special Branch'),
(4, 'Sub Process/Destrict');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `ID` int NOT NULL,
  `fullName` varchar(200) DEFAULT NULL,
  `emailId` varchar(30) DEFAULT NULL,
  `passCode` varchar(100) DEFAULT NULL,
  `isAuditor` tinyint(1) DEFAULT NULL,
  `unitID` int DEFAULT NULL,
  `responsibility` int DEFAULT NULL,
  `userRole` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`ID`, `fullName`, `emailId`, `passCode`, `isAuditor`, `unitID`, `responsibility`, `userRole`) VALUES
(1, 'Yohannes Mitke', 'jonmersha@gmail.com', '123123123', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `USER_ROLES`
--

CREATE TABLE `USER_ROLES` (
  `userID` int DEFAULT NULL,
  `roleID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `USER_ROLES`
--

INSERT INTO `USER_ROLES` (`userID`, `roleID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `WBS`
--

CREATE TABLE `WBS` (
  `ID` int NOT NULL,
  `planID` int DEFAULT NULL,
  `programID` int DEFAULT NULL,
  `taskDescription` varchar(1000) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `totalDate` double DEFAULT NULL,
  `creator` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `WBS`
--

INSERT INTO `WBS` (`ID`, `planID`, `programID`, `taskDescription`, `startDate`, `endDate`, `totalDate`, `creator`) VALUES
(1, 1, 1, 'Port Scanninig', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `WORK_UNIT`
--

CREATE TABLE `WORK_UNIT` (
  `ID` int NOT NULL,
  `unitName` varchar(200) DEFAULT NULL,
  `parentUnit` int DEFAULT NULL,
  `unitType` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `WORK_UNIT`
--

INSERT INTO `WORK_UNIT` (`ID`, `unitName`, `parentUnit`, `unitType`) VALUES
(3, 'INTERNAL AUDIT PROCESS', NULL, NULL),
(4, 'President Office', NULL, 2),
(5, 'Internal Audit Process', 4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AUDITABLE_AREA`
--
ALTER TABLE `AUDITABLE_AREA`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `objectID` (`objectID`);

--
-- Indexes for table `AUDIT_OBJECT`
--
ALTER TABLE `AUDIT_OBJECT`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `objectName` (`objectName`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `AUDIT_OBJECT_OBJECTIVES`
--
ALTER TABLE `AUDIT_OBJECT_OBJECTIVES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `objectID` (`objectID`);

--
-- Indexes for table `AUDIT_PLAN`
--
ALTER TABLE `AUDIT_PLAN`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AuditObject` (`AuditObject`),
  ADD KEY `AuditType` (`AuditType`),
  ADD KEY `PlanCreatedBy` (`PlanCreatedBy`),
  ADD KEY `PlanApprovedBy` (`PlanApprovedBy`),
  ADD KEY `schedule_cretedBY` (`schedule_cretedBY`);

--
-- Indexes for table `AUDIT_PROGRAM`
--
ALTER TABLE `AUDIT_PROGRAM`
  ADD PRIMARY KEY (`planID`),
  ADD KEY `creator` (`creator`),
  ADD KEY `objectID` (`objectID`);

--
-- Indexes for table `AUDIT_PROJECT`
--
ALTER TABLE `AUDIT_PROJECT`
  ADD PRIMARY KEY (`planID`),
  ADD KEY `contactPerson` (`contactPerson`);

--
-- Indexes for table `AUDIT_TYPE`
--
ALTER TABLE `AUDIT_TYPE`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BUDGET_YEAR`
--
ALTER TABLE `BUDGET_YEAR`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LABEL` (`LABEL`),
  ADD UNIQUE KEY `start_date` (`start_date`),
  ADD UNIQUE KEY `end_Date` (`end_Date`);

--
-- Indexes for table `CHECKLIST`
--
ALTER TABLE `CHECKLIST`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `auditObject` (`auditObject`),
  ADD KEY `auditbale_area` (`auditbale_area`);

--
-- Indexes for table `Finding`
--
ALTER TABLE `Finding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `planID` (`planID`),
  ADD KEY `projectID` (`projectID`),
  ADD KEY `auditArea` (`auditArea`),
  ADD KEY `auiditProgram` (`auiditProgram`);

--
-- Indexes for table `REPORT`
--
ALTER TABLE `REPORT`
  ADD PRIMARY KEY (`planID`),
  ADD KEY `prograId` (`prograId`);

--
-- Indexes for table `REPORT_SUMMARY`
--
ALTER TABLE `REPORT_SUMMARY`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `reportID` (`reportID`);

--
-- Indexes for table `RISK_AUDIT_UNIVERSE`
--
ALTER TABLE `RISK_AUDIT_UNIVERSE`
  ADD PRIMARY KEY (`planID`,`riskItemID`),
  ADD KEY `riskItemID` (`riskItemID`);

--
-- Indexes for table `RISK_ITEM`
--
ALTER TABLE `RISK_ITEM`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `roleName` (`roleName`);

--
-- Indexes for table `SCHEDULE_MEMEBERS`
--
ALTER TABLE `SCHEDULE_MEMEBERS`
  ADD PRIMARY KEY (`planID`,`auditorID`),
  ADD KEY `auditorID` (`auditorID`);

--
-- Indexes for table `SPESIFIC_OBJECTIVES`
--
ALTER TABLE `SPESIFIC_OBJECTIVES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `reportID` (`reportID`);

--
-- Indexes for table `UNIT_TYPE`
--
ALTER TABLE `UNIT_TYPE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TypeName` (`TypeName`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `users_ibfk_1` (`unitID`);

--
-- Indexes for table `USER_ROLES`
--
ALTER TABLE `USER_ROLES`
  ADD KEY `userID` (`userID`),
  ADD KEY `roleID` (`roleID`);

--
-- Indexes for table `WBS`
--
ALTER TABLE `WBS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `planID` (`planID`),
  ADD KEY `programID` (`programID`),
  ADD KEY `creator` (`creator`);

--
-- Indexes for table `WORK_UNIT`
--
ALTER TABLE `WORK_UNIT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parentUnit` (`parentUnit`),
  ADD KEY `unitType` (`unitType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AUDITABLE_AREA`
--
ALTER TABLE `AUDITABLE_AREA`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `AUDIT_OBJECT`
--
ALTER TABLE `AUDIT_OBJECT`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `AUDIT_OBJECT_OBJECTIVES`
--
ALTER TABLE `AUDIT_OBJECT_OBJECTIVES`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `AUDIT_PLAN`
--
ALTER TABLE `AUDIT_PLAN`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `AUDIT_TYPE`
--
ALTER TABLE `AUDIT_TYPE`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `BUDGET_YEAR`
--
ALTER TABLE `BUDGET_YEAR`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `CHECKLIST`
--
ALTER TABLE `CHECKLIST`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Finding`
--
ALTER TABLE `Finding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `REPORT_SUMMARY`
--
ALTER TABLE `REPORT_SUMMARY`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `RISK_ITEM`
--
ALTER TABLE `RISK_ITEM`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ROLES`
--
ALTER TABLE `ROLES`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `SPESIFIC_OBJECTIVES`
--
ALTER TABLE `SPESIFIC_OBJECTIVES`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UNIT_TYPE`
--
ALTER TABLE `UNIT_TYPE`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WBS`
--
ALTER TABLE `WBS`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `WORK_UNIT`
--
ALTER TABLE `WORK_UNIT`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AUDITABLE_AREA`
--
ALTER TABLE `AUDITABLE_AREA`
  ADD CONSTRAINT `auditable_area_ibfk_1` FOREIGN KEY (`objectID`) REFERENCES `AUDIT_OBJECT` (`ID`);

--
-- Constraints for table `AUDIT_OBJECT`
--
ALTER TABLE `AUDIT_OBJECT`
  ADD CONSTRAINT `audit_object_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `USERS` (`ID`);

--
-- Constraints for table `AUDIT_OBJECT_OBJECTIVES`
--
ALTER TABLE `AUDIT_OBJECT_OBJECTIVES`
  ADD CONSTRAINT `audit_object_objectives_ibfk_1` FOREIGN KEY (`objectID`) REFERENCES `AUDIT_OBJECT` (`ID`);

--
-- Constraints for table `AUDIT_PLAN`
--
ALTER TABLE `AUDIT_PLAN`
  ADD CONSTRAINT `audit_plan_ibfk_1` FOREIGN KEY (`AuditObject`) REFERENCES `AUDIT_OBJECT` (`ID`),
  ADD CONSTRAINT `audit_plan_ibfk_2` FOREIGN KEY (`AuditType`) REFERENCES `AUDIT_TYPE` (`ID`),
  ADD CONSTRAINT `audit_plan_ibfk_3` FOREIGN KEY (`PlanCreatedBy`) REFERENCES `USERS` (`ID`),
  ADD CONSTRAINT `audit_plan_ibfk_4` FOREIGN KEY (`PlanApprovedBy`) REFERENCES `USERS` (`ID`),
  ADD CONSTRAINT `audit_plan_ibfk_5` FOREIGN KEY (`schedule_cretedBY`) REFERENCES `USERS` (`ID`);

--
-- Constraints for table `AUDIT_PROGRAM`
--
ALTER TABLE `AUDIT_PROGRAM`
  ADD CONSTRAINT `audit_program_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `USERS` (`ID`),
  ADD CONSTRAINT `audit_program_ibfk_2` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `audit_program_ibfk_3` FOREIGN KEY (`objectID`) REFERENCES `AUDIT_OBJECT` (`ID`);

--
-- Constraints for table `AUDIT_PROJECT`
--
ALTER TABLE `AUDIT_PROJECT`
  ADD CONSTRAINT `audit_project_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `audit_project_ibfk_2` FOREIGN KEY (`contactPerson`) REFERENCES `USERS` (`ID`);

--
-- Constraints for table `CHECKLIST`
--
ALTER TABLE `CHECKLIST`
  ADD CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`auditObject`) REFERENCES `AUDIT_OBJECT` (`ID`),
  ADD CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`auditbale_area`) REFERENCES `AUDITABLE_AREA` (`ID`);

--
-- Constraints for table `Finding`
--
ALTER TABLE `Finding`
  ADD CONSTRAINT `finding_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `finding_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `AUDIT_PROJECT` (`planID`),
  ADD CONSTRAINT `finding_ibfk_3` FOREIGN KEY (`auditArea`) REFERENCES `AUDITABLE_AREA` (`ID`),
  ADD CONSTRAINT `finding_ibfk_4` FOREIGN KEY (`auiditProgram`) REFERENCES `AUDIT_PROGRAM` (`planID`);

--
-- Constraints for table `REPORT`
--
ALTER TABLE `REPORT`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`prograId`) REFERENCES `AUDIT_PROGRAM` (`planID`);

--
-- Constraints for table `REPORT_SUMMARY`
--
ALTER TABLE `REPORT_SUMMARY`
  ADD CONSTRAINT `report_summary_ibfk_1` FOREIGN KEY (`reportID`) REFERENCES `REPORT` (`planID`);

--
-- Constraints for table `RISK_AUDIT_UNIVERSE`
--
ALTER TABLE `RISK_AUDIT_UNIVERSE`
  ADD CONSTRAINT `risk_audit_universe_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `risk_audit_universe_ibfk_2` FOREIGN KEY (`riskItemID`) REFERENCES `RISK_ITEM` (`ID`);

--
-- Constraints for table `SCHEDULE_MEMEBERS`
--
ALTER TABLE `SCHEDULE_MEMEBERS`
  ADD CONSTRAINT `schedule_memebers_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `schedule_memebers_ibfk_2` FOREIGN KEY (`auditorID`) REFERENCES `USERS` (`ID`);

--
-- Constraints for table `SPESIFIC_OBJECTIVES`
--
ALTER TABLE `SPESIFIC_OBJECTIVES`
  ADD CONSTRAINT `spesific_objectives_ibfk_1` FOREIGN KEY (`reportID`) REFERENCES `REPORT` (`planID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`unitID`) REFERENCES `Work_Unit` (`ID`);

--
-- Constraints for table `USER_ROLES`
--
ALTER TABLE `USER_ROLES`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `USERS` (`ID`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `ROLES` (`ID`);

--
-- Constraints for table `WBS`
--
ALTER TABLE `WBS`
  ADD CONSTRAINT `wbs_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `AUDIT_PLAN` (`ID`),
  ADD CONSTRAINT `wbs_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `AUDIT_PROGRAM` (`planID`),
  ADD CONSTRAINT `wbs_ibfk_3` FOREIGN KEY (`creator`) REFERENCES `USERS` (`ID`);

--
-- Constraints for table `WORK_UNIT`
--
ALTER TABLE `WORK_UNIT`
  ADD CONSTRAINT `work_unit_ibfk_1` FOREIGN KEY (`parentUnit`) REFERENCES `WORK_UNIT` (`ID`),
  ADD CONSTRAINT `work_unit_ibfk_2` FOREIGN KEY (`unitType`) REFERENCES `UNIT_TYPE` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
