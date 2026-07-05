# Assignment Tracker 📝
This is a simple and efficient web application built to help keep track of assignments and tasks. This project follows the Model-View-Controller (MVC) design pattern and uses modern Sass features like variables, mixins, and nesting for clean, maintainable styling. It was developed to serve as a portfolio project showcasing backend database CRUD operations and functional application routing.

# 🛠️ Tech Stack
Backend: PHP
Database: MariaDB / MySQL
Frontend Styling: Sass (SCSS)
Local Server: XAMPP (Apache/PHP)
Production Environment: Docker
Architecture: MVC (Model-View-Controller)

# 📁 Folder Structure (MVC)
The application separates logic, data, and presentation to make the code easy to read and scale:
** /model: Handles the database connection and SQL CRUD operations (e.g., fetching, adding, or deleting assignments).
** /view: Contains the frontend layout and HTML structure (headers, footers, lists).
** /controller: Manages the data flow, receives user input, and routes actions between the model and the view.
** /css: Contains the compiled CSS from the Sass files.
** /sass: Contains the .scss files used for styling.

# 🚀 How to Run Locally (Using XAMPP)
* **Clone the repository:**
  
* **Bash**
git clone https://github.com/your-username/assignment_tracker.git

* **cd assignment_tracker**
(Tip: If you use VS Code or Cursor, you can type code . in your terminal to quickly open the project folder!)

 * **Move the project:**
Place the assignment_tracker folder inside your XAMPP htdocs directory (usually located at C:\xampp\htdocs\).

* **Start XAMPP:**
Open the XAMPP Control Panel and start the Apache and MySQL modules.

* **Set up the Database:**

Open your browser and navigate to http://localhost/phpmyadmin.

* **Create a new database** (e.g., assignment_tracker_db).

* **Import the provided** .sql file included in the repo or run the SQL queries to set up your tables.

* **Update the database connection** settings in the model/database.php file to match your local setup.

## Compile Sass (Optional):
If you want to edit the styles, make sure to compile the Sass file to CSS.

* **Bash**
sass sass/main.scss css/main.css --watch
Run the App:
Open your browser and visit http://localhost/assignment_tracker.

## 🐳 How to Run in Production (Using Docker)
If you want to deploy this live (e.g., on Render), you can use the included Docker setup, which containerizes the Apache, PHP, and database environment.

* **Build the Docker Image:**
Ensure Docker is running on your machine, then run:

* **Bash**
docker build -t assignment-tracker-app .
Run the Docker Container:

* **Bash**
docker run -p 8080:80 -d assignment-tracker-app
Access the Live App:
Open your browser and go to http://localhost:8080 to see the containerized application running.
