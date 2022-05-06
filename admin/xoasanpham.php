<?php
  include '../connect_db.php';
  $id = $_GET['id'];
  $sql = "DELETE FROM products where id_product = $id";
  $query = mysqli_query($con,$sql);
  header('location: ../admin.php');
?>