<?php
  include "koneksi.php";
date_default_timezone_set('Asia/Jakarta');
session_start();
if(empty($_SESSION['username']) and empty($_SESSION['password'])) {
  echo '<!doctype html>
  <html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      body { font-family: "Segoe UI", Roboto, sans-serif; background: #f8f9fa; height: 100vh; display: flex; align-items: center; justify-content: center; margin: 0; }
      .error-box { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); text-align: center; border-top: 5px solid #dc3545; }
      .error-box h2 { color: #dc3545; margin-bottom: 10px; }
      .error-box p { color: #6c757d; margin-bottom: 20px; }
      .btn-login { display: inline-block; background-color: #17a2b8; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; transition: 0.3s; }
      .btn-login:hover { background-color: #138496; }
    </style>
  </head>
  <body>
    <div class="error-box">
      <h2>Akses Ditolak</h2>
      <p>Maaf, silahkan melakukan login terlebih dahulu.<br>Anda telah keluar dari sistem atau sesi telah habis.</p>
      <a href="index.php" class="btn-login">Login Kembali</a>
      <br><br>
    </div>
  </body>
  </html>';
} else {
?>

<!-- php grafik laporan bentuk chart -->
<?php
  // grafik buat kategori laporan magang dan skripsi
    $kategori_laporan = mysqli_query($koneksi, "SELECT DISTINCT jenis_laporan FROM tb_laporan");
    while ($r = mysqli_fetch_array($kategori_laporan)) {
    $jenis_laporan[] = $r['jenis_laporan'];
    $jml_laporan = mysqli_query($koneksi, "SELECT COUNT(id_laporan) AS total FROM tb_laporan WHERE jenis_laporan = '$r[jenis_laporan]'");
    $l = mysqli_fetch_array($jml_laporan);
    $total_laporan[] = $l['total'];
  }
?>

<!doctype html>
<html lang="en">
  <head>
    <title><?php echo ucwords(str_replace('_', ' ', $_GET['hal'])) ?></title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS VERSION 4.0-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Bootstrap CSS ICON-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    
    <!-- Script texareanya pake cdn.tiny -->
    <script src="https://cdn.tiny.cloud/1/b7t3baz442wmghk2rfbsavebemdcsnztw49mcak20y05hxrr/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>

    <!-- script chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.5.0"></script>
    <script>
        tinymce.init({
      selector: '#mytextarea'
    });
    </script>

    <!-- LINK DATA TABEL -->

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.3.8/css/dataTables.dataTables.css">

  </head>
  <!-- warna hover sidebar -->
    <style>
    .nav-pills .nav-link.active {
      background-color: #17A2B8 !important;
      color: white !important;
    }

    /* css button buat cetaknya */
    .dt-buttons {
      display: inline-flex;
      border-radius: 5px;
      overflow: hidden;
      border: 1px solid #ddd;
      background: #fff;
    }

    .dt-button {
      border: none !important;
      margin: 0 !important;
      padding: 8px 18px !important;
      background: transparent !important;
      color: #555 !important;
      transition: 0.2s;
    }

    .dt-button:not(:last-child) {
      border-right: 1px solid #eee !important;
    }

    .dt-button:hover {
      background: #28a745 !important;
      color: #fff !important;
    }

    .dt-button:focus,
    .dt-button:active {
      background: #007bff !important;
    }
    </style>
  <body>
        <!-- Untuk PHP -->
      <?php
        $sql = mysqli_query($koneksi, "SELECT * FROM admin_tb, tb_tentang");

        $r = mysqli_fetch_array($sql);
      ?>   
      <div class="container-fluid mt-1">
       <div class="row">
        <div class="col-lg-12 py-2 bg-info fixed-top px-4">
          <div class="d-flex align-items-center px-4"></div>
          <img src="./img_tentang/<?php echo $r['foto_sistem'] ?>" height="50" width="50"class="logo-img" title="Logo UKTS">

          <!-- TAMBAHAN NAMA SISTEM -->
          <h4 class="d-inline-block text-white align-middle brand-title mb-1 ml-2 font-weight-bold"><?php echo $r['nama_nav'] ?></h4>

          <div class="dropdown float-right mt-1">
            <button class="btn btn-light text-info font-weight-bold dropdown-toggle mr-2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Admin
            </button>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">
                <div class="media">
                <img class="align-self-center mr-3" src="././img_tentang/<?php echo $r['foto_sistem'] ?>" height="50" width="50" alt="Generic placeholder image">
                <div class="media-body">
                <h5 class="mt-0"><?php echo $r['nama_admin'] ?></h5>
                <small><p class="mb-0"><i class="bi bi-clock"></i> Pkl <?php echo date('H:i') ?> WIB</p></small>
                </div>
              </div>
              </a>
              <a class="dropdown-item" href="dashboard.php?hal=admin"><i class="bi bi-gear"></i> Setting</a>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"><i class="bi bi-box-arrow-right"></i> Logout</a>
            </div>
          </div>
        </div>
      </div>

      <!-- pop up longout -->
      <!-- Modal Konfirmasi Logout -->
      <div class="modal fade" id="logoutModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">

            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title">
                <i class="bi bi-box-arrow-right"></i> Konfirmasi Logout
              </h5>
              <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body text-center">
              <p style="font-size:17px;">
                Apakah anda yakin ingin keluar dari sistem?
              </p>
            </div>

            <div class="modal-footer justify-content-center">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">
                Batal
              </button>

              <a href="logout.php" class="btn btn-danger">
                Ya
              </a>
            </div>

          </div>
        </div>
      </div>

    <!-- Menu Sidebar -->
    <div class="row mt-4" style="padding-top: 50px;">
      <div class="col-lg-2 position-fixed vh-100">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
          <a class="nav-link <?php echo ($_GET['hal'] == 'beranda') ? "active":"" ?>" href="dashboard.php?hal=beranda">Beranda</a>
          
          <a class="nav-link <?php echo (($_GET['hal'] == 'laporan') or ($_GET['hal'] == 'tambah_laporan') or ($_GET['hal'] == 'edit_laporan') or ($_GET['hal'] == 'cetak_data')) ? "active":"" ?>" href="dashboard.php?hal=laporan">Laporan Akademis</a>
          
          <a class="nav-link <?php echo (($_GET['hal'] == 'kategori_laporan') or ($_GET['hal'] == 'fakultas_teknik') or ($_GET['hal'] == 'fakultas_teologi') or ($_GET['hal'] == 'fakultas_ekonomi') or ($_GET['hal'] == 'dokumen_skripsi') or ($_GET['hal'] == 'dokumen_magang')) ? "active":"" ?>" href="dashboard.php?hal=kategori_laporan">Kategori Laporan</a>
          
          <a class="nav-link <?php echo (($_GET['hal'] == 'pengguna_sistem') or ($_GET['hal'] == 'tambah_pengguna')) ? "active":"" ?>" href="dashboard.php?hal=pengguna_sistem"> Pengguna</a> 
          
          <a class="nav-link <?php echo ($_GET['hal'] == 'tentang') ? "active":"" ?>" href="dashboard.php?hal=tentang">Tentang</a>

          <!-- <a class="nav-link <?php echo (($_GET['hal'] == 'cetak_laporan') or ($_GET['hal'] == 'cetak')) ? "active":"" ?>" href="dashboard.php?hal=cetak_laporan">Cetak</a> -->
        </div>
      </div>
      <div class="col-lg-10 offset-2">
        
        <?php
          if (isset($_GET['hal'])) {
            switch ($_GET['hal']) {
              case 'beranda':
               include "page/page_beranda/beranda.php";
               break;

              case 'kategori_laporan':
                include "page/page_kategorilaporan/kategori_laporan.php"; 
                break;

              case 'dokumen_skripsi':
                include "page/page_kategorilaporan/dokumen_skripsi.php";
                break;

              case 'dokumen_magang':
                include "page/page_kategorilaporan/dokumen_magang.php";
                break;

              case 'fakultas_teknik':
                include "page/page_kategorilaporan/fakultas_teknik.php";
                break;

              case 'fakultas_teologi':
                include "page/page_kategorilaporan/fakultas_teologi.php";
                break;

              case 'fakultas_ekonomi':
                include "page/page_kategorilaporan/fakultas_ekonomi.php";
                break;

              case 'laporan';
                include "page/page_laporan/laporan.php";
                break;

              case 'tambah_laporan';
                include "page/page_laporan/tambah_laporan.php";
                break;

              case 'edit_laporan':
                include "page/page_laporan/edit_laporan.php";
                break;

              case 'hapus_laporan';
                include "page/page_laporan/hapus_laporan.php";
                break;

              case 'pengguna_sistem':
                include "page/page_tambahanggota/pengguna_sistem.php";
                break;

              case 'tambah_pengguna':
                include "page/page_tambahanggota/tambah_pengguna.php";
                break;

              // case 'edit_pengguna':
              //   include "page/page_tambahanggota/edit_pengguna.php";
              //   break;

              case 'hapus_anggota':
                include "page/page_tambahanggota/hapus_anggota.php";
                break;

              case 'tentang':
                include "page/page_tentang/tentang.php";
                break;

              case 'admin':
                include "page/page_admin/admin.php";
                break;

              default:
              echo '<div class="d-flex justify-content-center align-items-center" style="height:70vh;">
                <div class="text-center">
                  <div class="mb-2">
                    <i class="bi bi-exclamation-triangle-fill text-warning" style="font-size:70px;"></i>
                  </div>
                  <h1 class="display-4 font-weight-bold">Oops!</h1>
                  <h4 class="mb-2">Halaman Tidak Ditemukan</h4>
                  <p class="text-muted">Maaf, halaman yang kamu cari tidak tersedia.</p>
                  <a href="dashboard.php?hal=beranda" class="btn btn-info mt-3">
                    <i class="bi bi-arrow-left"></i> Kembali ke Beranda
                  </a>
                </div>
              </div>';
            }
          } else {
              header("location:dashboard.php?hal=beranda");
          }
        ?>

      </div>
    </div>

    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- script buat tampilan data tabel cetak -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.3.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/select/3.1.3/js/dataTables.select.js"></script>
    <script src="https://cdn.datatables.net/select/3.1.3/js/select.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.html5.min.js"></script>
      <!-- script untuk tabel tampilan  -->
       <script>
        new DataTable('#example_cetak', {
        layout: {
          topStart: {
            buttons: [
                // Tombol Export Excel (Semua Data)
                { 
                    extend: 'excelHtml5', 
                    text: 'Export All (Excel)',
                    exportOptions: { modifier: { selected: null } }
                },

                // Tombol PDF (Semua Data)
                { 
                    extend: 'pdfHtml5', 
                    text: 'Export All (PDF)',
                    messageTop: 'Data dicetak pada tanggal: ' + new Date().toLocaleDateString(), 
                    exportOptions: { modifier: { selected: null } } 
                },

                // Tombol Excel
                { 
                    extend: 'excelHtml5', 
                    text: 'Excel Selected',
                    exportOptions: { modifier: { selected: true } } 
                },
                
                // Tombol PDF
                { 
                    extend: 'pdfHtml5', 
                    text: 'PDF Selected',
                    messageTop: 'Data dicetak pada tanggal: ' + new Date().toLocaleDateString(), 
                    exportOptions: { modifier: { selected: true } } 
                }
            ]
        }
    },
    select: true
});
      </script>

    <!-- script buat tampilan data tabel biasa -->
    <script src="https://cdn.datatables.net/2.3.7/js/dataTables.js"></script>
    <!-- script untuk tabel tampilan  -->
    <script>
          $(document).ready(function() {
      var t = $('#example').DataTable( {
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        },
      ],
        "order": [[ 1, 'asc' ]]
      });

      t.on('order.dt search.dt', function () {
        let i = 1;

        t.cells(null, 0, { search: 'applied', order: 'applied' }).every(function (cell) {
          this.data(i++);
        });
      }).draw();
    });
    </script>

   
    <!-- Grafik chart laporan -->
    <script>
      const x = <?php echo json_encode($jenis_laporan) ?>;
      const y = <?php echo json_encode($total_laporan) ?>;      
      const warna_bar = [
        "#07253c",
        "#F77F00"
      ];

      const ctx = document.getElementById('grafiklaporan');

      new Chart(ctx, {
        type: "doughnut",
        data: {
          labels: x,
          datasets: [{
            backgroundColor: warna_bar,
            data: y
          }]
        },
        options: {
          plugins: {
            legend: {display:true},
            title: {
              display: true,
              text: "Jumlah Data Berdasarkan Jenis Laporan",
              font: {size:15}
            }
          }
        }
      });
    </script>
  </body>
</html>

<?php
  }
?>