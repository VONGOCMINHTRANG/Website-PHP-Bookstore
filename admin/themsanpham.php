<?php session_start();
include '../connect_db.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BookStore Admin</title>
  <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
  <link rel="stylesheet" href="../css/admin.css">
  <link rel="stylesheet" href="../font-awesome/css/all.css">
</head>

<body style="background-color: #F0F0F0;" data-spy="scroll" data-target="#myScrollspy" data-offset="1">
  <?php
  include '../connect_db.php';
  include '../hienidnguoidung.php';
  ?>
  <div class="menu">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="../image/logo.png" alt="..." width="100px"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="../index.php">Trang chủ</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../admin.php" onclick="listsanpham();">Sản Phẩm</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../admin/donhang.php" onclick="listdonhang()" ;>Đơn Hàng</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../admin/quanlyuser.php" onclick="listkhachhang();">Khách Hàng</a>
            </li>
          </ul>

          <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
              <a class="nav-link" href="">Xin Chào Quản Trị Viên</a>
            </li>
            <li class="nav-item text-nowrap">
              <!-- Nếu chưa đăng nhập thì hiển thị nút Đăng nhập -->
              <a type="button" class="btn btn-outline-info btn-md btn-rounded btn-navbar waves-effect waves-light" href="./dangxuat.php">Đăng Xuất</a>
            </li>
          </ul>
        </div>
    </nav>
  </div>
  <!-- Navbar -->
  <div class="container">
    <div class="row">
      <div class="col-sm-2 col-lg-2" id="myScrollspy">
        <nav class="navbar navbar-light flex-column mt-2">
          <nav class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="../admin.php">Danh sách sản phẩm</a>
              <a class="nav-link" href="./themsanpham.php">Thêm sản phẩm</a>
            </li>
          </nav>
        </nav>
      </div>
      <div class="container">
        <div class="col">
          <!-- Xử lý thêm sản phẩm -->

          <?php


          if (isset($_POST['sbm'])) {
            $name_product = $_POST['name_product'];
            // $name_product = strip_tags($_POST['name_product']);
            $price = $_POST['price'];
            // $price = strip_tags($_POST['price']);

            if (isset($_FILES['image'])) {
              $file = $_FILES['image'];
              $file_name = $file['name'];
              move_uploaded_file($file['tmp_name'], '../image/' . $file_name);
            }
            $describe_product = $_POST['describe_product'];
            // $describe_product = strip_tags($_POST['describe_product']);
            $id_category = $_POST['id_category'];
            // $id_category = strip_tags($_POST['id_category']);

            $sql = "INSERT INTO products(id_product,name_product,price,image,describe_product,id_category) VALUES ('NULL','" . $name_product . "','" . $price . "','" . $file_name . "','" . $describe_product . "','" . $id_category . "')";
            $query = mysqli_query($con, $sql);

            if ($query) {
              header('location: ../admin.php');
            } else {
              echo "Lỗi";
            }
          }
          ?>
          <!-- Xử lý thêm sản phẩm -->

          <form method="POST" enctype="multipart/form-data">
            <div class="container-fluid" id="addproduct">
              <div class="card-header">
                <h2>Thêm sản phẩm</h2>
              </div>
              <!-- <div class="form-group">
                <label for="">ID sản phẩm</label>
                <input type="text" name="id_product" class="form-control" required>
              </div> -->
              <div class="form-group row">
                <label for="" class="col-sm-2 col-form-label">Tên sản phẩm</label>
                <div class="col-sm-10">
                  <input type="text" name="name_product" required class="form-control">
                </div>
              </div>
              <div class="form-group row">
                <label for="" class="col-sm-2 col-form-label">Giá sản phẩm</label>
                <div class="col-sm-10">
                  <input type="number" min="0" name="price" class="form-control" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="" class="col-sm-2 col-form-label">Hình ảnh sản phẩm</label>
                <div class="col-sm-10">
                  <input type="file" name="image" class="form-control" required>
                </div>
              </div>
              <div class="form-group row">
                <label for="" class="col-sm-2 col-form-label">Mô tả sản phẩm</label>
                <div class="col-sm-10">
                  <input type="text" name="describe_product" class="form-control">
                </div>
              </div>
              <div class="form-group row">
                <label for="" class="col-sm-2 col-form-label">Thể loại:</label>
                <?php
                $sql = "SELECT * FROM category";
                $query_sql = mysqli_query($con, $sql);
                ?>
                <div class="col-sm-10">
                  <select class="form-control" name="id_category">
                    <?php
                    $sql_category = "SELECT * FROM category ORDER BY id_category DESC";
                    $query_category = mysqli_query($con, $sql_category);
                    while ($rows = mysqli_fetch_array($query_category)) {
                    ?>
                      <option value="<?= $rows['id_category'] ?>"><?= $rows['category_name'] ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <button name="sbm" class="btn btn-primary" type="submit">Thêm sản phẩm</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    function xoasanpham() {
      confirm("Bạn chắc chắn muốn xóa sản phẩm này ?");
    }
  </script>
</body>

</html>