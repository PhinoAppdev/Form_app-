<?php
class Connection{
	protected $conn ="";

	public function __construct()
	{
		// $this->conn = new mysqli("localhost","gxvxuoyc_ghoomteraho_user","Ghoomteraho@123","gxvxuoyc_ghoomteraho_db");
        $this->conn=new mysqli('localhost','root','','my_form');
	}

	public function __destruct(){
		$this->conn->close();
	}
}
?>