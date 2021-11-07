<?php
define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASSWORD", "");
define("DB_DATABASE", "registration");


// Create connection
$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if(isset($_POST['register'])) {
    $username = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["pass"];

    $rows = "SELECT * FROM user WHERE email='$email'";
    $result = mysqli_query($conn, $rows);
    if (mysqli_num_rows($result) > 0) {
        echo '<script>alert("Email Already Exists")</script>';
    } else {
        $sql = "INSERT INTO user (name, email, password)
            VALUES ('$username', '$email', '$password')";
        $conn->query($sql);
        printf("Welcome %s",$username);
    }
}
elseif (isset($_POST['login'])) {
    $email = $_POST["email"];
    $password = $_POST["pass"];
    $user_valid = "SELECT * FROM user WHERE email='$email' AND password='$password'";
    $result = mysqli_query($conn, $user_valid);
    if(mysqli_num_rows($result) == 0){
        echo '<script>alert("Incorrect Username Or Password")</script>';
    }
    else{
        $row = $result->fetch_assoc();
        printf("Welcome %s",$row["name"]);
    }
}
$conn->close();



?>

