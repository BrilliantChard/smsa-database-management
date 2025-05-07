-- DATABASE FOR MY SMSA PROJECT

CREATE DATABASE SMSA_DATABASE;
USE SMSA_DATABASE;

-- CREATING TABLES FOR SMSA DATABASE

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Farmer (
    farmer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    location VARCHAR(255)
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_available INT NOT NULL,
    category_id INT,
    farmer_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (farmer_id) REFERENCES Farmer(farmer_id)
);

CREATE TABLE Buyer (
    buyer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    order_date DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id)
);

CREATE TABLE OrderItem (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE ServiceProvider (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    service_type VARCHAR(100),
    contact_info VARCHAR(255)
);

CREATE TABLE ServiceRequest (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_id INT,
    provider_id INT,
    request_date DATE,
    status VARCHAR(50) DEFAULT 'Requested',
    FOREIGN KEY (farmer_id) REFERENCES Farmer(farmer_id),
    FOREIGN KEY (provider_id) REFERENCES ServiceProvider(provider_id)
);

-- INSERTING SAMPLE DATA

INSERT INTO Category (name) VALUES 
('Vegetables'), ('Dairy'), ('Grains');

INSERT INTO Farmer (name, phone, location) VALUES 
('Alice Odongo', '0712345678', 'Kisumu'), 
('Ben Otieno', '0798765432', 'Nakuru');

INSERT INTO Product (name, price, quantity_available, category_id, farmer_id) VALUES 
('Tomatoes', 50.00, 200, 1, 1),
('Milk (Litre)', 70.00, 100, 2, 2),
('Maize (kg)', 40.00, 300, 3, 1);

INSERT INTO Buyer (name, email, address) VALUES 
('John Doe', 'john@example.com', 'Nairobi'), 
('Jane Smith', 'jane@example.com', 'Eldoret');

INSERT INTO Orders (buyer_id, order_date, status) VALUES 
(1, '2025-05-01', 'Shipped'), 
(2, '2025-05-02', 'Pending');

INSERT INTO OrderItem (order_id, product_id, quantity) VALUES 
(1, 1, 10),
(1, 3, 5),
(2, 2, 20);

INSERT INTO ServiceProvider (name, service_type, contact_info) VALUES 
('GreenTransport Ltd', 'Delivery', 'green@transport.com'), 
('AgroSoil Ltd', 'Soil Testing', 'info@agrosoil.com');

INSERT INTO ServiceRequest (farmer_id, provider_id, request_date, status) VALUES 
(1, 1, '2025-05-01', 'Completed'), 
(2, 2, '2025-05-02', 'Pending');
