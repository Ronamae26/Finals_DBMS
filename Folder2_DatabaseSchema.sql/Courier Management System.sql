CREATE TABLE user_info(
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    contact_number VARCHAR(20),
    email VARCHAR(255),
	password_ VARCHAR(50) NOT NULL
);

INSERT INTO user_info (user_id, first_name, last_name, address, contact_number, email, password_)
VALUES
(1, 'Roma Grace', 'Matibag', 'San Jose Batangas', '0922222222222', 'rgmatibag@gmail.com', 080302),
(2, 'Alyssa', 'Atienza', '456 Mataas na Wood', '555-987-6543', 'ally@email.com','2ally'),
(3, 'Nelcy', 'Cabacang', '789 Baybayin', '555-111-2222', 'nexy@email.com', '3cy'),
(4, 'Kyle', 'Calingasan', '101 Alitagtag', '555-333-4444', 'kayl@email.com','4kai'),
(5, 'Clark', 'Alisuag', '567 Alitagtag', '555-555-5555', 'clark2@email.com','5ark'),
(6, 'Chester', 'Arano', '999 Alitagtag', '555-666-7777', 'che@email.com', '6ches'),
(7, 'Barbs', 'Abratique', '222 Alitagtag', '555-888-9999', 'thebarbs@email.com','7bars'),
(8, 'Laurence', 'Dimaano', '777 Rosario', '555-999-0000', 'davon@email.com', '8rence'),
(9, 'Ian', 'De Castro', '333 Balete', '555-444-3333', 'ian@email.com', '9an'),
(10, 'Jafet', 'De Silva', '444 Balete', '555-222-1111', 'ja@email.com','10fet');


CREATE TABLE Customer_info (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    contact_number VARCHAR(20),
    email VARCHAR(255),
	user_id INT 
);

INSERT INTO Customer_info (customer_id, first_name, last_name, address, contact_number, email, user_id)
VALUES
(1, 'Iris', 'Robles', 'Padre Garcia', '123-456-7890', 'iris@gmail.com', 1),
(2, 'Rona Mae', 'Dimaano', 'Rosario', '987-654-3210', 'rona@gmail.com', 2),
(3, 'Alysa', 'Atienza', '789 San Jose', '555-123-4567', 'roma@gmail.com', 3),
(4, 'Trisha', 'Macalintal', '101 Rosario', '222-333-4444', 'trish@gmail', 4),
(5, 'Abby Dhane', 'Loro', '567 San Jose', '777-888-9999', 'abby@gmail', 5),
(6, 'Robbie', 'Taylor', '999 Ibaan', '111-222-3333', 'rob@gmail', 6),
(7, 'Winston', 'Clark', '222 Pinagkawitan', '444-555-6666', 'wins@gmail', 7),
(8, 'Mhark', 'Tahimik', '777 Tiaong', '666-777-8888', 'mhark@gmail.com', 8),
(9, 'Gecelyn', 'Deleon', '333 Mataas na Wood', '999-000-1111', 'gece@gmail', 9),
(10, 'Julbien', 'Pedimato', '444 Lipa', '123-456-7890', 'peds@gmail', 10);

CREATE TABLE Parcel (
    parcel_id INT PRIMARY KEY,
    price DECIMAL(10, 2),
    description VARCHAR(255),
    quantity INT,
	booking_date DATE,
	estimated_delivery_date DATE,
    payment_status VARCHAR(50),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer_info(customer_id)
);


INSERT INTO Parcel (parcel_id, price, description, quantity, payment_status, customer_id, booking_date, estimated_delivery_date)
VALUES 
(0001, 500, 'Book', 1, 'Paid', 1, '2023-12-23', '2023-12-24'),
(0002, 750, 'Clothes', 2, 'Unpaid', 2, '2023-12-14', '2023-12-27'),
(0003, 900, 'Electronics', 1, 'Paid', 3, '2023-01-17', '2023-01-22'),
(0004, 350, 'Shoes', 3, 'Unpaid', 4, '2023-01-18', '2023-01-23'),
(0005, 50.99, 'Toys', 2, 'Paid', 5, '2023-01-19', '2023-01-24'),
(0006, 18.75, 'Kitchenware', 1, 'Unpaid', 6, '2023-01-20', '2023-01-25'),
(0007, 222.50, 'Sports Gear', 2, 'Paid', 7, '2023-01-21', '2023-01-26'),
(0008, 127.99, 'Beauty Products', 1, 'Paid', 8, '2023-01-22', '2023-01-27'),
(0009, 100.99, 'Home Decor', 3, 'Unpaid', 9, '2023-01-23', '2023-01-28'),
(0010, 150.95, 'Books', 2, 'Unpaid', 10, '2023-01-24', '2023-01-29');



CREATE TABLE Courier_Status (
    courier_status_id INT PRIMARY KEY,
    delivery_status VARCHAR(50),
    date_of_delivery DATE
);

INSERT INTO Courier_Status (courier_status_id, delivery_status, date_of_delivery)
VALUES
(1, 'In Transit', NULL),
(2, 'Delivered', '2023-12-27'),
(13, 'Out for Delivery', NULL),
(14, 'Arrived at Sorting Facility', '2021-01-12'),
(15, 'Delay in Transit', NULL),
(16, 'Package Lost', NULL),
(17, 'In Transit', NULL),
(18, 'Delivered', '2021-01-20'),
(19, 'Out for Delivery', NULL),
(20, 'Delivered', '2021-01-15');



CREATE TABLE Delivery_details(
    delivery_id INT PRIMARY KEY,
    customer_address VARCHAR(255),
    payment_status VARCHAR(50),
    date_of_delivery DATE,
    courier_status_id INT,
    parcel_id INT,
    tracking_id INT
);

INSERT INTO Delivery_details (delivery_id, customer_address, payment_status, date_of_delivery, courier_status_id, 
							  parcel_id, tracking_id)
VALUES
(21, 'Padre Garcia Bats', 'Paid', '2023-12-24', 1, 0001, 31),
(22, 'Rosario Bats', 'Unpaid', NULL, 2, 0002, 32),
(23, '789 San Jose', 'Unpaid', NULL, 13, 0003, 33),
(24, '101 Rosario', 'Paid', '2021-01-08', 14, 0004, 34),
(25, '567 San Jose', 'Paid', '2021-01-10', 15, 0005, 35),
(26, '999 Ibaan', 'Unpaid', NULL, 16, 0006, 36),
(27, '222 Pinagkawitan', 'Unpaid', NULL, 17, 0007, 37),
(28, '777 Tiaong', 'Paid', '2021-01-18', 18, 0008, 38),
(29, '333 Mataas na Wood', 'Paid', '2021-01-12', 19, 0009, 39),
(30, '444 Lipa', 'Unpaid', NULL, 20, 0010, 40);




CREATE TABLE Tracking_info (
    tracking_id INT PRIMARY KEY,
    courier_id INT,
    estimated_delivery_date DATE,
    delivery_status VARCHAR(50)
);

INSERT INTO Tracking_info (tracking_id, courier_id, estimated_delivery_date, delivery_status)
VALUES 
(31, 1, '2023-12-24', 'In Transit'),
(32, 2, NULL, 'Delivered'),
(33, 3, NULL, 'Not Started'),
(34, 4, '2021-01-08', 'In Transit'),
(35, 5, '2021-01-10', 'In Transit'),
(36, 6, NULL, 'Not Started'),
(37, 7, '2021-01-18', 'In Transit'),
(38, 8, NULL, 'Not Started'),
(39, 9, '2021-01-12', 'In Transit'),
(40, 10, NULL, 'Not Started');

CREATE TABLE Courier_info (
    courier_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
	contact_number VARCHAR(20),
	address VARCHAR(255),
    email VARCHAR(255),
    delivery_id INT,
	user_id INT
   );

INSERT INTO Courier_info(courier_id, first_name, last_name, contact_number, address,
						 email, delivery_id, user_id)
VALUES
(1, 'Juan', 'Dela cruz', '09111111111', 'Lipa city', 'Delacruzjuan@gmail', 21, 1),
(2, 'Jose', 'Delos reyes', '09222222222', 'Batangas City', 'JoseDelosreyes@gmail', 22, 2),
(3, 'Lourenz', 'Anderson', '333-222-1111', '333 Rosario', 'kap@gmail', 23, 3),
(4, 'Denver', 'Harris', '444-555-6666', '444 Balibago', 'den@gmail', 24, 4),
(5, 'Alleon', 'Martin', '555-666-7777', '555 Alupay', 'alleon@gmail', 25, 5),
(6, 'Adrian', 'Thompson', '666-777-8888', '666 Lipa', 'adrian@gmail', 26, 6),
(7, 'KC', 'White', '777-888-9999', '777 Sanjuan', 'kc@gmail', 27, 7),
(8, 'King', 'Taylor', '888-999-0000', '444 Padre Garcia', 'king@gmail', 28, 8),  
(9, 'Von', 'Hernandez', '999-000-1111', '555 Mataas na Wood', 'von@gmail', 29, 9),
(10, 'Kian', 'Smith', '111-222-3333', '666 Pine St', 'kian@gmail', 30, 10);

ALTER TABLE Parcel
    ADD CONSTRAINT fk_parcel_customer
    FOREIGN KEY (customer_id) REFERENCES Customer_info(customer_id);

ALTER TABLE Delivery_details
    ADD CONSTRAINT fk_delivery_details_courier_status
    FOREIGN KEY (courier_status_id) REFERENCES Courier_Status(courier_status_id);

ALTER TABLE Delivery_details
    ADD CONSTRAINT fk_delivery_details_parcel
    FOREIGN KEY (parcel_id) REFERENCES Parcel(parcel_id);

ALTER TABLE Delivery_details
    ADD CONSTRAINT fk_delivery_details_tracking_info
    FOREIGN KEY (tracking_id) REFERENCES Tracking_info(tracking_id);

ALTER TABLE Tracking_info
    ADD CONSTRAINT fk_tracking_info_Courier_info
    FOREIGN KEY (courier_id) REFERENCES Courier_info(courier_id);

ALTER TABLE Courier_info
    ADD CONSTRAINT fk_courier_info_delivery_details
    FOREIGN KEY (delivery_id) REFERENCES Delivery_details (delivery_id);

ALTER TABLE Customer_info
    ADD CONSTRAINT fk_customer_info_user_info
    FOREIGN KEY (customer_id) REFERENCES user_info(user_id);

ALTER TABLE Courier_info
    ADD CONSTRAINT fk_Courier_info_user_info
    FOREIGN KEY (user_id) REFERENCES user_info(user_id);
	
	
	
	
-- SELECT JOIN
-- This query retrieves parcel information along with the first and last names of customers who placed the orders.
SELECT Parcel.*, Customer_info.first_name, Customer_info.last_name
FROM Parcel
JOIN Customer_info ON Parcel.customer_id = Customer_info.customer_id;

-- This query joins Customer_info and Parcel tables to retrieve specific information about customers and their corresponding parcels.
SELECT c.customer_id, c.first_name, c.last_name, c.address AS customer_address,
      p.description, p.price, p.booking_date, p.estimated_delivery_date
FROM Customer_info c
JOIN Parcel p ON c.customer_id = p.customer_id;

-- This query joins Delivery_details and Courier_Status to retrieve detailed information about deliveries along with their current status.
SELECT Delivery_details.*, Courier_Status.delivery_status
FROM Delivery_details
JOIN Courier_Status ON Delivery_details.courier_status_id = Courier_Status.courier_status_id;


-- SELECT JOIN JOIN
-- This query involves multiple joins between Tracking_info, Courier_info, and user_info to retrieve detailed tracking information along with courier and user details.
SELECT ti.tracking_id, ti.delivery_status, ci.first_name AS courier_first_name, ui.email
FROM Tracking_info ti
JOIN Courier_info ci ON ti.courier_id = ci.courier_id
JOIN user_info ui ON ci.user_id = ui.user_id;

-- This query involves multiple joins between Courier_Status, Delivery_details, and Parcel to retrieve comprehensive information about courier status, delivery details, and parcel information.
SELECT CS.*, DD.*, P.*
FROM Courier_Status CS
JOIN Delivery_details DD ON CS.courier_status_id = DD.courier_status_id
JOIN Parcel P ON DD.parcel_id = P.parcel_id;

-- This query involves multiple joins between Parcel, Delivery_details, and Tracking_info to retrieve information about parcels, delivery details, and tracking information.
SELECT p.parcel_id, p.description, d.delivery_id, d.customer_address, t.tracking_id, t.delivery_status
FROM Parcel p
JOIN Delivery_details d ON p.parcel_id = d.parcel_id
JOIN Tracking_info t ON d.tracking_id = t.tracking_id;

-- SELECT ORDER BY
-- This query retrieves customer information and orders it based on the alphabetical order of their last names.
SELECT first_name, last_name, contact_number
FROM Customer_info
ORDER BY last_name ASC;

-- This query retrieves parcel information along with customer details and orders the result based on the booking date in descending order.
SELECT Parcel.*, Customer_info.*
FROM Parcel
JOIN Customer_info ON Parcel.customer_id = Customer_info.customer_id
ORDER BY Parcel.booking_date DESC;

-- This query retrieves specific customer information and orders the result based on the alphabetical order of last names.
SELECT
    customer_id,
    first_name,
    last_name,
    address,
    contact_number,
    email,
    user_id
FROM
    Customer_info
ORDER BY
    last_name ASC;
    
-- UPDATE
-- This query updates the contact number of a courier with courier_id = 5.
UPDATE Courier_info
SET contact_number = '0912345678'
WHERE courier_id = 1;

-- This query updates the password of a user with email 'kayl@email.com'.
UPDATE user_info
SET password_ = '4matt'
WHERE email = 'kayl@email.com';

-- This query updates the customer address in Delivery_details from 'Padre Garcia' to 'Lipa'.
UPDATE Delivery_details
SET customer_address = 'Lipa'
WHERE customer_address = 'Padre Garcia';

-- DELETE
-- This query updates foreign key references in Delivery_details to NULL where courier_status_id = 1.
UPDATE Delivery_details
SET courier_status_id = NULL
WHERE courier_status_id = 1;

-- This query safely deletes a record in Courier_Status where courier_status_id = 1.
DELETE FROM Courier_Status
WHERE courier_status_id = 1;

-- This query deletes records in Delivery_details where customer_address is 'Mataas na Wood'.
DELETE FROM Delivery_details
WHERE customer_address = 'Mataas na Wood';

-- SELECT
-- This query retrieves all records from the user_info table.
SELECT * FROM user_info;

-- This query retrieves specific user information where email and password match certain values.
SELECT * FROM user_info 
WHERE email = 'rgmatibag@gmail.com'
AND password_ = '80302';

-- This query retrieves information about a specific customer with customer_id = 1.
SELECT * FROM Customer_info
WHERE customer_id = 1;

-- This query retrieves all records from the Delivery_details table.
SELECT * FROM Delivery_details;

-- SELECT...WHERE
-- This query retrieves courier status information for a specific delivery with delivery_id = 24.
SELECT Courier_Status.*
FROM Courier_Status
JOIN Delivery_details ON Courier_Status.courier_status_id = Delivery_details.courier_status_id
WHERE Delivery_details.delivery_id = 24;

-- This query retrieves delivery details for records where the date_of_delivery is between '2021-01-01' and '2021-01-10'.
SELECT *
FROM Delivery_details
WHERE date_of_delivery BETWEEN '2021-01-01' AND '2021-01-10';

-- This query retrieves parcel information along with customer details for a specific customer with customer_id = 3.
SELECT Parcel.description, Customer_info.customer_id, CONCAT(Customer_info.first_name, ' ', Customer_info.last_name) AS customer_name
FROM Parcel
JOIN Customer_info ON Parcel.customer_id = Customer_info.customer_id
WHERE Customer_info.customer_id = 3;

	
	
	
	
	
	
	
	
	
	
	
	
	
	