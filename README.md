# README

# 🍕 Pizza Ordering API

## 📌 Project Overview
This is a **Rails 7 API** for ordering pizzas with customizable options like **size, crust, toppings, and sides**. It supports **inventory management** and **pricing rules**, including free toppings for large pizzas.

---

## 🚀 Features
- **Order Creation**: Users can create orders with different pizzas, crusts, toppings, and sides.
- **Polymorphic Inventory Management**: Inventory tracking for pizzas, toppings, crusts, and sides.
- **Pricing Rules**:
  - Large pizzas get **2 free toppings**.
  - Price dynamically calculated based on size, crust, and toppings.
- **API Versioning**: Uses `api/v1` namespace for future scalability.
- **Testing**: Fully tested with **RSpec & FactoryBot**.

---

## 🛠️ Setup Instructions

### **1️⃣ Install Dependencies**
```sh
bundle install
```

### **2️⃣ Set Up the Database**
```sh
rails db:create
rails db:migrate
rails db:seed
```

### **3️⃣ Start the Rails Server**
```sh
rails s
```

The API will be available at: `http://localhost:3000/api/v1/`

---

## 📡 API Endpoints

### **1️⃣ Fetch All Pizzas**
```sh
curl -X GET "http://localhost:3000/api/v1/pizzas"
```

### **2️⃣ Place an Order**
```sh
curl -X POST "http://localhost:3000/api/v1/orders" -H "Content-Type: application/json" -d '{
  "order": {
    "status": "pending",
    "customer_name": "Krishna",
    "order_items_attributes": [{
      "pizza_id": 1,
      "size": "Medium",
      "crust_id": 1,
      "order_toppings_attributes": [{"topping_id": 1}, {"topping_id": 2}]
    }],
    "order_sides_attributes": [{
      "side_id": 1
    }]
  }
}'
```

### **3️⃣ Check Order Status**
```sh
curl -X GET "http://localhost:3000/api/v1/orders/1"
```

### **4️⃣ Restock Inventory**
```sh
curl -X POST "http://localhost:3000/api/v1/orders/restock" -H "Content-Type: application/json" -d '{
  "item_type": "Pizza",
  "item_id": 1,
  "quantity": 10
}'
```

---

## 🔧 Technologies Used
- **Rails 7** (API Mode)
- **RSpec & FactoryBot** (Testing)
- **Sqlite3** (Database)
- **cURL/Postman** (API Testing)

---

## ✨ Future Enhancements
- Add **User Authentication**
- Implement **Discount Coupons**
- WebSocket support for **real-time order tracking**



