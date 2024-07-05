<%-- 
    Document   : ordercompletion
    Created on : Jul 5, 2024, 11:32:48 PM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart Completion</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }
            header, footer {
                background-color: #f8f8f8;
                padding: 10px;
                text-align: center;
            }
            main {
                display: flex;
                flex: 1;
            }
            .sidebar {
                width: 250px;
                background-color: #f0f0f0;
                padding: 15px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }
            .content {
                flex: 1;
                padding: 20px;
            }
            .order-confirmation, .payment-info {
                margin-bottom: 20px;
            }
            .notification {
                background-color: #e7f3fe;
                border-left: 4px solid #2196F3;
                padding: 10px;
                margin-bottom: 20px;
            }
            .search-box, .categories, .latest-products, .contacts {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>

        <header>
            <h1>Order Completed</h1>
        </header>

        <main>
            <div class="sidebar">
                <div class="search-box">
                    <h2>Product Search</h2>
                    <input type="text" placeholder="Search for products...">
                </div>
                <div class="categories">
                    <h2>Product Categories</h2>
                    <ul>
                        <li>Category 1</li>
                        <li>Category 2</li>
                        <li>Category 3</li>
                    </ul>
                </div>
                <div class="latest-products">
                    <h2>Latest Products</h2>
                    <ul>
                        <li>Product 1</li>
                        <li>Product 2</li>
                        <li>Product 3</li>
                    </ul>
                </div>
                <div class="contacts">
                    <h2>Contacts/Links</h2>
                    <p>Phone: 123-456-7890</p>
                    <p>Email: info@example.com</p>
                    <p><a href="#">Terms and Conditions</a></p>
                </div>
            </div>

            <div class="content">
                <div class="notification">
                    Your order has been submitted successfully!
                </div>
                <div class="order-confirmation">
                    <h2>Order Confirmation</h2>
                    <p>Order Number: <%= request.getAttribute("orderNumber") %></p>
                    <p>Thank you for your purchase! You will receive an order confirmation email shortly.</p>
                </div>
                <div class="payment-info">
                    <h2>Payment Information</h2>
                    <p>Please transfer the total amount to the following bank account:</p>
                    <p>Bank: <%= request.getAttribute("bankName") %></p>
                    <p>Account Number: <%= request.getAttribute("accountNumber") %></p>
                    <p>Account Name: <%= request.getAttribute("accountName") %></p>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Example Store. All rights reserved.</p>
        </footer>

    </body>
</html>

