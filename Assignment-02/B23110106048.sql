CREATE DATABASE CarShowroomDB;

CREATE TABLE Customers(
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(60) NOT NULL,
    City VARCHAR(60) NOT NULL,
    State VARCHAR(60) NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE Cars(
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(60) NOT NULL,
    Brand VARCHAR(60) NOT NULL,
    Year INT NOT NULL ,
    Price NUMERIC(10,2) NOT NULL CHECK(Price>0),
    Color VARCHAR(60) NOT NULL,
    InventoryCount INT NOT NULL CHECK (InventoryCount >= 0)
);

CREATE TABLE Salespersons(
    SalespersonID SERIAL PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Department VARCHAR(60) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE Sales(
    SaleID SERIAL PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    CarID INTEGER REFERENCES Cars(CarID),
    SaleDate DATE NOT NULL,
    SalePrice NUMERIC(10,2) NOT NULL CHECK (SalePrice > 0),
    SalespersonID INTEGER REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords(
    RecordID SERIAL PRIMARY KEY,
    CarID INTEGER REFERENCES Cars(CarID),
    ServiceDate DATE NOT NULL,
    ServiceType VARCHAR(60) NOT NULL,
    Cost NUMERIC(10,2) NOT NULL CHECK (Cost>0),
    TechnicianID INTEGER NOT NULL
);


INSERT INTO Customers (CustomerName, City, State, JoinDate)
VALUES
('Ali Khan', 'Karachi', 'Sindh', '2023-01-15'),
('Sara Ahmed', 'Lahore', 'Punjab', '2022-11-20'),
('Usman Tariq', 'Islamabad', 'Islamabad Capital Territory', '2021-09-05'),
('Fatima Noor', 'Faisalabad', 'Punjab', '2023-03-12'),
('Hamza Ali', 'Quetta', 'Balochistan', '2022-07-30'),
('Maryam Shah', 'Peshawar', 'Khyber Pakhtunkhwa', '2021-12-18'),
('Zain Raza', 'Multan', 'Punjab', '2023-04-25'),
('Hira Aslam', 'Rawalpindi', 'Punjab', '2022-06-10'),
('Bilal Hussain', 'Hyderabad', 'Sindh', '2021-08-14'),
('Ayesha Iqbal', 'Gujranwala', 'Punjab', '2023-02-08'),
('Salman Farooq', 'Sialkot', 'Punjab', '2022-05-17'),
('Noor Fatima', 'Bahawalpur', 'Punjab', '2021-10-23'),
('Omer Sheikh', 'Sukkur', 'Sindh', '2023-05-01'),
('Iqra Nadeem', 'Mardan', 'Khyber Pakhtunkhwa', '2022-08-09'),
('Ahmed Rafi', 'Abbottabad', 'Khyber Pakhtunkhwa', '2021-11-02'),
('Kiran Javed', 'Okara', 'Punjab', '2023-03-28'),
('Shahzaib Malik', 'Mirpur Khas', 'Sindh', '2022-09-15'),
('Laiba Anwar', 'Chiniot', 'Punjab', '2021-12-05'),
('Farhan Saeed', 'Kasur', 'Punjab', '2023-06-11'),
('Maham Zafar', 'Larkana', 'Sindh', '2022-04-19'),
('Nashit Hassan', 'Rahim Yar Khan', 'Punjab', '2021-07-22'),
('Rimsha Gul', 'Khuzdar', 'Balochistan', '2023-01-09'),
('Tariq Mehmood', 'Gwadar', 'Balochistan', '2022-03-16'),
('Samina Bashir', 'Muzaffarabad', 'Azad Kashmir', '2021-09-27'),
('Danish Irfan', 'Skardu', 'Gilgit-Baltistan', '2023-05-29');



INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) 
VALUES
('Civic LX', 'Honda', 2023, 35000.00, 'White', 10),
('Civic EX', 'Honda', 2022, 38000.00, 'Black', 8),
('Accord Sport', 'Honda', 2023, 45000.00, 'Blue', 5),
('Accord Touring', 'Honda', 2021, 52000.00, 'Gray', 4),
('City Aspire', 'Honda', 2022, 28000.00, 'Red', 7),
('Corolla X', 'Toyota', 2023, 30000.00, 'White', 12),
('Corolla Altis', 'Toyota', 2022, 34000.00, 'Black', 9),
('Camry SE', 'Toyota', 2023, 48000.00, 'Silver', 6),
('Camry XLE', 'Toyota', 2021, 55000.00, 'Blue', 4),
('Yaris ATIV', 'Toyota', 2022, 27000.00, 'Red', 10),
('Model S', 'Tesla', 2023, 90000.00, 'Black', 3),
('Model 3', 'Tesla', 2023, 45000.00, 'White', 5),
('Model X', 'Tesla', 2022, 95000.00, 'Blue', 2),
('Model Y', 'Tesla', 2022, 60000.00, 'Gray', 4),
('Roadster', 'Tesla', 2021, 200000.00, 'Red', 1),
('Mustang GT', 'Ford', 2023, 75000.00, 'Yellow', 2),
('Mustang Mach-E', 'Ford', 2023, 68000.00, 'Blue', 3),
('F-150 Raptor', 'Ford', 2022, 65000.00, 'Black', 4),
('Explorer XLT', 'Ford', 2021, 50000.00, 'White', 6),
('Bronco Wildtrak', 'Ford', 2022, 58000.00, 'Green', 2),
('A4 Premium', 'Tesla', 2023, 55000.00, 'White', 5),
('A6 Luxury', 'Audi', 2022, 75000.00, 'Black', 3),
('Q7 Quattro', 'Audi', 2023, 85000.00, 'Gray', 2),
('Q5 Sportback', 'Audi', 2021, 65000.00, 'Blue', 4),
('R8 Coupe', 'Audi', 2021, 180000.00, 'Red', 1);



INSERT INTO Salespersons (Name, Department, HireDate) 
VALUES
('Ahmed Khan', 'Sales', '2019-03-15'),
('Sara Ali', 'Marketing', '2020-06-22'),
('Bilal Hussain', 'Sales', '2018-09-10'),
('Nadia Iqbal', 'Support', '2021-01-05'),
('Hassan Raza', 'Sales', '2017-07-19');



INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) 
VALUES
(5, 12, '2024-03-02', 22000, 2),
(8,  3, '2024-03-03', 27000, 4),
(12, 19, '2024-03-04', 19500, 1),
(3,  7, '2024-03-04', 32000, 5),
(17, 14, '2024-03-05', 18000, 2),
(6,  5, '2024-03-06', 25000, 3),
(25, 21, '2024-03-06', 30000, 1),
(11, 8, '2024-03-07', 26000, 5),
(15, 16, '2024-03-08', 20000, 4),
(9,  10, '2024-03-09', 28000, 2),
(14, 4, '2024-03-10', 31000, 3),
(2,  25, '2024-03-11', 24000, 5),
(7,  11, '2024-03-12', 19500, 4),
(20, 15, '2024-03-13', 33000, 2),
(4,  2, '2024-03-14', 26000, 1),
(21, 17, '2024-03-15', 21500, 3),
(10, 1, '2024-03-16', 29000, 4),
(18, 13, '2024-03-17', 20500, 2),
(16, 23, '2024-03-18', 27000, 5),
(1,  9, '2024-03-19', 25000, 1),
(22, 6, '2024-03-20', 28500, 3),
(19, 12, '2024-03-21', 29500, 4),
(13, 20, '2024-03-22', 31000, 2),
(23, 24, '2024-03-23', 24500, 5),
(24, 18, '2024-03-24', 21500, 1),

(2,  7, '2024-01-05', 24000, 4),
(7,  15, '2024-01-08', 30000, 2),
(4,  21, '2024-01-10', 27500, 3),
(11, 8, '2024-01-15', 20000, 1),
(15, 5, '2024-01-18', 31000, 5),
(18, 10, '2024-01-20', 26500, 2),
(5,  2, '2024-01-22', 29000, 3),
(23, 9, '2024-01-25', 20500, 4),

(9,  16, '2024-02-02', 28000, 5),
(3,  13, '2024-02-04', 21000, 2),
(20, 11, '2024-02-06', 30000, 1),
(25, 22, '2024-02-09', 27500, 4),
(1,  17, '2024-02-12', 23000, 3),
(8,  3, '2024-02-14', 25000, 5),
(21, 19, '2024-02-16', 31500, 2),
(17, 1, '2024-02-18', 19500, 4),

(6,  4, '2024-04-01', 22000, 5),
(19, 23, '2024-04-02', 30500, 1),
(13, 6, '2024-04-03', 27000, 3),
(24, 14, '2024-04-05', 25000, 4),
(10, 7, '2024-04-07', 21500, 2),
(16, 18, '2024-04-10', 28000, 5),
(22, 9, '2024-04-12', 26000, 1),
(14, 12, '2024-04-15', 30000, 3),

(8,  25, '2024-05-03', 24000, 4),
(5,  11, '2024-05-06', 29500, 1),
(7,  8, '2024-05-09', 22000, 2),
(3,  13, '2024-05-12', 28000, 3),
(18, 6, '2024-05-15', 26500, 5),
(4,  21, '2024-05-18', 31000, 1),
(2,  10, '2024-05-21', 23500, 4),
(15, 7, '2024-05-24', 30500, 2),

(6,  20, '2024-06-02', 25000, 5),
(23, 15, '2024-06-04', 29500, 3),
(1,  2, '2024-06-06', 20500, 4),
(21, 17, '2024-06-08', 32000, 1),
(9,  12, '2024-06-11', 26500, 2),
(13, 14, '2024-06-13', 28500, 5),
(19, 5, '2024-06-16', 24500, 3),
(11, 8, '2024-06-19', 30000, 4),

(10,  9, '2024-07-02', 22500, 1),
(18, 16, '2024-07-05', 28000, 3),
(15, 4, '2024-07-07', 26500, 2),
(7,  13, '2024-07-09', 29500, 5),
(25, 6, '2024-07-12', 31000, 4),
(8,  20, '2024-07-14', 21500, 1),
(2,  1, '2024-07-16', 30000, 3),
(22, 17, '2024-07-18', 27500, 2),

(20, 14, '2024-08-01', 24500, 5),
(14,  3, '2024-08-03', 26000, 4),
(12, 21, '2024-08-05', 29000, 1),
(9,  10, '2024-08-07', 28000, 2),
(16, 7, '2024-08-10', 32000, 3),
(3,  22, '2024-08-12', 20500, 5),
(11, 2, '2024-08-14', 25000, 4),
(24, 15, '2024-08-16', 29500, 1),

(4,  18, '2024-09-01', 21000, 3),
(19,  8, '2024-09-03', 29500, 5),
(21,  5, '2024-09-05', 28500, 4),
(6,  12, '2024-09-07', 27500, 1),
(23, 19, '2024-09-09', 26500, 2),
(17, 11, '2024-09-12', 24000, 3),
(25, 4, '2024-09-14', 30500, 5),
(5,  23, '2024-09-16', 22000, 1);



INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID)
VALUES
(1, '2024-01-05', 'Oil Change', 120, 1),
(2, '2024-01-12', 'Tire Rotation', 80, 2),
(3, '2024-02-03', 'Brake Replacement', 450, 3),
(4, '2024-02-10', 'Battery Replacement', 200, 4),
(5, '2024-02-18', 'Transmission Repair', 1200, 5),
(6, '2024-03-01', 'Engine Tune-Up', 600, 1),
(7, '2024-03-15', 'Oil Change', 130, 2),
(8, '2024-03-22', 'Tire Rotation', 75, 3),
(9, '2024-04-05', 'Brake Replacement', 500, 4),
(10, '2024-04-12', 'Battery Replacement', 180, 5),
(11, '2024-04-20', 'Transmission Repair', 1500, 1),
(12, '2024-05-03', 'Engine Tune-Up', 550, 2),
(13, '2024-05-15', 'Oil Change', 140, 3),
(14, '2024-06-01', 'Tire Rotation', 85, 4),
(15, '2024-06-18', 'Brake Replacement', 480, 5),
(16, '2024-06-25', 'Battery Replacement', 220, 1),
(17, '2024-07-04', 'Transmission Repair', 1300, 2),
(18, '2024-07-15', 'Engine Tune-Up', 620, 3),
(19, '2024-08-02', 'Oil Change', 125, 4),
(20, '2024-08-11', 'Tire Rotation', 90, 5),
(21, '2024-08-20', 'Brake Replacement', 510, 1),
(22, '2024-09-01', 'Battery Replacement', 210, 2),
(23, '2024-09-10', 'Transmission Repair', 1450, 3),
(24, '2024-09-18', 'Engine Tune-Up', 580, 4),
(25, '2024-09-25', 'Oil Change', 135, 5),
(1, '2024-10-02', 'Tire Rotation', 95, 1),
(2, '2024-10-12', 'Brake Replacement', 495, 2),
(3, '2024-10-20', 'Battery Replacement', 205, 3),
(4, '2024-10-28', 'Transmission Repair', 1380, 4),
(5, '2024-11-05', 'Engine Tune-Up', 610, 5),
(6, '2024-11-15', 'Oil Change', 128, 1),
(7, '2024-11-25', 'Tire Rotation', 88, 2),
(8, '2024-12-03', 'Brake Replacement', 520, 3),
(9, '2024-12-10', 'Battery Replacement', 215, 4),
(10, '2024-12-18', 'Transmission Repair', 1420, 5),
(11, '2024-12-27', 'Engine Tune-Up', 640, 1);




-- PART 1

SELECT COUNT(*) as total_customer 
FROM Customers;


SELECT AVG(SalePrice) as avg_saleprice 
FROM Sales;


SELECT MAX(SalePrice) as most_expensive_car 
FROM Sales;


SELECT SUM(InventoryCount) as total_cars 
FROM Cars;


SELECT MIN(SaleDate) as earliest_sale_date, MAX(SaleDate) as recent_sale_date 
FROM Sales;


-- PART 2

SELECT COUNT(Model), BRAND as model_count
FROM CAR 
GROUP BY Brand;


SELECT sp.salespersonid, sp.name, SUM(s.saleprice) as total_sales
FROM sales as s
INNER JOIN salespersons as sp
ON s.salespersonid = sp.salespersonid
GROUP BY sp.salespersonid, sp.name


SELECT c.model, avg(s.saleprice) as avg_sale_price
FROM Cars as c
INNER JOIN sales as s
ON c.carid = s.carid
GROUP BY c.model


SELECT servicetype , avg(cost) as avg_service_cost
FROM servicerecords
GROUP BY servicetype


SELECT brand,color,COUNT(*) as total_cars
FROM cars
GROUP BY brand, color


-- PART 3

SELECT brand, COUNT(DISTINCT model) as model_count
FROM CARS
GROUP BY brand
HAVING COUNT( DISTINCT model) > 5


SELECT c.model, COUNT(*) as total_sales
FROM Cars as c
INNER JOIN Sales as s
ON s.carid = c.carid
GROUP BY c.model
HAVING COUNT(*) > 10


SELECT sp.salespersonid ,sp.name, AVG(s.saleprice) as average_sales
FROM sales as s
INNER JOIN salespersons as sp
ON sp.salespersonid = s.salespersonid
GROUP BY sp.salespersonid, sp.name
HAVING AVG(s.saleprice) > 50000


SELECT EXTRACT(MONTH FROM saledate) as sale_month, COUNT(*) as total_sales
FROM sales
GROUP BY sale_month
HAVING COUNT(*)>20 


SELECT servicetype, AVG(cost) as avg_service_cost
FROM servicerecords 
GROUP BY servicetype
HAVING AVG(cost)>500