
#  Pharmacy Management System

A robust and scalable **Pharmacy Management System** built using **MySQL**. This system is designed using a **shared database and shared schema (multi-tenant)** architecture to support multiple pharmacies and their branches under a single application with distinct IDs.

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

| Table Name               | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `pharmacies`             | Main registry of pharmacies with contact details                            |
| `manufacturers`          | List of medicine manufacturers                                               |
| `medicines`              | Medicine details with manufacturer linkage                                  |
| `pharmacies_x_medicines` | Many-to-many relationship between pharmacies and medicines                  |
| `inventories`            | Current inventory levels per pharmacy                                       |
| `customers`              | Customer records per pharmacy                                               |
| `sales`                  | Sale transactions per pharmacy/customer                                     |
| `sales_items`            | Items involved in each sale (one-to-many from sales)                        |
| `employees`              | Employee records per pharmacy                                               |
| `suppliers`              | Supplier details for medicine purchasing                                    |
| `purchases`              | Purchase records including supplier, pharmacy, and medicine details         |
| `payments_details`       | Payment information per sale                                                |
| `returns`                | Medicine return records with reason and refund info                         |
| `pharmacies_x_suppliers`| Many-to-many relationship between pharmacies and suppliers  

> All tables include `pharmacy_id` and/or `branch_id` for multi-tenant identification.

##  Sample Data

Includes:
- 100 pharmacies
- 10 realistic entries for each related table (branches, sales, inventory, etc.)
- Interlinked data with foreign keys and integrity maintained


   

