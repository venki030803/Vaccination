<?php
 include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!empty($_POST["username"])) {
        // Sanitize the username
        $username = $_POST["username"];

        // Establish the database connection
        // $servername = "localhost";
        // $username_db = "root";
        // $password_db = "";
        // $dbname = "medicalproject";

        // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

        if ($conn->connect_error) {
            // Handle connection error
            $response['status'] = 'failure';
            $response['message'] = 'Connection failed: ' . $conn->connect_error;
        } else {
            // Initialize a variable to store the total completed count
            $total_completed_count = 0;

            // Define an associative array of tables and their corresponding completed columns
            $tables_columns = array(
                'week6dose' => 'completed',
                'week7dose' => 'completed7',
                'week14dose' => 'completed14',
                '6monthdose' => 'completed_month6',
                '9monthdose' => 'completed_month9',
                'year1dose' => 'completed_year1',
                '15monthdose' => 'completed_month15',
                '18monthdose' => 'completed_month18',
                'year2dose' => 'completed_year2',
                'year3dose' => 'completed_year3',
                'year4dose' => 'completed_year4',
                'year5dose' => 'completed_year5'
            );

            // Loop through each table and execute a separate query
            foreach ($tables_columns as $table => $completed_column) {
                $sql = "SELECT COUNT(*) as completed_count FROM $table WHERE username = ? AND $completed_column = 1";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $username);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $total_completed_count += $row['completed_count'];
                }

                $stmt->close();
            }

            // Successful query execution
            $response['status'] = 'success';
            $response['total_completed_count'] = $total_completed_count;

            // Close the database connection
            $conn->close();
        }
    } else {
        $response['status'] = 'failure';
        $response['message'] = 'Username not provided or empty in the request data';
    }
} else {
    $response['status'] = 'failure';
    $response['message'] = 'Invalid request method';
}

// Return a consistent response format
echo json_encode($response);
?>
