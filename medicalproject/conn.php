<?php
$servername = "localhost";
$username_db = "root";
$password_db = "";
$dbname = "medicalproject";

$conn = new mysqli($servername, $username_db, $password_db, $dbname,3306);//3310

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>