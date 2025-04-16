# ==============================================
# Authentication Endpoints
# ==============================================

# 1. Register Endpoints
## Register Customer
curl -s -X POST "http://localhost:5000/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Customer User",
    "email": "customer@example.com",
    "password": "password123",
    "role": "customer"
  }' \
  -c /tmp/cookie.txt | json_pp

## Register Admin
curl -s -X POST "http://localhost:5000/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Admin User",
    "email": "admin@example.com",
    "password": "password123",
    "role": "admin"
  }' \
  -c /tmp/cookie.txt | json_pp

## Register Rider
curl -s -X POST "http://localhost:5000/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Rider User",
    "email": "rider1@example.com",
    "password": "password123",
    "role": "rider"
  }' \
  -c /tmp/cookie.txt | json_pp

# 2. Authentication Operations
## Login with Email
curl -s -X POST "http://localhost:5000/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "customer@example.com",
    "password": "password123"
  }' \
  -c /tmp/cookie.txt | json_pp

## Google OAuth Login
open "http://localhost:5000/auth/google"

## Check Auth Status
curl -s -X GET "http://localhost:5000/auth/me" \
  -b /tmp/cookie.txt | json_pp

## Logout
curl -s -X GET "http://localhost:5000/auth/logout" \
  -b /tmp/cookie.txt | json_pp

# ==============================================
# Product Endpoints
# ==============================================

## Get All Products (Public)
curl -s -X GET "http://localhost:5000/products" | json_pp

## Get Product by ID (Public)
curl -s -X GET "http://localhost:5000/products/68001dfd77697cf5f577c15b" | json_pp

# ==============================================
# Order Endpoints
# ==============================================

## Create Order (Customer only)
curl -s -X POST "http://localhost:5000/orders" \
  -H "Content-Type: application/json" \
  -b /tmp/cookie.txt \
  -d '{
    "product_id": "68001dfd77697cf5f577c15b",
    "quantity": 1,
    "selected_size": "M",
    "selected_color": "Black"
  }' | json_pp

## Get Current User's Orders (Customer only)
curl -s -X GET "http://localhost:5000/orders/me" \
  -b /tmp/cookie.txt | json_pp

## Get All Orders (Admin only)
curl -s -X GET "http://localhost:5000/orders" \
  -b /tmp/cookie.txt | json_pp

## Assign Rider to Order (Admin only)
curl -s -X PUT "http://localhost:5000/orders/ORDER_ID/assign" \
  -H "Content-Type: application/json" \
  -b /tmp/cookie.txt \
  -d '{
    "riderId": "RIDER_USER_ID"
  }' | json_pp

## Get Assigned Orders (Rider only)
curl -s -X GET "http://localhost:5000/orders/assigned" \
  -b /tmp/cookie.txt | json_pp

## Update Order Status (Rider only)
curl -s -X PUT "http://localhost:5000/orders/ORDER_ID/status" \
  -H "Content-Type: application/json" \
  -b /tmp/cookie.txt \
  -d '{
    "status": "shipped"
  }' | json_pp

# ==============================================
# User Endpoints
# ==============================================

## Get Current User Profile
curl -s -X GET "http://localhost:5000/users/me" \
  -b /tmp/cookie.txt | json_pp

## Get All Riders (Admin only)
curl -s -X GET "http://localhost:5000/users/riders" \
  -b /tmp/cookie.txt | json_pp