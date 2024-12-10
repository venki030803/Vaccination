<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Decode the JSON data
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($data["username"]) && isset($data["password"])) {
        $username = $data["username"];
        $password = $data["password"];
        $name = $data["name"];
        $age = $data["age"];
        $gender = $data["gender"];
        $contact = $data["contact"];
        $specialist = $data["specialist"];
        
        require("conn.php");

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Prepare and bind
        $stmt = $conn->prepare("INSERT INTO doctor (username, password, Name, Age, Gender, Contact, Specialist) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $username, $password, $name, $age, $gender, $contact, $specialist);
        
        if ($stmt->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Data inserted successfully';
        } else {
            $response['status'] = 'failure';
            $response['error'] = $stmt->error;
        }

        // Close the statement and the database connection
        $stmt->close();
        $conn->close();
    } else {
        $response['status'] = 'failure';
        $response['error'] = 'Invalid input';
    }

    // Send JSON response back to the client
    header('Content-Type: application/json');
    echo json_encode($response);
}
?>
