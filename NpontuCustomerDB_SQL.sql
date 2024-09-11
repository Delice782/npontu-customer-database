-- Drop the database if it already exists
DROP DATABASE IF EXISTS NpontuCustomerDb;

-- Create the database
CREATE DATABASE NpontuCustomerDb;
USE NpontuCustomerDb;

-- --------------------------------------------CREATING TABLES--------------------------------------------------

-- Client table
CREATE TABLE Client (
    Client_ID INT PRIMARY KEY,
    Client_name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL
);

-- Government table
CREATE TABLE Government (
    Client_id INT PRIMARY KEY,
    GovernmentType VARCHAR(50),
    Government_Name VARCHAR(50),
    FOREIGN KEY (Client_id) REFERENCES Client(Client_ID)
);

-- Non-Government table
CREATE TABLE NonGovernment (
    Client_id INT PRIMARY KEY,
    Industry VARCHAR(50),
    Non_Government_Name VARCHAR(50),
    FOREIGN KEY (Client_id) REFERENCES Client(Client_ID)
);

-- DevTeam table
CREATE TABLE DevTeam (
    DevTeam_id INT PRIMARY KEY,
    Team_leader VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(20) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    Team_name VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR(50) NOT NULL,
    Product_type VARCHAR(50) NOT NULL,
    Product_description VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    Cost INT NOT NULL,
    DevTeam_id INT,
    FOREIGN KEY (DevTeam_id) REFERENCES DevTeam(DevTeam_id)
);

-- AI table
CREATE TABLE AI (
    AIProduct_id INT PRIMARY KEY,
    Product_id INT NOT NULL,
    AI_Type VARCHAR(50) NOT NULL
);

-- ITConsult table
CREATE TABLE ITConsult (
    ITConsult_id INT PRIMARY KEY,
    Product_id INT NOT NULL,
    Consult_Type VARCHAR(50) NOT NULL
);

-- Apps table
CREATE TABLE Apps (
    App_id INT PRIMARY KEY,
    App_Name VARCHAR(100) NOT NULL,
    Apps_version VARCHAR(50) NOT NULL,
    Product_id INT NOT NULL
);

-- Feedback table
CREATE TABLE Feedback (
    Feedback_id INT PRIMARY KEY,
    Client_id INT,
    Product_id INT,
    Rating INT NOT NULL,
    Feedback_date DATE NOT NULL,
    FOREIGN KEY (Client_id) REFERENCES Client(Client_ID),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- Purchases table
CREATE TABLE Purchases (
    Purchase_id INT PRIMARY KEY,
    Client_id INT,
    Product_id INT,
    Purchase_date DATE NOT NULL,
    Price INT NOT NULL,
    FOREIGN KEY (Client_id) REFERENCES Client(Client_ID),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- LowRating table
CREATE TABLE LowRating (
    Rating_id INT PRIMARY KEY,
    Feedback_id INT,
    Reason VARCHAR(50) NOT NULL,
    FOREIGN KEY (Feedback_id) REFERENCES Feedback(Feedback_id)
);

-- MediumRating table
CREATE TABLE MediumRating (
    Rating_id INT PRIMARY KEY,
    Feedback_id INT,
    Suggestions VARCHAR(50) NOT NULL,
    FOREIGN KEY (Feedback_id) REFERENCES Feedback(Feedback_id)
);

-- HighRating table
CREATE TABLE HighRating (
    Rating_id INT PRIMARY KEY,
    Feedback_id INT,
    Appreciations VARCHAR(50) NOT NULL,
    FOREIGN KEY (Feedback_id) REFERENCES Feedback(Feedback_id)
);


-- ------------------------------------------------------DATA MANUPULATION----------------------------------------------


-- Insert data into the Client table
INSERT INTO Client (Client_ID, Client_name, Email, Phone_number, Address) VALUES
(400002509, 'Steve John', 'steve.john@gmail.com', '+233256789029', '123 Government St'),
(12348765, 'Emilia Blay', 'emilia.blay@gmail.com', '+233266787021', '789 Non_Government Avenue'),
(34632224, 'Emmanuel Aborsi', 'emmanuel.aborsi@gmail.com', '+244675890349', '1st Avenue Berekusu'),
(43567789, 'Abigail Yeboah', 'abigail.yeboah@gmail.com', '+253256789029', '12 Abarasi St'),
(12565655, 'Emily Owusu', 'emily.owusu@gmail.com', '+233263426021', '89 Ngong Road'),
(99999999, 'Paul Aborsi', 'paul.aborsi@gmail.com', '+244670000000', '5th Avenue Berekusu'),
(420232509, 'Abigail Mensah', 'abigail.mensah@gmail.com', '+253256789333', '122 Abarasi St'),
(888888888, 'Zoe Owusu', 'zoe.owusu@gmail.com', '+233263426000', '89 Pear Road'),
(777777770, 'Splendour Andrews', 'splendour.andrews@gmail.com', '+233263426111', '64 Mario Street'),
(888888880, 'Richard Li', 'richard.li@gmail.com', '+233263426555', '44 Cheese Road'),
(500000005, 'Karoli Ben', 'karoli.ben@gmail.com', '+233200000001', '123 Accra St'),
(500000006, 'Lydia Smith', 'lydia.smith@gmail.com', '+233200000002', '124 Madina St'),
(500000007, 'Michael Doe', 'michael.doe@gmail.com', '+233200000003', '125 Madina St'),
(500000008, 'Nancy King', 'nancy.king@gmail.com', '+233200000004', '126 Kwabenya St'),
(500000009, 'Oscar Perry', 'oscar.perry@gmail.com', '+233200000005', '127 Kwabenya St'),
(500000010, 'Peter Quaye', 'peter.quaye@gmail.com', '+233200000006', '128 Kwabenya St'),
(500000011, 'Quincy Jones', 'quincy.jones@gmail.com', '+233200000007', '129 Berekuso St'),
(500000012, 'Rebecca Harris', 'rebecca.harris@gmail.com', '+233200000008', '130 Kumasi St'),
(500000013, 'Samuel Wilson', 'samuel.wilson@gmail.com', '+233200000009', '131 Kumasi St'),
(500000014, 'Theresa Brown', 'theresa.brown@gmail.com', '+233200000010', '132 Kumasi St');


-- Insert data into the Government table
INSERT INTO Government (Client_id, GovernmentType, Government_Name) VALUES
(400002509, 'Federal', 'Federal Agency'),
(12348765, 'State', 'State Department'),
(34632224, 'Local', 'Local Council'),
(99999999, 'Municipal', 'Municipal Office'),
(43567789, 'Federal', 'Federal Agency 2'),
(12565655, 'County', 'County Office'),
(420232509, 'Provincial', 'Provincial Authority'),
(888888888, 'Territorial', 'Territorial Office'),
(777777770, 'Regional', 'Regional Authority'),
(888888880, 'District', 'District Office');


-- Insert data into the NonGovernment table
INSERT INTO NonGovernment (Client_id, Industry, Non_Government_Name) VALUES
(500000005, 'Technology', 'Tech Corp'),
(500000006, 'Healthcare', 'Health Inc'),
(500000007, 'Finance', 'Finance Group'),
(500000008, 'Education', 'Edu Org'),
(500000009, 'Retail', 'Retail Co'),
(500000010, 'Manufacturing', 'Manu LLC'),
(500000011, 'Real Estate', 'Real Estate Ltd'),
(500000012, 'Energy', 'Energy Corp'),
(500000013, 'Transport', 'Transport Services'),
(500000014, 'Hospitality', 'Hospitality Group');


-- Insert data into the DevTeam table
INSERT INTO DevTeam (DevTeam_id, Team_leader, Phone_number, Specialization, Team_name) VALUES
(4005, 'Kojo Bernard', '+254256789059', 'Production', 'FrontEnd'),
(4006, 'Beatrice Abraham', '+274256789010', 'Production', 'BackEnd'),
(4007, 'Ama Dickson', '+233425678907', 'Production', 'FrontEnd'),
(4008, 'Purity Yeboah', '+254256777059', 'Production', 'FrontEnd'),
(4009, 'Delice Johnson', '+233256789059', 'Production', 'FrontEnd'),
(4010, 'Kwame Mensah', '+233456789123', 'Production', 'BackEnd'),
(4011, 'Linda Appiah', '+233345678912', 'Design', 'UI/UX'),
(4012, 'Isaac Owusu', '+233456789456', 'Production', 'DevOps'),
(4013, 'Martha Agyapong', '+233567890123', 'Production', 'FullStack'),
(4014, 'Nana Kofi', '+233678901234', 'Support', 'Maintenance');


-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_name, Product_type, Product_description, Price, Cost, DevTeam_id) VALUES
(111, 'AI', 'Artificial Intelligence', 'AI-based analytics tool', 5000, 3000, 4005),
(222, 'ITConsult', 'Consulting', 'IT consulting services', 7000, 4000, 4006),
(333, 'Apps', 'Mobile Application', 'E-commerce mobile app', 10000, 6000, 4007),
(444, 'AI', 'Artificial Intelligence', 'AI-powered chatbot', 8000, 5000, 4005),
(555, 'Apps', 'Mobile Application', 'Social media mobile app', 9000, 5500, 4007),
(666, 'AI', 'Artificial Intelligence', 'AI-based analytics tool', 5000, 3000, 4005),
(777, 'ITConsult', 'Consulting', 'IT consulting services', 7000, 4000, 4006),
(888, 'Apps', 'Mobile Application', 'Mobile money mobile app', 10000, 6000, 4007),
(999, 'AI', 'Artificial Intelligence', 'AI-powered chatbot', 8000, 5000, 4005),
(990, 'Apps', 'Mobile Application', 'Social media mobile app', 9000, 5500, 4007),
(100, 'AI', 'Artificial Intelligence', 'AI-based analytics tool', 5000, 3000, 4005),
(200, 'ITConsult', 'Consulting', 'IT consulting services', 7000, 4000, 4006),
(300, 'Apps', 'Mobile Application', 'Mobile money mobile app', 10000, 6000, 4007),
(400, 'AI', 'Artificial Intelligence', 'AI-powered chatbot', 8000, 5000, 4005),
(500, 'Apps', 'Mobile Application', 'Social media mobile app', 9000, 5500, 4007);


-- Insert data into the AI table 
INSERT INTO AI (AIProduct_id, Product_id, AI_Type) VALUES
(1, 111, 'Predictive Analytics'),
(2, 444, 'Natural Language Processing'),
(3, 666, 'Computer Vision'),
(4, 999, 'Speech Recognition'),
(5, 100, 'Recommendation Systems'),
(6, 200, 'Robotic Process Automation'),
(7, 300, 'Machine Learning'),
(8, 400, 'Deep Learning'),
(9, 500, 'Image Recognition'),
(10, 777, 'Chatbots');


-- Insert data into the ITConsult table 
INSERT INTO ITConsult (ITConsult_id, Product_id, Consult_Type) VALUES
(1, 222, 'Technical Support'),
(2, 333, 'System Integration'),
(3, 444, 'Cloud Solutions'),
(4, 555, 'Cybersecurity'),
(5, 111, 'Data Analytics'),
(6, 222, 'Technical Support'),
(7, 333, 'System Integration'),
(8, 444, 'Cloud Solutions'),
(9, 555, 'Cybersecurity'),
(10, 111, 'Data Analytics');


-- Insert data into the Apps table 
INSERT INTO Apps (App_id, App_Name, Apps_version, Product_id) VALUES
(1, 'Npontu Analytics Pro', 'v1.0', 333),
(2, 'CampyConnect', 'v2.0', 555),
(3, 'Npontu Secure Vault', 'v3.0', 666),
(4, 'CampyChat', 'v4.0', 777),
(5, 'Npontu Scheduler', 'v5.0', 888),
(6, 'CampyFinance', 'v6.0', 999),
(7, 'Npontu HealthTrack', 'v7.0', 100),
(8, 'CampyTasks', 'v1.1', 333),
(9, 'Npontu Learning Hub', 'v2.1', 444),
(10, 'CampyWeather', 'v3.1', 111);


-- Insert data into the Feedback table
INSERT INTO Feedback (Feedback_id, Client_id, Product_id, Rating, Feedback_date) VALUES
(11, 500000012, 111, 5, '2024-01-15'),
(22, 12348765, 222, 4, '2024-02-20'),
(33, 888888888, 333, 3, '2024-03-12'),
(44, 400002509, 444, 5, '2024-04-25'),
(55, 12565655, 555, 4, '2024-05-30'),
(66, 99999999, 666, 5, '2024-06-15'),
(77, 400002509, 777, 3, '2024-07-20'), 
(88, 888888888, 888, 4, '2024-08-10'),
(99, 777777770, 999, 2, '2024-09-05'),
(10, 888888880, 100, 5, '2024-10-01');


-- Insert data into the Purchases table
INSERT INTO Purchases (Purchase_id, Client_id, Product_id, Purchase_date, Price) VALUES
(1, 400002509, 111, '2024-01-10', 5000),
(2, 12348765, 222, '2024-01-10', 7000),
(3, 34632224, 333, '2024-03-05', 10000),
(4, 400002509, 444, '2024-04-22', 8000), 
(5, 12565655, 555, '2024-05-28', 9000),
(6, 99999999, 666, '2024-06-20', 12000),
(7, 400002509, 777, '2024-07-15', 15000), 
(8, 888888888, 888, '2024-08-25', 11000),
(9, 777777770, 999, '2024-09-10', 14000),
(10, 888888880, 100, '2024-10-05', 13000);


-- Insert data into the LowRating table
INSERT INTO LowRating (Rating_id, Feedback_id, Reason) VALUES
(1, 33, 'Product performance was below expectations'),
(2, 77, 'Not enough features'),
(3, 66, 'Late delivery'),
(4, 22, 'Product performance was below expectations'),
(5, 11, 'Not enough features'),
(6, 88, 'Poor customer support'),
(7, 55, 'Product performance was below expectations'),
(8, 99, 'Not enough features'),
(9, 11, 'Poor customer support'),
(10, 44, 'Product performance was below expectations'),
(11, 11, 'Not enough features'),
(12, 66, 'Poor customer support');


-- Insert data into the MediumRating table
INSERT INTO MediumRating (Rating_id, Feedback_id, Suggestions) VALUES
(1, 22, 'Improve customer support'),
(2, 55, 'Add more features'),
(3, 88, 'Enhance performance'),
(4, 22, 'Offer discounts'),
(5, 44, 'Better documentation'),
(6, 33, 'Increase user interface responsiveness'),
(7, 77, 'Provide better onboarding materials'),
(8, 99, 'Expand support hours'),
(9, 11, 'Improve mobile app stability'),
(10, 66, 'Enhance feature customization options');


-- Insert data into the HighRating table
INSERT INTO HighRating (Rating_id, Feedback_id, Appreciations) VALUES
(1, 11, 'Excellent product quality'),
(2, 44, 'Great user experience'),
(3, 88, 'Excellent product quality'),
(4, 55, 'Great user experience'),
(5, 66, 'Very helpful'),
(6, 77, 'Well-designed'),
(7, 10, 'Outstanding value'),
(8, 99, 'Exceptional customer service'),
(9, 33, 'Innovative features'),
(10, 22, 'Reliable performance');


-- Task 2.4: SQL Query Writing

-- 1. Client Demographics

-- a. Retrieve and sort by highest frequency the specific client or client type that purchases a specific product
SELECT c.Client_ID, c.Client_name, 
       COALESCE(g.GovernmentType, ng.Industry) AS Client_type, 
       COUNT(p.Product_ID) AS Purchase_Count
FROM Client c
LEFT JOIN Government g ON c.Client_ID = g.Client_id
LEFT JOIN NonGovernment ng ON c.Client_ID = ng.Client_id
JOIN Purchases p ON c.Client_ID = p.Client_ID
WHERE p.Product_ID = '111'  -- Replace with actual Product ID
GROUP BY c.Client_ID, c.Client_name, Client_type
ORDER BY Purchase_Count DESC
LIMIT 10;

-- b. List all clients who have purchased products along with the product name, only if the client has provided feedback
SELECT c.Client_name, p.Product_name
FROM Client c
INNER JOIN Purchases pu ON c.Client_ID = pu.Client_id
INNER JOIN Products p ON pu.Product_id = p.Product_id
WHERE c.Client_ID IN (SELECT DISTINCT Client_id FROM Feedback);

-- 2. Product Information

-- a. Retrieve department team working on each product and sort by team name
SELECT p.Product_name, dt.Team_name
FROM Products p 
LEFT JOIN DevTeam dt ON p.DevTeam_id = dt.DevTeam_id
ORDER BY dt.Team_name;

-- b. Retrieve and sort by lowest to highest cost and price of each product
SELECT * FROM Products
ORDER BY Cost ASC, Price ASC;

-- 3. Client Feedback on Products

-- a. Retrieve average and max rating for all products
SELECT p.Product_name, AVG(f.Rating) AS Average_Rating, MAX(f.Rating) AS Max_Rating
FROM Feedback f
JOIN Products p ON f.Product_id = p.Product_id
GROUP BY p.Product_name;

-- b. Retrieve average and max rating for a specified product
SELECT p.Product_name, AVG(f.Rating) AS Average_Rating, MAX(f.Rating) AS Max_Rating
FROM Feedback f
JOIN Products p ON f.Product_id = p.Product_id
WHERE p.Product_name = 'Apps'
GROUP BY p.Product_name;

-- 4. Product Purchase Information

-- a. Retrieve all purchases and their total revenue
SELECT p.Product_name, SUM(p.Price) AS Total_Revenue
FROM Purchases pu
INNER JOIN Products p ON pu.Product_ID = p.Product_id
GROUP BY p.Product_name;

-- b. Find the names of clients who have purchased a product but have not provided feedback
SELECT c.Client_name
FROM Client c
INNER JOIN Purchases pu ON c.Client_ID = pu.Client_id
LEFT JOIN Feedback f ON c.Client_ID = f.Client_id
WHERE f.Feedback_id IS NULL;

-- Additional Queries

-- 1. Calculate the total revenue generated from purchases
SELECT SUM(p.Price) AS Total_Revenue
FROM Purchases pu
INNER JOIN Products p ON pu.Product_ID = p.Product_id;

-- 2. List clients who have 'gmail.com' email addresses
SELECT Client_name, Email
FROM Client
WHERE Email LIKE '%@gmail.com'
ORDER BY Client_name;

-- 3. Retrieve the most popular product based on purchase count
SELECT p.Product_name, COUNT(pu.Product_ID) AS Purchase_Count
FROM Products p
INNER JOIN Purchases pu ON p.Product_id = pu.Product_id
GROUP BY p.Product_name
ORDER BY Purchase_Count DESC
LIMIT 1;

-- 4. List the product name and the development team name for products costing more than 5000
SELECT p.Product_name, dt.Team_name
FROM Products p
INNER JOIN DevTeam dt ON p.DevTeam_id = dt.DevTeam_id
WHERE p.Cost > 5000;


-- 5. Retrieve clients and their associated feedback count, sorting by feedback count and filtering clients who have given feedback in the last 30 days
SELECT c.Client_name, COUNT(f.Feedback_id) AS Feedback_Count
FROM Client c
INNER JOIN Feedback f ON c.Client_ID = f.Client_id
WHERE f.Feedback_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY c.Client_name
ORDER BY Feedback_Count DESC;

-- 6. Retrieve products with their development team and average rating, only for products with a price greater than $100, sorting by average rating
SELECT p.Product_name, dt.Team_name, AVG(f.Rating) AS Average_Rating
FROM Products p
INNER JOIN DevTeam dt ON p.DevTeam_id = dt.DevTeam_id
INNER JOIN Feedback f ON p.Product_id = f.Product_id
WHERE p.Price > 100
GROUP BY p.Product_name, dt.Team_name
ORDER BY Average_Rating DESC;

-- 7. Find the total feedback count and average rating for each client, including those who have not given feedback
SELECT c.Client_name, COUNT(f.Feedback_id) AS Feedback_Count, AVG(f.Rating) AS Average_Rating
FROM Client c
LEFT JOIN Feedback f ON c.Client_ID = f.Client_id
GROUP BY c.Client_name
ORDER BY c.Client_name;

-- 7. Retrieve the total purchase amount for each client, including those who have not made any purchases, and sort by total purchase amount
SELECT c.Client_name, COALESCE(SUM(p.Price), 0) AS Total_Purchase_Amount
FROM Client c
LEFT JOIN Purchases pu ON c.Client_ID = pu.Client_id
LEFT JOIN Products p ON pu.Product_id = p.Product_id
GROUP BY c.Client_name
ORDER BY Total_Purchase_Amount DESC;

-- 9. Calculate the total revenue, average revenue per client, and count of unique products purchased
SELECT 
    SUM(p.Price) AS Total_Revenue,
    AVG(p.Price) AS Average_Revenue_Per_Product,
    COUNT(DISTINCT p.Product_id) AS Unique_Products_Purchased
FROM Purchases pu
INNER JOIN Products p ON pu.Product_id = p.Product_id;

-- 10. Find the top 5 products with the highest average rating and their development team names, ordered by average rating
SELECT p.Product_name, dt.Team_name, AVG(f.Rating) AS Average_Rating
FROM Products p
INNER JOIN Feedback f ON p.Product_id = f.Product_id
INNER JOIN DevTeam dt ON p.DevTeam_id = dt.DevTeam_id
GROUP BY p.Product_name, dt.Team_name
ORDER BY Average_Rating DESC
LIMIT 5;

-- 11. List products with their cost, average feedback rating, and whether the product is highly rated (rating >= 4), sorted by cost
SELECT p.Product_name, p.Cost, AVG(f.Rating) AS Average_Rating,
       CASE 
           WHEN AVG(f.Rating) >= 4 THEN 'Highly Rated'
           ELSE 'Not Highly Rated'
       END AS Rating_Status
FROM Products p
INNER JOIN Feedback f ON p.Product_id = f.Product_id
GROUP BY p.Product_name, p.Cost
ORDER BY p.Cost ASC;

-- 12. Retrieve clients who have purchased more than 3 products, including their total purchase amount and feedback count, sorted by total purchase amount
SELECT c.Client_name, COUNT(pu.Product_id) AS Product_Count, COALESCE(SUM(p.Price), 0) AS Total_Purchase_Amount, COUNT(f.Feedback_id) AS Feedback_Count
FROM Client c
INNER JOIN Purchases pu ON c.Client_ID = pu.Client_id
LEFT JOIN Products p ON pu.Product_id = p.Product_id
LEFT JOIN Feedback f ON c.Client_ID = f.Client_id
GROUP BY c.Client_name
HAVING Product_Count > 3
ORDER BY Total_Purchase_Amount DESC;

-- 9. List the top 5 clients based on the highest number of purchases, including the number of products purchased and total purchase amount
SELECT c.Client_name, COUNT(pu.Product_id) AS Product_Count, SUM(p.Price) AS Total_Purchase_Amount
FROM Client c
INNER JOIN Purchases pu ON c.Client_ID = pu.Client_id
INNER JOIN Products p ON pu.Product_id = p.Product_id
GROUP BY c.Client_name
ORDER BY Product_Count DESC
LIMIT 5;

-- 14. Retrieve product names with the number of clients who have purchased each product, and sort by the number of clients
SELECT p.Product_name, COUNT(DISTINCT pu.Client_ID) AS Client_Count
FROM Products p
INNER JOIN Purchases pu ON p.Product_id = pu.Product_id
GROUP BY p.Product_name
ORDER BY Client_Count DESC;

-- Creating Views

-- View for Client table
CREATE VIEW ClientView AS
SELECT Client_ID, Client_name, Email, Phone_number, Address
FROM Client;
SELECT * FROM ClientView;


-- View for DevTeam table
CREATE VIEW DevTeamView AS
SELECT DevTeam_id, Team_leader, Phone_number, Specialization, Team_name
FROM DevTeam;
SELECT * FROM DevTeamView;


-- View for Products table
CREATE VIEW ProductsView AS
SELECT Product_id, Product_name, Product_type, Product_description, Price, Cost, DevTeam_id
FROM Products;
SELECT * FROM ProductsView;

-- View for Feedback table
CREATE VIEW FeedbackView AS
SELECT Feedback_id, Client_id, Product_id, Rating, Feedback_date
FROM Feedback;
SELECT * FROM FeedbackView;

