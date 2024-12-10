<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    $username = $_POST["username"];

    // Establish the database connection
    // $servername = "localhost";
    // $username_db = "root";
    // $password_db = "";
    // $dbname = "medicalproject";

    // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

    // if ($conn->connect_error) {
    //     die("Connection failed: " . $conn->connect_error);
    // }

    // Use prepared statements to prevent SQL injection
    $sql = "SELECT q1, q2, q3 FROM 6monthdose WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($q1, $q2, $q3);

    $response = array();

    while ($stmt->fetch()) {
       
        $response =  $q1 . ', ' . $q2 . ', ' . $q3 ;
    }

    if (empty($response)) {
        $response['status'] = 'failure';
        $response['message'] = 'No data found for the given username';
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response);
}
?>
