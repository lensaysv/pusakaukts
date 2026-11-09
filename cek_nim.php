<?php
include 'koneksi.php';

if(isset($_POST['nim'])){

    $nim = mysqli_real_escape_string($koneksi, $_POST['nim']);

    $query = mysqli_query($koneksi,
        "SELECT * FROM tb_laporan WHERE nim_mhs='$nim'"
    );

    if(mysqli_num_rows($query) > 0){

        echo "duplicate";

    } else {

        echo "available";
    }
}
?>