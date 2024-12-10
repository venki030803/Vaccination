<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    // Check if the table name and username are provided in the POST data
    if (!empty($_POST['table_name']) && !empty($_POST['username'])) {
        // Sanitize the table name and username
        $tableName = $_POST['table_name'];
        $username = $_POST['username'];

        // Define an associative array of tables and their corresponding completed columns
        $tables_columns = array(
            'week6dose' => 'completed_date',
            'week7dose' => 'completed_date',
            'week14dose' => 'completed_date',
            '6monthdose' => 'completed_date_month_6',
            '9monthdose' => 'completed_date_month_9',
            'year1dose' => 'completed_date_year_1',
            '15monthdose' => 'completed_date_month_15',
            '18monthdose' => 'completed_date_month_18',
            'year2dose' => 'completed_date_year_2',
            'year3dose' => 'completed_date_year_3',
            'year4dose' => 'completed_date_year_4',
            'year5dose' => 'completed_date_year_5'
        );

        // Check if the provided table name exists in the array
        if (array_key_exists($tableName, $tables_columns)) {
            // // Assuming you have a database connection established
            // $servername = "localhost";
            // $username_db = "root";
            // $password_db = "";
            // $dbname = "medicalproject";

            // $conn = new mysqli($servername, $username_db, $password_db, $dbname);

            // Check connection
            // if ($conn->connect_error) {
            //     die("Connection failed: " . $conn->connect_error);
            // }

            // Get the associated column for the provided table
            $columnName = $tables_columns[$tableName];

            // Construct and execute the query
            $query = "SELECT $columnName FROM $tableName WHERE username = '$username'";
            $result = $conn->query($query);

            // Handle the result, for example, print or process the data
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "Completion Date: " . $row[$columnName];
                }
            } else {
                echo "No results found";
            }

            // Close the connection
            $conn->close();
        } else {
            // Handle the case where the provided table name is not valid
            echo "Invalid table name";
        }
    } else {
        // Handle the case where the table name or username is not provided
        echo "Table name or username not provided";
    }
}

?>
