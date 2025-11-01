-- =====================================================================
-- File Name: COMMON.SQL
-- Description: Common Physical File for all demonstration programs
-- =====================================================================

CREATE OR REPLACE TABLE COMMONPF (
    EMPID   DECIMAL(5, 0) NOT NULL PRIMARY KEY
                LABEL 'EMPLOYEE ID',
    EMPNAME CHAR(15)
                LABEL 'EMPLOYEE NAME',
    EMPDPT  CHAR(10)
                LABEL 'EMPLOYEE DEPARTMENT'
) 
RCDFMT COMMONREC;

-- Sample data insertion for testing
INSERT INTO COMMONPF (EMPID, EMPNAME, EMPDPT) VALUES
    (1, 'John Smith', 'Sales'),
    (2, 'Aravind Vemula', 'Development'),
    (3, 'Maria Garcia', 'HR'),
    (4, 'James Wilson', 'Finance');

-- =====================================================================
-- This file is used by all programs in the Bltinfns&opCods folder
-- RECORD FORMAT: COMMONREC
-- =====================================================================
