<?php
// include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($_POST["username"]) && isset($_POST["password"])){
        $username = $_POST["username"];
        $password = $_POST["password"];
        $parentname = $_POST["parentname"];
        $childname = $_POST["childname"];
        $age = $_POST["age"];
        $phone = $_POST["phone"];
        $gender = $_POST["gender"];
        $bloodgroup = $_POST["bloodgroup"];
        $dob = $_POST["dob"];

        // // Establish the database connection
        $servername = "localhost";
        $username_db = "root";
        $password_db = "";
        $dbname = "medicalproject";

        $conn = new mysqli($servername, $username_db, $password_db, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Query to insert data into the database
        $sql = "INSERT INTO register ( username, password, parentname, childname, age, phone, gender, bloodgroup,dob,dp) VALUES ('$username', '$password','$parentname', '$childname', '$age','$phone', '$gender', '$bloodgroup', '$dob','images/1712632827.jpg')";

        if ($conn->query($sql) === TRUE) {
            $response['status'] = 'success';
            $response['message'] = 'Data inserted successfully';
        } else {
            $response['status'] = 'failure';
            $response['error'] = $conn->error;
        }

        // Close the database connection
        $conn->close();
    } else {
        $response['status'] = 'failure';
        $response['message'] = 'Username or password not provided';
    }

    echo json_encode($response);
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
}
?>