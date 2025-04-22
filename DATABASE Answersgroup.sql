-- Create and use the database
CREATE DATABASE Answersgroup;
USE Answersgroup;

-- Brand Table 
CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    origin_country VARCHAR(50)
);
INSERT INTO brand (name, description, origin_country) VALUES
('Nike', 'Sportswear and footwear', 'USA'),
('Apple', 'Consumer electronics and software', 'USA'),
('H&M', 'Fashion and clothing', 'Sweden'),
('Vivo', 'Smartphones and electronics', 'China'),
('Samsung', 'Electronics and appliances', 'South Korea'),
('Bata', 'Affordable footwear', 'Global'),
('SafariCom', 'Mobile and internet services', 'Kenya'),
('KCB', 'Banking services', 'Kenya'),
('Supa Loaf', 'Bakery products', 'Kenya'),
('Brookside', 'Dairy products', 'Kenya'),
('KTDA', 'Tea products', 'Kenya');

-- Product categories 
CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);
INSERT INTO product_category (name, description) VALUES
('Clothing', 'Apparel and fashion'),
('Electronics', 'Tech and gadgets'),
('Footwear', 'Shoes and sneakers'),
('Food & Beverages', 'Groceries and drinks'),
('Mobile Phones', 'Smartphones and feature phones'),
('Banking', 'Financial services'),
('Furniture', 'Home and office furniture'),
('Agricultural', 'Farm products and equipment'),
('Beauty', 'Cosmetics and personal care');

-- Product Table 
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT REFERENCES brand(id),
    category_id INT REFERENCES product_category(id),
    base_price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    is_local BOOLEAN DEFAULT FALSE
);

-- Color Table
CREATE TABLE color (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);
INSERT INTO color (name, hex_code) VALUES
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Black', '#000000'),
('White', '#FFFFFF'),
('Green', '#008000'),
('Yellow', '#FFFF00'),
('Brown', '#A52A2A'),
('Orange', '#FFA500'),
('Purple', '#800080'),
('Pink', '#FFC0CB'),
('Grey', '#808080'),
('Multi-color', NULL),
('Kitenge Print', NULL),
('Kikoi Stripes', NULL),
('Maasai Red', '#CC0000');

-- Size Option
CREATE TABLE size_option (
    id SERIAL PRIMARY KEY,
    value VARCHAR(10) NOT NULL
);
INSERT INTO size_option (value) VALUES
('XS'), ('S'), ('M'), ('L'), ('XL'), ('XXL'), ('XXXL'),
('28'), ('30'), ('32'), ('34'), ('36'), ('38'), ('40'), ('42'), ('44'),
('One Size'),
('500ml'), ('1L'), ('2L'), ('5L'),
('50g'), ('100g'), ('250g'), ('500g'), ('1kg'), ('2kg'), ('5kg'), ('10kg');

-- Size Category
CREATE TABLE size_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);
INSERT INTO size_category (name, description) VALUES
('Clothing', 'Standard clothing sizes'),
('Shoes', 'Shoe sizes'),
('Food', 'Food package sizes'),
('Universal', 'One size fits all');

-- Link sizes to size categories
CREATE TABLE size_category_option (
    size_category_id INT REFERENCES size_category(id),
    size_option_id INT REFERENCES size_option(id),
    PRIMARY KEY (size_category_id, size_option_id)
);
INSERT INTO size_category_option (size_category_id, size_option_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
(2, 8), (2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15),
(3, 26), (3, 27), (3, 28), (3, 29), (3, 30), (3, 31), (3, 32), (3, 33),
(4, 16);

-- Product Variation
CREATE TABLE product_variation (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    color_id INT REFERENCES color(id),
    size_option_id INT REFERENCES size_option(id),
    UNIQUE (product_id, color_id, size_option_id)
);

-- Product Item
CREATE TABLE product_item (
    id SERIAL PRIMARY KEY,
    variation_id INT REFERENCES product_variation(id),
    sku VARCHAR(100) NOT NULL UNIQUE,
    stock_quantity INT DEFAULT 0,
    price_override DECIMAL(10, 2), 
    is_on_sale BOOLEAN DEFAULT FALSE,
    discount_price DECIMAL(10, 2)
);

-- Product Image
CREATE TABLE product_image (
    id SERIAL PRIMARY KEY,
    variation_id INT REFERENCES product_variation(id),
    url TEXT NOT NULL,
    alt_text VARCHAR(255),
    is_main BOOLEAN DEFAULT FALSE
);

-- Attribute Category
CREATE TABLE attribute_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
INSERT INTO attribute_category (name) VALUES
('Physical'),
('Technical'),
('Nutritional'),
('Cultural'),
('Safety');

-- Attribute Type
CREATE TABLE attribute_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    data_type VARCHAR(50) NOT NULL
);
INSERT INTO attribute_type (name, data_type) VALUES
('Material', 'text'),
('Weight', 'number'),
('Battery Life', 'text'),
('Screen Size', 'text'),
('Network', 'text'),
('Ingredients', 'text'),
('Allergens', 'text'),
('Origin', 'text'),
('Cultural Significance', 'text'),
('Care Instructions', 'text'),
('Expiry Date', 'date'),
('Energy', 'text'),
('Protein', 'text'),
('Fat', 'text'),
('Carbohydrates', 'text');

-- Product Attribute
CREATE TABLE product_attribute (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    name VARCHAR(100) NOT NULL,
    value TEXT NOT NULL,
    attribute_category_id INT REFERENCES attribute_category(id),
    attribute_type_id INT REFERENCES attribute_type(id)
);
