-- Table: Employee
CREATE TABLE Employee (
                          ID INTEGER NOT NULL,
                          Username VARCHAR(20) NOT NULL,
                          HashedPassword VARCHAR(50) NOT NULL,
                          Name VARCHAR(20) NOT NULL,
                          Surname VARCHAR(20) NOT NULL,
                          DoB DATE NOT NULL,
                          Email VARCHAR(20) NOT NULL,
                          Phone VARCHAR(20) NOT NULL,
                          Start_Date DATE NOT NULL,
                          End_Date DATE,
                          Boss_ID INTEGER,
                          Warehouse_ID INTEGER NOT NULL,
                          CONSTRAINT Employee_pk PRIMARY KEY (ID)
);

-- Table: Job
CREATE TABLE Job (
                     ID INTEGER NOT NULL,
                     Name VARCHAR(50) NOT NULL,
                     Description VARCHAR(200) NOT NULL,
                     CONSTRAINT Job_pk PRIMARY KEY (ID)
);

-- Table: Employee_Job
CREATE TABLE Employee_Job (
                              Employee_ID INTEGER NOT NULL,
                              Job_ID INTEGER NOT NULL,
                              CONSTRAINT Employee_Job_pk PRIMARY KEY (Employee_ID, Job_ID)
);

-- Table: Login_Audit
CREATE TABLE Login_Audit (
                             ID INTEGER NOT NULL,
                             Username VARCHAR(20) NOT NULL,
                             IP_Address VARCHAR(20) NOT NULL,
                             Login_Time TIMESTAMP NOT NULL,
                             Success_Failure BOOLEAN NOT NULL,
                             CONSTRAINT Login_Audit_pk PRIMARY KEY (ID)
);

-- Table: Employee_Login_Audit
CREATE TABLE Employee_Login_Audit (
                                      Login_Audit_ID INTEGER NOT NULL,
                                      Employee_ID INTEGER NOT NULL,
                                      CONSTRAINT Employee_Login_Audit_pk PRIMARY KEY (Login_Audit_ID, Employee_ID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
                           ID INTEGER NOT NULL,
                           Address VARCHAR(200) NOT NULL,
                           CONSTRAINT Warehouse_pk PRIMARY KEY (ID)
);

-- Table: Item
CREATE TABLE Item (
                      ID INTEGER NOT NULL,
                      Name VARCHAR(20) NOT NULL,
                      Description VARCHAR(200) NOT NULL,
                      Price DECIMAL(10,3) NOT NULL,
                      Quantity INTEGER NOT NULL,
                      CONSTRAINT Item_pk PRIMARY KEY (ID)
);

-- Table: Sale
CREATE TABLE Sale (
                      ID INTEGER NOT NULL,
                      Sale_Time TIMESTAMP NOT NULL,
                      Salesman_ID INTEGER NOT NULL,
                      CONSTRAINT Sale_pk PRIMARY KEY (ID)
);

-- Table: Item_Sale
CREATE TABLE Item_Sale (
                           Item_ID INTEGER NOT NULL,
                           Sale_ID INTEGER NOT NULL,
                           CONSTRAINT Item_Sale_pk PRIMARY KEY (Sale_ID, Item_ID)
);

-- Table: Warehouse_Items
CREATE TABLE Warehouse_Items (
                                 Warehouse_ID INTEGER NOT NULL,
                                 Item_ID INTEGER NOT NULL,
                                 CONSTRAINT Warehouse_Items_pk PRIMARY KEY (Warehouse_ID, Item_ID)
);

-- Foreign Keys
ALTER TABLE Employee ADD CONSTRAINT Employee_Boss FOREIGN KEY (Boss_ID) REFERENCES Employee(ID);
ALTER TABLE Employee ADD CONSTRAINT Employee_Warehouse FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(ID);
ALTER TABLE Employee_Job ADD CONSTRAINT Employee_Job_Employee FOREIGN KEY (Employee_ID) REFERENCES Employee(ID);
ALTER TABLE Employee_Job ADD CONSTRAINT Employee_Job_Job FOREIGN KEY (Job_ID) REFERENCES Job(ID);
ALTER TABLE Employee_Login_Audit ADD CONSTRAINT ELA_Employee FOREIGN KEY (Employee_ID) REFERENCES Employee(ID);
ALTER TABLE Employee_Login_Audit ADD CONSTRAINT ELA_LoginAudit FOREIGN KEY (Login_Audit_ID) REFERENCES Login_Audit(ID);
ALTER TABLE Sale ADD CONSTRAINT Sale_Salesman FOREIGN KEY (Salesman_ID) REFERENCES Employee(ID);
ALTER TABLE Item_Sale ADD CONSTRAINT ItemSale_Item FOREIGN KEY (Item_ID) REFERENCES Item(ID);
ALTER TABLE Item_Sale ADD CONSTRAINT ItemSale_Sale FOREIGN KEY (Sale_ID) REFERENCES Sale(ID);
ALTER TABLE Warehouse_Items ADD CONSTRAINT WI_Item FOREIGN KEY (Item_ID) REFERENCES Item(ID);
ALTER TABLE Warehouse_Items ADD CONSTRAINT WI_Warehouse FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(ID);