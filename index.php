	<?php
		session_start();
		include "koneksi.php";

		$sql = mysqli_query($koneksi, "SELECT * FROM admin_tb, tb_tentang");
		$r = mysqli_fetch_array($sql);

		if ((empty($_SESSION['username'])) and (empty($_SESSION['password']))) {
	?>

	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo $r['nama_nav'] ?></title>

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

	<style>
		body{
			height:100vh;
			display:flex;
			align-items:center;
			justify-content:center;
			font-family:'Segoe UI',sans-serif;
			background:linear-gradient(135deg,#eef2f7,#d9e4f5);
		}

		/* CARD LOGIN */
		.login-container{
			width:900px;
			background:#ffffff;
			border-radius:20px;
			box-shadow:0 20px 50px rgba(0,0,0,0.08);
			overflow:hidden;
			transition:0.3s;
		}

		.login-container:hover{
			transform:translateY(-4px);
			box-shadow:0 30px 70px rgba(0,0,0,0.12);
		}

		/* BAGIAN GAMBAR */
		.login-image{
			display:flex;
			align-items:center;
			justify-content:center;
			background:linear-gradient(160deg,#17a2b8,#36d1dc);
			padding:80px;
		}

		.login-image img{
			width:180px;
			filter:drop-shadow(0 8px 15px rgba(0,0,0,0.2));
			transition:0.3s;
		}

		.login-image img:hover{
			transform:scale(1.05);
		}

		/* FORM LOGIN */
		.login-form{
			padding:60px;
		}

		.login-title{
			font-weight:600;
			font-size:22px;
			margin-bottom:35px;
			color:#333;
		}

		/* INPUT */
		.form-control{
			height:48px;
			border-radius:10px;
			border:1px solid #e5e7eb;
			padding-left:14px;
			transition:0.2s;
		}

		.form-control:focus{
			border-color:#17a2b8;
			box-shadow:0 0 0 3px rgba(23,162,184,0.1);
		}

		/* PASSWORD BUTTON */
		.input-group button{
			border-radius:0 10px 10px 0;
		}

		/* BUTTON LOGIN */
		.btn-login{
			background:#17a2b8;
			border:none;
			padding:5px 15px;
			border-radius:5px;
			font-weight:500;
			transition:0.3s;
		}

		.btn-login:hover{
			background:#138496;
			transform:translateY(-2px);
			box-shadow:0 8px 20px rgba(0,0,0,0.15);
		}
	</style>
		</head>
	<body>

	<!-- form login -->
	<!-- Bagian foto/logo yang diambil dari tb_tentang folder img_tentang dengan nama database foto-sistem-->
	<div class="login-container">
		<div class="row">
			<div class="col-md-6 login-image">
				<img src="./img_tentang/<?php echo $r['foto_sistem'] ?>">
			</div>

			<!-- kolom untuk isi data login dan akan di kirim, cek, dan diproses melalui file cek_login_admin.php -->
			<div class="col-md-6 login-form">
				<h4 class="login-title">Login Admin</h4>
				<form action="cek_login_admin.php" method="POST">
					<div class="form-group">
						<label>Username</label>
						<input type="text" name="username" class="form-control" placeholder="Masukkan username" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<div class="input-group">
							<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Masukkan password" required>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" onclick="togglePassword()">
									<i id="toggleIcon" class="bi bi-eye-slash"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- <div class="form-group mt-2">
						<a href="lupa_password.php"> Lupa Password?</a>
					</div> -->
					<button type="submit" class="btn btn-login text-white float-right">Login</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Pesan eror jika username / password salah, serta mengecek apakah data yang diinput sesuai / tidak-->	
	<?php
	if(isset($_GET['error'])){

	    if($_GET['error']== "username"){
	        $pesan="Username tidak ditemukan!";
	        $warna="danger";
	    }
	    elseif($_GET['error']== "password"){
	        $pesan="Password yang anda masukkan salah!";
	        $warna="danger";
	    }
	?>
<div class="modal fade" id="errorModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg">
      <div class="modal-header bg-<?php echo $warna; ?> text-white">
        <h5 class="modal-title">
            <i class="bi bi-exclamation-triangle-fill"></i> Peringatan Login
        </h5>
        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body text-center">
        <p style="font-size:17px;"><?php echo $pesan; ?></p>
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-<?php echo $warna; ?>" data-dismiss="modal">
            Coba Lagi
        </button>
      </div>
    </div>
  </div>
</div>

<?php } ?>

	<!-- JS password jika klik icon mata -->
	<!-- fungsi togglePassword(): untuk jalankan fitur buka tutup icon mana pada password -->
	<script>
		function togglePassword() {
			var passwordInput = document.getElementById("inputPassword");
			var icon = document.getElementById("toggleIcon");

			if (passwordInput.type === "password") {
				passwordInput.type = "text";
				icon.classList.remove("bi-eye-slash");
				icon.classList.add("bi-eye");
			} else {
				passwordInput.type = "password";
				icon.classList.remove("bi-eye");
				icon.classList.add("bi-eye-slash");
			}
		}
	</script>
	</body>

	<!-- script JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>

	<!-- modal pesan eror login -->
	<script>
		$(window).on('load',function(){
		    $('#errorModal').modal('show');
		});
	</script>
	</html>

	<!-- code php -->
	<?php
		} else {
			echo '<script>window.history.go(-1)</script>';
		}
	?>