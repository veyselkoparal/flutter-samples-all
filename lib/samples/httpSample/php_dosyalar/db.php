<?php
$db = new mysqli("localhost","admin","1a51450296f3b0cd4dcdf11f6b3d96dfc887a51edb712772","flutter_http");
$db->set_charset("utf8");
if($db->connect_errno){ 
	die("Üzgünüm, bazı problemler oluştu");
}
?>