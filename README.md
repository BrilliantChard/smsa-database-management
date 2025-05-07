# 📦 SMSA_DATABASE

**Smart Market for Sustainable Agriculture (SMSA)** is a relational database designed to support an online marketplace where farmers can list agricultural products, buyers can place orders, and service providers can offer agricultural services.

---

## 🗄️ Database Structure

The database includes the following tables:

- **Category**: Types of products (e.g., Vegetables, Dairy, Grains).
- **Farmer**: Farmers registered in the platform.
- **Product**: Agricultural products listed by farmers.
- **Buyer**: Customers who place orders.
- **Orders**: Tracks orders made by buyers.
- **OrderItem**: Items included in each order.
- **ServiceProvider**: Providers offering services like delivery or soil testing.
- **ServiceRequest**: Requests made by farmers to service providers.

---

## ⚙️ Sample Data Included

The schema includes sample data such as:
- Product categories (`Vegetables`, `Dairy`, `Grains`)
- Farmers and their products
- Buyers and their orders
- Service providers and service requests

---

## 🧩 Key Features

- Well-normalized relational design
- Referential integrity through foreign keys
- Clear separation of concerns between products, orders, and services

---

## 🚀 Usage

1. Run the SQL script to create the database and all tables.
2. Insert sample data to test queries and application logic.
3. Integrate with a backend API (e.g., FastAPI) to support CRUD operations.

---

## 🧑‍💻 Author

Chard Odhiambo – *Software Engineer & Database Designer*

---
