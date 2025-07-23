-- Warehouses
INSERT INTO Warehouse (ID, Adress) VALUES
                                       (1, '123 Main St, Berlin'),
                                       (2, '456 Market Ave, Munich');

-- Jobs
INSERT INTO Job (ID, Name, Description) VALUES
                                            (1, 'Salesman', 'Handles customer purchases.'),
                                            (2, 'Manager', 'Oversees operations.'),
                                            (3, 'Stocker', 'Manages inventory.');

-- Employees
INSERT INTO Employee (ID, Username, HashedPassword, Name, Surname, DoB, Email, Phone, Start_Date, End_Date, Boss_ID, Warehouse_ID) VALUES
                                                                                                                                       (1, 'jdoe', 'hashpass123', 'John', 'Doe', '1990-01-15', 'jdoe@example.com', '555-1111', '2020-01-01', NULL, NULL, 1),
                                                                                                                                       (2, 'asmith', 'hashpass456', 'Alice', 'Smith', '1985-06-20', 'asmith@example.com', '555-2222', '2021-05-01', NULL, 1, 1),
                                                                                                                                       (3, 'bwayne', 'hashpass789', 'Bruce', 'Wayne', '1980-03-30', 'bwayne@example.com', '555-3333', '2019-11-15', NULL, 1, 2),
                                                                                                                                       (4, 'ckent', 'hashpass999', 'Clark', 'Kent', '1992-07-10', 'ckent@example.com', '555-4444', '2023-02-01', NULL, 3, 2);

-- Employee Jobs
INSERT INTO Employee_Job (Employee_ID, Job_ID) VALUES
                                                   (1, 2),
                                                   (2, 1),
                                                   (3, 3),
                                                   (4, 1);

-- Items
INSERT INTO Item (ID, Name, Description, Price, Quantity) VALUES
                                                             (1, 'Laptop', 'Gaming laptop with 16GB RAM', 1200.500, 5),
                                                             (2, 'Mouse', 'Wireless ergonomic mouse', 25.999, 20),
                                                             (3, 'Keyboard', 'Mechanical RGB keyboard', 75.250, 10),
                                                             (4, 'Monitor', '27" 4K monitor', 299.990, 7);

-- Warehouse Items
INSERT INTO Warehouse_Items (Warehouse_ID, Item_ID) VALUES
                                                        (1, 1),
                                                        (1, 2),
                                                        (2, 3),
                                                        (2, 4);

-- Sales
INSERT INTO Sale (ID, Sale_Time, Salesman_ID) VALUES
                                                  (1, '2025-07-20 10:00:00', 2),
                                                  (2, '2025-07-21 15:30:00', 4),
                                                  (3, '2025-07-22 09:15:00', 1);

-- Item Sales
INSERT INTO Item_Sale (Item_ID, Sale_ID) VALUES
                                             (1, 1),
                                             (2, 1),
                                             (3, 2),
                                             (4, 3);
