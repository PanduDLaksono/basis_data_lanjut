
--
-- Database: toko_sepeda
--

-- --------------------------------------------------------

--
-- Table structure for table barang
--

CREATE TABLE barang (
  id_barang varchar(15) NOT NULL,
  id_toko varchar(10) NOT NULL,
  id_kategori varchar(20) NOT NULL,
  id_merk varchar(11) NOT NULL DEFAULT '',
  nama_barang varchar(25) NOT NULL,
  model_tahun varchar(4) NOT NULL,
  stok_barang int NOT NULL DEFAULT '0',
  harga_barang int NOT NULL DEFAULT '0'
)

-- --------------------------------------------------------

--
-- Table structure for table kategori
--

CREATE TABLE kategori (
  id_kategori varchar(20) NOT NULL,
  nama_kategori varchar(50) DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table merk
--

CREATE TABLE merk (
  id_merk varchar(11) NOT NULL DEFAULT '',
  nama_merk varchar(25) NOT NULL DEFAULT ''
)

-- --------------------------------------------------------

--
-- Table structure for table pegawai
--

CREATE TABLE pegawai (
  id_pegawai varchar(15) NOT NULL,
  nama_pegawai varchar(50) NOT NULL,
  alamat_pegawai varchar(60) NOT NULL,
  jns_kelamin varchar(12) NOT NULL CHECK (jns_kelamin IN('Laki-Laki','Perempuan')),
  telp_pegawai varchar(13) DEFAULT NULL,
  status_pegawai varchar(12) NOT NULL CHECK (status_pegawai IN('Tetap','Honorer')),
  email_pegawai varchar(50) DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table pelanggan
--

CREATE TABLE pelanggan (
  id_pelanggan varchar(15) NOT NULL,
  nam_pelanggan varchar(50) NOT NULL DEFAULT '',
  alamat_pelanggan varchar(60) NOT NULL DEFAULT '',
  telp_pelanggan varchar(13) NOT NULL DEFAULT '',
  jns_kelamin varchar(12) NOT NULL CHECK (jns_kelamin IN('Laki-Laki','Perempuan')),
  kota_pelanggan varchar(15) DEFAULT '',
  provinsi_pelanggan varchar(25) DEFAULT '',
  kode_pos int DEFAULT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table pesanan
--

CREATE TABLE pesanan (
  id_pesan varchar(15) NOT NULL,
  id_barang varchar(15) NOT NULL,
  id_toko varchar(10) NOT NULL,
  id_pegawai varchar(15) NOT NULL,
  id_pelanggan varchar(15) NOT NULL,
  jml_pesan int NOT NULL DEFAULT '0',
  tgl_kirim date NOT NULL,
  tgl_pesan date NOT NULL
)

-- --------------------------------------------------------

--
-- Table structure for table toko
--

CREATE TABLE toko (
  id_toko varchar(10) NOT NULL,
  nama_toko varchar(50) NOT NULL,
  telp_toko varchar(13) NOT NULL DEFAULT '',
  email varchar(50) NOT NULL,
  alamat_toko varchar(50) NOT NULL,
  kota varchar(30) NOT NULL,
  provinsi varchar(25) NOT NULL,
  kode_pos int DEFAULT NULL
)

--
-- Indexes for dumped tables
--

--
-- Indexes for table barang
--
ALTER TABLE barang
  ADD PRIMARY KEY (id_barang)

--
-- Indexes for table kategori
--
ALTER TABLE kategori
  ADD PRIMARY KEY (id_kategori);

--
-- Indexes for table merk
--
ALTER TABLE merk
  ADD PRIMARY KEY (id_merk);

--
-- Indexes for table pegawai
--
ALTER TABLE pegawai
  ADD PRIMARY KEY (id_pegawai);

--
-- Indexes for table pelanggan
--
ALTER TABLE pelanggan
  ADD PRIMARY KEY (id_pelanggan);

--
-- Indexes for table pesanan
--
ALTER TABLE pesanan
  ADD PRIMARY KEY (id_pesan)

--
-- Indexes for table toko
--
ALTER TABLE toko
  ADD PRIMARY KEY (id_toko);

--
-- Constraints for dumped tables
--

--
-- Constraints for table barang
--
ALTER TABLE barang
  ADD CONSTRAINT FK_barang_kategori FOREIGN KEY (id_kategori) REFERENCES kategori (id_kategori) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_barang_merk FOREIGN KEY (id_merk) REFERENCES merk (id_merk) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_barang_toko FOREIGN KEY (id_toko) REFERENCES toko (id_toko) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table pesanan
--
ALTER TABLE pesanan
  ADD CONSTRAINT FK_pesanan_barang FOREIGN KEY (id_barang) REFERENCES barang (id_barang) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_pesanan_pegawai FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_pesanan_toko FOREIGN KEY (id_toko) REFERENCES toko (id_toko) ON DELETE CASCADE ON UPDATE CASCADE;

