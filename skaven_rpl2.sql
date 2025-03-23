-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Mar 2025 pada 08.03
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skaven_rpl2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tipe_barang` varchar(50) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_prestasi`
--

CREATE TABLE `detail_prestasi` (
  `id_detailprestasi` int(11) NOT NULL,
  `id_prestasi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `tanggal_prestasi` date NOT NULL,
  `peringkat` int(11) NOT NULL,
  `kategori` enum('umum','produktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_prestasi`
--

INSERT INTO `detail_prestasi` (`id_detailprestasi`, `id_prestasi`, `id_siswa`, `id_guru`, `tanggal_prestasi`, `peringkat`, `kategori`) VALUES
(1, 2, 6, 5, '2023-03-04', 2, 'produktif'),
(2, 3, 3, 4, '2023-02-12', 3, 'umum'),
(10, 17, 2, 1, '2025-03-20', 2, 'produktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `eskul`
--

CREATE TABLE `eskul` (
  `eskulID` int(11) NOT NULL,
  `nama_eskul` varchar(250) NOT NULL,
  `profil_eskulID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `eskul_siswa`
--

CREATE TABLE `eskul_siswa` (
  `id` int(11) NOT NULL,
  `siswaID` int(11) NOT NULL,
  `eskulID` int(11) NOT NULL,
  `tanggal_gabung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_sekolah`
--

CREATE TABLE `event_sekolah` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(250) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_pembimbing`
--

CREATE TABLE `guru_pembimbing` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `bidang` enum('lkbb','pemrograman','matematika','pkn') NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `mata_pelajaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `guru_pembimbing`
--

INSERT INTO `guru_pembimbing` (`id_guru`, `nama_guru`, `bidang`, `no_telpon`, `nip`, `email`, `alamat`, `mata_pelajaran`) VALUES
(1, 'ibu anty', 'pemrograman', '08765487', '12345', 'antyrpl@gmail.com', 'jl.ince nurdin', 'pemrong'),
(2, 'ibu tenri', 'matematika', '0879654321', '67890', 'tenritte23@gmail.com', 'jl.rajawali', 'matematika'),
(3, 'pak ibe', 'pkn', '08765478', '10298', 'ibrahim12@gmail.com', 'jl.cendrawasih', 'basis data'),
(4, 'ibu asrah', 'pkn', '098765876', '56789', 'asrahwati@gmail.com', 'jl.borong', 'pkk'),
(5, 'pak fajar', 'lkbb', '0876544598', '49856', 'fajarji@gmail.com', 'jl.sudirman', 'website'),
(6, 'ibu ayu', 'matematika', '0987656', '', 'ayuwidya@gmail.com', 'jl.ince', 'fisika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `hari` varchar(250) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `id_guru` int(20) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `membimbing`
--

CREATE TABLE `membimbing` (
  `id_membimbing` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_prestasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembina`
--

CREATE TABLE `pembina` (
  `pembinaID` int(11) NOT NULL,
  `eskulID` int(11) NOT NULL,
  `nama_pembina` varchar(250) NOT NULL,
  `kontak` varchar(250) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_mengikuti` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengawasan`
--

CREATE TABLE `pengawasan` (
  `id_pengawas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_event` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id_prestasi` int(11) NOT NULL,
  `nama_prestasi` varchar(250) NOT NULL,
  `tingkat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id_prestasi`, `nama_prestasi`, `tingkat`) VALUES
(1, 'fotografi', 'Kabupaten'),
(2, 'juara Lomba Cerdas Cermat', 'Internasional'),
(3, 'menggambar', 'Kota'),
(4, 'IT', 'Kota'),
(5, 'juara lomba desain web ', 'Internasional'),
(6, 'juara lomba desain web ', 'Internasional'),
(7, 'menggambar', 'Internasional'),
(8, 'menggambar', 'Internasional'),
(9, 'menggambar', 'Internasional'),
(10, 'menggambar', 'Internasional'),
(11, 'juara Lomba Desain Grafis', 'Kabupaten'),
(12, 'juara Lomba Desain Grafis', 'Kabupaten'),
(13, 'Lomba desain Grafis', 'Internasional'),
(14, 'gambar', 'Kota'),
(15, 'menyanyi', 'Kabupaten'),
(16, 'Lomba desain Grafis', 'Kota'),
(17, 'Lomba desain Grafis', 'Provinsi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(250) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profileskul`
--

CREATE TABLE `profileskul` (
  `profiilEskulID` int(11) NOT NULL,
  `logo` text NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kapasitas_ruang` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswaa`
--

CREATE TABLE `siswaa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(250) NOT NULL,
  `kelas` varchar(250) NOT NULL,
  `jurusan` varchar(250) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `saldo` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `keahlian` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswaa`
--

INSERT INTO `siswaa` (`id_siswa`, `nama_siswa`, `kelas`, `jurusan`, `jenis_kelamin`, `saldo`, `alamat`, `keahlian`) VALUES
(2, 'Qalby', 'XII', 'Perkantoran', 'perempuan', 250000, 'Jl. baji minasa', 'Menyanyi'),
(3, 'Suci Aziza', 'XII', 'Akuntansi', 'perempuan', 5000, 'Jl.Cendrawasi', 'Berpidato'),
(4, 'Fadilla', 'XII', 'Pekerjaan Sosial', 'perempuan', 3000, 'Jl. Ince Nurdin', 'IT'),
(5, 'Herani', 'XII', 'Tata Boga', 'perempuan', 6000, 'Jl. Sudirman', 'Program'),
(6, 'condrado', 'XII', 'perkantoran', 'laki-laki', 9000, 'jl.ujung pandang', 'ngoding'),
(7, 'Mirsya', 'XII ', 'Rekayasa Perangkat Lunak', 'laki-laki', 100000, 'Jl. rajawali', 'Mengedit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tingkat`
--

CREATE TABLE `tingkat` (
  `id_tingkat` int(11) NOT NULL,
  `tingkat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tingkat`
--

INSERT INTO `tingkat` (`id_tingkat`, `tingkat`) VALUES
(2, 'Internasional'),
(4, 'Kabupaten'),
(5, 'Kota'),
(1, 'Nasional'),
(3, 'Provinsi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'guru', '77e69c137812518e359196bb2f5e9bb9');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_siswa_5` (`id_siswa`),
  ADD KEY `fk_guru_4` (`id_guru`);

--
-- Indeks untuk tabel `detail_prestasi`
--
ALTER TABLE `detail_prestasi`
  ADD PRIMARY KEY (`id_detailprestasi`),
  ADD UNIQUE KEY `id_siswa` (`id_siswa`),
  ADD KEY `fk_prestasi_3` (`id_prestasi`),
  ADD KEY `fk_guru` (`id_guru`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_transaksi` (`id_transaksi`),
  ADD KEY `fk_product` (`id_produk`);

--
-- Indeks untuk tabel `eskul`
--
ALTER TABLE `eskul`
  ADD PRIMARY KEY (`eskulID`),
  ADD KEY `fk_profil_eskul` (`profil_eskulID`);

--
-- Indeks untuk tabel `eskul_siswa`
--
ALTER TABLE `eskul_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_siswa_eskul` (`siswaID`),
  ADD KEY `fk_eskul` (`eskulID`);

--
-- Indeks untuk tabel `event_sekolah`
--
ALTER TABLE `event_sekolah`
  ADD PRIMARY KEY (`id_event`);

--
-- Indeks untuk tabel `guru_pembimbing`
--
ALTER TABLE `guru_pembimbing`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `fk_mapel` (`id_mapel`),
  ADD KEY `fk_kelas` (`id_kelas`),
  ADD KEY `fk_guru_6` (`id_guru`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `membimbing`
--
ALTER TABLE `membimbing`
  ADD PRIMARY KEY (`id_membimbing`),
  ADD KEY `fk_guru_7` (`id_guru`),
  ADD KEY `fk_siswa_7` (`id_siswa`),
  ADD KEY `fk_prestasi_1` (`id_prestasi`);

--
-- Indeks untuk tabel `pembina`
--
ALTER TABLE `pembina`
  ADD PRIMARY KEY (`pembinaID`),
  ADD KEY `fk_pembina` (`eskulID`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_mengikuti`),
  ADD KEY `fk_siswa_4` (`id_siswa`),
  ADD KEY `fk_event` (`id_event`);

--
-- Indeks untuk tabel `pengawasan`
--
ALTER TABLE `pengawasan`
  ADD PRIMARY KEY (`id_pengawas`),
  ADD KEY `fk_guru_8` (`id_guru`),
  ADD KEY `fk_event_1` (`id_event`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `fk_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `profileskul`
--
ALTER TABLE `profileskul`
  ADD PRIMARY KEY (`profiilEskulID`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`);

--
-- Indeks untuk tabel `siswaa`
--
ALTER TABLE `siswaa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `tingkat`
--
ALTER TABLE `tingkat`
  ADD PRIMARY KEY (`id_tingkat`),
  ADD UNIQUE KEY `tingkat` (`tingkat`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_siswa_3` (`id_siswa`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_prestasi`
--
ALTER TABLE `detail_prestasi`
  MODIFY `id_detailprestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `event_sekolah`
--
ALTER TABLE `event_sekolah`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `membimbing`
--
ALTER TABLE `membimbing`
  MODIFY `id_membimbing` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_mengikuti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_guru_4` FOREIGN KEY (`id_guru`) REFERENCES `guru_pembimbing` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_5` FOREIGN KEY (`id_siswa`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_prestasi`
--
ALTER TABLE `detail_prestasi`
  ADD CONSTRAINT `fk_guru` FOREIGN KEY (`id_guru`) REFERENCES `guru_pembimbing` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestasi` FOREIGN KEY (`id_prestasi`) REFERENCES `prestasi` (`id_prestasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `eskul`
--
ALTER TABLE `eskul`
  ADD CONSTRAINT `fk_profil_eskul` FOREIGN KEY (`profil_eskulID`) REFERENCES `profileskul` (`profiilEskulID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `eskul_siswa`
--
ALTER TABLE `eskul_siswa`
  ADD CONSTRAINT `fk_eskul` FOREIGN KEY (`eskulID`) REFERENCES `eskul` (`eskulID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_eskul` FOREIGN KEY (`siswaID`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_guru_6` FOREIGN KEY (`id_guru`) REFERENCES `guru_pembimbing` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `membimbing`
--
ALTER TABLE `membimbing`
  ADD CONSTRAINT `fk_prestasi_1` FOREIGN KEY (`id_prestasi`) REFERENCES `prestasi` (`id_prestasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_7` FOREIGN KEY (`id_siswa`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembina`
--
ALTER TABLE `pembina`
  ADD CONSTRAINT `fk_pembina` FOREIGN KEY (`eskulID`) REFERENCES `eskul` (`eskulID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `fk_event` FOREIGN KEY (`id_event`) REFERENCES `event_sekolah` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_4` FOREIGN KEY (`id_siswa`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengawasan`
--
ALTER TABLE `pengawasan`
  ADD CONSTRAINT `fk_event_1` FOREIGN KEY (`id_event`) REFERENCES `event_sekolah` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guru_8` FOREIGN KEY (`id_guru`) REFERENCES `guru_pembimbing` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_siswa_3` FOREIGN KEY (`id_siswa`) REFERENCES `siswaa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
