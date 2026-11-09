<?php
	session_start();
	include "koneksi.php";

	$email_session = $_SESSION['email'] ?? '';

	$sql = mysqli_query($koneksi, "
		SELECT * 
		FROM tb_tentang
	");

	$r = mysqli_fetch_array($sql);

	if ((empty($_SESSION['email'])) and (empty($_SESSION['password_angg']))) {
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title><?php echo $r['nama_nav'] ?></title>

	<!-- Bootstrap 5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Bootstrap Icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

	body{
		min-height:100vh;
		background:
		linear-gradient(rgba(10,15,25,.78), rgba(10,15,25,.78)),
		url('img/universitas-kristen-surakarta.jpg');
		background-size:cover;
		background-position:center;
		display:flex;
		align-items:center;
		justify-content:center;
		font-family:'Segoe UI',sans-serif;
		padding:20px;
	}

	/* CARD LOGIN */
	.login-container{
		width:100%;
		max-width:980px;
		background:rgba(255,255,255,0.08);
		backdrop-filter:blur(15px);
		border:1px solid rgba(255,255,255,0.12);
		border-radius:28px;
		overflow:hidden;
		box-shadow:0 25px 60px rgba(0,0,0,.35);
	}

	/* BAGIAN KIRI */
	.login-image{
		background:
		linear-gradient(135deg,#17a2b8,#0dcaf0);
		display:flex;
		flex-direction:column;
		align-items:center;
		justify-content:center;
		padding:70px 50px;
		color:white;
		text-align:center;
		position:relative;
	}

	.login-image::before{
		content:'';
		position:absolute;
		width:250px;
		height:250px;
		background:rgba(255,255,255,.12);
		border-radius:50%;
		top:-70px;
		right:-70px;
	}

	.login-image::after{
		content:'';
		position:absolute;
		width:180px;
		height:180px;
		background:rgba(255,255,255,.08);
		border-radius:50%;
		bottom:-50px;
		left:-50px;
	}

	.login-image img{
		width:220px;
		height:220px;
		object-fit:contain;
		padding:15px;
		border-radius:25px;
		border:6px solid rgba(255,255,255,.25);
		box-shadow:0 15px 35px rgba(0,0,0,.25);
		position:relative;
		z-index:2;
		background:white;
	}

	.login-image h2{
		margin-top:28px;
		font-weight:700;
		position:relative;
		z-index:2;
	}

	.login-image p{
		position:relative;
		z-index:2;
		opacity:.92;
		max-width:320px;
	}

	/* FORM LOGIN */
	.login-form{
		padding:65px 55px;
		background:white;
	}

	.login-title{
		font-size:34px;
		font-weight:700;
		color:#1f2937;
		margin-bottom:8px;
	}

	.login-subtitle{
		color:#6b7280;
		margin-bottom:35px;
	}

	/* INPUT */
	.form-label{
		font-weight:600;
		color:#374151;
		margin-bottom:8px;
	}

	.form-control{
		height:54px;
		border-radius:14px;
		border:1px solid #dbe2ea;
		padding-left:15px;
		font-size:15px;
		transition:.3s;
	}

	.form-control:focus{
		border-color:#17a2b8;
		box-shadow:0 0 0 4px rgba(23,162,184,.15);
	}

	.input-group-text{
		border-radius:0 14px 14px 0;
		background:#fff;
		border-left:none;
		cursor:pointer;
	}

	/* BUTTON */
	.btn-login{
		height:52px;
		border:none;
		border-radius:14px;
		background:linear-gradient(135deg,#17a2b8,#0dcaf0);
		font-weight:600;
		font-size:16px;
		color:white;
		transition:.3s;
		box-shadow:0 10px 25px rgba(13,202,240,.25);
	}

	.btn-login:hover{
		transform:translateY(-2px);
		box-shadow:0 15px 30px rgba(13,202,240,.35);
	}

	.footer-text{
		margin-top:25px;
		text-align:center;
		font-size:14px;
		color:#6b7280;
	}

	@media(max-width:768px){

		.login-image{
			display:none;
		}

		.login-form{
			padding:45px 30px;
		}

		.login-title{
			font-size:28px;
		}
	}

</style>
</head>

<body>

<!-- FORM LOGIN -->
<div class="login-container">

	<div class="row g-0">

		<!-- KIRI -->
		<div class="col-md-6 login-image">

			<img src="./img_tentang/<?php echo $r['foto_sistem'] ?>">

			<h2><?php echo $r['nama_nav'] ?></h2>

			<p>
				Selamat datang di sistem repository akademik.
				Silahkan login menggunakan akun anda.
			</p>

		</div>

		<!-- KANAN -->
		<div class="col-md-6 login-form">

			<h1 class="login-title">
				Login User
			</h1>
			<p class="login-subtitle">
				Masukkan email dan password untuk melanjutkan.
			</p>
			<form action="cek_login_user.php" method="POST">
				<div class="mb-4">
					<label class="form-label">
						Email
					</label>
					<input type="email" name="email" class="form-control" placeholder="Masukkan email" required>
				</div>
				<div class="mb-4">
					<label class="form-label">
						Password
				</label>
					<div class="input-group">
						<input type="password" name="password_angg" id="inputPassword" class="form-control border-end-0" placeholder="Masukkan password" required>
						<span class="input-group-text"
							onclick="togglePassword()">
							<i id="toggleIcon" class="bi bi-eye-slash"></i>
						</span>
					</div>
				</div>
				<div class="d-grid">
					<button type="submit"
						class="btn btn-login">
						<i class="bi bi-box-arrow-in-right"></i>
						Login
					</button>
				</div>
			</form>
			<div class="footer-text">
				© <?php echo date('Y') ?> <?php echo $r['nama_nav'] ?>
			</div>
		</div>
	</div>
</div>

<!-- MODAL ERROR -->
<?php
if(isset($_GET['error'])){

    if($_GET['error']== "email"){
        $pesan="Email tidak ditemukan!";
        $warna="danger";
    }
    elseif($_GET['error']== "password_angg"){
        $pesan="Password yang anda masukkan salah!";
        $warna="danger";
    }
?>
<div class="modal fade" id="errorModal_user" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content border-0 shadow-lg">
			<div class="modal-header bg-<?php echo $warna; ?> text-white">
				<h5 class="modal-title">
					<i class="bi bi-exclamation-triangle-fill"></i>
					Peringatan Login
				</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center">
	        	<p style="font-size:17px;"><?php echo $pesan; ?></p>
	      	</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-<?php echo $warna; ?>" data-bs-dismiss="modal"> Coba Lagi</button>
			</div>
		</div>
	</div>
</div>

<?php } ?>

<!-- SCRIPT PASSWORD -->
<script>
	function togglePassword(){
		var passwordInput = document.getElementById("inputPassword");
		var icon = document.getElementById("toggleIcon");
		if(passwordInput.type === "password"){
			passwordInput.type = "text";
			icon.classList.remove("bi-eye-slash");
			icon.classList.add("bi-eye");
		}else{
			passwordInput.type = "password";
			icon.classList.remove("bi-eye");
			icon.classList.add("bi-eye-slash");
		}
	}
</script>

<!-- BOOTSTRAP 5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- MODAL AUTO SHOW -->
<script>
	window.onload = function(){
		var errorModal_user = document.getElementById('errorModal_user');
		if(errorModal_user){
			var modal = new bootstrap.Modal(errorModal_user);
			modal.show();
		}
	}
</script>

</body>
</html>
<?php
	} else {
		echo '<script>window.history.go(-1)</script>';
	}
?>
