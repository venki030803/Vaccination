<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    
    $username = $_POST["username"];
    $newQ1 = $_POST["completed_date"]; // Add the new values you want to update
    
    echo $newQ1;
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
    $sql = "UPDATE year2dose SET completed_date_year_2= ?,completed_year2='1' WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $newQ1, $username);
    $stmt->execute();

    $response = array();

    if ($stmt->affected_rows > 0) {
        $response['status'] = 'success';
        $response['message'] = 'Data updated successfully';
    } else {
        $response['status'] = 'failure';
        $response['message'] = 'No data updated for the given username';
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response);
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}
?>
