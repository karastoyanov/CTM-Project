-- Create a table for spare parts
CREATE TABLE spare_parts (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    car_model VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert real data into the table
INSERT INTO spare_parts (part_name, car_model, manufacturer, price) VALUES
    ('Brake Pad', 'Toyota Camry', 'Bosch', 49.99),
    ('Oil Filter', 'Honda Accord', 'Mann-Filter', 8.99),
    ('Spark Plug', 'Ford Mustang', 'NGK', 2.49),
    ('Air Filter', 'Chevrolet Malibu', 'WIX Filters', 12.99),
    ('Headlight Bulb', 'Nissan Altima', 'Philips', 5.99),
    ('Alternator', 'Volkswagen Golf', 'Denso', 89.99),
    ('Radiator', 'Mazda CX-5', 'Koyo', 64.99),
    ('Spark Plug', 'Volkswagen Golf', 'Bosch', 23.99);