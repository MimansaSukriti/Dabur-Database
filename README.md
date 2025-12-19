# Dabur FMCG Supply Chain & Sales Management Database
## Overview
This project presents a MySQL-based relational database designed for Dabur India Ltd., an FMCG organization. The database supports key business operations including procurement, manufacturing, inventory management, distribution, sales, and payments. The schema is normalized to reduce redundancy and ensure data integrity.
## Tools Used
* MySQL Server
* MySQL Workbench
* SQL (DDL & DML)
* GitHub (Version Control)
## Database Tables
The database consists of master and transaction tables to represent real-world FMCG operations.
### Master Tables
* Product Category
* Product
* Supplier
* Manufacturing Plant
* Warehouse
* Distributor
* Retailer
### Transaction Tables
* Purchase Order
* Production Batch
* Inventory
* Sales Order
* Sales Order Items
* Payment
## Table Relationship
* One product category can have multiple products
* One supplier can generate multiple purchase orders
* One product can have multiple production batches
* One warehouse can store multiple products
* One distributor can place multiple sales orders
* Each sales order can contain multiple products
## ER Diagram
The ER diagram is created using MySQL Workbench and shows primary keys, foreign keys, and one-to-many relationships between entities. It visually represents the complete FMCG supply chain from suppliers to distributors.
<img width="863" height="1357" alt="Dabur" src="https://github.com/user-attachments/assets/847d8f00-3303-4be5-9c6e-31d32c1472f7" />
## Project Structure
* SQL script for database and table creation
* SQL script for sample insert statements
* ER diagram file (MySQL Workbench)
* README.md documentation
## Conclusion
This project demonstrates the practical application of DBMS concepts such as normalization, entity-relationship modeling, optimized data types, and referential integrity. It reflects real-world business processes of an FMCG organization and is suitable for academic evaluation and viva discussions.
