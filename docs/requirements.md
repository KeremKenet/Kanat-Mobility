# Kanat Mobility — Scooter Rental ERP System

scooter-rental-erp is an enterprise-grade database and management system designed for **Kanat Mobility**, a multi-city micro-mobility service operating electric scooters, electric bikes, and pedal bikes across İzmir, Antalya, and Eskişehir.

## 🚀 Key Features & Modules
* **Fleet & Zone Management:** City-wide tracking of zones, numbered parking spots, vehicle models, and real-time fleet availability, including automated rebalancing rules.
* **User Wallets & Financial Ledgers:** Secure prepaid wallet system backed by strict ledger tracking for top-ups, ride charges, refunds, and adjustments.
* **Dynamic Tariffs & Pricing:** Historical tariff tracking managing unlock fees and per-minute rates across vehicle types and cities without affecting past transactions.
* **Ride Lifecycle & Telemetry:** Full management of reservations, active rides, GPS ping telemetry streams (ide_event), VAT-inclusive revenue calculations, and promotional discount campaigns.
* **Maintenance & Supply Chain:** Comprehensive tracking of maintenance tickets, spare parts, supplier offers, lead times, and battery swap operations.
* **Security & Access Control:** Role-based access control (RBAC), row-level security (RLS), secure audit logging for sensitive modifications, and data privacy protection.

## 🛠️ Technology Stack
* **Database Management System:** PostgreSQL
* **Architecture:** Relational database design featuring complex constraints, triggers, stored procedures, table functions, and materialized views.
