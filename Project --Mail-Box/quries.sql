-- Create user table
CREATE TABLE IF NOT EXISTS users (
    email NVARCHAR(MAX) PRIMARY KEY,
    fname NVARCHAR(MAX),
    lname NVARCHAR(MAX),
    password NVARCHAR(MAX),
    dob NVARCHAR(MAX),
    phone NVARCHAR(MAX)
);

-- Insert a new user
INSERT INTO users (email, fname, lname, password, dob, phone)
VALUES ('example@example.com', 'John', 'Doe', 'hashed_password', '1990-01-01', '1234567890');

-- Select user by email
SELECT * FROM users WHERE email = 'example@example.com';

-- Update user information
UPDATE users SET fname = 'Jane', lname = 'Doe' WHERE email = 'example@example.com';

-- Delete user by email
DELETE FROM users WHERE email = 'example@example.com';


-- Insert a new user into the users table
INSERT INTO users (fname, lname, password, dob, phone, email)
VALUES ('John', 'Doe', 'password123', '1990-01-01', '1234567890', 'john@example.com');
