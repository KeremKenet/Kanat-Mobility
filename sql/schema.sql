DROP SCHEMA IF EXISTS ride CASCADE;
CREATE SCHEMA ride;

CREATE TABLE ride.zones (
    zone_id SERIAL PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    zone_name VARCHAR(100) NOT NULL,
    target_vehicle_count INT NOT NULL DEFAULT 10
);

CREATE TABLE ride.vehicle_models (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL CHECK (vehicle_type IN ('electric_scooter', 'electric_bike', 'pedal_bike')),
    min_start_battery INT NOT NULL DEFAULT 20,
    unlock_fee NUMERIC(10,2) NOT NULL,
    minute_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE ride.vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    model_id INT NOT NULL REFERENCES ride.vehicle_models(model_id),
    zone_id INT NOT NULL REFERENCES ride.zones(zone_id),
    status VARCHAR(30) NOT NULL DEFAULT 'AVAILABLE' CHECK (status IN ('AVAILABLE', 'RESERVED', 'ACTIVE', 'MAINTENANCE', 'REBALANCING')),
    battery_level INT NOT NULL CHECK (battery_level BETWEEN 0 AND 100),
    last_battery_swap TIMESTAMP
);

CREATE TABLE ride.riders (
    rider_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    national_id VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE ride.wallets (
    wallet_id SERIAL PRIMARY KEY,
    rider_id INT NOT NULL UNIQUE REFERENCES ride.riders(rider_id),
    balance NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (balance >= 0)
);

CREATE TABLE ride.wallet_ledger (
    ledger_id SERIAL PRIMARY KEY,
    wallet_id INT NOT NULL REFERENCES ride.wallets(wallet_id),
    amount NUMERIC(10,2) NOT NULL,
    transaction_type VARCHAR(30) NOT NULL CHECK (transaction_type IN ('TOP_UP', 'RIDE_PAYMENT', 'REFUND', 'FINE')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ride.rides (
    ride_id SERIAL PRIMARY KEY,
    rider_id INT NOT NULL REFERENCES ride.riders(rider_id),
    vehicle_id INT NOT NULL REFERENCES ride.vehicles(vehicle_id),
    status VARCHAR(30) NOT NULL DEFAULT 'RESERVED' CHECK (status IN ('RESERVED', 'ACTIVE', 'ENDED', 'PAID', 'CANCELLED')),
    reserved_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    billed_minutes INT DEFAULT 0,
    net_charge NUMERIC(10,2) DEFAULT 0.00,
    vat_amount NUMERIC(10,2) DEFAULT 0.00,
    gross_charge NUMERIC(10,2) DEFAULT 0.00,
    unlock_snapshot NUMERIC(10,2) NOT NULL,
    minute_snapshot NUMERIC(10,2) NOT NULL
);
