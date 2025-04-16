# Restaurant Management System (DBMS Project)

This project is a Restaurant Management System developed as part of a Database Management System (DBMS) course. It handles restaurant operations such as order processing, menu management, table reservations, billing, and staff management. The backend is implemented using MySQL.

## Table of Contents

- Overview  
- Features  
- Technologies Used  
- Database Design  
- ER Diagram  
- Installation & Usage  
- Sample Queries  
- Project Structure  
- Report  

## Overview

The Restaurant Management System is designed to streamline the day-to-day activities of a restaurant including managing menu items, taking customer orders, generating bills, handling reservations, and maintaining staff records. It uses SQL for performing operations and managing relationships across different entities.

## Features

- Add, update, and delete menu items  
- Take customer orders and process bills  
- Manage table reservations and availability  
- Maintain staff details and shifts  
- Calculate daily revenue  
- Generate kitchen and billing reports  

## Technologies Used

- Database: MySQL  
- Language: SQL  
- Tools: MySQL Workbench, phpMyAdmin  
- Platform: Windows or Linux  

## Database Design

The system includes the following tables:

1. menu – Contains menu items with prices and categories  
2. orders – Stores order details, quantity, and timestamps  
3. tables – Tracks table availability and reservations  
4. customers – Maintains customer information and order history  
5. staff – Handles staff records including roles and shifts  
6. billing – Manages invoice generation and payments

The tables are interconnected using primary and foreign keys to ensure normalized and efficient data handling.

## ER Diagram

The ER Diagram illustrates the relationships among menu items, orders, customers, staff, and billing. Refer to the ER_Diagram image included in the project files.

## Installation & Usage

1. Download or clone the repository to your local system.

2. Open MySQL Workbench or phpMyAdmin.

3. Import the following SQL files in sequence:  
   - Tables_Creation.sql  
   - Insert_Queries.sql  
   - Select_Queries.sql

4. Run the SQL queries to simulate restaurant operations.

5. Check the Sample_Output_Screenshots folder for query results and outputs.

## Sample Queries

- List all available tables for reservation  
- Show top 5 selling menu items  
- Calculate the total bill for a specific order  
- Display staff assigned to a shift  
- View orders placed on a specific date  

## Project Structure

Restaurant-Management-System/  
├── ER_Diagram.png  
├── Table_Relations.png  
├── Tables_Creation.sql  
├── Insert_Queries.sql  
├── Select_Queries.sql  
├── Sample_Output_Screenshots/  
├── restaurant_management_report.pdf  
└── README.md

## Report

The report includes:  
- Introduction  
- Tools and Techniques Used  
- System Requirements  
- ER Diagram  
- Table Relations  
- Database Schema  
- SQL Queries with Outputs  
- Summary and Conclusion

Refer to restaurant_management_report.pdf for full documentation.

