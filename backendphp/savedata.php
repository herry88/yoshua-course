<?php 
include 'conn.php';

$item_code = $_POST['item_code'];
$item_name = $_POST['item_name'];
$price = $_POST['price'];
$stock = $_POST['stock'];

//simpan
$save =  $conn->query("INSERT INTO tb_item(item_code, item_name,price,stock)
VALUES('".$item_code."','".$item_name."','".$price."','".$stock."')");
//tampilin
$show = $conn->query("SELECT  * FROM tb_item  ORDER BY item_code  DESC LIMIT 1");
while($row = mysqli_fetch_array($show)){
    $data[] = $row;
}
//respomse json
if($save){
    $response = array('status'=>1, 'msg'=>'Insert Success','data'=>$data);
} else{
    $response = array('msg'=>'gagal insert');
}

header('Content-Type:application/json');
echo json_encode($response);