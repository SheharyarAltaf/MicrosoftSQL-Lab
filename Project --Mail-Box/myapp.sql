CREATE TABLE users (
    fname NVARCHAR(MAX),
    lname NVARCHAR(MAX),
    password NVARCHAR(MAX),
    dob NVARCHAR(MAX),
    phone NVARCHAR(MAX),
    email NVARCHAR(MAX) PRIMARY KEY NOT NULL
);

CREATE TABLE emails (
    email_id INT PRIMARY KEY AUTOINCREMENT,
    subject NVARCHAR(MAX),
    msg NVARCHAR(MAX),
    receiver_email NVARCHAR(MAX),
    sender_email NVARCHAR(MAX),
    time NVARCHAR(MAX)
);

CREATE TABLE inbox (
    email_id INT,
    user_id NVARCHAR(MAX),
    inbox_id INT PRIMARY KEY AUTOINCREMENT,
    FOREIGN KEY (email_id) REFERENCES emails(email_id),
    FOREIGN KEY (user_id) REFERENCES users(email)
);

CREATE TABLE sentbox (
    email_id INT,
    user_id NVARCHAR(MAX),
    sentbox_id INT PRIMARY KEY AUTOINCREMENT,
    FOREIGN KEY (email_id) REFERENCES emails(email_id),
    FOREIGN KEY (user_id) REFERENCES users(email)
);

CREATE TABLE draft (
    email_id INT,
    user_id NVARCHAR(MAX),
    draft_id INT PRIMARY KEY AUTOINCREMENT,
    FOREIGN KEY (email_id) REFERENCES emails(email_id),
    FOREIGN KEY (user_id) REFERENCES users(email)
);