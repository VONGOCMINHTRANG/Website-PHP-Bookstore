<?php
if (empty($_SESSION['user'])) {
    echo 'Bạn chưa đăng nhập để sử dụng tính năng này. <a href="javascript:history.back()">Quay lại</a> ';
    exit;
} else {
    $user = $_SESSION['user'];
    $search = mysqli_query($con, "SELECT * FROM `user` WHERE `username` LIKE '" . $user . "'");
    if (mysqli_num_rows($search) == 1) {
        $result = mysqli_fetch_array($search);
        $iduser = $result['id'];
    }
}
?>
