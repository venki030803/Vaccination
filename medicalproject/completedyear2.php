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

        // Query to retrieve data from both tables using JOIN
        $sql = "SELECT 18monthdose.completed_date_month_18,18monthdose.completed_month18, year2dose.completed_year2
                FROM 18monthdose
                JOIN year2dose ON 18monthdose.username = year2dose.username
                WHERE 18monthdose.username = '$username'";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Fetch the data
            $row = $result->fetch_assoc();

            // Extract the values you need and concatenate them into a string
            $string_data =  $row['completed_date_month_18']. ', '  . $row['completed_month18']. ', ' . $row['completed_year2'];

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
