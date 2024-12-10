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
        $sql = "SELECT year1dose.completed_date_year_1,year1dose.completed_year1, 15monthdose.completed_month15
                FROM year1dose
                JOIN 15monthdose ON year1dose.username = 15monthdose.username
                WHERE year1dose.username = '$username'";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Fetch the data
            $row = $result->fetch_assoc();

            // Extract the values you need and concatenate them into a string
            $string_data =  $row['completed_date_year_1']. ', '  . $row['completed_year1']. ', ' . $row['completed_month15'];

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
