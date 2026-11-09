<?php

//deklasrasi variabel
$server 	= "localhost";
$username   = "root";
$password 	= "";
$db_name 	= "repoukts_db";    

$koneksi 	= mysqli_connect($server, $username, $password, $db_name);

if($koneksi) {
    // echo "Koneksi Berhasil!";
} else {
    echo "Koneksi Gagal!";
}

?>
