<?php
 include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($_POST["username"])) {
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

        // Query to check login credentials
        $sql = "SELECT dp FROM register WHERE username = '$username'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Fetch the data
            $row = $result->fetch_assoc();
            $profileImage = $row['dp']; 

            if (!empty($profileImage) && file_exists($profileImage)) {
                // Read the image file as binary data
                $binaryData = file_get_contents($profileImage);
                // Set the response headers to indicate binary data
                header('Content-Type: image/jpeg');
                // Send the binary data directly to the client
                echo $binaryData;
            } else {
                // If profile image not found or empty, send an empty response
                header('Content-Type: text/plain');
                echo 'Profile image not found';
            }
        } else {
            // If no matching user found, send an empty response
            header('Content-Type: text/plain');
            echo 'User not found';
        }

        // Close the database connection
        $conn->close();
    } else {
        // If username not provided, send an error response
        header('Content-Type: text/plain');
        echo 'Username not provided';
    }
}
?>