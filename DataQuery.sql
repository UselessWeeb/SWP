--disclaimed: 
--data only used to testing
INSERT INTO [Role] (role_purpose) VALUES ('admin'), ('sale_manager'), ('marketing'), ('sale'), ('deliverer'), ('customer')
GO

--vertified user
select * from [User]
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('John Doe', 'image/avatar/default.jpg' ,'Male', '123 Main St', 'sansunderswap2004@gmail.com', '123-456-7890', '123456', 'vertified', 1);
GO

select * from Blog_Category
--unvertified user
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('Loel', 'images/avatar/default.jpg' ,'Male', '123 Main St', 'longndhe181257@fpt.edu.vn', '123-456-7891', '123456', 'unvertified', 2);
GO

INSERT INTO Laptop (title, main_image, original_price, stock, products_detail, sale_price, status, updated_date) VALUES 
('Laptop A', 'image/laptop/a.jpg', 1000.00, 10, 'Details of Laptop A', 900.00, 1, GETDATE()),
('Laptop B', 'image/laptop/b.jpg', 1500.00, 5, 'Details of Laptop B', 1350.00, 1, GETDATE());
GO

-- Inserting laptop categories
INSERT INTO Laptop_Category (laptop_id, Category) VALUES 
(1, 'Gaming'),
(2, 'Business');
GO

-- Inserting laptop images
INSERT INTO Laptop_Image (laptop_id, Image) VALUES 
(1, 'image/laptop/a_1.jpg'),
(1, 'image/laptop/a_2.jpg'),
(2, 'image/laptop/b_1.jpg');
GO

-- Inserting orders
INSERT INTO [Order] (order_date, status, user_id) VALUES 
(GETDATE(), 1, 1),
(GETDATE(), 2, 2);
GO

-- Inserting order items
INSERT INTO Order_Item (order_id, laptop_id, quantity, price) VALUES 
(1, 1, 1, 900.00),
(2, 2, 1, 1350.00);
GO

-- Inserting order information
INSERT INTO Order_Information (order_id, payment_method, user_id) VALUES 
(1, 'Credit Card', 1),
(2, 'PayPal', 2);
GO

-- Inserting carts
INSERT INTO Cart (user_id,laptop_id, quantity) VALUES 
(1, 1, 3),
(1, 2, 4);
GO

-- Inserting tokens
INSERT INTO Token (userid, tokenString, expireDate, purpose) VALUES 
(1, 'token123', GETDATE() + 1, 0);
GO

select * from Blog
-- Inserting feedback
INSERT INTO Feedback (user_id, order_id, rated_star, feedback, images, status) VALUES 
(1, 1, 4.5, 'Great laptop!', 'image/feedback/1.jpg', 1);
GO

-- Inserting blogs
INSERT INTO Blog (thumbnail, title, updated_date, blog_content, is_featured, user_id) VALUES 
('image/blog/thumbnail.jpg', 'New Laptops of 2024', GETDATE(), 'Content of the blog post...', 1, 1);
GO

-- Inserting blog categories
INSERT INTO Blog_Category (blog_id, Category) VALUES 
(1, 'Technology');
GO

-- Inserting sliders
INSERT INTO Slider (title, images, details, backlink, status, user_id) VALUES 
('New Arrival', 'image/slider/new_arrival.jpg', 'Check out the latest laptops!', 'http://example.com', 1, 1);
GO

-- Inserting scores
INSERT INTO Score (score, user_id) VALUES 
(100, 1);
GO