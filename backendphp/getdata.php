<?php
include "conn.php";
$qr = $conn->query("SELECT  * FROM tb_item");
$result = array();
while ($getdata = $qr->fetch_assoc()){
    $result[] = $getdata;
}
echo json_encode($result);