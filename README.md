
#  Pharmacy Management System

A robust and scalable **Pharmacy Management System** built using **MySQL**. This system is designed using a **shared database and shared schema (multi-tenant)** architecture to support multiple pharmacies and their branches under a single application with
fk 
 distinct IDs.

##  Features

-  Support for 100+ pharmacies and their branches
-  Inventory and stock management
-  Sales and purchase tracking
- Supplier management
-  Employee and user access control
-  Real-time data consistency
-  Secure, tenant-isolated data

## Tech Stack

- **Backend/Database**: MySQL
- **Architecture**: Shared Database & Shared Schema (Multi-Tenant)
- **Design**: Normalized schema with realistic test data

##  Database Structure

- `pharmacies`: Master table for pharmacy registration
- `branches`: Pharmacy branches linked to their parent pharmacy
- `medicines`: Details of available medicines
- `inventory`: Stock levels per branch
- `sales`: Records of sold items
- `purchases`: Records of purchases from suppliers
- `suppliers`: Supplier contact and transaction info
- `employees`: Employee records per branch
- `users`: Login credentials and roles

> All tables include `pharmacy_id` and/or `branch_id` for multi-tenant identification.

##  Sample Data

Includes:
-  this project is ulpoaded on github by command line 
- 100 pharmacies
- 10 realistic entries for each related table (branches, sales, inventory, etc.)
- Interlinked data with foreign keys and    integrity maintained 
 