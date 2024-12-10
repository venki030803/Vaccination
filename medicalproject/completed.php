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

        // if ($conn->connect_error) {
        //     die("Connection failed: " . $conn->connect_error);
        // }

        // Query to retrieve data from both tables using JOIN
        $sql = "SELECT register.dob, week6dose.completed
                FROM register
                JOIN week6dose ON register.username = week6dose.username
                WHERE register.username = '$username'";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Fetch the data
            $row = $result->fetch_assoc();

            // Extract the values you need and concatenate them into a string
            $string_data =  $row['dob']. ', ' . $row['completed'];

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
