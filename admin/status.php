<?php 
include 'protect.php';

// $id = $_GET['id'];

if (isset($_POST['status'])) {
    //$status = $_POST['status'];
    $sql = $db->query("UPDATE pembelian SET status='dibayar' WHERE id_pembelian='$_GET[id]'");
} else {echo "gagal";}
?>