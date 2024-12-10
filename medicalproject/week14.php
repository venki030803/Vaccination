<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    
    $username = $_POST["username"];
    $newQ1 = $_POST["q1"];
    $newQ2 = $_POST["q2"];
    $newQ3 = $_POST["q3"];
    $newQ4 = $_POST["q4"]; // Corrected variable name
    // // Establish the database connection
    // $servername = "localhost";
    // $username_db = "root";
    // $password_db = "";
    // $dbname = "medicalproject";

    // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

    // if ($conn->connect_error) {
    //     die("Connection failed: " . $conn->connect_error);
    // }

    // Use prepared statements to prevent SQL injection
    $sql = "UPDATE week14qa SET q1 = ?, q2 = ?, q3 = ?, q4 = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $newQ1, $newQ2, $newQ3, $newQ4, $username); // Corrected parameter type

    $stmt->execute();

    $response = array();

    if ($stmt->affected_rows > 0) {
        $response['status'] = 'success';
        $response['message'] = 'Data updated successfully';
    } else {
        $response['status'] = 'success';
        $response['message'] = 'No data updated for the given username';
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response);
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}
?>
