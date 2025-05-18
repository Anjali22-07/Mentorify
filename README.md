
# Mentorify

Mentorify is a dynamic web application designed to serve as a platform for technical articles. It helps fresh graduates and tech enthusiasts stay up-to-date with the latest trends and developments in the technology domain. The application supports features such as user registration, login authentication, article/blog creation, editing, commenting, and more.

## 🚀 Features

- User registration and authentication system
- Create, edit, and delete technical articles
- Commenting system for user interaction
- Organized and intuitive UI for better user experience
- Follows MVC (Model-View-Controller) architecture
- Responsive frontend for better usability

## 🛠️ Tech Stack

### Frontend
- **HTML5**
- **CSS3**
- **JavaScript**

### Backend
- **Java**
- **Servlets & JSP (JavaServer Pages)**
- **JDBC** for database connectivity
- **MySQL** as the relational database

## 🗂️ Project Structure

Mentorify/
│
├── nbproject/ # NetBeans project configuration files
├── src/ # Java source code (Servlets, Models, DAOs)
├── web/ # Web content including JSPs, HTML, CSS, JS
│ ├── index.jsp # Entry point
│ ├── login.jsp # Login page
│ ├── register.jsp # Registration page
│ └── ... # Other JSPs for article view, create, comment
├── build.xml # Ant build script (NetBeans)
└── README.md # Project documentation


## 🗃️ Database Schema (MySQL Overview)

Here are the main tables used in the project:

CREATE TABLE categories(
 c_id INT PRIMARY KEY,
    name VARCHAR(100),
    c_desc VARCHAR(500)
);
CREATE TABLE EMPLOYEE (
    empid INT PRIMARY KEY,
    empname VARCHAR(100)
);
CREATE TABLE LIKE(
    lid INT PRIMARY KEY,
    pid INT
    uid INT
     FOREIGN KEY (pid) REFERENCES POSTS(pid),
    FOREIGN KEY (uid) REFERENCES USER(uid)
    );
CREATE TABLE POSTS (
    p_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    code TEXT,
    picture VARCHAR(255),
    date DATE,
    cat_id INT,
    userId INT,
    FOREIGN KEY (cat_id) REFERENCES CATEGORIES(c_id),
    FOREIGN KEY (userId) REFERENCES USER(uid)
);
CREATE TABLE PRODUCT (
    pid INT PRIMARY KEY,
    pname VARCHAR(100) NOT NULL,
    empid INT,
    FOREIGN KEY (empid) REFERENCES EMPLOYEE(empid)
);
CREATE TABLE USER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    about TEXT,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    profile VARCHAR(255)
);


## 🧪 How to Run Locally

1. **Clone this repository**:
   ```bash
   git clone https://github.com/Anjali22-07/Mentorify.git

2. Open the project in NetBeans (recommended, as it contains nbproject configuration files).

3. Set up your MySQL database:

4. Create the required schema and tables.

5. Import the SQL dump (if provided), or use the SQL schema.

6. Update the JDBC configuration:

7. Modify the database connection settings in the appropriate Java file (usually something like ConnectionProvider.java or a config class).

8. Build and deploy the project on Apache Tomcat:

9. Make sure Tomcat is properly configured in NetBeans.

10. Clean and build the project.

11. Run it on your local server.

12. Access the app at:
    ```
     http://localhost:8080/Mentorify/
    

## 📌 To-Do / Future Enhancements

-- Add search functionality for articles

-- Rich text editor for blog writing

-- User profile and bookmarks

-- Tagging system for categorization

-- Password hashing for security


👩‍💻 Author
Anjali
GitHub: Anjali22-07

Feel free to fork the repo, contribute, or open issues for improvements!
