-- Kanat Mobility - Sample Seed Data

-- 1. Zones
INSERT INTO ride.zones (city, zone_name, target_vehicle_count) VALUES
('İzmir', 'Alsancak Merkez', 15),
('İzmir', 'Kordon Sahil', 12),
('Antalya', 'Kaleiçi', 10),
('Eskişehir', 'Adalar', 15);

-- 2. Vehicle Models
INSERT INTO ride.vehicle_models (model_name, vehicle_type, min_start_battery, unlock_fee, minute_price) VALUES
('Xiaomi Pro 2', 'electric_scooter', 20, 4.99, 2.50),
('Segway Ninebot Max', 'electric_scooter', 25, 5.49, 2.75),
('City e-Bike Standard', 'electric_bike', 20, 6.00, 3.00),
('Classic Pedal Bike', 'pedal_bike', 0, 3.00, 1.50);

-- 3. Vehicles
INSERT INTO ride.vehicles (model_id, zone_id, status, battery_level, last_battery_swap) VALUES
(1, 1, 'AVAILABLE', 85, CURRENT_TIMESTAMP - INTERVAL '2 hours'),
(1, 1, 'AVAILABLE', 92, CURRENT_TIMESTAMP - INTERVAL '1 hour'),
(2, 2, 'AVAILABLE', 78, CURRENT_TIMESTAMP - INTERVAL '3 hours'),
(3, 3, 'AVAILABLE', 65, CURRENT_TIMESTAMP - INTERVAL '4 hours'),
(4, 4, 'AVAILABLE', 100, NULL);

-- 4. Riders
INSERT INTO ride.riders (first_name, last_name, email, national_id) VALUES
('Ahmet', 'Yılmaz', 'ahmet.yilmaz@example.com', '12345678901'),
('Ayşe', 'Demir', 'ayse.demir@example.com', '23456789012'),
('Mehmet', 'Kaya', 'mehmet.kaya@example.com', '34567890123');

-- 5. Wallets
INSERT INTO ride.wallets (rider_id, balance) VALUES
(1, 150.00),
(2, 200.00),
(3, 50.00);

-- 6. Wallet Ledger
INSERT INTO ride.wallet_ledger (wallet_id, amount, transaction_type) VALUES
(1, 150.00, 'TOP_UP'),
(2, 200.00, 'TOP_UP'),
(3, 50.00, 'TOP_UP');
