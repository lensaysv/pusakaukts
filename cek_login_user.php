<?php
include "koneksi.php";
session_start();

$email         = mysqli_real_escape_string($koneksi, $_POST['email']);
$password_angg = md5($_POST['password_angg']);

$query = mysqli_query($koneksi, "SELECT * FROM tb_user WHERE email='$email'");
$cek = mysqli_num_rows($query);

if($cek == 0){

    // email tidak ditemukan
    header("Location:index_user.php?error=email");

}else{

    // ini usernamenya ada, lalu akan cek passwordnya
    $r = mysqli_fetch_array($query);

    if($r['password_angg'] != $password_angg){

        // password salah
        header("Location:index_user.php?error=password_angg");

    }else{

        // login berhasil
        $_SESSION['namauser']    = $r['nama_user'];
        $_SESSION['email']       = $r['email'];
        $_SESSION['iduser']      = $r['id_user'];

        header("Location:dashboard_user.php?hal=beranda");
    }
}
?>