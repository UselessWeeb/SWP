--disclaimed: 
--data only used to testing
INSERT INTO [Role] (role_purpose) VALUES ('admin'), ('sale_manager'), ('marketing'), ('sale'), ('deliverer'), ('customer')
GO

--vertified user
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('John Doe', '/image/avatar/default.jpg' ,'Male', '123 Main St', 'sansunderswap2004@gmail.com', '123-456-7890', '123456', 'vertified', 1);
GO

--unvertified user
INSERT INTO [User] (full_name, avatar, gender, address, email, phone_number, password, state, role_id) 
VALUES ('Loel', '/image/avatar/default.jpg' ,'Male', '123 Main St', 'longndhe181257@fpt.edu.vn', '123-456-7890', '123456', 'unvertified', 6);
GO

--blog
INSERT INTO Blog (title, thumbnail, updated_date, category, blog_content, user_id) 
VALUES ('The Journey of Learning Java', '/image/thumbnail/1.jpg', GETDATE(), 'Programming', 'This is a blog post about learning Java...', 2);
GO