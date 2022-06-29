<?php

$functionName = isset($_POST['fName']) ? $_POST['fName'] : '';


if($functionName == "update") {
$getFunc = new Rating();
echo $getFunc->update($_POST['proid'], $_POST['rating']);
} 

class Rating {
// Database credentials
private $host     = 'localhost';
private $username = 'root';
private $password = '';
private $database = 'gallery_db';
public  $db;

public function __construct(){
if(!isset($this->db)){
	// Connect to the database    
	try {
	$this->db = new mysqli($this->host, $this->username, $this->password, $this->database);
	}catch (Exception $e){
	$error = $e->getMessage();
	echo $error;
	}
}
}
public function select(){
$select = "SELECT * FROM `images` where `delete_f` = 0 order by `rate` desc ";
$result = mysqli_query($this->db ,$select);
return mysqli_fetch_all($result);
}

public function update($id, $rating) {
$update = "UPDATE `images` SET rate = '$rating' WHERE id = '$id' ";
$result = mysqli_query($this->db ,$update);
if($result) { 
	return 'Data Updated Successfully';
}
} 
}
