-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2026 pada 04.32
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repoukts_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_tb`
--

CREATE TABLE `admin_tb` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_tb`
--

INSERT INTO `admin_tb` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'ADMIN PERPUS UKTS', 'uktsrepository', '5d506d3dd23e9bea84881be7e497c076');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `id_dosen` int(11) NOT NULL,
  `nm_dosen` varchar(100) NOT NULL,
  `id_fakultas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_dosen`
--

INSERT INTO `tb_dosen` (`id_dosen`, `nm_dosen`, `id_fakultas`) VALUES
(1, 'Omega Rimba Gemilang, S.Kom., M.Kom.', 1),
(2, 'Retno Palupi, S.Si., M.Cs.', 1),
(3, 'SM Santi Winarsih, S.Kom., M.Cs.', 1),
(4, 'Maria Atik Sunarti Ekowati, S.T., M.Kom.', 1),
(5, 'Bambang Kristiawan, S.Si., M.Sc.', 1),
(6, 'Adi Nugroho, S.P., S.Kom., M.T.', 1),
(7, 'Agus Winarno W., S.T.', 1),
(8, 'Agerippa Yanuranda Krismani, S.T., M.Sc.', 1),
(9, 'YB Dwi Setianto, S.T., M.Cs.', 1),
(10, 'Handoko, M.Kom.', 1),
(11, 'Dra. Cicik Sudaryantiningsih, M.Si', 1),
(12, 'Elvis Umbu Lolo, S.T., M.T.', 1),
(13, 'Sri Wening, S.PAK., M.Th.', 2),
(15, 'Wibisono, S.Th., M.Pd.K.', 2),
(16, 'Dr. Justin Niaga Siman Juntak, S.Si.Teol., M.Pd.K.', 2),
(17, 'Pdt. Budi Widiyanto, S.Ag.', 2),
(18, 'Pdt. Kristriyanto, M.Th.', 2),
(19, 'Pdt. Matius Susanto Budi, S.Th.', 2),
(20, 'Mardiyanto, S.PAK., M.Th.', 2),
(21, 'Eko Pambudi, S.PAK., M.Th.', 2),
(22, 'Magdalena Elly K., S.Pd.K., M.Si.', 2),
(23, 'Setyo Budi, S.Pd., S.Th., M.Th.', 2),
(24, 'Dorkasih YK, S.Si., M.A.', 2),
(25, 'Dyah Ayu Puri Palupi, S.E., M.M.', 3),
(26, 'Lyna Raharjo, S.E., M.M.', 3),
(27, 'Mujiyono, S.E., M.Si.', 3),
(28, 'Kristyana Dananti, S.E., M.Si.', 3),
(29, 'Mardanung Patrno Cahjono, S.E., M.Sc., Ak.', 3),
(30, 'Hernawati Pramesti, S.E., M.Si., Ak.', 3),
(31, 'Magdalena Nany, S.E., M.Si., Ak.', 3),
(32, 'Bambang Hadinugroho, S.E., M.Si.', 3),
(33, 'Endang Satyawati, S.E., M.Si., Ak.', 3),
(34, 'Indah Handaruwati, S.E., M.M.', 3),
(35, 'Basuki Nugroho, S.E., M.Si.', 3),
(36, 'Dian Paula April Juwan, S.Fil., M.Phil.', 2),
(37, 'Dr. Kristriyanto, S.Th., M.Th.', 2),
(38, 'Eliana Setyanti,S.Psi.,M.Si', 2),
(39, 'Sabda Wahyudi, S.E.,M.Th', 2),
(40, 'Dr. Uri Christian Sakti Labeti', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_fakultas`
--

CREATE TABLE `tb_fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nm_fakultas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_fakultas`
--

INSERT INTO `tb_fakultas` (`id_fakultas`, `nm_fakultas`) VALUES
(1, 'Teknik'),
(2, 'Teologi'),
(3, 'Ekonomi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_laporan` int(11) NOT NULL,
  `nama_mhs` varchar(100) NOT NULL,
  `nim_mhs` varchar(30) NOT NULL,
  `judul_laporan` varchar(250) NOT NULL,
  `abstrak_laporan` text NOT NULL,
  `tahun` year(4) NOT NULL,
  `jenis_laporan` enum('Magang','Skripsi') NOT NULL,
  `status` enum('Tersedia','Tidak Tersedia') NOT NULL,
  `file` varchar(150) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_laporan`
--

INSERT INTO `tb_laporan` (`id_laporan`, `nama_mhs`, `nim_mhs`, `judul_laporan`, `abstrak_laporan`, `tahun`, `jenis_laporan`, `status`, `file`, `id_fakultas`, `id_prodi`) VALUES
(8, 'HANNY HARTANTO', 'B2.20.172.001', 'ANALISIS DAN RANCANG BANGUN APLIKASI e-PAYROLL SKPNK BERBASIS WEB DI SEKOLAH KRISTEN PELITA NUSANTARA KASIH SURAKARTA MENGGUNAKAN FRAMEWORK CODEIGNITE', '', 2017, 'Magang', 'Tersedia', '2015464729_Hanny Hartanto B2.20.172.001 (Laporan Kerja Praktik).pdf', 1, 1),
(14, 'NATANAEL CHRISTIAN ADITYA', 'B220121011', 'LAPORAN KERJA PRAKTEK PEMBUATAN WEBSITE GKI KABANGAN SOLO', '', 2016, 'Magang', 'Tersedia', '1185037471_Natanael Christian Aditya B22012011 Laporan Kerja Praktek.pdf', 1, 1),
(37, 'JORELAN NUNUMETE', 'B220101007', 'ANALISA DAN PEMASANGAN JARINGAN TELEPON DAN INTERNET SPEEDY', '', 2013, 'Magang', 'Tersedia', '1150122539_Jorelan Nunumete b2.pdf', 1, 1),
(70, 'TOMAS RATRIYANA', 'B2.08.02', 'PROGRAM BANTU GAME EDUKASI UNTUK PLAYGROUP DAN TAMAN KANAK-KANAK DENGAN MENGGUNAKAN ADOBE FLASH CS3 PROFESSIONAL (STUDI KASUS TK KRISTEN KARTASURA)', '<p style=\"text-align: justify;\">Teknologi Informasi di Indonesia saat ini sudah merambah ke dunia&nbsp;pendidikan. Tidak terkecuali di dunia pendidikan dasar, yang juga memanfaatkan&nbsp;komputer sebagai media pembelajaran. Banyak anak yang menggemari game,&nbsp;bahkan ada anak yang menjadi lupa belajar, karena terlalu asik bermain game.</p>\r\n<p style=\"text-align: justify;\">Dalam kasus ini memanfaatkan game sebagai media pembelajaran bagi anak-anak playgroup dan taman kanak - kanak. Dengan menggunakan Adobe Flash&nbsp;CS3 Professional, dan actionscript 2, dibuat suatu game pembelajaran yang dapat&nbsp;membantu anak - anak dalam belajar hal - hal dasar, seperti mengenal huruf,&nbsp;angka, warna, profesi, nama binatang, berhitung dan puzzle. Aplikasi ini&nbsp;dirancang dan dibangun dengan memanfaatkan elemen - elemen multimedia,&nbsp;yaitu: gambar, teks, dan suara yang dibuat semenarik mungkin, agar anak - anak&nbsp;lebih tertarik dan semangat dalam belajar.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Dengan game berbasis edukasi ini, diharapkan anak - anak bisa&nbsp;mendapatkan bekal dan pengetahuan yang cukup, sehingga bisa membantu anak&nbsp;dalam belajar. Dengan game ini, anak - anak bisa belajar sambil bermain,&nbsp;sehingga anak - anak bisa lebih cepat menyerap materi yang ada dalam game ini.</p>', 2011, 'Skripsi', 'Tersedia', '378737855_TOMAS RATRIYANA B2.pdf', 1, 1),
(71, 'Ifan Saputra Wibisono', 'B220131003', 'LAPORAN TUGAS AKHIR ANALISA DAN RANCANG BANGUN APLIKASI WEB MOBILE JASA CUCI MOTOR DAN MOBIL DENGAN METODE WATERFALL', '<p style=\"text-align: justify;\">Perkembangan teknologi sistem berbasis komputerisasi pada masa sekarang ini sudah sangat cepat dan maju, salah satunya yaitu pada sistem administrasi. Hal ini juga berlaku pada bidang Jasa Cuci Motor/Mobil yang membutuhkan pengelolaan administrasi berbasis komputerisasi atau yang dikenal dengan Sistem Informasi Jasa Cuci Motor/Mobil. Hal ini mendorong untuk melakukan berbagai macam strategi guna menarik pelanggan tidak hanya dari segi pelayanan jasanya tapi juga dari segi pelayanan administrasinya karena keduanya merupakan satu sistem yang tidak dapat dipisahkan.</p>\r\n<p style=\"text-align: justify;\">Melihat kondisi tersebut, perlu adanya perancangan sistem administrasi yang terkomputerisasi. Hal ini untuk meningkatkan keunggulan kompetitif Penyedia Jasa Cuci Motor/Mobil dalam memberikan pelayanan yang terbaik bagi pelanggan tidak hanya dari segi pelayanan jasa namun juga dari segi pelayanan administrasi agar pelanggan semakin puas terhadap pelayanan yang diberikan Penyedia Jasa Cuci Motor/Mobil.</p>\r\n<p style=\"text-align: justify;\">Penulis membuat sebuah Sistem Informasi Jasa Cuci Motor/Mobil yang dapat&nbsp;memudahkan admin dalam pengolahan data transaksi dan menghasilkan suatu informasi yang&nbsp;berkualitas dan berguna bagi customer juga bagi pemilik atau pimpinan dalam memperoleh&nbsp;berbagai laporan sehingga dapat membantu dalam pengambılan keputusan. Dalam&nbsp;pengembangan Sistem in: penulis menggunakan metode Waterfal! dengan tahapan analisis,&nbsp;desain, pengkodean, pengujian dan pemeliharaan dan sudah diuji cobakan di Monday Jasa&nbsp;Cuci Motor/Mobil.</p>', 2017, 'Skripsi', 'Tersedia', '1083226367_Ifan Saputra W. B220131003.pdf', 1, 1),
(72, 'SEPTIANINGSIН', 'A1. 2012.1006', 'PENGARUH PENERAPAN DISIPLIN LEMBAGA SEKOLAH TERHADAP KUALITAS KOMPETENSI GURU KRISTEN DI SEKOLAH MENENGAH KEJURUAN KRISTEN 2 SURAKARTA', '<p style=\"text-align: justify;\">Septianingsih, NIM: A1. 2012. 1006. Skripsi: Pengaruh Penerapan Disiplin Lembaga<br>Sekolah Terhadap Kualitas Kompetensi Guru Kristen Di Sekolah Menengah Kejuruan<br>Kristen 2 Surakarta. Fakultas Teologi, Program Studi Pendidikan Agama Kristen Universitas<br>Kristen Surakarta.<br>Melihat bahwa kedisiplinan merupakan hal penting yang harus dilaksanakan dalam<br>lembaga sekolah. Agar kedisiplinan dapat terwujud maka membutuhkan peran guru sebagai pelaku pendidikan untuk melaksanakan setiap peraturan yang sudah dibuat, agar tujuan<br>sekolah dapat tercapai. Tercapainya tujuan sekolah dipengaruhi oleh perilaku disiplin yang dilakukan oleh guru dalam melaksanakan tugas dan tanggung jawabnya. Guru memiliki<br>tanggungjawab untuk mengajarkan kepada siswa tentang nilai-nilai yang baik. Oleh karena itu guru harus berpedoman pada peraturan yang tertuang dalam kode etik profesionalisme<br>guru. Dengan pedoman tersebut seorang guru diharapkan mampu melaksanakan tugas keguruan dengan baik sesuai kompetensi yang harus dimiliki oleh guru. Kompetensi itu diantaranya kompetensi professiona!, kompetensi pedagogik, kompetensi sosial dan kompetensi kepribadian. Pelaksanaan tugas keguruan membutuhkan sebuah kedisiplinan, karena dengan kedisiplinan akan meningkatkan kualitas guru sebagai pendidik dan meningkatkan mutu sekolah. Penerapan disiplin merupakan tanggung jawab sebagai seorang guru yang professional dalam mengemban tugas pendidikan. Bagi seorang guru Kristen dalam mengemban tugas tidak hanya bertanggung jawab kepada lembaga tetapi juga sebagai jawaban terhadap panggilan sebagai guru. Oleh sebab itu guru Kristen harus mampu untuk meneladani Kristus dalam melaksanakan tugas tanggung jawabnya dan mentransfer kepada siswa.<br>Penelitian ini bertujuan mengetahui sikap guru dalam melaksanakan tanggung jawab kedisiplinan yang ditetapkan oleh lembaga sekolah dan mengetahui penerapan kedisiplinan di SMK Kristen 2 Surakarta serta membuktikan pengaruh penerapan disiplin lembaga sekolah terhadap kualitas kompetensi guru Kristen di SMK Kristen 2 Surakarta. Manfaat yang diperoleh dalam penelitian ini ialah untuk memberikan wawasan bagi guru SMK Kristen 2<br>Surakarta dalam menerapkan kedisiplinan, mengajak guru Kristen untuk mendalami kompetensi serta memberikan masukan bagi sekolah untuk menerapkan kedisiplinan agar menjadi sekolah Kristen yang berkualitas.<br>Penelitian ini menggunakan metode peneiitian deskriptif kuantitatif dengan menggunakan angket tertutup dan observasi pasif. Dalam pengumpulan data diukur dengan menggunakan skala pengukuran Likert. Jumlah pertanyaan angket sebanyak 40 soal dengan rincian 20 soal berkaitan variable bebas dan 20 soal berkaitan variable terikat. Sample yang digunakan dalam penelitian ini adalah guru sebanyak 30 dari 43 guru yang mengajar di Sekclah Menengah Kejuruan Kristen 2 Surakarta. Pengolahan serta analisa data dilakukan dengan menggunakan program SPSS 16.00 dengan beberapa tahap yakni uji Validitas, Reliabilitas, Normalitas, Correlations dan Regretion. Hasilnya adalah perolehan skor angket dinyatakan Valid, Reliabel dan berdistribusi normal serta dapat dibuktikan bahwa ada pengaruh yang kuat antara variable X terhadap variable Y. Hasilnya dapat dibuktikan melalui perhitungan statistik dengan pengolahan Correlation dan Regretion yang menunjukkan nilai Pearson Correlation atau menurut Soegiyono R hitung masuk dalam kriteria kuat yakni antara 0,60 - 0,799 sebab nilai yang diperoleh yakni 0,733. Jika dilihat dari nilai signifikansi atau nilai sig yang dihasilkan lebih kecil dari 0,05 yaitu 0,000. Dibuktikan dengan thitung&gt; Aabel hasilnya 5,695 &gt; 2,04841. Artinya Ha diterima sehingga dapat dinyatakan signifikan. Melalui tahapan dalam SPSS 16.00 ini dapat dinyatakan dan dibuktikan bahwa terdapat<br>antara<br>&nbsp;pengaruh dengan kategori kuat dan signifikan dengan pengaruh sebesar 53,7 %<br>Sekolah<br>&nbsp;penerapan disiplin lembaga sekolah terhadap kualitas kompetensi guru Kristen di Menengah Kejuruan Kristen 2 Surakarta.</p>', 2016, 'Skripsi', 'Tersedia', '538681490_Septianingsih A1.2012.1006.pdf', 2, 3),
(73, 'INDAH RANI DEWI', 'C2.05.005', 'ANALISIS FAKTOR – FAKTOR YANG MEMBEDAKAN ANTARA PERUSAHAAN YANG MENGALAMI FINANCIAL DISTRESS DENGAN PERUSAHAAN YANG TIDAK MENGALAMI FINANCIAL DISTRESS (Studi pada Perusahaan yang Terdaftar di Bursa Efek Indonesia)', '<p style=\"text-align: justify;\">Penelitian ini meneliti mengenai faktor-faktor yang membedakan antara&nbsp;perusahaan yang mengalami financial distress dengan perusahaan yang tidak&nbsp;mengalami financial distress. Financial distress merupakan gejala awal dari&nbsp;kebangkrutan perusahaan di mana peruzahaan mengalami kesulitan keuangan&nbsp;yang jika tidak segera ditangani dengan baik dan semakin memburuk akan&nbsp;dapat mengakibatkan kebangkrutan. Faktor-faktor yang dianalisis dalam&nbsp;penelitian ini adalah current ratio, current liabilities/ total asset (CLTA), net&nbsp;fixed asset/ total asset (NFTA), current asset/total asset (CATA), debt ratio,&nbsp;dan cashflow/ total liabilities (CFTL).</p>\r\n<p style=\"text-align: justify;\">Peneliti menggunakan data sekunder dengan populasi seluruh perusahaan&nbsp;yang terdaftar di Bursa Efek Indonesia tahun 2004-2007. Metode pemilihan&nbsp;sampel yang digunakan adalah purposive sampling. Sampel penelitian dibagi&nbsp;menjadi dua kelompok yaitu kelompok perusahaan yang mengalami financial&nbsp;distress dan kelompok perusahaan yang tidak mengalami financial distress.&nbsp;Sedangkan tehnik analisis yang digunakan dalam penelitian ini adalah uji&nbsp;asumsi klasik dan analisis diskriminan.&nbsp;Hasil dari penelitian ini menunjukkan bahwa current ratio, current asset/total asset (CATA), debt ratio, dan cash flow/ total liabilities (CFTL) dapat&nbsp;digunakan sebagai faktor pembeda antara perusahaan yang mengalami&nbsp;financial distress dengan perusahaan yang tidak mengalami financial distress.&nbsp;Sedangkan current liabilities/ total asset (CLTA), dan net fixed asset/ total&nbsp;asset (NFTA) tidak dapat digunakan sebagai faktor pembeda antara&nbsp;perusahaan yang mengalami financial distress dengan perusahaan yang tidak&nbsp;mengalami financial distress.</p>\r\n<p style=\"text-align: justify;\">Kata kunci : financial distress, current ratio, current liabilities/ total asset&nbsp;(CLTA), net fixed asset/ total asset (NFTA), current asset/ total asset&nbsp;(CATA), debt ratio, dan cash flow/ total liabilities (CFTI.).</p>', 2009, 'Skripsi', 'Tersedia', '1356938971_Indah Rani D. C2.05.005.pdf', 3, 6),
(74, 'EKO SUDEWO', 'A1.07.013', 'PENGARUH PENDIDIKAN AGAMA KRISTEN DALAM KELUARGA TERHADAP KEHARMONISAN KELUARGA DI GEREJA KRISTEN JAWA NUSUKAN SURAKARTA', '<p style=\"text-align: justify;\">Pendidikan Agama Kristen merupakan hal yang dibutuhkan dalam keluarga,&nbsp;untuk penanaman nilai-nilai Kristiani sangat diperlukan dalam Keharmonisan Keluarga.&nbsp;Keluarga sangat dominan dalam penentuan nilai-nilai Kristiani yang akan ditanamkan&nbsp;pada keluarga.</p>\r\n<p style=\"text-align: justify;\">Berdasarkan latar belakang yang telah penulis jelaskan diatas, maka penulis&nbsp;merasa ingin tahu serta tertarik untuk meneliti bagaimana pengaruh Pendidikan Agama&nbsp;Kristen dalam keluarga terhadap Keharmonisan Keluarga yang paling tepat dan sesuai&nbsp;diterapkan dalam keluarga.</p>\r\n<p style=\"text-align: justify;\">Dalam penelitian ini penulis menghubungkan pengaruh Pendidikan Agama&nbsp;Kristen dalam keluarga dengan Keharmonisan Keluarga. Penulis menghubungkan&nbsp;Pengaruh Pendidikan Agama Kristen dalam Keluarga terhadap Keharmonisan keluarga&nbsp;akan berpengaruh terhadap sikap : Disiplin, Bertanggung jawab, Saling mengasihi,&nbsp;saling menolong dan saling menerima baik suka maupun duka.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Penelitian ini menggunakan metode penelitian kuantitatif dengan analisis data menggunakan skala pengukuran interval yaitu rumus korelasi product moment, karena&nbsp;Penulis meneliti 2 variabel yaitu pengaruh Pendidikan Agama Kristen dalam keluarga&nbsp;dan Keharmonisan keluarga. Variabel bebasnya adalah Pendidikan Agama Kristen&nbsp;sedangkan variabel terikatnya adalah Keharmonisan keluarga. Untuk pembuatan angket&nbsp;penulis membaginya menjadi dua bagian, yaitu angket yang berisi pertanyaan untuk&nbsp;variabel bebas yaitu pengaruh Pendidikan Agama Kristen dalam keluarga sejumlah 15&nbsp;pertanyaan. Sedangkan untuk angket yang berisi pertanyaan untuk variabel terikat yaitu&nbsp;Keharmonisan keluarga juga berjumlah 15 pertanyaan. Jumlah responden 30 keluarga.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Setelah diperoleh hasil nilai analisa: 0,763 dan membandingkan dengan Tabel&nbsp;korelasi, maka dapat dipastikan bahwa variabel Pendidikan Agama Kristen dalam&nbsp;keluarga memiliki pengaruh secara positif terhadap variabel Keharmonisan Keluarga di&nbsp;GKJ Nusukan, Surakarta.</p>', 2010, 'Skripsi', 'Tersedia', '1021812872_Eko Sudewo a1.pdf', 2, 3),
(75, 'Tjoek Adi Tjandra', 'C2.03.015', 'PERBEDAAN KINERJA PERUSAHAAN YANG TERDAFTAR DI BURSA EFEK JAKARTA SEBELUM DAN SESUDAH KRISIS MONETER', '<p style=\"text-align: justify;\">Penelitian ini mengambil judul \"PERBEDAAN KINERJA&nbsp;PERUSAHAAN YANG TERDAFTAR DI BURSA EFEK JAKARTA&nbsp;SEBELUM DAN SESUDAH KRISIS MONETER\" Penelitian ini bertujuan&nbsp;untuk mendapatkan bukti empiris dan mengetahui usaha-usaha efisiensi kinerja&nbsp;serta mengidentifikasi perbedaan efisiensi yang signifikan dari perusahaan yang terdaftar di Bursa Efek Indonesia. Sebelum krisis moneter dan setelah krisismoneter populasi penelitian yang digunakan adalah semua perusahaan yang&nbsp;terdaftar di Bursa Efek Indonesia pada tahun 1994 sampai dengan 2001. Teknik&nbsp;pengambilan yang dipakai adalah Purposive Random Sampling. Teknik&nbsp;pengumpulan data, dilakukan dengan cara mengambil data sekunder yang diambil&nbsp;dari Buku ICMD (Indonesia Capital Market Directory). Teknik Analisis data&nbsp;menggunakan Analisis Uji t, Uji F dan dibantu menggunakan program SPSS versi&nbsp;11,5.</p>\r\n<p style=\"text-align: justify;\">Hasil pengujian hipotesis menunjukkan bahwa dalam penelitian ini pengujian Normalitas Data berubah secara signifikan, ini terbukti dari: rasio keuangan ROI,ROA,TATL,CR, dan AT. Hasil Uji Beda menunjukkan hipotesis pertama sampai dengan hipotesis keempat dapat diterima, karena Hasil Uji Bedanya lebih kecil dari nilai standard (0,05). Namun untuk hipotesis kelima ditolak, Hasil Uji Bedanya lebih besar dari nilai standard (0,05).&nbsp;</p>\r\n<p style=\"text-align: justify;\">Hasil analisis data penelitian ini dapat ditarik kesimpulan bahwa : Rasio Keuangan pada ROI,ROA,TATL,CR, perusahaan Go Public, sebelum krisis moneter berbeda secara signifikan dengan ROI,ROA,TATL,CR, setelah krisis moneter.Rasio Keuangan AT perusahaan Go Public sebelum krisis moneter tidak beda secara signifikan dengan AT setelah krisis moneter.</p>\r\n<p style=\"text-align: justify;\">Penolakan tersebut disebabkan karena penjualan dan daya beli masyarakat menurun dengan cepat namun tidak secepat kenaikan biaya biaya sebagai akibat&nbsp;krisis ekonomi, maka Asset Turnover relatif tidak berubah.</p>', 2009, 'Skripsi', 'Tersedia', '292696625_Tjoek Adi Tjandra (Skripsi).pdf', 3, 6),
(76, 'SUDARMANTO', 'A1.06.018', 'ASPEK-ASPEK YANG DILAKUKAN GEREJA DALAM MEMBANTU PENGENTASAN KEMISKINAN DI GEREJA KRISTEN JAWA GAMBIRAN', '<p style=\"text-align: justify;\">Skripsi dengan judul \"ASPEK-ASPEK YANG DILAKUKAN GEREJA&nbsp;DALAM MEMBANTU PENGENTASAN KEMISKINAN DI GKJ GAMBIRAN\" ditulis oleh Sudarmanto NIM A1.06.018 sebagai persyaratan untuk memperoleh&nbsp;gelar Sarjana Teologi Program Studi Pendidikan Agama Kristen pada Fakultas Teologi Universitas Kristen Surakarta</p>\r\n<p style=\"text-align: justify;\">Setiap orang memang tidak mau kalau dirinya itu miskin, tapi jaman sekarang&nbsp;kemiskinan adalah masalah yang harus dipecahkan bersama baik itu pribadi orang itu&nbsp;sendiri atau keluarga bahkan mungkin negara dan tak luput juga Gereja juga harus&nbsp;bisa memecahkan permasalah yang menimpa jemaatnya yang mengalami kemiskinan&nbsp;agar didalam kebersamaannya tidak terjadi perbedaan dengan jemaat yang tidak&nbsp;miskin. Oleh sebab itu peulis disini penulis meneliti tentang aspek-aspek yang&nbsp;dilaukan gereja dalam pengentasan kemiskinan terutama disini adalah Gereja&nbsp;Gambiran yang terletak di Sragen.</p>\r\n<p style=\"text-align: justify;\">Sampel penelitian disini terdiri dari 30 warga jemaat yang sudah dewasa yang&nbsp;beranggotakan sebagai jemaat GKJ Gambiran yang dipilih secara acak. Untuk&nbsp;penelitian ini dilihat dari tiga aspek yaitu aspek Teologis, aspek Sosial dan aspek&nbsp;Ekonomi.</p>\r\n<p style=\"text-align: justify;\">Maka dari itu penulis mengangkat permasalahan ini sebagai salah satu&nbsp;permalasahan yang perlu diteliti dalam gereja tersebut. Adapaun dalam penelitian ini&nbsp;menggunakan rumus prosentase, yaitu dengan rumus :</p>\r\n<p style=\"text-align: justify;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;n<br>%=_______ x 100%<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;N</p>\r\n<p style=\"text-align: justify;\">Keterangan:<br>100% = prosentase<br>n =jumlah nilai yang diperoleh<br>N =jumlah seluruh nilai</p>\r\n<p style=\"text-align: justify;\">Adapun hasil dari penelitian ini adalah sebagai berikut :&nbsp;Aspek Teologis sebesar 32,22% berarti dengan hasil ini gereja sudah ikut bertanggunjawab secara teologi terhadap jemaatnya.</p>\r\n<p style=\"text-align: justify;\">Aspek Sosial sebesar 29,22% ini juga seperti hasil aspek teologi bahwa gereja juga&nbsp;sudah bertanggung secara sosial terhadap jemaatnya.&nbsp;Aspek ekonomi sebesar 25,22% secara hasil gereja sudah bertanggung jawab secara&nbsp;ekonomi artinya gereja juga ikut membantu ekonomi warga meskipun tidak&nbsp;sepenuhnya.</p>\r\n<p style=\"text-align: justify;\">Dari jumlah ketiga aspek tersebut sebesar 86,67% dan yang menjawab tidak&nbsp;13,33% dan hasil tersebut dapat dikatakan bahwa aspek-aspek tersebut terdapat&nbsp;pengaruh terhadap apa yang dilakukan gereja dalam pengentasan kemiskinan.</p>', 2010, 'Skripsi', 'Tersedia', '148629030_Sudarmanto A1.06.018.pdf', 2, 3),
(78, 'MUSTIKA NUGRAHENI SIWI', 'B1.2014.1004', 'PENGOLAHAN LIMBAH DI RUMAH SAKIT UMUM DAERAH DR. MOEWARDI SURAKARTA', '', 2017, 'Magang', 'Tersedia', '584716985_Mustika Nugraheni S. (Magang).pdf', 1, 2),
(79, 'EMA WIDIYANTO', 'B1.02.005', 'INSTALASI PENGOLAHAN AIR LIMBAH RUMAH SAKIT UMUM DAERAH dr.R SOETRASNO KABUPATEN REMBANG', '', 2012, 'Magang', 'Tersedia', '1219954706_EMA WIDIYANTO B1.pdf', 1, 2),
(81, 'karni', 'A1.08.036', 'PENGARUH PORTOFOLIO TERHADAP PELAKSANAAN PENILAIAN MATA PELAJARAN PENDIDIKAN AGAMA KRISTEN SESUAI KURIKULUM TINGKAT SATUAN PENDIDIKAN PADA SISWA SEKOLAH DASAR NEGERI VII WONOGIRI', '<p style=\"text-align: justify;\">Skripsi dengan judul \" PENGARUH PORTOFOLIO TERHADAP&nbsp;PELAKSANAAN PENILAIAN MATA PELAJARAN PENDIDIKAN AGAMА&nbsp;KRISTEN SESUAI KURIKULUM TINGKAT SATUAN PENDIDIKAN PADA&nbsp;SISWA SEKOLAH DASAR NEGERI VII WONOGIRI \" ditulis oleh Karni NIM&nbsp;A1.08.036 sebagai persyaratan untuk memperoleh gelar Sarjana Teologi Program&nbsp;Studi Pendidikan Agama Kristen pada Fakultas Teologi Universitas Kristen&nbsp;Surakarta.</p>\r\n<p style=\"text-align: justify;\">Pengaruh portofolio terhadap pelaksanaan penilaian mata pelajaran Pendidikan Agama Kristen sesuai Kurikulum Tingkat Satuan Pendidikan pada siswa Sekolah Dasar Negeri VII Wonogiri adalah penelitian deskriptif kuantitatif yang membahas mengenai seberapa signifikan hubungan antara prtofolio dengan pelaksanaan penilaian mata pelajaran Pendidikan Agama Kristen sesuai&nbsp;Kurikulum tingkat Satuan Pendidikan pada siswa Sekolah Dasar Negeri VII&nbsp;Wonogiri.</p>\r\n<p style=\"text-align: justify;\">Dalam penelitian ini penulis menggunakan rumus korelasi product moment&nbsp;dimana sebagai variabel X adalah portofolio dan variabel Y adalah pelaksanaan&nbsp;penilaian mata pelajaran Pendidikan Agama Kristen dan dalam penulisan ini&nbsp;masing-masing ada empat aspek, yaitu untuk portofolio : karangan, puisi, gambar,&nbsp;kliping dan untuk variabel Y, yaitu: alat evaluasi, evaluasi diri, alat seleksi,&nbsp;pencatat kemampuan yang dicapai. Populasi penelitian ini melibatkan seluruh&nbsp;siswa Sekolah Dasar Negeri VII Wonogiri yang beragama Kristen.</p>\r\n<p style=\"text-align: justify;\">Berdasarkan penelitian yang dilakukan tentang pengaruh portofolio&nbsp;terhadap pelaksanaan penilaian mata pelajaran Pendidikan Agama Kristen sesuai&nbsp;kurikulum tingkat satuan pendidikan pada siswa Sekolah Dasar Negeri VII&nbsp;Wonogiri nilai r (korelasi product moment) sebesar 0,784 berarti hasilnya lebih&nbsp;besar dari nilai taraf signifikan 5% yaitu 0,361 atau pada taraf signifikan 1% yaitu&nbsp;0,463. jumlah sampel 30 orang (N=30).</p>\r\n<p style=\"text-align: justify;\">Hasil penelitian ini menunjukkan hubungan variabel X dan Y adalah&nbsp;signifikan atau ada hubungan positif.</p>', 2011, 'Skripsi', 'Tersedia', '1051069657_Karni A1.08.036.pdf', 2, 3),
(83, 'RIA NUR CAHYANI LIDYA ANTONIO', 'C2.06.007', 'ANALISIS PENGARUH UKURAN PERUSAHAAN, PROFITABILITAS, LEVERAGE, DAN NET PROFIT MARGIN TERHADAP TINDAKAN PERATAAN LABA (INCOME SMOOTHING) PADA PERUSAHAAN PERBANKAN YANG TERDAFTAR DI BURSA EFEK INDONESIA PERIODE 2005-2007.', '<p style=\"text-align: justify;\">Penelitian ini bertujuan untuk meneliti tentang pengaruh ukuran&nbsp;perusahaan, profitabilitas, leverage, dan net profit margin baik secara bersamasama ataupun parsial terhadap tindakan perataan laba. Perumusan masalah dalam&nbsp;penelitian ini adalah apakah ukuran perusahaan, profitabilitas, leverage, dan net&nbsp;profit margin secara bersama-sama berpengarch signifikan terhadap tindakan&nbsp;perataan laba dan apakah ukuran perusahaan, profitabilitas, leverage, dan net&nbsp;profit margin secara parsial berpengaruh signifikan terhadap tindakan perataan&nbsp;laba.</p>\r\n<p style=\"text-align: justify;\">Penelitian ini menggunakan data sekunder dengan populasi seluruh perusahaan perbankan yang terdaftar di Bursa Efek Indonesia pada periode 2005-2007. Pengambilan sampel menggunakan metode purposive sampling. Teknik analisis data yang digunakan adalah uji asumsi klasik, uji F, uji t dan uji koefisien determinasi (R&sup2;) dengan menggunakan SPSS. Hasil dari penelitian ini pengujian hipotesisnya menunjukkan bahwa nilai F-hitung lebih besar daripada nilai F-tabel sehingga kesimpulan yang didapat bahwa variabel ukuran perusahaan, profitabilitas, leverage dan net profit margin&nbsp;secara bersama-cama berpengaruh signifikan terhadap tindakan perataan laba.</p>\r\n<p style=\"text-align: justify;\">Hasil pengujian untuk uji t menunjukkan hasil untuk variabel ukuran perusahaan nilai t-hitung lebih kecil daripada nilai t-tabel sehingga kesimpulan yang didapat&nbsp;bahwa variabel ukuran perusahaan secara parsial berpengaruh signifikan terhadap&nbsp;tindakan perataan laba. Sedangkan hasil untuk variabel profitabilitas, leverage dan&nbsp;net profit imargin nilai t-hitung lebih besar daripada nilai t-tabel sehingga&nbsp;kesimpulan yang didapat bahwa variabel profitabilitas, leverage dan net profit&nbsp;margin secara parsial tidak berpengaruh signifikan terhadap tindakan perataan&nbsp;laba.</p>\r\n<p style=\"text-align: justify;\">Kata Kunci : Ukuran perusahaan, Profitabilitas, leverage, net profit margin,&nbsp;perataan laba.</p>', 2011, 'Skripsi', 'Tersedia', '1430383593_RIA NUR CAHYANI C2.pdf', 3, 6),
(91, 'CATUR WULANDARI', 'C1.2012.1003', 'PENGARUH MOTIVASI, KEPUASAN KERJA, DAN LINGKUNGAN KERJA PADA KINERJA KARYAWAN DI PDAM SURAKARTA', '<p>Penelitian ini bertujuan untuk menganalisis pengaruh motivasi,<br>kepuasan kerja dan lingkungan kerja pada kinerja karyawan di PDAM<br>Surakarta. Sehubungan dengan masalah tersebut, diajukan hipotesis<br>sebagai berikut, H1: diduga motivasi kerja memiliki pengaruh terhadaр<br>kinerja karyawan, H2: diduga kepuasan kerja memiliki pengaruh terhadap<br>kinerja karyawan, H3 :: diduga lingkungan kerja memiliki pengaruh<br>terhadap kinerja karyawan, H4 : diduga variabel motivasi, kepuasan kerja<br>dan lingkungan kerja secara bersama-sama memiliki pengaruh terhadap<br>kinerja karyawan. Penelitian ini menggunakan model matematika: Y= a+<br>bX +bX+bX+e<br>Pengambilan sampel menggunakan metode purposive sampling,<br>dalam penelitian ini diambil 40 karyawan sebagai sampel dan<br>pengumpulan data dengan menggunakan kuesioner. Data dianalisis<br>menggunakan regresi linear berganda dengan menggunakan SPSS 21.00<br>Hasil dari penelitian ini menunjukkan, nilai t dari variabel motivasi<br>sebesar 0.013, variabel kepuasan kerja sebesar 0.005, variabel lingkungan<br>kerja sebesar 0.049, dan variabel motivasi, kepuasan kerja, dan lingkungan<br>kerja secara simultan pada kinerja karyawan sebesar 11.505.<br>Dari hasil tersebut dapat disimpulkan bahwa semua variabel<br>independen berpengaruh terhadap kinerja karyawan.<br>Dari hasil penelitian yang dilakukan, perusahaan perlu lebih<br>meningkatkan kinerja karyawan dengan cara memberikan jaminan hari<br>tua, kompensasi yang layak pada karyawan, dan juga lebih menjaga<br>kebersihan dan kenyamanan lingkungan kerja.<br>Kata kunci: Motivasi, Kepuasan Kerja, Lingkungan kerja, dan<br>Kinerja Karyawan</p>', 2016, 'Skripsi', 'Tersedia', '1276402217_Catur_Wulandari_C1.2012.1003.pdf', 3, 5),
(92, 'JENNIFER EUODIA YOSEVIN', 'b220221032', 'PEMBUATAN TATA CARA INPUT DATA BUKU KOLEKSI PERPUSTAKAAN MENGGUNAKAN SLIMS 9 BULIAN (Studi kasus: Universitas Kristen Teknologi Solo)', '', 2025, 'Magang', 'Tidak Tersedia', '131139787_Laporan_Magang_Jennifer_Euodia_B220221032.pdf', 1, 1),
(93, 'Tunas Wiji Sasongko', 'B2.07.005', 'PERANCANGAN DAN IMPLEMENTASI WEBSITE TK DHARMA WANITA BOLON', '<p style=\"text-align: justify;\">TK Dharma Wanita Bolon merupakan salah satu sekolah taman kanak-kanak negeri yang terbaik di Karanganyar. Sekolah ingin memberikan informasi secara&nbsp;lebih cepat, efisien untuk sampai ke pengguna informasi dan mendistribusikannya&nbsp;agar bisa dijangkau secara luas, terus-menerus serta bisa diterima oleh sekolah,&nbsp;orangtua maupun masyarakat. Dengan adanya website diharapkan bisa membantu&nbsp;pihak sekolah dalam menyebarkan informasi. Tujuan dari perancangan dan&nbsp;implementasi website yang akan penulis buat adalah mempermudah proses&nbsp;mengelola data-data sekolah menjadi suatu informasi website.</p>\r\n<p style=\"text-align: justify;\">Sesuai dengan tujuan penelitian, maka penelitian dilakukan dengan \'metode&nbsp;pengumpulan data, analisis, perancangan, dan pembuatan website dengan&nbsp;menggunakan bahasa pemrograman PHP dengan server menggunakan apache.</p>\r\n<p style=\"text-align: justify;\">Dari hasil penelitian dapat disimpulkan bahwa TK Dharma Wanita Bolon&nbsp;memerlukan implementasi teknologi informasi berbasis website secara online untuk&nbsp;membantu kinerja sekolah dalam mengelola data menjadi sebuah informasi website&nbsp;dan dipublikasikan ke umum.</p>', 2012, 'Skripsi', 'Tersedia', '331261803_Tunas_Wii_S_b2.pdf', 1, 1),
(94, 'HASTANTI WIDYANINGSIH', 'C2.02.006', 'FAKTOR-FAKTOR YANG MEMPENGARUHI KEMAJUAN MANAJEMEN TEKNOLOGI INFORMASI PADA PERBANKAN DI SURAKARTA', '<p style=\"text-align: justify;\">Keberhasilan TI aktif yang diterapkan sangat tergantung pada partisipasi&nbsp;manajemen manajer perusahaan tersebut. Menggunakan TI yang canggih berbasis&nbsp;komputer hal ini memampukan manajer dalam pengambilan keputusan yang tepat.&nbsp;Pengembangan manajemen TI atau SI dipengaruhi oleh adanya keterlibatan&nbsp;manajer, partisipasi manajer, latar belakang manajer, dan kondisi perusahaan, hal&nbsp;ini merupakan faktor yang mempengaruhi kemajuan manajemen TI.</p>\r\n<p style=\"text-align: justify;\">Tujuan dalam penelitian ini untuk mengetahui: (1) faktor partisipasi manajer&nbsp;mempengaruhi kemajuan manajemen TI pada Perbankan di Surakarta.(2) faktor&nbsp;keterlibatan manajer mempengaruhi kemajuan manajemen TI pada Perbankan di&nbsp;Surakarta. (3) faktor kondisi organisasi manajer mempengaruhi kemajuan&nbsp;manajemen TI pada Perbankan di Surakarta. (4) faktor latar belakang manajer&nbsp;mempengaruhi kemajuan manajemen TI pada Perbankan di Surakarta. (5) faktor&nbsp;partisipasi, keterlibatan, kondisi, dan latar belakang manajer mempengaruhi&nbsp;kemajuan manajemen TI pada Perbankan di Surakarta.</p>\r\n<p style=\"text-align: justify;\">Jenis penelitian bersifat kuantitatif dengan populasi penelitian nama-nama&nbsp;bank di Surakarta ada 24 bank. Data dikumpulkan melalui kuesioner. Analisis&nbsp;data menggunakan teknik uji t-test dan uji F.</p>\r\n<p style=\"text-align: justify;\">Kesimpulan hasil penelitian yaitu: (1) Variabel partisipasi manajer terbukti berpengaruh signifikan terhadap variabel pengembangan teknologi informasi. (2) Variabel keterlibatan manajer berpengaruh terhadap variabel pengembangan teknologi informasi. (3) Variabel kondisi organisasi berpengaruh signifikan terhadap variabel pengembangan teknologi informasi. (4) Variabel latar belakang manajer berpengaruh terhadap variabel pengembangan teknologi informasi. (5)&nbsp;Hasil variabel independen secara bersamaan berpengaruh terhadap variabel&nbsp;dependen. (6) Hasil analisis koefisien determinasi R2 sebesar 0,625, yang berarti&nbsp;variasi perubahan variabel pengembangan teknologi informasi dapat dijelaskan&nbsp;variabel partisipasi manajer, keterlibatan manajer, kondisi organisasi, dan latar&nbsp;belakang manajer sebesar 62,5%. Sedangkan sisanya 37,5% dijelaskan oleh&nbsp;variabel lain di luar model yang tidak terobservasi, misalnya keadaan lingkungan&nbsp;perusahaan, gaji, dan suasana kerja.</p>\r\n<p style=\"text-align: justify;\">Kata Kunci: Faktor partisipasi, keterlibatan, kondisi, latar belakang manajer, kemajuan manajemen TI.</p>', 2009, 'Skripsi', 'Tersedia', '2084464881_Hastanti_Widyaningsih__Skripsi_.pdf', 3, 6),
(95, 'DANI ATMIYATI', 'A1.06.002', 'PENGARUH PERSIAPAN MENGAJAR GURU SEKOLAH MINGGU TERHADAP KEBERHASILAN MENGAJAR SEKOLAH MINGGU DI GEREJA KRISTEN INDONESIA COYUDAN SURAKARTA (POS JEMAAT JOYOTAKAN)', '<div id=\"model-response-message-contentr_144347d5e7d0c553\" class=\"markdown markdown-main-panel md-content enable-luminous-fast-follows enable-updated-hr-color stronger\" dir=\"ltr\" aria-busy=\"false\" aria-live=\"polite\">\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"1,0\">DANI ATMIYATI, A1.06.002, 2011, Judul Skripsi \"Pengaruh persiapan mengajar guru sekolah minggu terhadap keberhasilan mengajar di Gereja Kristen Indonesia Coyudan Surakarta (Pos Jemaat Joyotakan)\", Skripsi, Program S-1 Pendidikan Agama Kristen pada Universitas Kristen Surakarta, Pembimbing Pdt.Kristriyanto, M.Th</span></div>\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"2,0\">Kata kuncinya adalah Persiapan Guru Sekolah Minggu dan Keberhasilan Mengajar Sekolah Minggu</span><span data-path-to-node=\"2,1\"><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><sup class=\"superscript\"><!----></sup><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></span> <!----><!----><!----><!----><!----><!----><!----><!----><!----></div>\r\n<br>\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"3,0\">Persiapan adalah kegiatan yang dikerjakan sebelum melakukan sebuah kegiatan, sehingga dapat membantu kelancaran dan proses dalam kegiatan. Persiapan mengajar berarti kegiatan yang dikerjakan sebelum melakukan kegiatan belajar mengajar. Keberhasilan suatu kegiatan bukan hanya ditentukan pada saat kegiatan belajar mengajar tersebut terjadi, tetapi juga ditentukan oleh faktor yang lain. Salah satu factor tersebut adalah kegiatan yang dilakukan sebelum mengajar atau disebut dengan persiapan mengajar. Didalam persiapan mengajar itu terdapat beberapa hal yang dilakukan oleh seorang guru sekolah minggu antara lain persiapan pribadi untuk membangun hubungan keintiman dengan Allah dan persiapan bersama dengan guru sekolah minggu yang lain untuk membahas materi pelajaran, tujuan pembelajaran, dan metode pembelajaran.</span><span data-path-to-node=\"3,1\"><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><sup class=\"superscript\"><!----></sup><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></span> <!----><!----><!----><!----><!----><!----><!----><!----><!----></div>\r\n<br>\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"4,0\">Berdasarkan latar belakang yang penulis jelaskan di atas, maka penulis merasa ingin tahu serta tertarik untuk meneliti apakah persiapan mengajar guru sekolah minggu berpengaruh terhadap keberhasilan mengajar sekolah minggu.</span><span data-path-to-node=\"4,1\"><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><sup class=\"superscript\"><!----></sup><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></span> <!----><!----><!----><!----><!----><!----><!----><!----><!----></div>\r\n<br>\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"5,0\">Dalam penelitian ini penulis menghubungkan Pengaruh Persiapan Mengajar Guru Sekolah Minggu dengan Keberhasilan mengajar. Penulis menghubungkan pengaruh Persiapan Mengajar Guru terhadap keberhasilan mengajar karena keberhasilan mengajar berpengaruh pada daya serap / pemahaman anak akan materi dan perubahan perilaku anak setelah kegiatan sekolah minggu.</span><span data-path-to-node=\"5,1\"><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><sup class=\"superscript\"><!----></sup><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></span> <!----><!----><!----><!----><!----><!----><!----><!----><!----></div>\r\n<br>\r\n<div style=\"text-align: justify;\"><span data-path-to-node=\"6,0\">Penelitian ini menggunakan metode penelitian kuantitatif dengan analisis data menggunakan regresi sederhana, karena penulis meneliti dua variable yaitu pengaruh persiapan mengajar guru sekolah minggu dan keberhasilan mengajar sekolah minggu. Variable bebasnya adalah persiapan mengajar sekolah minggu, sedangkan variable terikatnya adalah keberhasilan mengajar sekolah minggu. Untuk pembuatan angket penulis membagi menjadi dua bagian, yaitu angket yang berisi pernyataan untuk variable bebas yaitu pengaruh persiapan mengajar guru sekolah minggu sejumlah 40 soal. Sedangkan untuk angket yang berisi pertanyaan untuk variable terikat yaitu keberhasilan mengajar sekolah minggu sejumlah 30 soal. Jumlah respondennya 30 guru agama Kristen dan 30 anak sekolah minggu. Pengolahan data pada bab IV menunjukkan bahwa Persiapan mengajar guru sekolah minggu berpengaruh signifikan terhadap keberhasilan mengajar sekolah minggu di Pos Jemaat Joyotakan GKI Coyudan, yaitu dengan dibuktikan melalui perhitungan statistik yang menunjukkan <span class=\"math-inline\" data-math=\"t &lt; t_{0,025; df=28}\" data-index-in-node=\"1027\">$t &lt; t_{0,025; df=28}$</span> yaitu <span class=\"math-inline\" data-math=\"-1,457 &lt; 2,048\" data-index-in-node=\"1054\">$-1,457 &lt; 2,048$</span> yang berati hipotesis diterima karena tidak berbeda secara signifikan dari nol.</span><span data-path-to-node=\"6,1\"><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><sup class=\"superscript\"><!----></sup><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></span> <!----><!----><!----><!----><!----><!----><!----><!----><!----></div>\r\n</div>', 2011, 'Skripsi', 'Tersedia', '1514158760_Dani_Atmiyati_A1.06.002.pdf', 2, 3),
(96, 'SUMARSONO', 'A2.20111002', 'KONTRIBUSI PENDETA DALAM MENUNJANG PERTUMBUHAN ROHANI REМАЈА DI GKJ KARANGDOWO', '<p dir=\"ltr\">Di dalam pertumbuhan rohani remaja, bukan tugas guru-guru sekolah. minggu saja untuk membina kepada remaja tetapi juga tugas pendeta untuk mengajar, mendidik agar dapat bertumbuh rohani mereka. Untuk itu kontribusi pendeta sangat penting sekali dalam menunjang pertumbuhan rohani remaja. Baik guru sekolah minggu maupun pendeta ini sangat menentukan dalam pertumbuhan rohani remaja-remaja.&nbsp;</p>\r\n<p dir=\"ltr\">Penulisan karya ilmiah didasarkan pada kontribusi pendeta dalam menunjang pertumbuhan rohani remaja, dengan mengambil langkah-langkah sebagai berikut: Pendahuluan, landasan teori tentang panggilan Pendeta, tugas dan peranan Pendeta, membuat program, pengertian tentang remaja, gambaran GKJ Karangdowo, dan kontribusi pendeta dalam menunjang pertumbuhan rohani remaja di GKJ Karangdowo. Metodologi: metodologi penelitian, populasi dan sampel, tempat dan waktu penelitian, teknik pengumpulan data, teknik analisa data, dan teknik pengukuran data. Laporan hasil penelitian dan kesimpulan dan saran.&nbsp;</p>\r\n<p dir=\"ltr\">Sampel penelitian terdiri dari 40 remaja yang berangotakan sebagai warga jemaat GKJ Karangdowo. Untuk itu penelitian ini dilihat dari 4 (empat) faktor teologi, sosiologis, psikologis dan paedagogis.</p>\r\n<p dir=\"ltr\">Maka dari itu penulis mengangkat permasalahan ini sebagai salah satu permasalahan yang perlu diteliti dalam gereja tersebut. Adapun dalam penelitian ini menggunakan rumus prosentase yaitu dengan rumus:</p>\r\n<p dir=\"ltr\">%= n/N 100%</p>\r\n<p dir=\"ltr\">Keterangan:&nbsp;</p>\r\n<p dir=\"ltr\">%: Hasil Prosentase&nbsp;</p>\r\n<p dir=\"ltr\">n: Nilai yang diperoleh.&nbsp;</p>\r\n<p dir=\"ltr\">N: Jumlah seluruh Individu.&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p dir=\"ltr\">Adapun hasil dari penelitian ini adalah sebagai berikut:&nbsp;</p>\r\n<p dir=\"ltr\">1. Faktor Teologi sebesar 384 atau 24%. Jadi dalam hal ini penulis mengambil kesimpulan bahwa Pendeta member kontribusi factor teologis bagi pertumbuhan rohani remaja di Gereja Kristen Jawa Karangdowo.&nbsp;</p>\r\n<p dir=\"ltr\">2. Faktor Sosiologis sebesar 380 atau 23% Jadi dalam hal ini penulis mengambil kesimpulan bahwa Pendeta member kontribusi faktor Sosiologis bagi pertunıbuhan rohani remaja di Gereja Kristen Jawa Karangdowo.&nbsp;</p>\r\n<p dir=\"ltr\">3. Faktor Psiskologis sebesar 381 atau 23,8% Jadi dalam hal ini penulis mengambil kesimpulan bahwa Pendeta member kontribusi faktor Psikologis bagi pertumbuhan rohani remaja di Gereja Kristen Jawa Karangdowo.&nbsp;</p>\r\n<p dir=\"ltr\">4. Faktor Paedagogis sebesar 382 atau 23,9% Jadi dalam hal ini penulis mengambil kesimpulan bahwa Pendeta member kontribusi faktor Paedagogis bagi pertumbuhan rohani remaja di Gereja Kristen Jawa Karangdowo.&nbsp;</p>\r\n<p dir=\"ltr\">Dari jumlah 4 (empat) faktor tersebut sebesar 1527 atau 95, 4 % yang menjawab Ya dan yang menjawab tidak sebesar 73 atau 4,6% dan hasil tersebut dapat dikatakan bahwa Kontribusi Pendeta dalam menunjang pertumbuhan rohani remaja di GKJ Karangdowo, sebesar 95,4 %.&nbsp;</p>', 2005, 'Skripsi', 'Tersedia', '2142453549_Sumarsono_A2.20111002.pdf', 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembimbing`
--

CREATE TABLE `tb_pembimbing` (
  `id_pembimbing` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pembimbing`
--

INSERT INTO `tb_pembimbing` (`id_pembimbing`, `id_laporan`, `id_dosen`) VALUES
(1, 8, 6),
(2, 71, 2),
(3, 71, 6),
(4, 78, 8),
(5, 14, 9),
(6, 72, 13),
(7, 72, 22),
(9, 37, 4),
(11, 70, 3),
(12, 70, 2),
(13, 81, 20),
(14, 81, 21),
(15, 83, 29),
(16, 83, 33),
(17, 74, 20),
(18, 74, 15),
(19, 76, 18),
(20, 73, 31),
(21, 75, 27),
(22, 75, 29),
(27, 92, 5),
(30, 91, 25),
(31, 79, 12),
(32, 93, 9),
(33, 93, 7),
(34, 94, 30),
(35, 94, 29),
(36, 95, 18),
(37, 95, 24),
(38, 96, 15),
(39, 96, 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penguji`
--

CREATE TABLE `tb_penguji` (
  `id_penguji` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penguji`
--

INSERT INTO `tb_penguji` (`id_penguji`, `id_laporan`, `id_dosen`) VALUES
(1, 71, 9),
(2, 71, 7),
(3, 71, 2),
(4, 71, 6),
(5, 72, 18),
(6, 72, 13),
(7, 72, 22),
(11, 70, 9),
(12, 70, 7),
(13, 70, 3),
(14, 70, 2),
(15, 81, 18),
(16, 81, 15),
(17, 81, 20),
(18, 83, 27),
(19, 83, 30),
(20, 83, 29),
(21, 74, 18),
(22, 74, 17),
(23, 74, 20),
(24, 76, 13),
(25, 76, 17),
(26, 76, 18),
(27, 73, 27),
(28, 73, 31),
(29, 73, 33),
(30, 75, 31),
(31, 75, 30),
(32, 75, 27),
(46, 91, 28),
(47, 91, 25),
(48, 91, 26),
(50, 93, 4),
(51, 93, 2),
(52, 93, 9),
(53, 93, 7),
(54, 94, 27),
(55, 94, 33),
(56, 94, 30),
(57, 95, 13),
(58, 95, 18),
(59, 95, 24),
(60, 96, 13),
(61, 96, 15),
(62, 96, 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_prodi`
--

CREATE TABLE `tb_prodi` (
  `id_prodi` int(11) NOT NULL,
  `nm_prodi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_prodi`
--

INSERT INTO `tb_prodi` (`id_prodi`, `nm_prodi`) VALUES
(1, 'S-1 Teknik Informatika'),
(2, 'S-1 Teknik Lingkungan'),
(3, 'S-1 Pendidikan Agama Kristen'),
(4, 'S-1 Pastoral Konserling'),
(5, 'S-1 Manajemen'),
(6, 'S-1 Akuntansi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tentang`
--

CREATE TABLE `tb_tentang` (
  `id_tentang` int(11) NOT NULL,
  `tentang_pusaka` text NOT NULL,
  `foto_sistem` varchar(100) NOT NULL,
  `nama_nav` varchar(50) NOT NULL,
  `nama_kampus` varchar(50) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_tentang`
--

INSERT INTO `tb_tentang` (`id_tentang`, `tentang_pusaka`, `foto_sistem`, `nama_nav`, `nama_kampus`, `id_admin`) VALUES
(1, '<p style=\"line-height: 1.3;\"><span style=\"font-size: 18pt;\"><strong>Tentang Sistem</strong></span></p>\r\n<p style=\"line-height: 1.3;\">Filosofi: PUSAKA UKTS adalah kepanjangan dari Pusat Arsip Karya Akademik Universitas Kristen Teknologi Solo, sebuah sistem yang dirancang untuk penyimpanan karya akademik mahasiswa seperti laporan magang ataupun laporan skripsi.</p>\r\n<p style=\"line-height: 1.5;\"><span style=\"font-size: 18pt;\"><strong>Tentang Perpustakaan</strong></span></p>\r\n<p style=\"line-height: 1.5;\">Perpustakaan Universitas Kristen Teknologi Solo berada di Jalan Walten Moginsidi No. 36-38, Gilingan, Kec. Banjarsari, Kota Surakarta, Jawa Tengah&nbsp;</p>\r\n<p style=\"line-height: 1.5;\">Jam Buka: Perpustakaan Universitas Kristen Teknologi Solo (UKTS) buka setiap senin-jumat jam 08.00-16.00 WIB dan untuk jam Istirahat perpustakaan 12.00-13.00 WIB</p>', 'LOGOUKTS.png', 'PUSAKA UKTS', 'Universitas Kristen Teknologi Solo', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_angg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `email`, `password_angg`) VALUES
(48, 'Uji Coba Sistem', 'quotestoday827@gmail.com', '893c449dfe5d020095518b355640bc81'),
(58, 'Senja Rembulan', 'senjarembulan88@gmail.com', '25a32e47ca7492d400067c377188055c'),
(59, 'Juan Noordiansyah', 'juanznoor@gmail.com', '801c88b2c9f4995958c9a84f9a7406c8');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_tb`
--
ALTER TABLE `admin_tb`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indeks untuk tabel `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indeks untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_fakultas` (`id_fakultas`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indeks untuk tabel `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `tb_penguji`
--
ALTER TABLE `tb_penguji`
  ADD PRIMARY KEY (`id_penguji`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `tb_prodi`
--
ALTER TABLE `tb_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `tb_tentang`
--
ALTER TABLE `tb_tentang`
  ADD PRIMARY KEY (`id_tentang`),
  ADD KEY `admin_tb` (`id_admin`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_tb`
--
ALTER TABLE `admin_tb`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT untuk tabel `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  MODIFY `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_penguji`
--
ALTER TABLE `tb_penguji`
  MODIFY `id_penguji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `tb_prodi`
--
ALTER TABLE `tb_prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_tentang`
--
ALTER TABLE `tb_tentang`
  MODIFY `id_tentang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD CONSTRAINT `tb_dosen_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `tb_fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD CONSTRAINT `tb_laporan_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `tb_prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_laporan_ibfk_2` FOREIGN KEY (`id_fakultas`) REFERENCES `tb_fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembimbing`
--
ALTER TABLE `tb_pembimbing`
  ADD CONSTRAINT `tb_pembimbing_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `tb_laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pembimbing_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_penguji`
--
ALTER TABLE `tb_penguji`
  ADD CONSTRAINT `tb_penguji_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `tb_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penguji_ibfk_2` FOREIGN KEY (`id_laporan`) REFERENCES `tb_laporan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tentang`
--
ALTER TABLE `tb_tentang`
  ADD CONSTRAINT `tb_tentang_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin_tb` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
