
<?php
include 'common/library.php';
include 'common/constant.php';


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "my_form";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = INSERT INTO `form_field`(`id`, `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `eleven`, `twleve`, `thirteen`, `frouteen`, `fiftin`, `sixteen`) VALUES ('10','hello','hello','hello',10/10/10,'hello','hello','hello','hello','hello','hello','[value-12]','hello','hello','hello','hello]','hello');

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();

// $_POST['user_id'] ="3";
// $_POST['name']="testbysaurabh";
// $_POST['mobile'] ="3214569870";
// $_POST['address']  ="04 test";
// $_POST['landmark']="test";
// $_POST['pincode'] ="401208";
    
?>