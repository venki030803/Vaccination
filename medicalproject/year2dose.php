
<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    
    $username = $_POST["username"];
    $q1=$_POST["q1"];
    
   
    // // Establish the database connection
    // $servername = "localhost";
    // $username_db = "root";
    // $password_db = "";
    // $dbname = "medicalproject";

    // $conn = new mysqli($servername, $username_db, $password_db, $dbname );

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    echo "111111";

    // Check if the record already exists for the given username
    $checkSql = "SELECT * FROM year2qa WHERE username = '$username'";
    $checkResult = $conn->query($checkSql);

    if ($checkResult->num_rows > 0) {
        // If record exists, update the values
        $insertSql = "UPDATE year2dose SET q1 = '$q1' WHERE username = '$username';";
        $insertStmt = $conn->query($insertSql);
        if ($insertStmt === TRUE) {
            $response['status'] = 'success';
            $response['message'] = 'Data inserted successfully';
        } else {
            $response['status'] = 'failure';
            $response['error'] = $insertStmt->error;
        }
    } else {
        // If record doesn't exist, insert a new record
        $insertSql = "INSERT INTO year2qa (username, q1,q2,q3,q4,q5) VALUES ('$username', '0', '0', '0', '0', '0')";
        $insertStmt = $conn->query($insertSql);
        $insertSql2 = "INSERT INTO year2dose (username, q1) VALUES ('$username', '$q1')";
        $insertStmt2 = $conn->query($insertSql2);

        if ($insertStmt2 === TRUE) {
            $response['status'] = 'success';
            $response['message'] = 'Data inserted successfully';
        } else {
            $response['status'] = 'failure';
            $response['error'] = $insertStmt->error;
        }
    }

    $conn->close();
    
    echo json_encode($response);
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}
?>


