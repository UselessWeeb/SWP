--disclaimed: 
--data only used to testing
INSERT INTO [Role] (role_purpose) VALUES ('admin'), ('sale_manager'), ('marketing'), ('sale'), ('deliverer'), ('customer')
GO

--vertified user
delete from 
select * from [User]
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('John Doe', 'image/avatar/default.jpg' ,'Male', '123 Main St', 'sansunderswap2004@gmail.com', '123-456-7890', '123456', 'vertified', 1);
GO

--unvertified user
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('Loel', 'images/avatar/default.jpg' ,'Male', '123 Main St', 'longndhe181257@fpt.edu.vn', '123-456-7891', '123456', 'unvertified', 6);
GO

--blog
delete from [Blog]
INSERT INTO Blog (title, thumbnail, updated_date, category, blog_content, user_id) 
VALUES ('DELL Inspiron 1101', 'images/thumbnail/1.jpg', GETDATE(), 'DELL', 'The computer is one of the...', 3);
GO

--product
delete from [Laptop]
INSERT INTO Laptop (title, category, image, original_price, products_detail, sale_price, status) 
VALUES ('Dell XPS 15', 'Ultrabook', 'images/product/1.jpg', 1500.00, 'Dell XPS 15 details here...', 1200.00, 1);
GO
--slider(s)

INSERT INTO Slider (title, images, details, backlink, status, user_id) 
VALUES ('Summer Sale', 'images/summer-sale.jpg', 'Products being sale up to 90% !', 'http://example.com/sale', 1, 4);
GO

INSERT INTO Slider (title, images, details, backlink, status, user_id) 
VALUES ('Sudden Sale', 'images/sudden-sale.jpg', 'Some odd products is being saled ! How cool', 'http://example.com/sale', 1, 4);
GO
