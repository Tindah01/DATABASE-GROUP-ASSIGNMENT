# 🛍️ AnswersGroup Product Catalog Database

This repository contains the SQL schema and seed data for a detailed product catalog database tailored to support a diverse, Kenya-inclusive marketplace. It supports brands, products, variations, attributes, and more.

---

## 📦 Features

- **Brand Management** – Supports local and international brands
- **Product Categorization** – Multiple categories and size types
- **Detailed Variants** – Color and size-specific product variations
- **Stock Keeping** – SKU management, pricing overrides, discount flags
- **Attribute System** – Custom attributes by category (e.g., Physical, Cultural, Nutritional)
- **Localization Support** – Includes Kenyan-specific products and cultural garments

---

## 🏗️ Schema Overview

| Table                | Description |
|----------------------|-------------|
| `brand`              | Brand details (name, origin, etc.) |
| `product_category`   | Classification of products |
| `product`            | Core product data |
| `color`, `size_option`, `size_category` | Styling and sizing |
| `product_variation`  | Specific combinations of product, color, size |
| `product_item`       | SKU, stock, pricing overrides |
| `product_image`      | Images with alt text for SEO/accessibility |
| `attribute_category`, `attribute_type`, `product_attribute` | Extensible attribute system |

---

