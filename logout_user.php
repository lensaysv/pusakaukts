<?php
session_start();

// hapus session admin
unset($_SESSION['email']);
unset($_SESSION['password_angg']);
unset($_SESSION['nama_user']);
unset($_SESSION['iduser']);
// unset($_SESSION['nama_sistem']);
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Logout</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<!-- Modal Logout -->
<div class="modal fade" id="logoutModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header bg-success text-white">
        <h5 class="modal-title">
          <i class="bi bi-check-circle-fill"></i>
          Logout Berhasil
        </h5>
      </div>

      <div class="modal-body text-center">
        <p style="font-size:17px;">
          Anda telah keluar dari sistem.
        </p>
      </div>

      <div class="modal-footer justify-content-center">
        <a href="index_user.php" class="btn btn-success">
          <i class="bi bi-box-arrow-in-right"></i> Login Kembali
        </a>
      </div>

    </div>
  </div>
</div>

<script>
$(window).on('load',function(){
    $('#logoutModal').modal('show');
});
</script>

</body>
</html>