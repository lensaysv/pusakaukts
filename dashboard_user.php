<?php
  include "koneksi.php";
  date_default_timezone_set('Asia/Jakarta');
  session_start();
  if (!isset($_GET['hlm'])) {
      header("Location: dashboard_user.php?hlm=beranda");
      exit;
  }

if(empty($_SESSION['email']) and empty($_SESSION['password_angg'])) {
  // --- TAMPILAN AKSES DITOLAK (BOOTSTRAP 5) ---
  echo '<!doctype html>
  <html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  </head>
  <body class="bg-light d-flex align-items-center justify-content-center" style="height: 100vh; margin: 0;">
    <div class="card shadow border-0 text-center p-4" style="max-width: 400px; width: 100%;">
      <div class="card-body">
        <i class="bi bi-shield-lock text-danger" style="font-size: 3rem;"></i>
        <h2 class="card-title mt-3 text-danger">Akses Ditolak</h2>
        <p class="card-text text-muted">Maaf, silahkan melakukan login terlebih dahulu.<br>Sesi Anda telah habis.</p>
        <a href="index_user.php" class="btn btn-primary w-100">
          <i class="bi bi-box-arrow-in-right"></i> Login Kembali
        </a>
      </div>
    </div>
  </body>
  </html>';
} else {
?>

<!doctype html>
<html lang="en">
  <head>
    <title><?php echo ucwords(str_replace('_', ' ', $_GET['hlm'])) ?></title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <!-- LINK DATA TABEL -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.3.8/css/dataTables.dataTables.css">

    <style>
      /* Styling untuk DataTables Buttons agar lebih rapi */
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
        background: #0d6efd !important; /* Warna Biru Bootstrap saat hover */
        color: #fff !important;
      }

      .dt-button:focus,
      .dt-button:active {
        background: #0a58ca !important;
      }
    </style>
  </head>
  <body>

      <!-- PHP Data User -->
      <?php
        $email_session = $_SESSION['email'];
        $sql = mysqli_query($koneksi, "SELECT * FROM tb_user JOIN tb_tentang WHERE tb_user.email = '$email_session'");
        $r = mysqli_fetch_array($sql);
      ?>   

      <!-- NAVBAR UTAMA (POSISI TENGAH, WARNA BIRU) -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm fixed-top">
        <div class="container">
          <!-- Brand / Logo -->
          <a class="navbar-brand d-flex align-items-center fw-bold" href="dashboard_user.php?hlm=beranda">
            <img src="./img_tentang/<?php echo $r['foto_sistem'] ?>" height="40" width="40" class="me-2" alt="Logo">
            <?php echo $r['nama_nav'] ?>
          </a>

          <!-- Toggler Mobile -->
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <!-- Navbar Menu Content -->
          <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Menu Navigasi (Tengah menggunakan mx-auto) -->
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link <?php echo (($_GET['hlm'] == 'beranda') or ($_GET['hlm'] == 'hasil_pencarian') or ($_GET['hlm'] == 'lihat_detail')) ? "active":"" ?>" href="dashboard_user.php?hlm=beranda">
                  <i class="bi bi-house-door me-1"></i> Beranda
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link <?php echo ($_GET['hlm'] == 'informasi') ? "active":"" ?>" href="dashboard_user.php?hlm=informasi">
                  <i class="bi bi-info-circle me-1"></i> Informasi
                </a>
              </li>
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle 
                  <?php echo (in_array($_GET['hlm'], ['jenis_dokumen','dokumen_fakultas','dokumen_prodi', 'per_tahun'])) ? 'active' : ''; ?>"href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      <i class="bi bi-bar-chart-line me-1"></i>
                      Statistik
                  </a>
                  <ul class="dropdown-menu shadow border-0">
                      <li>
                          <a class="dropdown-item"
                             href="dashboard_user.php?hlm=jenis_dokumen">
                              <i class="bi bi-pie-chart me-2"></i>
                              Jenis Dokumen
                          </a>
                      </li>
                      <li>
                          <a class="dropdown-item"
                             href="dashboard_user.php?hlm=dokumen_fakultas">
                              <i class="bi bi-file-earmark-text"></i>
                              Dokumen per Fakultas
                          </a>
                      </li>
                      <li>
                          <a class="dropdown-item"
                             href="dashboard_user.php?hlm=dokumen_prodi">
                              <i class="bi bi-file-earmark-text"></i>
                              Dokumen per Prodi
                          </a>
                      </li>
                      <li>
                          <a class="dropdown-item"
                             href="dashboard_user.php?hlm=per_tahun">
                              <i class="bi bi-calendar-date me-2"></i>
                              Dokumen per Tahun
                          </a>
                      </li>
                  </ul>
              </li>
            </ul>
            <!-- User Dropdown (Kanan) -->
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center text-white fw-bold" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  User
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="navbarDropdown">
                  <li>
                    <a class="dropdown-item" href="#">
                      <div class="d-flex align-items-center">
                        <div>
                          <h6 class="mb-0 fw-bold"><?php echo $r['nama_user'] ?></h6>
                          <small class="text-muted"><i class="bi bi-clock"></i> Pkl <?php echo date('H:i') ?> WIB</small>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="dashboard_user.php?hlm=user"><i class="bi bi-gear"></i> Setting</a></li>
                  <li><a class="dropdown-item text-danger" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <!-- Modal Konfirmasi Logout (Bootstrap 5 Syntax) -->
      <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title" id="logoutModalLabel">
                <i class="bi bi-box-arrow-right"></i> Konfirmasi Logout
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
              <p style="font-size:17px;">Apakah anda yakin ingin keluar dari sistem?</p>
            </div>
            <div class="modal-footer justify-content-center">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
              <a href="logout_user.php" class="btn btn-danger">Ya</a>
            </div>
          </div>
        </div>
      </div>

    <!-- KONTEN UTAMA -->
    <!-- padding-top: 80px untuk memberi jarak agar tidak tertutup navbar fixed-top -->
    <div class="container-fluid p-4" style="margin-top: 80px; min-height: 100vh;">
        
        <?php
          if (isset($_GET['hlm'])) {

            switch ($_GET['hlm']) {
              case 'beranda':
               include "page_user/page_user_beranda/beranda.php";
               break;

              case 'hasil_pencarian':
                include "page_user/page_user_beranda/hasil_pencarian.php";
                break;

              case 'lihat_detail':
                include "page_user/page_user_beranda/lihat_detail.php";
                break;

              case 'informasi':
                include "page_user/page_user_informasi/informasi.php";
                break;

              case 'jenis_dokumen':
                include "page_user/page_user_statistik/jenis_dokumen.php";
                break;

              case 'dokumen_fakultas':
                include "page_user/page_user_statistik/dokumen_fakultas.php";
                break;

              case 'dokumen_prodi':
                include "page_user/page_user_statistik/dokumen_prodi.php";
                break;

              case 'per_tahun':
                include "page_user/page_user_statistik/per_tahun.php";
                break;
                
              case 'export_file':
                include "page_user/page_user_statistik/export_file.php";
                break;

              case 'user':
                include "page_user/page_user/user.php";
                break;

              default:
              echo '<div class="d-flex justify-content-center align-items-center" style="height:70vh;">
                <div class="text-center">
                  <div class="mb-4">
                    <i class="bi bi-exclamation-triangle-fill text-warning" style="font-size:5rem;"></i>
                  </div>
                  <h1 class="display-4 fw-bold">Oops!</h1>
                  <h4 class="mb-3">Halaman Tidak Ditemukan</h4>
                  <p class="text-muted fs-5">Maaf, halaman yang kamu cari tidak tersedia.</p>
                  <a href="dashboard_user.php?hlm=beranda" class="btn btn-primary btn-lg mt-3 px-4">
                    <i class="bi bi-arrow-left"></i> Kembali ke Beranda
                  </a>
                </div>
              </div>';
            }
          } 
        ?>

    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Tabel - Datatabels -->
    <script src="https://cdn.datatables.net/2.3.8/css/dataTables.dataTables.css"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.3.8/js/dataTables.js"></script>
    <!-- script buat tampilan data tabel biasa -->
    <script src="https://cdn.datatables.net/2.3.7/js/dataTables.js"></script>
    <!-- script untuk tabel tampilan  -->
    <script>
    //     new DataTable('#tahun', {
    //     layout: {
    //         topStart: 'info',
    //         bottom: 'paging',
    //         bottomStart: null,
    //         bottomEnd: null
    //     }
    // });
      $(document).ready(function() {
        $('#tahun').DataTable({
            searching: false,
            lengthChange: false,
            info: false,
            paging: false
        });
    });
    </script>
  </body>
</html>

<?php
  }
?>