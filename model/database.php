<!-- This file will create a connection to the database -->
<!-- dsn: stand for Data Source Name  -->
<?php
// 1. Check for Environment Variables first, otherwise fall back to Docker defaults
$host = getenv('DB_HOST') ?: '127.0.0.1';
$dbname = getenv('DB_NAME') ?: 'assignment_tracker';
$username = getenv('DB_USER') ?: 'appuser';
$password = getenv('DB_PASS') ?: 'apppass';

$dsn = "mysql:host=$host;dbname=$dbname";

// 2. The Logic for connection
try {
    $db = new PDO($dsn, $username, $password);
} catch (PDOException $e) {
    $error = "Database Error: ";
    $error .= $e->getMessage();
    include('view/error.php');
    exit();
}
?>