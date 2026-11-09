<?php
include "koneksi.php";
session_start();

$username = mysqli_real_escape_string($koneksi, $_POST['username']);
$password = md5($_POST['password']);

$query = mysqli_query($koneksi, "SELECT * FROM admin_tb WHERE username='$username'");
$cek = mysqli_num_rows($query);

if($cek == 0){

    // username tidak ditemukan
    header("Location:index.php?error=username");

}else{

    // ini usernamenya ada, lalu akan cek passwordnya
    $r = mysqli_fetch_array($query);

    if($r['password'] != $password){

        // password salah
        header("Location:index.php?error=password");

    }else{

        // login berhasil
        $_SESSION['nama_sistem'] = $r['nama_sistem'];
        $_SESSION['namaadmin']   = $r['nama_admin'];
        $_SESSION['username']    = $r['username'];
        $_SESSION['idadmin']     = $r['id_admin'];

        header("Location:dashboard.php?hal=beranda");
    }
}
?>