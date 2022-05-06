<?php 

    session_start();
    // kiem tra 
    if(!empty($_SESSION['user'])) {
        header('location:giohang.php');
    } else {
        header('location:index.php');
        die();
    }
?>