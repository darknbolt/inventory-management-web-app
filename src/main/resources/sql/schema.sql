-- tables
-- Table: Employee
CREATE TABLE Employee (
                          ID integer  NOT NULL,
                          Username varchar(20)  NOT NULL,
                          HashedPassword varchar(50)  NOT NULL,
                          Name varchar(20)  NOT NULL,
                          Surname varchar(20)  NOT NULL,
                          DoB date  NOT NULL,
                          Email varchar(20)  NOT NULL,
                          Phone varchar(20)  NOT NULL,
                          Start_Date date  NOT NULL,
                          End_Date date  NULL,
                          Boss_ID integer  NULL,
                          Warehouse_ID integer  NOT NULL,
                          CONSTRAINT Employee_pk PRIMARY KEY (ID)
);

-- Table: Employee_Job
CREATE TABLE Employee_Job (
                              Employee_ID integer  NOT NULL,
                              Job_ID integer  NOT NULL,
                              CONSTRAINT Employee_Job_pk PRIMARY KEY (Employee_ID,Job_ID)
);

-- Table: Employee_Login_Audit
CREATE TABLE Employee_Login_Audit (
                                      Login_Audit_ID integer  NOT NULL,
                                      Employee_ID integer  NOT NULL,
                                      CONSTRAINT Employee_Login_Audit_pk PRIMARY KEY (Login_Audit_ID,Employee_ID)
);

-- Table: Item
CREATE TABLE Item (
                      ID integer  NOT NULL,
                      Name varchar(20)  NOT NULL,
                      Description varchar(200)  NOT NULL,
                      Cost double(10,3)  NOT NULL,
                      Quantity integer  NOT NULL,
                      CONSTRAINT Item_pk PRIMARY KEY (ID)
);

-- Table: Item_Sale
CREATE TABLE Item_Sale (
                           Item_ID integer  NOT NULL,
                           Sale_ID integer  NOT NULL,
                           CONSTRAINT Item_Sale_pk PRIMARY KEY (Sale_ID,Item_ID)
);

-- Table: Job
CREATE TABLE Job (
                     ID integer  NOT NULL,
                     Name varchar(50)  NOT NULL,
                     Description varchar(200)  NOT NULL,
                     CONSTRAINT Job_pk PRIMARY KEY (ID)
);

-- Table: Login_Audit
CREATE TABLE Login_Audit (
                             ID integer  NOT NULL,
                             Username varchar(20)  NOT NULL,
                             IP_Address varchar(20)  NOT NULL,
                             Login_Time timestamp  NOT NULL,
                             Success_Failure bool  NOT NULL,
                             CONSTRAINT Login_Audit_pk PRIMARY KEY (ID)
);

-- Table: Sale
CREATE TABLE Sale (
                      ID integer  NOT NULL,
                      Sale_Time timestamp  NOT NULL,
                      Salesman_ID integer  NOT NULL,
                      CONSTRAINT Sale_pk PRIMARY KEY (ID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
                           ID integer  NOT NULL,
                           Adress varchar(200)  NOT NULL,
                           CONSTRAINT Warehouse_pk PRIMARY KEY (ID)
);

-- Table: Warehouse_Items
CREATE TABLE Warehouse_Items (
                                 Warehouse_ID integer  NOT NULL,
                                 Item_ID integer  NOT NULL,
                                 CONSTRAINT Warehouse_Items_pk PRIMARY KEY (Warehouse_ID,Item_ID)
);

-- foreign keys
-- Reference: Employee_Employee (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Employee FOREIGN KEY Employee_Employee (Boss_ID)
    REFERENCES Employee (ID);

-- Reference: Employee_Job_Employee (table: Employee_Job)
ALTER TABLE Employee_Job ADD CONSTRAINT Employee_Job_Employee FOREIGN KEY Employee_Job_Employee (Employee_ID)
    REFERENCES Employee (ID);

-- Reference: Employee_Job_Job (table: Employee_Job)
ALTER TABLE Employee_Job ADD CONSTRAINT Employee_Job_Job FOREIGN KEY Employee_Job_Job (Job_ID)
    REFERENCES Job (ID);

-- Reference: Employee_Login_Audit_Employee (table: Employee_Login_Audit)
ALTER TABLE Employee_Login_Audit ADD CONSTRAINT Employee_Login_Audit_Employee FOREIGN KEY Employee_Login_Audit_Employee (Employee_ID)
    REFERENCES Employee (ID);

-- Reference: Employee_Login_Audit_Login_Audit (table: Employee_Login_Audit)
ALTER TABLE Employee_Login_Audit ADD CONSTRAINT Employee_Login_Audit_Login_Audit FOREIGN KEY Employee_Login_Audit_Login_Audit (Login_Audit_ID)
    REFERENCES Login_Audit (ID);

-- Reference: Employee_Warehouse (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Warehouse FOREIGN KEY Employee_Warehouse (Warehouse_ID)
    REFERENCES Warehouse (ID);

-- Reference: Item_Purchase_Item (table: Item_Sale)
ALTER TABLE Item_Sale ADD CONSTRAINT Item_Purchase_Item FOREIGN KEY Item_Purchase_Item (Item_ID)
    REFERENCES Item (ID);

-- Reference: Item_Purchase_Purchase (table: Item_Sale)
ALTER TABLE Item_Sale ADD CONSTRAINT Item_Purchase_Purchase FOREIGN KEY Item_Purchase_Purchase (Sale_ID)
    REFERENCES Sale (ID);

-- Reference: Purchase_Employee (table: Sale)
ALTER TABLE Sale ADD CONSTRAINT Purchase_Employee FOREIGN KEY Purchase_Employee (Salesman_ID)
    REFERENCES Employee (ID);

-- Reference: Table_9_Item (table: Warehouse_Items)
ALTER TABLE Warehouse_Items ADD CONSTRAINT Table_9_Item FOREIGN KEY Table_9_Item (Item_ID)
    REFERENCES Item (ID);

-- Reference: Table_9_Warehouse (table: Warehouse_Items)
ALTER TABLE Warehouse_Items ADD CONSTRAINT Table_9_Warehouse FOREIGN KEY Table_9_Warehouse (Warehouse_ID)
    REFERENCES Warehouse (ID);