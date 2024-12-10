<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($_POST["username"])) {
        $username = $_POST["username"];

        // $servername = "localhost";
        // $username_db = "root";
        // $password_db = "";
        // $dbname = "medicalproject";

        // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

        // if ($conn->connect_error) {
        //     die("Connection failed: " . $conn->connect_error);
        // }

        // Query to retrieve data from both tables using JOIN
        $sql = "SELECT week14dose.completed_date,week14dose.completed14, 6monthdose.completed_month6
                FROM week14dose
                JOIN 6monthdose ON week14dose.username = 6monthdose.username
                WHERE week14dose.username = '$username'";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Fetch the data
            $row = $result->fetch_assoc();

            // Extract the values you need and concatenate them into a string
            $string_data =  $row['completed_date']. ', '  . $row['completed14']. ', ' . $row['completed_month6'];

            // Successful retrieval
        
            $response = $string_data;
        } else {
            // No matching records found
            $response['status'] = 'failure';
            $response['message'] = 'No data found for the provided username';
        }

        // Close the database connection
        $conn->close();
    } else {
        $response['status'] = 'failure';
        $response['message'] = 'Username not provided';
    }

    echo json_encode($response);
}
