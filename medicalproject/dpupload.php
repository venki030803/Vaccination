<?php
include 'conn.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $hostname = 'localhost';
    $username = 'root';
    $password_db = '';
    $database = 'medicalproject';

    $conn = new mysqli($hostname, $username, $password_db, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get data from the request body as JSON
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    // Extract values from the JSON data
    $username = $data["username"];
    $base64image = $data["base64image"];
    
    // Sanitize user inputs
    $username = $conn->real_escape_string($username);

    $imageData = base64_decode($base64image);

    // File handling
    $targetDirectory = "images/";
    $defaultImage = "demo.jpg";  // Default image filename

    // Check if the file is uploaded successfully
    if ($imageData !== false) {
        $profileimage = $targetDirectory . time() . ".jpg";  // Unique filename based on timestamp
        file_put_contents($profileimage, $imageData);
    } else {
        // Use default image if decoding fails or no sfile is uploaded
        $profileimage = $targetDirectory . $defaultImage;
    } 
    echo $profileimage;
    echo $username;
    // Prepare SQL statement with prepared statement
    $sql = "UPDATE register SET dp = ? WHERE username = ?";

    // Create a prepared statement
    $stmt = $conn->prepare($sql);

    // Bind parameters
    $stmt->bind_param("ss", $profileimage, $username);

    // Execute the statement
    if ($stmt->execute()) {
        echo "Data inserted successfully";
    } else {
        echo "Error: " . $conn->error;
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>