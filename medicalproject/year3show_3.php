<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($_POST["username"])) {
        $username = $_POST["username"];

        // // Establish the database connection
        // $servername = "localhost";
        // $username_db = "root";
        // $password_db = "";
        // $dbname = "medicalproject";

        // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

    // Use prepared statements to prevent SQL injection
    $sql = "SELECT q3 FROM year3qa WHERE username = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Fetch the data
        $row = $result->fetch_assoc();

        // Extract the values you need and concatenate them into a string
        $string_data = $row['q3'] ;

        // Login successful
    
        $response = $string_data;
    } else {
        // Login failed
        $response['status'] = 'failure';
        $response['message'] = 'Invalid username or password';
    }

    // Close the database connection
    $conn->close();
} else {
    $response['status'] = 'failure';
    $response['message'] = 'Username or password not provided';
}

echo json_encode($response);
}