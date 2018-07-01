-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Nov 13, 2010 at 10:34 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `sisfokol_v3_smk`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `adminx`
-- 

CREATE TABLE `adminx` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `usernamex` varchar(15) NOT NULL DEFAULT '',
  `passwordx` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `adminx`
-- 

INSERT INTO `adminx` (`kd`, `usernamex`, `passwordx`) VALUES ('e4ea2f7dfb2e5c51e38998599e90afc2', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

-- 
-- Table structure for table `admin_ks`
-- 

CREATE TABLE `admin_ks` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_pegawai` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `admin_ks`
-- 

INSERT INTO `admin_ks` (`kd`, `kd_pegawai`) VALUES ('348bfd3c654a8dfb111be785507f8558', 'f8521322d5f22044ab5bf49de4a81b27');

-- --------------------------------------------------------

-- 
-- Table structure for table `admin_tu`
-- 

CREATE TABLE `admin_tu` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_pegawai` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `admin_tu`
-- 

INSERT INTO `admin_tu` (`kd`, `kd_pegawai`) VALUES ('e63f6d0b87685afcf3c8600361066bfe', '8cd74c008c54c1ed1731a3dbe055f935');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_brg`
-- 

CREATE TABLE `inv_brg` (
  `kd` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_brg`
-- 

INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('89a604cca445fdaf05f223d48d1e2d8c', 'BR0001', 'Gunting');
INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('020919fb5a2e6034b8cabbe08ac1ba0d', 'BR0002', 'Penggaris Kayu Besar');
INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('c544d4968d73bea79164c352651734a5', 'BR0003', 'Papan Tulis');
INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('812f13b24e536dd9f7f184882e826401', 'BR0004', 'Meja Lipat');
INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('8f8f089be50be74bbef64102f2144eed', 'BR0005', 'Kursi Lipat');
INSERT INTO `inv_brg` (`kd`, `kode`, `nama`) VALUES ('40b414426795f13813766d784a407e79', '11', '11');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_brg_keahlian`
-- 

CREATE TABLE `inv_brg_keahlian` (
  `kd` varchar(50) NOT NULL,
  `kd_brg` varchar(50) NOT NULL,
  `kd_keahlian` varchar(50) NOT NULL,
  `jml` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_brg_keahlian`
-- 

INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('99cf01589a64ae07a8f6f8a1331d72a6', '020919fb5a2e6034b8cabbe08ac1ba0d', '761328c3fd8f3bec20fd885d28ca22d2', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('0edeba167bce6edd400aa63b68f4b992', '020919fb5a2e6034b8cabbe08ac1ba0d', 'fb80bfef3775adb38538ecee6b93be0f', '2');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('79fa1953ae6d8bbe02908e4717a38b51', '020919fb5a2e6034b8cabbe08ac1ba0d', 'c44298c32a7d78c416646524b1b3f228', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('d1bb0a4c761fa1b9ca69cded8b13b61c', '020919fb5a2e6034b8cabbe08ac1ba0d', '4ca9dc826b48c794175b27fad223ff9e', '7');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('502007fad38507b807bf024ad4399c5c', '020919fb5a2e6034b8cabbe08ac1ba0d', 'f78e58e3d8d18775f418762e9426b43d', '2');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('56abd4ed4eb981ff1cf946972ae56662', '89a604cca445fdaf05f223d48d1e2d8c', '761328c3fd8f3bec20fd885d28ca22d2', '2');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('7b5342138253b880fe9863520a8e6b65', '89a604cca445fdaf05f223d48d1e2d8c', 'fb80bfef3775adb38538ecee6b93be0f', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('a91552967ee01962c5795309f606b29d', '89a604cca445fdaf05f223d48d1e2d8c', 'c44298c32a7d78c416646524b1b3f228', '3');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('528c2e215920a958e3be09360940461d', '89a604cca445fdaf05f223d48d1e2d8c', '4ca9dc826b48c794175b27fad223ff9e', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('3c56ecc0b390069c785051b80324a3f1', '89a604cca445fdaf05f223d48d1e2d8c', 'f78e58e3d8d18775f418762e9426b43d', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('615e83aece8751c767184f1f7d7ea673', '89a604cca445fdaf05f223d48d1e2d8c', '4fcf418adddd67383212bc1d22c61e98', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('29db1f24495e2cd1e3d99897851cdb31', '89a604cca445fdaf05f223d48d1e2d8c', '1c217606333ac983b8760baf64cd8b8a', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('0d43d2cb5918c58af3586aabb4c1fdcb', '89a604cca445fdaf05f223d48d1e2d8c', '1ca1210fab344eccd77b4f5f1e2cc569', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('ae89477307a5ce8bd11392029d6b73b5', '89a604cca445fdaf05f223d48d1e2d8c', '9d768710c2d056869f252b7a59a84c8c', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('137674f0200beff8c24ed4545d39bf3a', '020919fb5a2e6034b8cabbe08ac1ba0d', '4fcf418adddd67383212bc1d22c61e98', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('2c1d939b29960946d92718eaab9e0432', '020919fb5a2e6034b8cabbe08ac1ba0d', '1c217606333ac983b8760baf64cd8b8a', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('7c3b0540ae84bd97b3e265d30f1675c6', '020919fb5a2e6034b8cabbe08ac1ba0d', '1ca1210fab344eccd77b4f5f1e2cc569', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('9422ca87f39b7987a640fcb1ab6235d2', '020919fb5a2e6034b8cabbe08ac1ba0d', '9d768710c2d056869f252b7a59a84c8c', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('c588e709b0b8da1255f5ac1c30ab96df', '40b414426795f13813766d784a407e79', '4fcf418adddd67383212bc1d22c61e98', '6');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('805ad9a9bc2031a7bdd7e303740f64b5', '40b414426795f13813766d784a407e79', '1c217606333ac983b8760baf64cd8b8a', '3');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('bfe6ecd9ee14963da4040f22fa966f87', '40b414426795f13813766d784a407e79', '1ca1210fab344eccd77b4f5f1e2cc569', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('57e222384607f7d0a3d1bbce457f8967', '40b414426795f13813766d784a407e79', '9d768710c2d056869f252b7a59a84c8c', '2');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('17940dbb8f35d87d67f03b26b14d0bdb', '40b414426795f13813766d784a407e79', '761328c3fd8f3bec20fd885d28ca22d2', '1');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('1d85c154b663e4b9e536fd9e6b7c41ee', '40b414426795f13813766d784a407e79', 'c44298c32a7d78c416646524b1b3f228', '2');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('7a068fed45b76fb935d1bbc4d968682e', '40b414426795f13813766d784a407e79', 'fb80bfef3775adb38538ecee6b93be0f', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('0b1259b697b3ae26e1f58249be49fa5c', '40b414426795f13813766d784a407e79', '4ca9dc826b48c794175b27fad223ff9e', '');
INSERT INTO `inv_brg_keahlian` (`kd`, `kd_brg`, `kd_keahlian`, `jml`) VALUES ('1adf696863488e5154d1094fa37da952', '40b414426795f13813766d784a407e79', 'f78e58e3d8d18775f418762e9426b43d', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_brg_pengadaan`
-- 

CREATE TABLE `inv_brg_pengadaan` (
  `kd` varchar(50) NOT NULL,
  `kd_brg` varchar(50) NOT NULL,
  `no_seri` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `jenis_bahan` varchar(50) NOT NULL,
  `tahun_buat` varchar(4) NOT NULL,
  `tahun_beli` varchar(4) NOT NULL,
  `sumber_dana` varchar(50) NOT NULL,
  `jml` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_brg_pengadaan`
-- 

INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('6ecfd685ad714907e603b565984e8631', '020919fb5a2e6034b8cabbe08ac1ba0d', '7', '6', '5', '4', '22', '3', '4', '6');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('3f101e05791f81a7ca68bda957a265bd', '020919fb5a2e6034b8cabbe08ac1ba0d', '1', '2', '3', '4', '5', '6', '7', '8');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('027badf17e6111abdbc49f04cd6ea491', '020919fb5a2e6034b8cabbe08ac1ba0d', '8', '5', '6', '3', '4', '6', '8', '2');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('3a9b3acc803490fc7aef1b3eef0b19f4', '89a604cca445fdaf05f223d48d1e2d8c', '1234567', '1', '1', '1', '1', '1', '1', '10');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('3a19d84ca1b823dd625e29690a42a6e5', '40b414426795f13813766d784a407e79', '1', '2', '3', '4', '5', '6', '78', '8');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('13959997db93651ddf2060d3f7fbe887', '40b414426795f13813766d784a407e79', '8', '7', '6', '5', '4', '3', '2', '4');
INSERT INTO `inv_brg_pengadaan` (`kd`, `kd_brg`, `no_seri`, `merk`, `model`, `jenis_bahan`, `tahun_buat`, `tahun_beli`, `sumber_dana`, `jml`) VALUES ('e1b2e3d847e9ebb60c09c316ada831d1', '40b414426795f13813766d784a407e79', '8', '7', '6', '5', '4', '3', '4', '5');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_lab`
-- 

CREATE TABLE `inv_lab` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `lab` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_lab`
-- 

INSERT INTO `inv_lab` (`kd`, `lab`) VALUES ('c9d80946867450cc7b91a09061b4bb7b', 'Komputer');
INSERT INTO `inv_lab` (`kd`, `lab`) VALUES ('658bd3c4f4991b833046c2d34865c38b', 'Kimia');
INSERT INTO `inv_lab` (`kd`, `lab`) VALUES ('76fe41ffbdc7d350d79933d29b964237', 'Bahasa');
INSERT INTO `inv_lab` (`kd`, `lab`) VALUES ('00ed678a5f8c877227611637f45d7236', 'Biologi');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_peng_lab`
-- 

CREATE TABLE `inv_peng_lab` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_lab` varchar(50) NOT NULL DEFAULT '',
  `tgl` date NOT NULL DEFAULT '0000-00-00',
  `kd_jam` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_ruang` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_peng_lab`
-- 

INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('6856dbf9d08b8b4c91a84e044c459cb9', '00ed678a5f8c877227611637f45d7236', '2009-03-03', 'f341e7faba39e62971b3d538c92e82df', '1ca1210fab344eccd77b4f5f1e2cc569', '3be17d09596cd245484fed3a4f5576eb', 'af2e94e92ff53b8592d7c1fdaf0c9edc');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('16ef06105c105528ed6b06fc1491bd6b', '76fe41ffbdc7d350d79933d29b964237', '2007-01-01', 'b049b4d3490463a7c3db3cea5fc1fa10', '4fcf418adddd67383212bc1d22c61e98', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('f13bdca2c63c2b14c7554daa3ef1da97', '76fe41ffbdc7d350d79933d29b964237', '2007-01-05', 'b049b4d3490463a7c3db3cea5fc1fa10', '4fcf418adddd67383212bc1d22c61e98', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('22b4788e7b18804870875113de68988b', 'c9d80946867450cc7b91a09061b4bb7b', '2008-02-02', '3be17d09596cd245484fed3a4f5576eb', '', '3be17d09596cd245484fed3a4f5576eb', 'b9f286b3403b958369e0ec3423f1a733');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('d6294112aa4c059d634f46d213797503', 'c9d80946867450cc7b91a09061b4bb7b', '2007-01-01', 'b049b4d3490463a7c3db3cea5fc1fa10', '', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('2357b64401324f3e54655b7759408471', '76fe41ffbdc7d350d79933d29b964237', '2007-01-01', '02c979304d20859b2fe5c9135c0c269b', '', '27de8f38a90dd1755acd801abefcbb42', '75b107399d4a2d26ccdc4817f8c7c8ed');
INSERT INTO `inv_peng_lab` (`kd`, `kd_lab`, `tgl`, `kd_jam`, `kd_keahlian`, `kd_kelas`, `kd_ruang`) VALUES ('637d6b0f4cd40d8f1a94f39e0759f248', '76fe41ffbdc7d350d79933d29b964237', '2007-01-02', 'b049b4d3490463a7c3db3cea5fc1fa10', '', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733');

-- --------------------------------------------------------

-- 
-- Table structure for table `inv_stock`
-- 

CREATE TABLE `inv_stock` (
  `kd` varchar(50) NOT NULL,
  `kd_brg` varchar(50) NOT NULL,
  `jml` varchar(10) NOT NULL DEFAULT '0',
  `jml_bagus` varchar(10) NOT NULL DEFAULT '0',
  `jml_sedang` varchar(10) NOT NULL DEFAULT '0',
  `jml_rusak` varchar(10) NOT NULL DEFAULT '0',
  `jml_hilang` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `inv_stock`
-- 

INSERT INTO `inv_stock` (`kd`, `kd_brg`, `jml`, `jml_bagus`, `jml_sedang`, `jml_rusak`, `jml_hilang`) VALUES ('0b9b6096ed4b97bd8c1960850849ab27', '020919fb5a2e6034b8cabbe08ac1ba0d', '16', '7', '4', '3', '5');
INSERT INTO `inv_stock` (`kd`, `kd_brg`, `jml`, `jml_bagus`, `jml_sedang`, `jml_rusak`, `jml_hilang`) VALUES ('09110d343e3ed748fb1df60d996917c8', '89a604cca445fdaf05f223d48d1e2d8c', '10', '10', '0', '0', '0');
INSERT INTO `inv_stock` (`kd`, `kd_brg`, `jml`, `jml_bagus`, `jml_sedang`, `jml_rusak`, `jml_hilang`) VALUES ('a397e5bfe1822490268c5e8e7f659d4e', '40b414426795f13813766d784a407e79', '17', '17', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `jadwal`
-- 

CREATE TABLE `jadwal` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_ruang` varchar(50) NOT NULL DEFAULT '',
  `kd_hari` varchar(50) NOT NULL DEFAULT '',
  `kd_jam` varchar(50) NOT NULL DEFAULT '',
  `kd_guru_prog_pddkn` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `jadwal`
-- 

INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('fbb38a18c25b37494c248e745a2cb45f', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '3bd672f690029e9b72e83b8ad1b2f8ae', 'f341e7faba39e62971b3d538c92e82df', '55e99352b24771c455ae6b96e5d3638f');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('46bff87f48f5ae81813b9edf5daed934', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', 'd7c1803d15c88bd82eb4a702b57647f4', 'f78e58e3d8d18775f418762e9426b43d', '55e99352b24771c455ae6b96e5d3638f');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('6a59512d936634a0d9ee3a347aaa7c0c', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '4fcf418adddd67383212bc1d22c61e98', 'f341e7faba39e62971b3d538c92e82df', 'e0ab308f76dc42841b1c529da6c017c9');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('70f39fe8c9fecc8dc0d8ea1927b06d20', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '7d73752ca4d67f433696f6848afbb107', '02c979304d20859b2fe5c9135c0c269b', '6f871d68b5d031fcd887bac2949c5358');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('e6a6c540990de8c503e8783cd229784d', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '', 'b9f286b3403b958369e0ec3423f1a733', 'd7c1803d15c88bd82eb4a702b57647f4', '21ddd50a146dfd554ddac33c19a21be5', 'e0ab308f76dc42841b1c529da6c017c9');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('bbcf7556933df541502c419463e9cc49', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '', 'b9f286b3403b958369e0ec3423f1a733', 'f88bd7a685a66f4f73219524c1f9e417', '21ddd50a146dfd554ddac33c19a21be5', '9cad70439fc5daaac9816c4e9df5a277');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('d6266fd54cd53f8c64267b8a7ff268df', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', 'd7c1803d15c88bd82eb4a702b57647f4', '02c979304d20859b2fe5c9135c0c269b', '6f871d68b5d031fcd887bac2949c5358');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('a8018704dd077e7bbbe0eba2f57fc1ea', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '3bd672f690029e9b72e83b8ad1b2f8ae', '4fcf418adddd67383212bc1d22c61e98', 'e0ab308f76dc42841b1c529da6c017c9');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('0cc145ea4789989be02ce9696d8d1d61', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '', 'b9f286b3403b958369e0ec3423f1a733', 'f88bd7a685a66f4f73219524c1f9e417', '9b0001d3a5a4c413f0bb8e697b0e513f', '55e99352b24771c455ae6b96e5d3638f');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('15b17df97968499c093ea49306230f43', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '7d73752ca4d67f433696f6848afbb107', '9b0001d3a5a4c413f0bb8e697b0e513f', 'ced1f0564ba4765880f6fb15f02402d0');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('15b17df97968499c093ea49306230f43', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '7d73752ca4d67f433696f6848afbb107', 'f78e58e3d8d18775f418762e9426b43d', 'ced1f0564ba4765880f6fb15f02402d0');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('5cbbcd90153228dca2622551e352ad9d', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', 'f88bd7a685a66f4f73219524c1f9e417', '3be17d09596cd245484fed3a4f5576eb', 'ced1f0564ba4765880f6fb15f02402d0');
INSERT INTO `jadwal` (`kd`, `kd_tapel`, `kd_smt`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_hari`, `kd_jam`, `kd_guru_prog_pddkn`) VALUES ('5cbbcd90153228dca2622551e352ad9d', '2a771e8ba89dd288743d4839d61185bc', 'b060de380c57384744177849d22fb584', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', 'f88bd7a685a66f4f73219524c1f9e417', 'f341e7faba39e62971b3d538c92e82df', 'ced1f0564ba4765880f6fb15f02402d0');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_absensi`
-- 

CREATE TABLE `m_absensi` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `absensi` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_absensi`
-- 

INSERT INTO `m_absensi` (`kd`, `absensi`) VALUES ('d1e7c66e6fb18e8e8478c286ac485b44', 'Sakit');
INSERT INTO `m_absensi` (`kd`, `absensi`) VALUES ('1bb73a74f58b3ba76720a0f3ab332e59', 'Ijin');
INSERT INTO `m_absensi` (`kd`, `absensi`) VALUES ('4fcf418adddd67383212bc1d22c61e98', 'Tanpa Keterangan');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_agama`
-- 

CREATE TABLE `m_agama` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `agama` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_agama`
-- 

INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('1fa739bfa7fc7ff5ebbb1944c9c8084a', 'Islam');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('caa9acb7cdcdf3a49d26281ec61867f5', 'Kristen');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('13db0d7c61769bdbba15cd6d5f4c86f5', 'Katolik');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('f9dae408b40e9097a3fd7ce0cd2e4120', 'Budha');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('2e40a5fdb46adb1029fcc51d7571e48c', 'Hindu');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('ca2b29701f90679012558724658b1fc8', 'Kong Hu Chu');
INSERT INTO `m_agama` (`kd`, `agama`) VALUES ('49204f7eab33f980e6b98f0442a17640', 'Kepercayaan');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_akta`
-- 

CREATE TABLE `m_akta` (
  `kd` varchar(50) NOT NULL,
  `akta` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_akta`
-- 

INSERT INTO `m_akta` (`kd`, `akta`) VALUES ('20296bbc8d345279e7c3fc0413c4d60e', 'Akta 3');
INSERT INTO `m_akta` (`kd`, `akta`) VALUES ('fd4dc3aba82f486aa9c6ec60445ffa6b', 'Akta 4');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_ekstra`
-- 

CREATE TABLE `m_ekstra` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `ekstra` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_ekstra`
-- 

INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('3497319974c63ee32ca758f7d24b37b3', 'Kepanduan');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('0dc704879c3f55d88679abd6acd99d51', 'Tapak Suci');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('163c3b94b1707ba18bd8adb74587c179', 'Basket');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('40a9b1401bebc29d47f6fdb71ea603f8', 'Paskibra');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('76fcf4589702a0c082805f9678339788', 'Karate');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('e776d14ba18f49dd274ad45f2a27583a', 'PMR');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('951178296270eec3522cd7ffdbae4f3a', 'Tae Kwon Do');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('aaff4bcfcaa595218fbca83667c64c95', 'Kungfu');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('4f598504624dd39f0f3f7c759b7e86e2', 'Sepak Bola');
INSERT INTO `m_ekstra` (`kd`, `ekstra`) VALUES ('8058997b7cd574ba47173868f93facd7', 'Musik');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_golongan`
-- 

CREATE TABLE `m_golongan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `golongan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_golongan`
-- 

INSERT INTO `m_golongan` (`kd`, `golongan`) VALUES ('82ba4795616e0288f375a255db7ceffd', '1');
INSERT INTO `m_golongan` (`kd`, `golongan`) VALUES ('03d4e1d05551bc9934e133b25db47760', '2');
INSERT INTO `m_golongan` (`kd`, `golongan`) VALUES ('f294b10662da8af71146e265a3157cfb', '3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_guru`
-- 

CREATE TABLE `m_guru` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_guru`
-- 

INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('c77f69ccdc6aad0910f23fd656c19261', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('7d73752ca4d67f433696f6848afbb107', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('0d4073aca49c4cbe0d441ba7b947a031', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('57aa3b059247cb6ded92fb69c723e8d6', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('199922eadd17be1b1188ef5edaa021f9', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('e0533a3c7e0d813195f095fc7217dc03', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('bbe6493adb0d15342c6b496cabd9e21c', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('fb80bfef3775adb38538ecee6b93be0f', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('f135cb913492af5b099a6e09cb57b3ab', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', 'edc5b859d5d26ed9c06a34ac72c2aed5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('5437ac49120428e5b464ff492b030a2c', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('8cbd5a2353c0813626de8960326748f7', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('0820c1faa803ad3a30fc3f74b5e1b6e8', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1ca1210fab344eccd77b4f5f1e2cc569', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('7c168ef905655ae7b5f3deb056a005c7', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1ca1210fab344eccd77b4f5f1e2cc569', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('4a8637c1ee34155315115fa4c8ffe609', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1ca1210fab344eccd77b4f5f1e2cc569', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('9ed20655d47a1ccbb89893d029002ab3', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1c217606333ac983b8760baf64cd8b8a', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('d7bd92b5dbdabcb8c45772b98f1509fd', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1c217606333ac983b8760baf64cd8b8a', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('4f9b10765aa44810f098333aa3f1fbce', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1c217606333ac983b8760baf64cd8b8a', 'edc5b859d5d26ed9c06a34ac72c2aed5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('0513aa22c98841121f05d3952febea98', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4fcf418adddd67383212bc1d22c61e98', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('50691f531e155f82474ae005461127cd', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4fcf418adddd67383212bc1d22c61e98', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('97aacd5fe0789b7c859d79c99af133d9', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4fcf418adddd67383212bc1d22c61e98', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('478ff021b9e3263bd768ad74565e04b1', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('bf56f18f247f049f1c21e7c614ebb15c', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('d830f37d05607ac9747ec4254a81c490', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('452446d904e8370fc0d6d911686a0ce0', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('463525d6ec375887e546d4ee250f4c2b', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('f5a1d68f40e868a0f92b0d6c7991ea6a', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('104fb57f6dc1ea3d1fd3d799661b8a09', '', '', '', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('9a273e6ab455c01b2bc413bd8216d9f6', '', '', '', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('8b539ba6d5843d659104f0baca2a6bc7', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('8a5cae718c22c655b01c906de1f5aea1', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('1052d42b0b7756bad413cb4d2f3429aa', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '45e13fe0fba53e8ad0642c139bf0f7c9');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('bf8d2af37d3a0d78f3d33d9f312dcc76', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '45d67a1ea2cd66420f007a190615506e', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('b55837f351547643169a43b489e649d1', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '45d67a1ea2cd66420f007a190615506e', 'f8521322d5f22044ab5bf49de4a81b27');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('32e1e7c18b4bb481cb9a877ea16d30ef', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '45d67a1ea2cd66420f007a190615506e', '864ca069180ae7c4acbb6ecac3148381');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('9d290f220e69294eb978ed052a9081ad', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '45d67a1ea2cd66420f007a190615506e', '8cd74c008c54c1ed1731a3dbe055f935');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('a125f1b7266d7a1a928edd4352db0fbc', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '45d67a1ea2cd66420f007a190615506e', '850a678c48b6f41b58d0b5678c6042bf');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('b13b53f14326605101212abd50f964fa', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('adaa7e3a4155cb2db499585b7e9b2a9d', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '5352c372add482e5f2d6e67a6f8be681');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('a6a91e725e02222bba9e03dee3803ead', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '864ca069180ae7c4acbb6ecac3148381');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('5dfd1c73705093569f31f0e91a69665e', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4ca9dc826b48c794175b27fad223ff9e', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('55a9bcdebffc58cef452eb403ddac1de', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4ca9dc826b48c794175b27fad223ff9e', '5352c372add482e5f2d6e67a6f8be681');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('10a1e0c4c2be08d861308ae24a590463', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4ca9dc826b48c794175b27fad223ff9e', '9f545dc8f390f4c8c779bb25c326cbb3');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('52cc1029fcf5bf244510b66210e9c3ef', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('a063ffb290669140d634fac3207fc33a', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('6b1f2351dcbc9bcbd29109c0f2319180', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', 'f8521322d5f22044ab5bf49de4a81b27');
INSERT INTO `m_guru` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_pegawai`) VALUES ('5594f70af3caba0d0d60fb15b5912a1a', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', '9f545dc8f390f4c8c779bb25c326cbb3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_guru_prog_pddkn`
-- 

CREATE TABLE `m_guru_prog_pddkn` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_guru` varchar(50) NOT NULL DEFAULT '',
  `kd_ruang` varchar(50) NOT NULL DEFAULT '',
  `kd_prog_pddkn` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_guru_prog_pddkn`
-- 

INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('298e289af25f55d318abdfc191198530', '3d0ecba6af6b76496a9bad0fff80af43', 'b9f286b3403b958369e0ec3423f1a733', '39dbbf4078f620cd28d241706729e457');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('f0fdd8df809f4a55f84f2d2d6363e7a1', '5c5b76553d21e1aa2bcbbd55aec09b41', 'b9f286b3403b958369e0ec3423f1a733', '39dbbf4078f620cd28d241706729e457');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('21ddd50a146dfd554ddac33c19a21be5', '3d0ecba6af6b76496a9bad0fff80af43', 'b9f286b3403b958369e0ec3423f1a733', 'fc76ca9f6ebcf0f34ab21b55cefdb912');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('59a44dc24088badd73202367003e7064', '5c5b76553d21e1aa2bcbbd55aec09b41', 'b9f286b3403b958369e0ec3423f1a733', 'd8022de243b4ce12b64f03a48158d39f');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('07e77cfcac013c4a011b50d521611b3e', '1bb73a74f58b3ba76720a0f3ab332e59', '75b107399d4a2d26ccdc4817f8c7c8ed', 'ec5a224ccc0e8c42b34814d6fa12ab2d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('3bd672f690029e9b72e83b8ad1b2f8ae', '29dfb4f490cf1855897561d5d6fdf59d', 'b9f286b3403b958369e0ec3423f1a733', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('33a7d0150879ab43089e531039c2d60c', '2ac3f4b47d993636357ab698e36a167f', 'b9f286b3403b958369e0ec3423f1a733', '6e09ea4152ea4e26c83f7d60c3c37be6');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('38a80108a0594a2cb9bbe34b036538a6', '2ac3f4b47d993636357ab698e36a167f', 'b9f286b3403b958369e0ec3423f1a733', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('e3153e17980b9a118145948cdd2d884a', 'aa947a10c3177f11379ce9fd1f5976f6', 'b9f286b3403b958369e0ec3423f1a733', 'ec5a224ccc0e8c42b34814d6fa12ab2d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('98c1a7a2e6013a128168cb9be449ca8c', 'dc40e589d2b506ed0b86c47346fe68ce', 'b9f286b3403b958369e0ec3423f1a733', '4598dd5b9ac644eaec4af76c548743be');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('52355c293be55acda94f62f81631e755', '306deafc4624b7016706b0484964c99d', 'b9f286b3403b958369e0ec3423f1a733', '4598dd5b9ac644eaec4af76c548743be');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('0ea6f9fa1b303efcefcec9d2a9deb351', 'dc40e589d2b506ed0b86c47346fe68ce', 'b9f286b3403b958369e0ec3423f1a733', 'd8022de243b4ce12b64f03a48158d39f');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('4d6f161735e1081c3c00c8d3666896ba', '29dfb4f490cf1855897561d5d6fdf59d', '75b107399d4a2d26ccdc4817f8c7c8ed', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('0e1ece3d552f2a2093df270b7ab30caf', '29dfb4f490cf1855897561d5d6fdf59d', '4b011fa0d4299e61fc27b1fa1432a1b4', '50bae4d47d12fa0cf23403a12f34be0d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('7274d1cb7966b62fa48beca3d67e5d99', 'e94ce13d82a4cecc43d04854029cf048', 'b9f286b3403b958369e0ec3423f1a733', 'ec5a224ccc0e8c42b34814d6fa12ab2d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('7e42d9ac3ac4577368ab725d161e2672', 'e94ce13d82a4cecc43d04854029cf048', 'b9f286b3403b958369e0ec3423f1a733', '6e09ea4152ea4e26c83f7d60c3c37be6');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('1e452ea94e0e03e368859a95f3da6ab3', 'e94ce13d82a4cecc43d04854029cf048', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '558dc5761abfa074e9b9f6ef52499a4d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('d5541046a0181da6c4c4142893f9db63', '2b80ca30c19541c6299cb39435fcff32', '75b107399d4a2d26ccdc4817f8c7c8ed', 'd8022de243b4ce12b64f03a48158d39f');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('5853fa7283cfd3999e6a0969dd13431e', 'e94ce13d82a4cecc43d04854029cf048', 'b9f286b3403b958369e0ec3423f1a733', '558dc5761abfa074e9b9f6ef52499a4d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('b0f139e46f9efe22e22dba86f523d0fa', 'aa947a10c3177f11379ce9fd1f5976f6', 'b9f286b3403b958369e0ec3423f1a733', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('5e3e35497db28a58d7b8fb92baed035f', 'aa947a10c3177f11379ce9fd1f5976f6', 'b9f286b3403b958369e0ec3423f1a733', '50bae4d47d12fa0cf23403a12f34be0d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('b68e8711ad0c22383bf1434de795602d', 'c77f69ccdc6aad0910f23fd656c19261', 'b9f286b3403b958369e0ec3423f1a733', 'd8022de243b4ce12b64f03a48158d39f');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('01c4a367629fce625230d83ea8d0a4ec', '0d4073aca49c4cbe0d441ba7b947a031', 'b9f286b3403b958369e0ec3423f1a733', '50bae4d47d12fa0cf23403a12f34be0d');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('8d7887e708e9022e535545ef7e8cdbda', '7d73752ca4d67f433696f6848afbb107', 'b9f286b3403b958369e0ec3423f1a733', '4598dd5b9ac644eaec4af76c548743be');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('af07d1bd4b01753703b238d620b85899', '0d4073aca49c4cbe0d441ba7b947a031', 'b9f286b3403b958369e0ec3423f1a733', 'd8022de243b4ce12b64f03a48158d39f');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('af51c232b6591c3734ba21e8a16ed3ed', '7d73752ca4d67f433696f6848afbb107', 'b9f286b3403b958369e0ec3423f1a733', 'c89e31c6134d92194320f6661e446dfb');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('eb5b43f50d4d178d78beba3acba6c890', '7d73752ca4d67f433696f6848afbb107', '75b107399d4a2d26ccdc4817f8c7c8ed', 'c89e31c6134d92194320f6661e446dfb');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('ac5a3b8d248cd5dd1ac8ed45b122aec8', '7d73752ca4d67f433696f6848afbb107', 'b9f286b3403b958369e0ec3423f1a733', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('73c1850e7a9a229b5303af4c5b484181', '463525d6ec375887e546d4ee250f4c2b', 'b9f286b3403b958369e0ec3423f1a733', 'c89e31c6134d92194320f6661e446dfb');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('494b1d74c6eecf755128fa531cb83892', 'c77f69ccdc6aad0910f23fd656c19261', 'b9f286b3403b958369e0ec3423f1a733', '1c867c0c756b35bc24301b0403fa556a');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('15c729ca83a74e52d0960d2a434f1daf', 'c77f69ccdc6aad0910f23fd656c19261', 'b9f286b3403b958369e0ec3423f1a733', 'c89e31c6134d92194320f6661e446dfb');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('dd5795cba4b4865fb0129c7030f7b156', '0d4073aca49c4cbe0d441ba7b947a031', 'b9f286b3403b958369e0ec3423f1a733', '8c5d87f3695190b00ffc7ab43e8aed24');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('55e99352b24771c455ae6b96e5d3638f', '8b539ba6d5843d659104f0baca2a6bc7', 'b9f286b3403b958369e0ec3423f1a733', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('e0ab308f76dc42841b1c529da6c017c9', 'a6a91e725e02222bba9e03dee3803ead', 'b9f286b3403b958369e0ec3423f1a733', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('5fca306cce1c661a1d507efe58540050', '1052d42b0b7756bad413cb4d2f3429aa', 'b9f286b3403b958369e0ec3423f1a733', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('6f871d68b5d031fcd887bac2949c5358', '8a5cae718c22c655b01c906de1f5aea1', 'b9f286b3403b958369e0ec3423f1a733', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('ced1f0564ba4765880f6fb15f02402d0', '8b539ba6d5843d659104f0baca2a6bc7', 'b9f286b3403b958369e0ec3423f1a733', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('9cad70439fc5daaac9816c4e9df5a277', 'b13b53f14326605101212abd50f964fa', 'b9f286b3403b958369e0ec3423f1a733', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('29376c07862cefc1ce64091715ee4ff5', 'b13b53f14326605101212abd50f964fa', 'b9f286b3403b958369e0ec3423f1a733', '172e9306f38626c28c5e2f46971f358e');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('ea5f0b6e2eb25c1978090a20a7c482e4', '8b539ba6d5843d659104f0baca2a6bc7', 'b9f286b3403b958369e0ec3423f1a733', '172e9306f38626c28c5e2f46971f358e');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('78e50eeadce0e9e8af0377c0e2f52d6c', '8a5cae718c22c655b01c906de1f5aea1', 'b9f286b3403b958369e0ec3423f1a733', '0ed6099d9e7062b4ad72968c98e960d3');
INSERT INTO `m_guru_prog_pddkn` (`kd`, `kd_guru`, `kd_ruang`, `kd_prog_pddkn`) VALUES ('744b2ea2aa096bb95f4a538f40ef6fee', '8b539ba6d5843d659104f0baca2a6bc7', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '37e27d00c9153d7c094d3e78b4ec75c5');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_hari`
-- 

CREATE TABLE `m_hari` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `no` char(1) NOT NULL DEFAULT '',
  `hari` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_hari`
-- 

INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('3bd672f690029e9b72e83b8ad1b2f8ae', '1', 'Senin');
INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('d7c1803d15c88bd82eb4a702b57647f4', '2', 'Selasa');
INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('7d73752ca4d67f433696f6848afbb107', '3', 'Rabu');
INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('f88bd7a685a66f4f73219524c1f9e417', '4', 'Kamis');
INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('4fcf418adddd67383212bc1d22c61e98', '5', 'Jum''at');
INSERT INTO `m_hari` (`kd`, `no`, `hari`) VALUES ('b0f139e46f9efe22e22dba86f523d0fa', '6', 'Sabtu');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_ijazah`
-- 

CREATE TABLE `m_ijazah` (
  `kd` varchar(50) NOT NULL,
  `ijazah` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_ijazah`
-- 

INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('7e9c4f81efa7a4a17474cb7969db36ca', 'S1');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('18a448cef0991b012fa96db82f9b9ef3', 'D III');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('fb73fb01775f6fb97ead55a219f179f8', 'S2');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('0960ac522396310eb4ff29db114e81cb', 'D IV');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('16497238bd931d9dc1151d469a42d2ff', 'SMA');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('f9bf654e0f1297bef49519bc6fae0ce0', 'D II');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('92a3b66f9dd6907a1573ac45bd20d85b', 'SD');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('2aba8bb893e540a14a225691ad854384', 'SMP');
INSERT INTO `m_ijazah` (`kd`, `ijazah`) VALUES ('dbb93ba7f11c88deb4f468de85827a36', 'SLTA');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_jabatan`
-- 

CREATE TABLE `m_jabatan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `jabatan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_jabatan`
-- 

INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('9b381c97c759b1066e58b2f26bda40a1', 'x');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('ce132b57bdf8b227ba09cce73ad88f91', 'y');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('13625166e41e264b7d034a0eb0b5f293', 'z');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('9b381c97c759b1066e58b2f26bda40a1', 'Kepala Sekolah');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('ce132b57bdf8b227ba09cce73ad88f91', 'Guru Pembina');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('13625166e41e264b7d034a0eb0b5f293', 'Guru Dewasa Tk. I');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('58e8dfdc7905e969285c61efb3a118d9', 'Guru Madya Tk. I');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('a728fa08dc4c37785f18f89e37cbc634', 'Guru Madya');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('8998124baa043bf1b45d873a8249d4b0', 'Kepala Tata Usaha');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('62e6546183b1d93d1ea313fd1a9027a2', 'Pelaksana');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('87c78b9cf602521947d9cee2f221faee', 'Guru Tidak Tetap');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('fc7a2d467dd97e5125e788a9dbb34cd3', 'Petugas Perpustakaan');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('b98b4ea54a3ecc439961f5cf0ff2e2eb', 'Petugas Kebersihan');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('7c25650e210eb0a77cf798139783e953', 'Satpam');
INSERT INTO `m_jabatan` (`kd`, `jabatan`) VALUES ('d343b77f000db7fb30c95c3b0ff5b8f7', 'Staf Tata Usaha');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_jam`
-- 

CREATE TABLE `m_jam` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `jam` char(2) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_jam`
-- 

INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('b049b4d3490463a7c3db3cea5fc1fa10', '1');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('3be17d09596cd245484fed3a4f5576eb', '2');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('f341e7faba39e62971b3d538c92e82df', '3');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('02c979304d20859b2fe5c9135c0c269b', '4');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('21ddd50a146dfd554ddac33c19a21be5', '5');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('4fcf418adddd67383212bc1d22c61e98', '6');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('9b0001d3a5a4c413f0bb8e697b0e513f', '7');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('f78e58e3d8d18775f418762e9426b43d', '8');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('1bb73a74f58b3ba76720a0f3ab332e59', '9');
INSERT INTO `m_jam` (`kd`, `jam`) VALUES ('0973ddebfca6c421a4e1ce28a4d29ea9', '10');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_keahlian`
-- 

CREATE TABLE `m_keahlian` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `bidang` varchar(100) NOT NULL,
  `program` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_keahlian`
-- 

INSERT INTO `m_keahlian` (`kd`, `bidang`, `program`) VALUES ('fb80bfef3775adb38538ecee6b93be0f', 'Listrik', 'Teknik Listrik Pemakaian');
INSERT INTO `m_keahlian` (`kd`, `bidang`, `program`) VALUES ('761328c3fd8f3bec20fd885d28ca22d2', 'Bangunan', 'Teknik Konstruksi Bangunan');
INSERT INTO `m_keahlian` (`kd`, `bidang`, `program`) VALUES ('c44298c32a7d78c416646524b1b3f228', 'Elektronik', 'Teknik Audio Video');
INSERT INTO `m_keahlian` (`kd`, `bidang`, `program`) VALUES ('4ca9dc826b48c794175b27fad223ff9e', 'Otomotif', 'Teknik Mekanik Otomotif');
INSERT INTO `m_keahlian` (`kd`, `bidang`, `program`) VALUES ('f78e58e3d8d18775f418762e9426b43d', 'Teknologi Pengerjaan Logam', 'Teknik Mesin Perkakas');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_kelamin`
-- 

CREATE TABLE `m_kelamin` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kelamin` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_kelamin`
-- 

INSERT INTO `m_kelamin` (`kd`, `kelamin`) VALUES ('4fcf418adddd67383212bc1d22c61e98', 'Pria');
INSERT INTO `m_kelamin` (`kd`, `kelamin`) VALUES ('29dfb4f490cf1855897561d5d6fdf59d', 'Wanita');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_kelas`
-- 

CREATE TABLE `m_kelas` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `no` char(1) NOT NULL DEFAULT '',
  `kelas` varchar(5) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_kelas`
-- 

INSERT INTO `m_kelas` (`kd`, `no`, `kelas`) VALUES ('27de8f38a90dd1755acd801abefcbb42', '1', 'X');
INSERT INTO `m_kelas` (`kd`, `no`, `kelas`) VALUES ('2df89d4a12f44a5cc897d6814760687d', '2', 'XI');
INSERT INTO `m_kelas` (`kd`, `no`, `kelas`) VALUES ('3be17d09596cd245484fed3a4f5576eb', '3', 'XII');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pangkat`
-- 

CREATE TABLE `m_pangkat` (
  `kd` varchar(50) NOT NULL,
  `pangkat` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pangkat`
-- 

INSERT INTO `m_pangkat` (`kd`, `pangkat`) VALUES ('c0011836f1202e3d5213e40fea29a377', 'Pembina');
INSERT INTO `m_pangkat` (`kd`, `pangkat`) VALUES ('550be00f355817a5bf3d27bc02d6398f', 'Penata Tk. I');
INSERT INTO `m_pangkat` (`kd`, `pangkat`) VALUES ('f5a11b8d79a774ea94242a2ad2768d97', 'Penata Muda Tk. I');
INSERT INTO `m_pangkat` (`kd`, `pangkat`) VALUES ('88ab28fb5217f51e69a3e40f0943d931', 'Penata');
INSERT INTO `m_pangkat` (`kd`, `pangkat`) VALUES ('a1d14d562ff19d0260ce5f70a288d324', 'Pengatur Tk. I');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai`
-- 

CREATE TABLE `m_pegawai` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `usernamex` varchar(50) NOT NULL,
  `passwordx` varchar(50) NOT NULL DEFAULT '',
  `nip` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL DEFAULT '',
  `kode` varchar(10) NOT NULL,
  `no_karpeg` varchar(10) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kd_kelamin` varchar(50) NOT NULL,
  `kd_agama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(100) NOT NULL,
  `gol_darah` varchar(10) NOT NULL,
  `filex` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai`
-- 

INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('8581148fda4cba20aa220b5bea5585d5', '120002', '98e8e5d9fb7d1f55d0ab70b7ffbca62b', '120002', '', 'Budi Raharjo', 'x', 'x', '1', '1900-01-01', '', '', '1', '1', '', '54021.jpg', '2008-08-14 13:00:19');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('fd81e50177b43431264d5a9c8499b2a9', '120003', '665a3abd55c0eb9242ae61187b48cd7b', '120003', '', 'Rusmanto Maryanto', '', '', '', '0000-00-00', '', '', '', '', '', '', '2008-08-17 15:06:58');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('8d804e81dcaa079c870be3138edf8006', '120001', 'df906bde6d2bb9848a5f23b35c3cf7df', '120001', '120001', 'Onno W. Purbo', '1', '1', '', '1900-01-01', '', '', '1', '1', '', '', '2008-07-04 14:47:31');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('8ce91ca2473b2f64575ef9284bf36640', '120004', 'fd6112d052e082ed3555cf2a0a655ea2', '120004', '', 'Anton R. Pardede', '', '', '', '0000-00-00', '', '', '', '', '', '', '2008-07-04 09:10:28');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('2df89d4a12f44a5cc897d6814760687d', '120005', '3203c2cc45642fd235ba5d1fc3d98a08', '120005', '', 'Jim Geovedi', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('3be17d09596cd245484fed3a4f5576eb', '120006', 'c3101780f81c15ad09ad901e98c68fc4', '120006', '', 'Ariya Hidayat', '', '', '', '0000-00-00', '', '', '', '', '', '', '2008-08-14 13:00:34');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('edc5b859d5d26ed9c06a34ac72c2aed5', '120007', 'f809499433d9f18de33a30c9e4e64e08', '120007', '', 'Alan Cox', '', '', '', '0000-00-00', '', '', '', '', '', '', '2008-06-29 11:59:30');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('45e13fe0fba53e8ad0642c139bf0f7c9', '120008', '55bb5123744ed940aed9f0896f41bcc1', '120008', '', 'David Faure', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('f8521322d5f22044ab5bf49de4a81b27', '1200010', 'ac85f460ae845d24b8cb33a771e72a08', '1200010', '', 'Richard M. Stallman', '3', '3', '3', '1903-03-03', '', '', '3', '3', '', '54003.jpg', '2009-07-24 11:53:33');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('a12f117d9ea5572828c4e13e5507b1a5', '1200013', 'afd06feefbb98811df9a69adff74797f', '1200013', '1200013', 'George Staikos', '888', '888', '7', '1902-02-06', '', '', '87', '53', '', 'bs23034.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('002d8634798be7bded45c82e6a9c69d4', '120009', '9a36ff6edf42edd904855c78f0f516c6', '120009', '120009', 'Waldo Bastian', '8', '7', '5', '1906-05-07', '', '', '987', '545', '', '54010.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('864ca069180ae7c4acbb6ecac3148381', '1200016', '4e36f3836cb796884c69f90f9f00fdef', '1200016', '120006', 'I Made Wiryana', '4', '4', '4', '1900-01-01', '', '', '4', '4', '', '56104.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('b37a3675ceb2e32d4b1fb9864231ee4a', '1200018', 'b709bbdc979585d95d97903878b1b921', '1200018', '1200018', 'Frans Thamura', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('9f545dc8f390f4c8c779bb25c326cbb3', '1200014', 'f7ce90efeffb747720d5f91f6dac6a7b', '1200014', '1200014', 'Daniel Molkentin', '3', '4', '6', '1904-03-03', '', '', '5', '6', '', '54301.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('5352c372add482e5f2d6e67a6f8be681', '1200011', '3b0e07868badc3a2eb00ca2da180af64', '1200011', '1200011', 'Noprianto', '5', '4', '5', '1902-03-03', '', '', '7', '5', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('8cd74c008c54c1ed1731a3dbe055f935', '1200017', '052df9f146039cb52f1e631355c1b47f', '1200017', '1200017', 'Reza Ervani', '', '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('850a678c48b6f41b58d0b5678c6042bf', '1200012', 'c2590aaf080c4d1f9a15c3b97bf4726b', '1200012', '1200012', 'Michael S. Sunggiardi', '777', '777', '777', '1902-03-03', '', '', '777', '777', '777', '', '0000-00-00 00:00:00');
INSERT INTO `m_pegawai` (`kd`, `usernamex`, `passwordx`, `nip`, `nuptk`, `nama`, `kode`, `no_karpeg`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `alamat`, `telp`, `gol_darah`, `filex`, `postdate`) VALUES ('8df3c8cfd8e00cf41e120b3c02f7458f', '1200015', 'ffcd8ca24575d2a6f400afc93f914b66', '1200015', '1200015', 'Linus Torvald', '555', '44', '22', '0000-00-00', '', '', '', '', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_diklat`
-- 

CREATE TABLE `m_pegawai_diklat` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `penyelenggara` varchar(50) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `lama` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_diklat`
-- 

INSERT INTO `m_pegawai_diklat` (`kd`, `kd_pegawai`, `nama`, `penyelenggara`, `tempat`, `tahun`, `lama`) VALUES ('2c01f90efb7e969f31187f2abe96ae61', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '8', '7', '6', '5', '4');
INSERT INTO `m_pegawai_diklat` (`kd`, `kd_pegawai`, `nama`, `penyelenggara`, `tempat`, `tahun`, `lama`) VALUES ('f9840be13fb5f4246b32738b692afec7', '850a678c48b6f41b58d0b5678c6042bf', '777', '', '', '', '');
INSERT INTO `m_pegawai_diklat` (`kd`, `kd_pegawai`, `nama`, `penyelenggara`, `tempat`, `tahun`, `lama`) VALUES ('3b4af707ff4ba0ee945c13b10d72aa09', '002d8634798be7bded45c82e6a9c69d4', '12', '23', '34', '45', '56');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_keluarga`
-- 

CREATE TABLE `m_pegawai_keluarga` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `nama_ayah` varchar(30) NOT NULL,
  `nama_ibu` varchar(30) NOT NULL,
  `status_kawin` enum('true','false') NOT NULL DEFAULT 'false',
  `tgl_nikah` date NOT NULL,
  `nama_pasangan` varchar(30) NOT NULL,
  `tmp_lahir_pasangan` varchar(50) NOT NULL,
  `tgl_lahir_pasangan` date NOT NULL,
  `pekerjaan_pasangan` varchar(50) NOT NULL,
  `nip_pasangan` varchar(30) NOT NULL,
  `gaji_pasangan` varchar(10) NOT NULL,
  `anak1_nama` varchar(30) NOT NULL,
  `anak1_tmp_lahir` varchar(50) NOT NULL,
  `anak1_tgl_lahir` date NOT NULL,
  `anak1_kelamin` varchar(1) NOT NULL,
  `anak1_sekolah` varchar(50) NOT NULL,
  `anak1_tunjangan` varchar(10) NOT NULL,
  `anak2_nama` varchar(30) NOT NULL,
  `anak2_tmp_lahir` varchar(50) NOT NULL,
  `anak2_tgl_lahir` date NOT NULL,
  `anak2_kelamin` varchar(1) NOT NULL,
  `anak2_sekolah` varchar(50) NOT NULL,
  `anak2_tunjangan` varchar(10) NOT NULL,
  `anak3_nama` varchar(30) NOT NULL,
  `anak3_tmp_lahir` varchar(50) NOT NULL,
  `anak3_tgl_lahir` date NOT NULL,
  `anak3_kelamin` varchar(1) NOT NULL,
  `anak3_sekolah` varchar(50) NOT NULL,
  `anak3_tunjangan` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_keluarga`
-- 

INSERT INTO `m_pegawai_keluarga` (`kd`, `kd_pegawai`, `nama_ayah`, `nama_ibu`, `status_kawin`, `tgl_nikah`, `nama_pasangan`, `tmp_lahir_pasangan`, `tgl_lahir_pasangan`, `pekerjaan_pasangan`, `nip_pasangan`, `gaji_pasangan`, `anak1_nama`, `anak1_tmp_lahir`, `anak1_tgl_lahir`, `anak1_kelamin`, `anak1_sekolah`, `anak1_tunjangan`, `anak2_nama`, `anak2_tmp_lahir`, `anak2_tgl_lahir`, `anak2_kelamin`, `anak2_sekolah`, `anak2_tunjangan`, `anak3_nama`, `anak3_tmp_lahir`, `anak3_tgl_lahir`, `anak3_kelamin`, `anak3_sekolah`, `anak3_tunjangan`) VALUES ('46bf0e171ac4d418b4d4bcce5508a0b0', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '9', '8', 'true', '1903-03-01', '7', '6', '1908-07-08', '5', '4', '4500000', '1', '2', '1901-02-01', 'L', '3', '4', '5', '6', '1902-03-03', 'P', '7', '8', '9', '8', '1904-04-01', 'L', '7', '6');
INSERT INTO `m_pegawai_keluarga` (`kd`, `kd_pegawai`, `nama_ayah`, `nama_ibu`, `status_kawin`, `tgl_nikah`, `nama_pasangan`, `tmp_lahir_pasangan`, `tgl_lahir_pasangan`, `pekerjaan_pasangan`, `nip_pasangan`, `gaji_pasangan`, `anak1_nama`, `anak1_tmp_lahir`, `anak1_tgl_lahir`, `anak1_kelamin`, `anak1_sekolah`, `anak1_tunjangan`, `anak2_nama`, `anak2_tmp_lahir`, `anak2_tgl_lahir`, `anak2_kelamin`, `anak2_sekolah`, `anak2_tunjangan`, `anak3_nama`, `anak3_tmp_lahir`, `anak3_tgl_lahir`, `anak3_kelamin`, `anak3_sekolah`, `anak3_tunjangan`) VALUES ('cae5709f0f168d026c55dd25532e1f71', '850a678c48b6f41b58d0b5678c6042bf', '777', '', '', '0000-00-00', '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '0000-00-00', '', '', '');
INSERT INTO `m_pegawai_keluarga` (`kd`, `kd_pegawai`, `nama_ayah`, `nama_ibu`, `status_kawin`, `tgl_nikah`, `nama_pasangan`, `tmp_lahir_pasangan`, `tgl_lahir_pasangan`, `pekerjaan_pasangan`, `nip_pasangan`, `gaji_pasangan`, `anak1_nama`, `anak1_tmp_lahir`, `anak1_tgl_lahir`, `anak1_kelamin`, `anak1_sekolah`, `anak1_tunjangan`, `anak2_nama`, `anak2_tmp_lahir`, `anak2_tgl_lahir`, `anak2_kelamin`, `anak2_sekolah`, `anak2_tunjangan`, `anak3_nama`, `anak3_tmp_lahir`, `anak3_tgl_lahir`, `anak3_kelamin`, `anak3_sekolah`, `anak3_tunjangan`) VALUES ('ed5b7b661fb4578574d2cdca0651b9cf', '002d8634798be7bded45c82e6a9c69d4', '1', '1', 'false', '1902-03-03', '1', '1', '1901-03-02', '1', '1', '1000000', '1', '2', '1904-05-04', 'P', '1', '1', '1', '4', '1904-08-07', 'L', '1', '1', '1', '5', '1903-10-05', 'L', '1', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_mengajar`
-- 

CREATE TABLE `m_pegawai_mengajar` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `mengajar1` varchar(50) NOT NULL,
  `jml_jam1` varchar(3) NOT NULL,
  `mengajar2` varchar(50) NOT NULL,
  `jml_jam2` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_mengajar`
-- 

INSERT INTO `m_pegawai_mengajar` (`kd`, `kd_pegawai`, `mengajar1`, `jml_jam1`, `mengajar2`, `jml_jam2`) VALUES ('0fede5042ef268ad353284b5d6d3029c', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '9', '8', '7', '6');
INSERT INTO `m_pegawai_mengajar` (`kd`, `kd_pegawai`, `mengajar1`, `jml_jam1`, `mengajar2`, `jml_jam2`) VALUES ('49f6fafede90c49971013307e8bbe08f', '850a678c48b6f41b58d0b5678c6042bf', '777', '', '', '');
INSERT INTO `m_pegawai_mengajar` (`kd`, `kd_pegawai`, `mengajar1`, `jml_jam1`, `mengajar2`, `jml_jam2`) VALUES ('326e80fcf6d569c73b9b89a6a3550f15', '002d8634798be7bded45c82e6a9c69d4', '9', '8', '7', '6');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_mk`
-- 

CREATE TABLE `m_pegawai_mk` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `sk_bln` varchar(2) NOT NULL,
  `sk_thn` varchar(2) NOT NULL,
  `s_bln` varchar(2) NOT NULL,
  `s_thn` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_mk`
-- 

INSERT INTO `m_pegawai_mk` (`kd`, `kd_pegawai`, `sk_bln`, `sk_thn`, `s_bln`, `s_thn`) VALUES ('50f88422ff4ec01329ec315de28cbbe5', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '8', '9', '6', '7');
INSERT INTO `m_pegawai_mk` (`kd`, `kd_pegawai`, `sk_bln`, `sk_thn`, `s_bln`, `s_thn`) VALUES ('b2bbce78d08544387a7e4a27ed8bf550', '850a678c48b6f41b58d0b5678c6042bf', '', '7', '', '');
INSERT INTO `m_pegawai_mk` (`kd`, `kd_pegawai`, `sk_bln`, `sk_thn`, `s_bln`, `s_thn`) VALUES ('0b5dd389cda2e5b16abbb37b6d9a10be', '002d8634798be7bded45c82e6a9c69d4', '2', '1', '4', '3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_pekerjaan`
-- 

CREATE TABLE `m_pegawai_pekerjaan` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `kd_status` varchar(50) NOT NULL,
  `kd_pangkat` varchar(50) NOT NULL,
  `kd_golongan` varchar(50) NOT NULL,
  `kd_jabatan` varchar(50) NOT NULL,
  `tmt_awal` date NOT NULL,
  `tmt_akhir` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_pekerjaan`
-- 

INSERT INTO `m_pegawai_pekerjaan` (`kd`, `kd_pegawai`, `kd_status`, `kd_pangkat`, `kd_golongan`, `kd_jabatan`, `tmt_awal`, `tmt_akhir`) VALUES ('ea27e021a5f82036adbb2a0dcc8eea9b', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '23603a737226f6c7eebb30371195f7f7', 'f5a11b8d79a774ea94242a2ad2768d97', 'fb8c62a2d44d3be35907c71fd6ab3d5a', '9b381c97c759b1066e58b2f26bda40a1', '2005-06-08', '2011-03-13');
INSERT INTO `m_pegawai_pekerjaan` (`kd`, `kd_pegawai`, `kd_status`, `kd_pangkat`, `kd_golongan`, `kd_jabatan`, `tmt_awal`, `tmt_akhir`) VALUES ('12572fed4ebee13e0ebde9faad6a0c6d', '850a678c48b6f41b58d0b5678c6042bf', '111361548ac89412a890b23dbbd146b4', '', '', '', '0000-00-00', '0000-00-00');
INSERT INTO `m_pegawai_pekerjaan` (`kd`, `kd_pegawai`, `kd_status`, `kd_pangkat`, `kd_golongan`, `kd_jabatan`, `tmt_awal`, `tmt_akhir`) VALUES ('8945a6dec008a6fffa1de1098bd37fae', '002d8634798be7bded45c82e6a9c69d4', '111361548ac89412a890b23dbbd146b4', 'c0011836f1202e3d5213e40fea29a377', '82ba4795616e0288f375a255db7ceffd', '13625166e41e264b7d034a0eb0b5f293', '2003-02-02', '2002-04-02');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pegawai_pendidikan`
-- 

CREATE TABLE `m_pegawai_pendidikan` (
  `kd` varchar(50) NOT NULL,
  `kd_pegawai` varchar(50) NOT NULL,
  `kd_ijazah` varchar(50) NOT NULL,
  `kd_akta` varchar(50) NOT NULL,
  `thn_lulus` varchar(4) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `nama_pt` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pegawai_pendidikan`
-- 

INSERT INTO `m_pegawai_pendidikan` (`kd`, `kd_pegawai`, `kd_ijazah`, `kd_akta`, `thn_lulus`, `jurusan`, `nama_pt`) VALUES ('dbc18253832b14aa22221449f184d8ae', 'b2a1d8c15c8dff1a8b67d51dee48a4cb', '7e9c4f81efa7a4a17474cb7969db36ca', '5aafd81c2b2a6ca2c0d75a4b3987b0df', '1999', 'komputer', 'BINUS Jakarta');
INSERT INTO `m_pegawai_pendidikan` (`kd`, `kd_pegawai`, `kd_ijazah`, `kd_akta`, `thn_lulus`, `jurusan`, `nama_pt`) VALUES ('7540b3b9e0ad69fa61d04da9bb970246', '850a678c48b6f41b58d0b5678c6042bf', 'f9bf654e0f1297bef49519bc6fae0ce0', '', '', '', '');
INSERT INTO `m_pegawai_pendidikan` (`kd`, `kd_pegawai`, `kd_ijazah`, `kd_akta`, `thn_lulus`, `jurusan`, `nama_pt`) VALUES ('53671d37b01f449a489d34ed198dc3c8', '002d8634798be7bded45c82e6a9c69d4', '7e9c4f81efa7a4a17474cb7969db36ca', 'fd4dc3aba82f486aa9c6ec60445ffa6b', '1', '2', '3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pekerjaan`
-- 

CREATE TABLE `m_pekerjaan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `pekerjaan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pekerjaan`
-- 

INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('6f1bea764bfc1a9c922ea2a3bf44c385', 'Petani');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('adbacfabfd5c0a3c1fb80ab8eb7cfc32', 'Peternak');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('526c71a8228143920305231b2de99835', 'Pedagang');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('7c7b8cb0c524398f2e274ecc007b7ed8', 'Swasta');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('1547709580cf585120bd02d7323e9623', 'Guru');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('268d16f5b9a4a796a4ab50d960bf0a30', 'Wiraswasta');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('776216b04964f5a58f9cc5d7fa63c49b', 'PNS');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('862c7786d621470f6504b6c37ae54bb6', 'Dokter');
INSERT INTO `m_pekerjaan` (`kd`, `pekerjaan`) VALUES ('483c8cb7a08984a3838352cac37e232f', 'Buruh');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_pribadi`
-- 

CREATE TABLE `m_pribadi` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `pribadi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_pribadi`
-- 

INSERT INTO `m_pribadi` (`kd`, `pribadi`) VALUES ('1239a2153fdca93a77792920147fefde', 'Akhlak');
INSERT INTO `m_pribadi` (`kd`, `pribadi`) VALUES ('a4d9cab25b9808fa86d64a087c5f4ffc', 'Kerajinan / Kedisiplinan');
INSERT INTO `m_pribadi` (`kd`, `pribadi`) VALUES ('6a595f8953ed5f907a13915f61306d48', 'Kerapihan');
INSERT INTO `m_pribadi` (`kd`, `pribadi`) VALUES ('64ee4bc0b699bfa57084c09e7b217aee', 'Kebersihan');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_prog_pddkn`
-- 

CREATE TABLE `m_prog_pddkn` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_jenis` varchar(50) NOT NULL DEFAULT '',
  `no` char(2) NOT NULL DEFAULT '',
  `no_sub` char(2) NOT NULL DEFAULT '',
  `prog_pddkn` varchar(255) NOT NULL DEFAULT '',
  `xpel` varchar(50) NOT NULL DEFAULT '',
  `kkm` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_prog_pddkn`
-- 

INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('2bf0ccdbb4d3ebbcb990af74bd78c658', '5656ff51c3172fc75985e4b5c9acead8', '1', '1', 'Pendidikan Agama', 'Agama', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('d5397f1497b5cdaad7253fdc92db610b', '5656ff51c3172fc75985e4b5c9acead8', '1', '2', 'PPKn', 'PPKn', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('e3050c2fe9297974cbf4328fa4f98d42', '5656ff51c3172fc75985e4b5c9acead8', '1', '3', 'Bahasa dan Satra Indonesia', 'Bhs. Indonesia', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('47599716060306c09493e977bbbce22e', '5656ff51c3172fc75985e4b5c9acead8', '1', '4', 'Pendidikan Jasmani dan Kesehatan', 'Penjasks', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('ad0efad9dd0abaec4b8f9aaa489ec2f1', '5656ff51c3172fc75985e4b5c9acead8', '1', '5', 'Sejarah Nasional dan Umum', 'Sejarah', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('3c9f301d2afd7414c5ec51a6e9687946', '053d6939a2099518d511d82a9a2ac9bc', '2', '1', 'Matematika', 'Mastematika', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('8b290bf3b1b039227841d89f5f145a80', '053d6939a2099518d511d82a9a2ac9bc', '2', '2', 'Bahasa Inggris', 'Inggris', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('87f6b1d5ecf9e60c4ea0bdc89b2085e5', '053d6939a2099518d511d82a9a2ac9bc', '2', '3', 'Fisika', 'Fisika', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('42646fb7b3cafcd424e700c1ffee3421', '053d6939a2099518d511d82a9a2ac9bc', '2', '4', 'Kimia', 'Kimia', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('e0e60ec21d10b717a728bc089e73f262', '053d6939a2099518d511d82a9a2ac9bc', '2', '5', 'Komputer', 'Komputer', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('e2812f19ee06fbf2f9c2b27fa55ae5db', '053d6939a2099518d511d82a9a2ac9bc', '2', '6', 'Kewirausahaan', 'Wirausaha', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('1e4cb2e03f2f23188afd6326c1ccd15b', '1239a2153fdca93a77792920147fefde', '3', '1', 'Pekerjaan Mekanik Elektro', 'Pekerjaan Mekanik Elektro', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('6fca7a9b9ac98ccc83aebb9fa27a2149', '1239a2153fdca93a77792920147fefde', '3', '2', 'Penggunaan Alat Ukur Listrik', 'Penggunaan Alat Ukur Listrik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('83a46649c8bf2b58bfc892041bd2b0e9', '1239a2153fdca93a77792920147fefde', '3', '3', 'Pemasangan Instalasi Listrik Penerangan dan Tenaga', 'Pemasangan Instalasi Listrik Penerangan dan Tenaga', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('5b1ddd68bf83ddf581f02abecf0fac97', '1239a2153fdca93a77792920147fefde', '3', '4', 'Pengujian Karakteristik Mesin Listrik', 'Pengujian Karakteristik Mesin Listrik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('16a7aaa3749e194b34172ac400da40b0', '1239a2153fdca93a77792920147fefde', '3', '5', 'Pembuatan Rangkaian Pengendalian Dasar', 'Pembuatan Rangkaian Pengendalian Dasar', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('743159ebd0cb34f3a437e429724078f9', '1239a2153fdca93a77792920147fefde', '3', '6', 'Pengujian Sumberxstrixsumber Tenaga Listrik Alternatif', 'Pengujian Sumberxstrixsumber Tenaga Listrik Altern', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('116e268d0a91872deec1347eb675259c', '1239a2153fdca93a77792920147fefde', '3', '7', 'Pengerjaan Dasar konstruksi Bangunan', 'Pengerjaan Dasar konstruksi Bangunan', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('b7bc2a2f5bb6d521e64c8974c143e9a0', '1239a2153fdca93a77792920147fefde', '3', '8', 'Pengerjaan Dasar Survai', 'Pengerjaan Dasar Survai', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('51bb254d1af7e6d9c5c43be0f7aeabca', '1239a2153fdca93a77792920147fefde', '3', '9', 'Penerapan Konsep Dasar Listrik dan Elektro', 'Penerapan Konsep Dasar Listrik dan Elektro', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('c590b8e5b4f1a5fe839466462e187182', '1239a2153fdca93a77792920147fefde', '3', '10', 'Penghitungan Kekuatan Konstruksi Bangunan Sederhan', 'Penghitungan Kekuatan Konstruksi Bangunan Sederhan', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('5b2bf96684c3e37470d69b6c701cb7b3', '1239a2153fdca93a77792920147fefde', '3', '11', 'Penghitungan Statika Bangunan', 'Penghitungan Statika Bangunan', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f1ddf320f999ec237d93342fd176c667', '1239a2153fdca93a77792920147fefde', '3', '12', 'penggerjaan pasang Batu', 'penggerjaan pasang Batu', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f8010c1ee4297879c025a4c6850bf43e', '1239a2153fdca93a77792920147fefde', '3', '14', 'Pengerjaan Plesteran', 'Pengerjaan Plesteran', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('1c3b8eb6f614211ba5d02b9db2b5866f', '1239a2153fdca93a77792920147fefde', '3', '15', 'Pengerjaan Ubin', 'Pengerjaan Ubin', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('45c04c3ce3edf82e8849d8b1f77debc4', '1239a2153fdca93a77792920147fefde', '3', '16', 'Pengerjaan Konstruksi Beton Sederhana', 'Pengerjaan Konstruksi Beton Sederhana', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('9c80a3899d4b719d63775931e578b8a5', '1239a2153fdca93a77792920147fefde', '3', '17', 'Pengerjaan Bekisting dan Perancah', 'Pengerjaan Bekisting dan Perancah', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('a542560d6c5f9ee6b1bc1822c8b01cd8', '1239a2153fdca93a77792920147fefde', '3', '18', 'Pengerjaan Cat ( Emulasi )', 'Pengerjaan Cat ( Emulasi )', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('b193edb39348b399af75f5cebcc2e343', '1239a2153fdca93a77792920147fefde', '3', '19', 'Pengujian Bahan Bangunan', 'Pengujian Bahan Bangunan', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f3d762ddb300f822bf898368edeb7729', '1239a2153fdca93a77792920147fefde', '3', '20', 'Menggambar Teknik Dasar', 'Menggambar Teknik Dasar', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('5f06db3b04d73ad8c6d5cf912e697b7b', '1239a2153fdca93a77792920147fefde', '3', '21', 'Pengerjaan Mekanik Elektro', 'Pengerjaan Mekanik Elektro', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('869d5051fd78f97e77e577a44a4016da', '1239a2153fdca93a77792920147fefde', '3', '22', 'Pengunaan Alat Ukur Listrik', 'Pengunaan Alat Ukur Listrik', '');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('ae8b5aa26a3ae31612eec1d1f6ffbce9', '1239a2153fdca93a77792920147fefde', '3', '23', 'Pemasangan Dasar Instalasi Listrik', 'Pemasangan Dasar Instalasi Listrik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('a1231c2f2311f2d3a33f20d2bc1e8ef1', '1239a2153fdca93a77792920147fefde', '3', '24', 'Penerapan Komponen Rangkaian Elektronik', 'Penerapan Komponen Rangkaian Elektronik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('db566723dd2645c648c2a24b26d92459', '1239a2153fdca93a77792920147fefde', '3', '25', 'Pengoperasian Perangkat Audio dan Vidio', 'Pengoperasian Perangkat Audio dan Vidio', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('37e27d00c9153d7c094d3e78b4ec75c5', '1239a2153fdca93a77792920147fefde', '3', '26', 'Perbaikan Body Otomotif Dasar', 'Perbaikan Body Otomotif Dasar', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f7265d26a8ede183e98ccad5441f01cd', '1239a2153fdca93a77792920147fefde', '3', '27', 'Pekerjaan Las Dasar', 'Pekerjaan Las Dasar', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('172e9306f38626c28c5e2f46971f358e', '1239a2153fdca93a77792920147fefde', '3', '28', 'Perhitungan Dasar Konstruksi Mesin', 'Perhitungan Dasar Konstruksi Mesin', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('9efac0e475dc2f723bb7f1b6cad1a371', '1239a2153fdca93a77792920147fefde', '3', '29', 'Otomotif Dasar', 'Otomotif Dasar', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f71319cae7ef94d92ce847527ad0b32c', '1239a2153fdca93a77792920147fefde', '3', '30', 'Penggunaan Mekanik Industri', 'Penggunaan Mekanik Industri', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('eb67b990e0f77ca7ce23542656bc886b', '1239a2153fdca93a77792920147fefde', '3', '31', 'Perbaikan Motor Otomotif', 'Perbaikan Motor Otomotif', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('5157b981af8d3315ad70be3b62f3803a', '1239a2153fdca93a77792920147fefde', '3', '32', 'Perbaikan Casis dan Sistem Pemindahan Tenaga', 'Perbaikan Casis dan Sistem Pemindahan Tenaga', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('f21bfb71e42110c53703d4b0588d97e2', '1239a2153fdca93a77792920147fefde', '3', '33', 'Menggambar Teknik Mesin', 'Menggambar Teknik Mesin', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('5bedc0740ebbf8ae764905df1a921b75', '1239a2153fdca93a77792920147fefde', '3', '34', 'Pekerjaan Las dan Fabrikasi Logam', 'Pekerjaan Las dan Fabrikasi Logam', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('0128f24f1f135d979fa84ce9dcd37f9f', '1239a2153fdca93a77792920147fefde', '3', '35', 'Pekerjaan Permesinan', 'Pekerjaan Permesinan', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('e344e843123dbf54ba24f482826b838e', '1239a2153fdca93a77792920147fefde', '3', '36', 'Penggunaan Peralatan Mekanik Industri', 'Penggunaan Peralatan Mekanik Industri', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('cd3712b66b171d5715e1c3b6882f1f71', '1239a2153fdca93a77792920147fefde', '3', '37', 'Menggambar Teknik', 'Menggambar Teknik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('1f41117131f4791c6929c04da4a9702b', '1239a2153fdca93a77792920147fefde', '3', '38', 'Pengoperasian Perangkat Komunikasi', 'Pengoperasian Perangkat Komunikasi', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('2f2c58f7a2ec3086820b1acb9b41e4e4', '1239a2153fdca93a77792920147fefde', '3', '39', 'Penerapan dasar Teknik Mikroprosesor', 'Penerapan dasar Teknik Mikroprosesor', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('db4de648dba6e2e1d7d4616734acf02d', '1239a2153fdca93a77792920147fefde', '3', '40', 'Penerapan Dasar Pembangkit Tenaga Surya', 'Penerapan Dasar Pembangkit Tenaga Surya', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('e62592a3cd3180b71aa9003892013b52', '1239a2153fdca93a77792920147fefde', '3', '41', 'Penerapan Dasar Tranduser dan sensor', 'Penerapan Dasar Tranduser dan sensor', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('4205631c9c5730b9e4fec8f4c092d3f4', '1239a2153fdca93a77792920147fefde', '3', '42', 'Membuat Pesawat Elektronika', 'Membuat Pesawat Elektronika', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('251e5f3c1e932d79e573003009045aeb', '1239a2153fdca93a77792920147fefde', '3', '43', 'Pengolahan Data Elektronik', 'Pengolahan Data Elektronik', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('0ed6099d9e7062b4ad72968c98e960d3', '1239a2153fdca93a77792920147fefde', '3', '44', 'Perbaikan Sistem Kelistrikan Otomotif', 'Perbaikan Sistem Kelistrikan Otomotif', '65');
INSERT INTO `m_prog_pddkn` (`kd`, `kd_jenis`, `no`, `no_sub`, `prog_pddkn`, `xpel`, `kkm`) VALUES ('0ce4551ef8d0499f330152ed1b9e6c98', '1239a2153fdca93a77792920147fefde', '3', '45', 'Pekerjaan Logam Dasar', 'Pekerjaan Logam Dasar', '65');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_prog_pddkn_jns`
-- 

CREATE TABLE `m_prog_pddkn_jns` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `no` varchar(1) NOT NULL,
  `jenis` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_prog_pddkn_jns`
-- 

INSERT INTO `m_prog_pddkn_jns` (`kd`, `no`, `jenis`) VALUES ('5656ff51c3172fc75985e4b5c9acead8', '1', 'Normatif');
INSERT INTO `m_prog_pddkn_jns` (`kd`, `no`, `jenis`) VALUES ('1239a2153fdca93a77792920147fefde', '3', 'Produktif');
INSERT INTO `m_prog_pddkn_jns` (`kd`, `no`, `jenis`) VALUES ('053d6939a2099518d511d82a9a2ac9bc', '2', 'Adaptif');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_prog_pddkn_kelas`
-- 

CREATE TABLE `m_prog_pddkn_kelas` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_prog_pddkn` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_prog_pddkn_kelas`
-- 

INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('ae5adf54f8560cabad8e8ad482f91287', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('368a0e8bcdbfd869eb43ed23ba0cd34a', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('e749847ff60e977cb6e9d790cb14f421', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f841b670d5705b9459bfa49fa78de89c', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b27abba04e1ed0ae0c6cb05156a214e5', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '1e4cb2e03f2f23188afd6326c1ccd15b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('235bb0b19e90751a9fe0273b8794135a', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '6fca7a9b9ac98ccc83aebb9fa27a2149');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('de705e356f5d0f6081a0d370cf2a3045', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '83a46649c8bf2b58bfc892041bd2b0e9');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('1d3e68e07bfa9f1933e55dc1505e67e7', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '5b1ddd68bf83ddf581f02abecf0fac97');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('195b72df6815be6ccbe0f63f253175cc', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '16a7aaa3749e194b34172ac400da40b0');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('dd1a16e582ff15f4c378416e53a48bdf', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '743159ebd0cb34f3a437e429724078f9');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('5eab1f105380e3cc5af4c749a777b37b', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '116e268d0a91872deec1347eb675259c');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('125e222aa93a8359214b66776bec62b6', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'b7bc2a2f5bb6d521e64c8974c143e9a0');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('8228ee135dc25e81e26e80fceedb82f0', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '51bb254d1af7e6d9c5c43be0f7aeabca');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('42193f7fe4176e072c70a9cbd46c2950', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'c590b8e5b4f1a5fe839466462e187182');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('0cac650552795fb67102cfb42aaa46da', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '5b2bf96684c3e37470d69b6c701cb7b3');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('4ab2d9c70618eb0c7c0c6622f796c7ae', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'f1ddf320f999ec237d93342fd176c667');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('5af8eca70c97ef7aa300c6a8ab5698bd', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'f8010c1ee4297879c025a4c6850bf43e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b209634908950a4e71f562287975b05a', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '1c3b8eb6f614211ba5d02b9db2b5866f');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('d02d72b6a8ce757ecf5c8269082936c0', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '45c04c3ce3edf82e8849d8b1f77debc4');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('2b5378943fe82fbf6e7d2b46b4028259', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '9c80a3899d4b719d63775931e578b8a5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('937b21854903bf4766706a660d6be0a4', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'a542560d6c5f9ee6b1bc1822c8b01cd8');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('63538a5ca9c31ce1df88b34790c9d0fa', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'b193edb39348b399af75f5cebcc2e343');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('5ea8cfac7ffba4d9f6fa06547b2ecbc1', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'f3d762ddb300f822bf898368edeb7729');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('dcab6863b0457114e682a0ab9e213c31', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '5f06db3b04d73ad8c6d5cf912e697b7b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('8747d7db41194b41065642aeacf93fc1', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '869d5051fd78f97e77e577a44a4016da');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('57b567dd44d9385f30bafc35dabf1dfb', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'ae8b5aa26a3ae31612eec1d1f6ffbce9');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('19c2a22fd5cb49b99df3b45ca58bffed', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'a1231c2f2311f2d3a33f20d2bc1e8ef1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('e4238cdafa7aab309896cab8c28a1b4c', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'db566723dd2645c648c2a24b26d92459');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('27a5b621941484b1a14f1410c24b21fc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '37e27d00c9153d7c094d3e78b4ec75c5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('386f64971d3191f8c2c038bd110b525a', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'f7265d26a8ede183e98ccad5441f01cd');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('95143a0dff8050cb09483c2764d552d0', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '172e9306f38626c28c5e2f46971f358e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('77cda56773b2e839aa6488c77893a3b0', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '9efac0e475dc2f723bb7f1b6cad1a371');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f36744c481ee173d4f42c8b89bd3ea79', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'f71319cae7ef94d92ce847527ad0b32c');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('33897725977820fb203f727747a29918', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'eb67b990e0f77ca7ce23542656bc886b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('905aac857b9cdfbfe44f54ac89865bfb', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '5157b981af8d3315ad70be3b62f3803a');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('13dcc79c1589f2dfa09fc60e8e71615f', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'f21bfb71e42110c53703d4b0588d97e2');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b5101abc922153ec55d6cf8ff57cb907', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '5bedc0740ebbf8ae764905df1a921b75');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f5b9fdbc10544f22665fb20ec9dfb9b7', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '0128f24f1f135d979fa84ce9dcd37f9f');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('e657d501a7b8337719d49fc50fe3ec19', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'e344e843123dbf54ba24f482826b838e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('76f96fc9549ebd6b8d78e431db7f7479', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'cd3712b66b171d5715e1c3b6882f1f71');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('5d7a210480fb4ad1e4512b4aabbe1a75', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '1f41117131f4791c6929c04da4a9702b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('ba20a4800c95d8312cdf3615f4098548', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '2f2c58f7a2ec3086820b1acb9b41e4e4');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('673e757941ddb65518376cef865efef8', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'db4de648dba6e2e1d7d4616734acf02d');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('bc86edd85b80af08cbc32af1a5ce7c00', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'e62592a3cd3180b71aa9003892013b52');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('ea1e24898b499f5ebe00ef86b3ff7836', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '4205631c9c5730b9e4fec8f4c092d3f4');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('bfbbe2fe19ca7e548f9fe9cf2ca3e8db', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '251e5f3c1e932d79e573003009045aeb');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('e21b14b107b23255d908266eea5a0f8f', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '0ed6099d9e7062b4ad72968c98e960d3');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('49eb191443a97b322e196e0b25731f5c', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '0ce4551ef8d0499f330152ed1b9e6c98');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('1d9a31192869cc7b7bfd2624a649cfb0', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('d134b2e94d2242f8ac3ff2960ffe68ae', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b30a246de91ca3949e90cb3190163d4e', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('3b499f5a641560e50418cb521e803942', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('1237855baf6eb76658dbc0ef2d1d4b52', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('26f3d0cd7e6243da9b3c52b2ccf90b0c', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('9ab47d46ea2e84363cbc5ecf34a4bb2a', '761328c3fd8f3bec20fd885d28ca22d2', '27de8f38a90dd1755acd801abefcbb42', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('9b749caaad5e90cf3eae9772991d9dec', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('a8c060687d4408762dbb3c067a50f800', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('0ba06dc86afd379df20ad949f30edeaf', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c6b2295243913ed98c149e32d4931385', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('32c4adb4b22af17e1e73d49c999b741a', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('6426d1eba5888f973bd202a0f87cba39', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c039d88b620798fb9a715e94ddb2ea30', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('868e161dd194eece4b2cf23097643b57', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('6254dd3efe0df98bda68950b1b6235c7', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('30dfabb4a948d13a54f2e1e64b946ea1', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('4b58d72e2d6850fc2ebf8af246e6ac90', 'fb80bfef3775adb38538ecee6b93be0f', '27de8f38a90dd1755acd801abefcbb42', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('cb6a66cc19434f83dd1ba3d571f60152', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('9a857a43ea3e3317b5fc494606fd419c', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('7801ee819a7eea093e8313360f66aa39', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('4718f7670dc764f1a0d74dde60b955d1', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('bdde5f5ace229fe6e1b03eb9f2ac08ef', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('5bc11bc26b076bdeef569273867f9935', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f7f606ec61e807979fb91685ae69ba95', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('4385a7e05d27a358d7388fc838e220bf', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('2678b97d250d001bd4e04322f6cf10fa', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('bbef1fdca628469c64e63be761ea85fe', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('edbea8382fea136f64fa9328f8495002', 'c44298c32a7d78c416646524b1b3f228', '27de8f38a90dd1755acd801abefcbb42', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('56325d47055367544d62ba51ad56b498', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('91cb906278acc91caae7f71c86c7eed6', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('3209364fd960dd518eb832b72c134c7b', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c38c45f56fea438e51c391f67aebb94e', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('609f777c74fbc5e400eda808e8aee413', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c3f53a8771270f017285f0b9840962a1', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b4ac2fb31e0784cdbc03da65c211f9b0', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('fe6877015f8439a164742d1a8fb01aaf', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('1a5be10effc3bc48304a7933c19ffced', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f547583db8fe4241a8d66879860fba6b', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('4e63cb3841fd775ff84dccaa8473ac5b', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('de9a2496621183cbfe6523f9146f6cdd', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('9f95be05e63fc735980b939e95a90812', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f6cf326ab958052ff956b6ec70cc4b31', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('8efe46f99a36732e1edcadf3ff20ab43', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('de75bc04c54ae863e3b2cfbac6e28192', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('a6a32567741fc50dd677df52723982f0', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('e9a394b03f1ce5f46c82fbca0dfcd280', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('62bd06d1f3002685a01950f5c6e1ede8', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('ffe7e80b9e5969119be329ec0f2731c8', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('74a11f6fdc947d6b8fef07cbd7b3bbb9', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b812a4d3147c593df1f874601e58908e', 'f78e58e3d8d18775f418762e9426b43d', '27de8f38a90dd1755acd801abefcbb42', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('dd3d5e3509576fec1434a4a604b6681c', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('235fe5ec980c69736aad6837af54ee7e', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('3e03e90f6b70503d026034db6ebf2aa6', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('72af2cb7303947b0f5141925bc60a951', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('0d2c2f442dbfe375c90c7a9a75776e10', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('27907e943e742941aa293427831b1c9e', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('59e4344866d7b76b1f2c50d570816539', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('cfc36f76f7bb30bf56ad0e9eef2b9ef4', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('b19ade8c00481fca2d3072d04400d134', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('75fecd0b173703d4cdc7a0a65a97c22f', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c8548d27cbed6a1e538b0f578c9eb44c', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('d379e7f57bb4978c50decdc3ad4d1e90', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '116e268d0a91872deec1347eb675259c');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('ca37859a006a87a3fe484236fbac7049', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '5b2bf96684c3e37470d69b6c701cb7b3');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('11e96494485622be6b35ef420f003a0f', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'f1ddf320f999ec237d93342fd176c667');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('90cdd12ae1a4f26f0a38ad582ec48d72', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'f8010c1ee4297879c025a4c6850bf43e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('492276b787062b8646ab5b93ea00b828', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', '1c3b8eb6f614211ba5d02b9db2b5866f');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('eb5eb45b4b1a2f46bfd495b02d834339', '761328c3fd8f3bec20fd885d28ca22d2', '2df89d4a12f44a5cc897d6814760687d', 'b193edb39348b399af75f5cebcc2e343');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('16a9cbcf32ac75544f7785da1c28431b', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('6b76f3ae70e9ed7ed2481e63cbb7f185', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '42646fb7b3cafcd424e700c1ffee3421');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('0c70c4b12e2cf8a4cfb38c8bb535e594', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'e2812f19ee06fbf2f9c2b27fa55ae5db');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f882c7aa44c0a1247fd8399da2683a10', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '87f6b1d5ecf9e60c4ea0bdc89b2085e5');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('f93fa84bb82ff5c53dc12b2b3e184fca', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'e0e60ec21d10b717a728bc089e73f262');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('bca79e011afcf84cdca8826e8b4841e2', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '3c9f301d2afd7414c5ec51a6e9687946');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('7ab72819f27fce49ceba55e0f8e97fdf', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'e3050c2fe9297974cbf4328fa4f98d42');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('3093a9bb6d7e62565d1b7391225d9161', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '2bf0ccdbb4d3ebbcb990af74bd78c658');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('1dbf80e1123be341f1efe9c0cb1b7609', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '47599716060306c09493e977bbbce22e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('3a72f895e9c2b92ecb02c7028aa69751', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'd5397f1497b5cdaad7253fdc92db610b');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('86248af2fc206aef9ad71a0b6aabfed7', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'ad0efad9dd0abaec4b8f9aaa489ec2f1');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('105c13c59a4f2281c68f8f48f8a0453e', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '116e268d0a91872deec1347eb675259c');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('7b2195bb8e56dbe6445c8f1ea45c5609', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '45c04c3ce3edf82e8849d8b1f77debc4');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('928b697105df95f86ef1c7c4b72e6d3d', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'f8010c1ee4297879c025a4c6850bf43e');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('c5820b3ae05b1cd468897efd2bbfdf89', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', '1c3b8eb6f614211ba5d02b9db2b5866f');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('a4b78a120974172ed52de4451257dc50', '761328c3fd8f3bec20fd885d28ca22d2', '3be17d09596cd245484fed3a4f5576eb', 'b193edb39348b399af75f5cebcc2e343');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('77a162ed7e2a268bb44aaa6da80bfb4d', '4ca9dc826b48c794175b27fad223ff9e', '3be17d09596cd245484fed3a4f5576eb', '8b290bf3b1b039227841d89f5f145a80');
INSERT INTO `m_prog_pddkn_kelas` (`kd`, `kd_keahlian`, `kd_kelas`, `kd_prog_pddkn`) VALUES ('9eb6717eff9ff9fc8255af4f41c0a9c0', '4ca9dc826b48c794175b27fad223ff9e', '3be17d09596cd245484fed3a4f5576eb', 'e2812f19ee06fbf2f9c2b27fa55ae5db');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_ruang`
-- 

CREATE TABLE `m_ruang` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `ruang` varchar(5) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_ruang`
-- 

INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('b9f286b3403b958369e0ec3423f1a733', 'A');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('af2e94e92ff53b8592d7c1fdaf0c9edc', 'B');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('75b107399d4a2d26ccdc4817f8c7c8ed', 'C');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('f1d8793368955b20185eebc6cc532a3d', 'D');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('4b011fa0d4299e61fc27b1fa1432a1b4', 'E');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('93bc41195da04813f69b7de11d91e905', 'F');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('094a3243e824a39f51d1f90069ec4626', 'G');
INSERT INTO `m_ruang` (`kd`, `ruang`) VALUES ('8d67b61afe73f0f481e5ee826cd6406a', 'H');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_sikap`
-- 

CREATE TABLE `m_sikap` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `sikap` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_sikap`
-- 

INSERT INTO `m_sikap` (`kd`, `sikap`) VALUES ('00ed678a5f8c877227611637f45d7236', 'A');
INSERT INTO `m_sikap` (`kd`, `sikap`) VALUES ('5e676cdbcd2d981d17eb01e2f140424a', 'B');
INSERT INTO `m_sikap` (`kd`, `sikap`) VALUES ('d1bb4677907c3066abba8f8f7b0d3434', 'C');
INSERT INTO `m_sikap` (`kd`, `sikap`) VALUES ('0136894393158e45a1857e97593cf98a', 'D');
INSERT INTO `m_sikap` (`kd`, `sikap`) VALUES ('f78e58e3d8d18775f418762e9426b43d', 'E');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa`
-- 

CREATE TABLE `m_siswa` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `usernamex` varchar(15) NOT NULL DEFAULT '',
  `passwordx` varchar(50) NOT NULL DEFAULT '',
  `nis` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL DEFAULT '',
  `panggilan` varchar(30) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kd_kelamin` varchar(50) NOT NULL,
  `kd_agama` varchar(50) NOT NULL,
  `warga_negara` varchar(50) NOT NULL,
  `anak_ke` varchar(2) NOT NULL,
  `jml_sdr_kandung` varchar(2) NOT NULL,
  `jml_sdr_tiri` varchar(2) NOT NULL,
  `jml_sdr_angkat` varchar(2) NOT NULL,
  `yatim_piatu` varchar(50) NOT NULL,
  `bhs_harian` varchar(50) NOT NULL,
  `filex` varchar(255) NOT NULL,
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa`
-- 

INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('20a672f750d99eedfc25358f6ad823e9', '8100035', '4799486f8670f30db3640b79f86cb0d6', '8100035', 'Desi Ratnasari', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '2008-08-14 12:59:37');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('9b0001d3a5a4c413f0bb8e697b0e513f', '8100036', '9015b912f37a420ce38247714c7b0155', '8100036', 'Parto', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('d1bb4677907c3066abba8f8f7b0d3434', '810004', '948992f6f0ba19fa18a22b9fd09462b7', '810004', 'M. Khosim Aminy', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('5656ff51c3172fc75985e4b5c9acead8', '8100037', 'a5812761de782dea12f7626ec9d9302c', '8100037', 'Dian Sastro', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('1239a2153fdca93a77792920147fefde', '8100038', 'e99d151a03e7d31987b167dc5ed51850', '8100038', 'Nicolas Saputra', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('f78e58e3d8d18775f418762e9426b43d', '810001', '618c33d941af5715164a5135b9da69dd', '810001', 'Agus Muhajir', '', 'x', '1900-01-01', '4fcf418adddd67383212bc1d22c61e98', '1fa739bfa7fc7ff5ebbb1944c9c8084a', '', '', '', '', '', '', '', 'os37066.jpg', '2009-08-02 04:38:43');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('e0ddb27a1258a4cd5fe31f5f0f3413ad', '810003', 'f5373342f72ff1d8b05a7682f606b2ad', '810003', 'Novie Norwandani', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '2008-11-10 10:44:08');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('828b3ff12044b06ea2883e49d9f0c8ca', '810005', 'dca2912687c9a58c47ffb39aa547369a', '810005', 'Indra', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('9df67984eb5b17402c198697043f4f79', '8100039', '19bb1059bdca4773ffd996c962de4ae3', '8100039', 'Mariana Renata', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('aa3f24c48079c1f8377b03dde903c8fb', '810002', 'e64f54e62c586c9841358abe3f5a486b', '810002', 'Julius Adi H.', 'x', '1', '1900-01-01', '4fcf418adddd67383212bc1d22c61e98', 'caa9acb7cdcdf3a49d26281ec61867f5', 'x', '1', '1', '1', '1', 'xstrix', 'x', '54096.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('b89ab967948944e2d81d2760f8f8ef85', '8100040', '3295c76acbf4caaed33c36b1b5fc2cb1', '8100040', 'Baim Wong', '66', '66', '1901-02-02', '29dfb4f490cf1855897561d5d6fdf59d', '2e40a5fdb46adb1029fcc51d7571e48c', '66', '66', '66', '66', '66', 'Anak Piatu', '66', '56230.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('75b29bf554a57479ada10a3ba8e5e6c4', '8100041', '45c48cce2e2d7fbdea1afc51c7c6ad26', '8100041', 'Pasha Ungu', '9', '9', '1904-11-02', '4fcf418adddd67383212bc1d22c61e98', '1fa739bfa7fc7ff5ebbb1944c9c8084a', '9', '9', '9', '9', '9', 'xstrix', 'Indonesia, Arab', 'hyjghgg.jpg', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('343718ea1520a27b980015414a4cf76c', '8100042', '8f14e45fceea167a5a36dedd4bea2543', '8100042', 'GIGI', '79', '79', '1902-01-01', '4fcf418adddd67383212bc1d22c61e98', '13db0d7c61769bdbba15cd6d5f4c86f5', '79', '79', '79', '79', '79', '79', '79', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('a63ef49c2828772057d9fe4cf7a802da', '8100043', '', '8100043', 'Jamrud', '', '', '0000-00-00', '4fcf418adddd67383212bc1d22c61e98', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('a7fa29ce85d53c1c9ef1167cee2c759a', '8100044', '', '8100044', 'Slank', '', '', '0000-00-00', '29dfb4f490cf1855897561d5d6fdf59d', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('a0bf430b44836e927fef6d2202d58c77', '8100045', '', '8100045', 'Nabila Syakib', '', '', '0000-00-00', '4fcf418adddd67383212bc1d22c61e98', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('e4d3df4d6f5e2efba1c4fd2bd02020fd', '8100046', '', '8100046', 'Paramitha Rusady', '', '', '0000-00-00', '4fcf418adddd67383212bc1d22c61e98', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('7a38ddd4f62fa4752d84f42d180fceb0', '8100047', '', '8100047', 'Dini Aminarti', '', '', '0000-00-00', '29dfb4f490cf1855897561d5d6fdf59d', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('0e5267e7c36c7632be0d77268227da57', '810006', '6efc53139ba1416418a6c6e584a25f2d', '810006', 'Hima P.', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('1b225a69d9cae82e37b519e7414400f2', '810007', '74fa942e1fcca16180802a2607c47bfb', '810007', 'Nur Faizah', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('f2f413dd8d2e990ea9237da3e85da7fd', '810008', 'f73e5d79a2915bfec31c4525053fb0ca', '810008', 'Erika Sandy Putri', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('b2da94a37523f3470522ca1c6b24a01a', '810009', '62db76f37331c2f7cb948ffe027d078b', '810009', 'Danang', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('11cfe1d90e135a00921b7840a2f2344b', '8100010', '74d1afc10c4ae48e53655c81a4efe5f5', '8100010', 'Budiyantoro', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('55c5057ef6ff1ec5bf13abfa9c50c355', '8100011', '4d26c36f6ce122e082221bed14847ce5', '8100011', 'Vicky', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('955502590c5a96118ee2094bdb67b0da', '8100012', 'a85dd6fd3108020ec7d8767887e0e276', '8100012', 'Henny R.', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('6efd409ae577467870c6a953c795e354', '8100013', '8602cd355cf46f00d90b998d1316a09f', '8100013', 'Nia', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('c55d3e4e70156bcbb7ca36f99decfd16', '8100014', '19693dcf5b8c2cfe3962233333870930', '8100014', 'Dian', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('39649f774ae93f2c89744803a5f02b98', '8100016', 'fa6d855e29ec9f0332a530f5d204485c', '8100016', 'Ulfah', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('323c7e218fe4e7a5024ad8876d7aba61', '8100015', '890fe0beee35fca4bd50d7980cf1626f', '8100015', 'Yvux Purba', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('d0a08bdd829a4bc434eee62ad72a0d51', '8100017', '4325df74ab7d6afcfa8361da20e22512', '8100017', 'Ifa', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('9ac37c64bc6a6b9047d10d672b48c9be', '8100018', '7fbaeda8eaae0917e81b863b391b8066', '8100018', 'Esti', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('5f9669d6a9d83c78c29e9588e0bfe673', '8100019', 'ca68f0361fd3428f70a779f9aee50511', '8100019', 'Susan', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('75d2955e361d2953471f64faf05a7af2', '8100020', '8108a23ebcd017caf6b6eb23a05fbda6', '8100020', 'Dedy', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('8fb2b0711fea15b4823d347e4776600a', '8100021', 'e24b59259dbd42b512760b0524eb7fdb', '8100021', 'Yuni', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('4f02ede76296b003f512032785e5c19e', '8100022', 'b1d8665988c2d74d0e32a64258bbe02d', '8100022', 'Windi Aji', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('4c30e2eb6684359f4c8baa77313e5a50', '8100023', 'fb00d92665f38ddfec13cccb15fe05cb', '8100023', 'Eka', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('953caf11ce76653b10ff61ff8a3a13bc', '8100024', '2c366cf9b9fd0d02df7fb3d0a7a8f156', '8100024', 'Agus Black', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('b8178962fbfb9b0be71d3d7a7297d3eb', '8100025', 'a09b6c8c012ec3b2d48e89c422f342b1', '8100025', 'Herni', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('7dd230c57099924bfa4a02e1b62151c6', '8100026', '0c57c4599fba1f8f323b1fafd12aea43', '8100026', 'Aslam', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('cd522621df3b6e6ddb40788e9d2984c3', '8100028', '7be96668231c8a9c82693fc683d27add', '8100028', 'Amru', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('0a246af7bd397521f108ce21368f1d36', '8100027', '9727e71f4333bf46a7de5ed9d7d52200', '8100027', 'Didik', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('2787382f3b83f03c407eba8de660bd16', '8100029', 'bfe9c5c497285922ec5532d642a38b0f', '8100029', 'Nungky', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('639f03bd658dc30affafaa63a897b4d3', '8100030', '12157b6b17bf8ca4a2bf207bb3b56236', '8100030', 'Maya', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('2040c4401658a0dbe07325e910feec1f', '8100031', '9e53442929bb8e5c1cb340aac68b4b2f', '8100031', 'Budi Gedi', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('8129daed93e584be5ac5ee9e5623b06b', '8100032', '5ddb6989f4d038a2741e9f7ee6dacaee', '8100032', 'Candra', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('34a64fb4deab766b70ec00c5e30af2b7', '8100033', '0bf01c4dc00295a4462559b649bdea10', '8100033', 'Budi M', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');
INSERT INTO `m_siswa` (`kd`, `usernamex`, `passwordx`, `nis`, `nama`, `panggilan`, `tmp_lahir`, `tgl_lahir`, `kd_kelamin`, `kd_agama`, `warga_negara`, `anak_ke`, `jml_sdr_kandung`, `jml_sdr_tiri`, `jml_sdr_angkat`, `yatim_piatu`, `bhs_harian`, `filex`, `postdate`) VALUES ('2b88a29ea1d2419963b3b514d401953e', '8100034', '07a10db554ed1fdcf81e1ae051a1d51e', '8100034', 'Eksan', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_ayah`
-- 

CREATE TABLE `m_siswa_ayah` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kd_agama` varchar(50) NOT NULL,
  `warga_negara` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `kd_pekerjaan` varchar(50) NOT NULL,
  `penghasilan` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `hidup` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_ayah`
-- 

INSERT INTO `m_siswa_ayah` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`, `hidup`) VALUES ('e88d12b78146622b4d3d91e4b34b7547', '75b29bf554a57479ada10a3ba8e5e6c4', '12', '2', '1902-02-02', '1fa739bfa7fc7ff5ebbb1944c9c8084a', '2', '2', '1547709580cf585120bd02d7323e9623', '2', '2', '2', '2');
INSERT INTO `m_siswa_ayah` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`, `hidup`) VALUES ('c593016a46c458adcd94ff03981631f9', 'b89ab967948944e2d81d2760f8f8ef85', '1', '2', '1902-03-03', '13db0d7c61769bdbba15cd6d5f4c86f5', '8', '7', '1547709580cf585120bd02d7323e9623', '6500433', '8', '6', '4');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_diterima`
-- 

CREATE TABLE `m_siswa_diterima` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `keahlian` varchar(50) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_diterima`
-- 

INSERT INTO `m_siswa_diterima` (`kd`, `kd_siswa`, `kelas`, `keahlian`, `tgl`) VALUES ('cd1a083381ba4c4b5a9446077f2c34b6', '75b29bf554a57479ada10a3ba8e5e6c4', '9', '10', '2013-12-11');
INSERT INTO `m_siswa_diterima` (`kd`, `kd_siswa`, `kelas`, `keahlian`, `tgl`) VALUES ('94b63b3751f27be16efbdc84393ba9a5', 'b89ab967948944e2d81d2760f8f8ef85', '3', '2', '2003-04-03');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_hobi`
-- 

CREATE TABLE `m_siswa_hobi` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `kesenian` varchar(50) NOT NULL,
  `olah_raga` varchar(50) NOT NULL,
  `organisasi` varchar(50) NOT NULL,
  `lain_lain` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_hobi`
-- 

INSERT INTO `m_siswa_hobi` (`kd`, `kd_siswa`, `kesenian`, `olah_raga`, `organisasi`, `lain_lain`) VALUES ('fd697e49f07b0be2bb6e51c686e7d94a', '75b29bf554a57479ada10a3ba8e5e6c4', '1', '2', '3', '4');
INSERT INTO `m_siswa_hobi` (`kd`, `kd_siswa`, `kesenian`, `olah_raga`, `organisasi`, `lain_lain`) VALUES ('94f17511aa44e185c4cd5af5a3a910d4', 'b89ab967948944e2d81d2760f8f8ef85', '9', '8', '7', '6');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_ibu`
-- 

CREATE TABLE `m_siswa_ibu` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kd_agama` varchar(50) NOT NULL,
  `warga_negara` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `kd_pekerjaan` varchar(50) NOT NULL,
  `penghasilan` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `hidup` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_ibu`
-- 

INSERT INTO `m_siswa_ibu` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`, `hidup`) VALUES ('2d0946c003cde6ad738c4440c4d79b12', '75b29bf554a57479ada10a3ba8e5e6c4', '36', '6', '1902-04-04', '13db0d7c61769bdbba15cd6d5f4c86f5', '6', '6', '526c71a8228143920305231b2de99835', '6', '6', '6', '6');
INSERT INTO `m_siswa_ibu` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`, `hidup`) VALUES ('89e00b7aeee5ce4c9f6b7bc0f5d6a268', 'b89ab967948944e2d81d2760f8f8ef85', '9', '8', '1903-02-07', '13db0d7c61769bdbba15cd6d5f4c86f5', '7', '6', '1547709580cf585120bd02d7323e9623', '4500000', '3', '2', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_kesehatan`
-- 

CREATE TABLE `m_siswa_kesehatan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `gol_darah` varchar(10) NOT NULL,
  `penyakit` varchar(50) NOT NULL,
  `kelainan` varchar(50) NOT NULL,
  `tinggi` varchar(3) NOT NULL,
  `berat` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_kesehatan`
-- 

INSERT INTO `m_siswa_kesehatan` (`kd`, `kd_siswa`, `gol_darah`, `penyakit`, `kelainan`, `tinggi`, `berat`) VALUES ('4685e56200bfda3f61bd6da25dd5aeb0', '75b29bf554a57479ada10a3ba8e5e6c4', 'xux', 'x', 'x', '8', '8');
INSERT INTO `m_siswa_kesehatan` (`kd`, `kd_siswa`, `gol_darah`, `penyakit`, `kelainan`, `tinggi`, `berat`) VALUES ('bc3c1c5e21c0cf72c27d2d260dba24a5', 'b89ab967948944e2d81d2760f8f8ef85', '1', '2', '3', '4', '5');
INSERT INTO `m_siswa_kesehatan` (`kd`, `kd_siswa`, `gol_darah`, `penyakit`, `kelainan`, `tinggi`, `berat`) VALUES ('f2ed99ad62827277cdf117fbc0bfcccd', 'aa3f24c48079c1f8377b03dde903c8fb', 'x', 'x', 'x', '170', '70');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_pendidikan`
-- 

CREATE TABLE `m_siswa_pendidikan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `lulusan` varchar(100) NOT NULL,
  `tgl_sttb` date NOT NULL,
  `no_sttb` varchar(50) NOT NULL,
  `lama` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_pendidikan`
-- 

INSERT INTO `m_siswa_pendidikan` (`kd`, `kd_siswa`, `lulusan`, `tgl_sttb`, `no_sttb`, `lama`) VALUES ('98ad8e2bfe3918fc60261cac74867dce', '75b29bf554a57479ada10a3ba8e5e6c4', '1', '2004-03-02', '5', '6');
INSERT INTO `m_siswa_pendidikan` (`kd`, `kd_siswa`, `lulusan`, `tgl_sttb`, `no_sttb`, `lama`) VALUES ('94b63b3751f27be16efbdc84393ba9a5', 'b89ab967948944e2d81d2760f8f8ef85', '9', '2004-03-03', '8', '6');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_perkembangan`
-- 

CREATE TABLE `m_siswa_perkembangan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `bea_siswa` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `alasan` varchar(50) NOT NULL,
  `tamat` varchar(50) NOT NULL,
  `no_sttb` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_perkembangan`
-- 

INSERT INTO `m_siswa_perkembangan` (`kd`, `kd_siswa`, `bea_siswa`, `tgl`, `alasan`, `tamat`, `no_sttb`) VALUES ('9fbc9aea639c0424ee631215765272c4', '75b29bf554a57479ada10a3ba8e5e6c4', '24', '2007-04-04', '4', '4', '5');
INSERT INTO `m_siswa_perkembangan` (`kd`, `kd_siswa`, `bea_siswa`, `tgl`, `alasan`, `tamat`, `no_sttb`) VALUES ('1083d0c41333f784b01545aad6a1cfed', 'b89ab967948944e2d81d2760f8f8ef85', '8', '2003-04-03', '9', '4', '5');
INSERT INTO `m_siswa_perkembangan` (`kd`, `kd_siswa`, `bea_siswa`, `tgl`, `alasan`, `tamat`, `no_sttb`) VALUES ('e34708786cc4c0cf32a508173b09efb9', 'aa3f24c48079c1f8377b03dde903c8fb', '1', '2001-03-05', '1', '2', '3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_pindahan`
-- 

CREATE TABLE `m_siswa_pindahan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `dari` varchar(100) NOT NULL,
  `alasan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_pindahan`
-- 

INSERT INTO `m_siswa_pindahan` (`kd`, `kd_siswa`, `dari`, `alasan`) VALUES ('7f612504a589267111a4f8c640d6de76', '75b29bf554a57479ada10a3ba8e5e6c4', '7', '8');
INSERT INTO `m_siswa_pindahan` (`kd`, `kd_siswa`, `dari`, `alasan`) VALUES ('94b63b3751f27be16efbdc84393ba9a5', 'b89ab967948944e2d81d2760f8f8ef85', '5', '4');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_selesai`
-- 

CREATE TABLE `m_siswa_selesai` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `melanjutkan_di` varchar(50) NOT NULL,
  `bekerja` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `instansi` varchar(50) NOT NULL,
  `penghasilan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_selesai`
-- 

INSERT INTO `m_siswa_selesai` (`kd`, `kd_siswa`, `melanjutkan_di`, `bekerja`, `tgl`, `instansi`, `penghasilan`) VALUES ('385a4af04597bf949891f0a537c0f34b', '75b29bf554a57479ada10a3ba8e5e6c4', '2911', '11', '2007-04-11', '11', '1500000');
INSERT INTO `m_siswa_selesai` (`kd`, `kd_siswa`, `melanjutkan_di`, `bekerja`, `tgl`, `instansi`, `penghasilan`) VALUES ('61e3cf80e42588fb690246ed5bc33b5b', 'b89ab967948944e2d81d2760f8f8ef85', 'x', 'x', '2003-03-03', 'x', '8000000');
INSERT INTO `m_siswa_selesai` (`kd`, `kd_siswa`, `melanjutkan_di`, `bekerja`, `tgl`, `instansi`, `penghasilan`) VALUES ('083effa3ec430a8581e6a888efac5888', 'aa3f24c48079c1f8377b03dde903c8fb', 'x', 'x', '2000-01-01', 'x', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_tmp_tinggal`
-- 

CREATE TABLE `m_siswa_tmp_tinggal` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(100) NOT NULL,
  `tinggal_dgn` varchar(50) NOT NULL,
  `jarak` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_tmp_tinggal`
-- 

INSERT INTO `m_siswa_tmp_tinggal` (`kd`, `kd_siswa`, `alamat`, `telp`, `tinggal_dgn`, `jarak`) VALUES ('880a217a73698170b3fa87d5ae00a2d6', '75b29bf554a57479ada10a3ba8e5e6c4', 'xy', 'y', 'Saudara', 'y');
INSERT INTO `m_siswa_tmp_tinggal` (`kd`, `kd_siswa`, `alamat`, `telp`, `tinggal_dgn`, `jarak`) VALUES ('4b1564a13ac827f3a639777326a94f93', 'b89ab967948944e2d81d2760f8f8ef85', '8', '7', 'Saudara', '4');
INSERT INTO `m_siswa_tmp_tinggal` (`kd`, `kd_siswa`, `alamat`, `telp`, `tinggal_dgn`, `jarak`) VALUES ('edda96419a67f66c78282ed60c6c6490', 'aa3f24c48079c1f8377b03dde903c8fb', 'x', 'y', 'Orang Tua', 'x');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_siswa_wali`
-- 

CREATE TABLE `m_siswa_wali` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tmp_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kd_agama` varchar(50) NOT NULL,
  `warga_negara` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `kd_pekerjaan` varchar(50) NOT NULL,
  `penghasilan` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_siswa_wali`
-- 

INSERT INTO `m_siswa_wali` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`) VALUES ('2858607c4d79a4db42f86e4b8ef18751', '75b29bf554a57479ada10a3ba8e5e6c4', 'x4', '4', '1901-01-04', '2e40a5fdb46adb1029fcc51d7571e48c', '4', '4', '862c7786d621470f6504b6c37ae54bb6', '4', '4', '4');
INSERT INTO `m_siswa_wali` (`kd`, `kd_siswa`, `nama`, `tmp_lahir`, `tgl_lahir`, `kd_agama`, `warga_negara`, `pendidikan`, `kd_pekerjaan`, `penghasilan`, `alamat`, `telp`) VALUES ('669a06608a356b1222c212383df9c101', 'b89ab967948944e2d81d2760f8f8ef85', '8', '7', '1903-04-03', '49204f7eab33f980e6b98f0442a17640', '8', '7', '1547709580cf585120bd02d7323e9623', '5900578', '4', '3');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_smt`
-- 

CREATE TABLE `m_smt` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `no` varchar(1) NOT NULL,
  `smt` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_smt`
-- 

INSERT INTO `m_smt` (`kd`, `no`, `smt`) VALUES ('b060de380c57384744177849d22fb584', '1', 'Ganjil');
INSERT INTO `m_smt` (`kd`, `no`, `smt`) VALUES ('900e28393edf271632735d0bb6e9b31c', '2', 'Genap');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_status`
-- 

CREATE TABLE `m_status` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_status`
-- 

INSERT INTO `m_status` (`kd`, `status`) VALUES ('111361548ac89412a890b23dbbd146b4', 'Tetap');
INSERT INTO `m_status` (`kd`, `status`) VALUES ('23603a737226f6c7eebb30371195f7f7', 'Honorer');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_tapel`
-- 

CREATE TABLE `m_tapel` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `tahun1` varchar(4) NOT NULL DEFAULT '',
  `tahun2` varchar(4) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_tapel`
-- 

INSERT INTO `m_tapel` (`kd`, `tahun1`, `tahun2`) VALUES ('2a771e8ba89dd288743d4839d61185bc', '2009', '2010');
INSERT INTO `m_tapel` (`kd`, `tahun1`, `tahun2`) VALUES ('d13e816e1bd8d00e0e5824fc430faf25', '2010', '2011');
INSERT INTO `m_tapel` (`kd`, `tahun1`, `tahun2`) VALUES ('dc69250cdecc762faba7452f38a49192', '2011', '2012');
INSERT INTO `m_tapel` (`kd`, `tahun1`, `tahun2`) VALUES ('0c03dbdd9e164b7638c23174953d3989', '2012', '2013');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_uang_gedung`
-- 

CREATE TABLE `m_uang_gedung` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `nilai` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_uang_gedung`
-- 

INSERT INTO `m_uang_gedung` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('cefc9a3a9dcc568bcad726dde2b71e7c', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '500000');
INSERT INTO `m_uang_gedung` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d1e7c66e6fb18e8e8478c286ac485b44', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '500000');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_uang_lain`
-- 

CREATE TABLE `m_uang_lain` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `nilai` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_uang_lain`
-- 

INSERT INTO `m_uang_lain` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d726cf836b61df5cc2897df1e42be505', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '10000');
INSERT INTO `m_uang_lain` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d1e7c66e6fb18e8e8478c286ac485b44', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '10000');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_uang_spp`
-- 

CREATE TABLE `m_uang_spp` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `nilai` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_uang_spp`
-- 

INSERT INTO `m_uang_spp` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d726cf836b61df5cc2897df1e42be505', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '30000');
INSERT INTO `m_uang_spp` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d1e7c66e6fb18e8e8478c286ac485b44', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '20000');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_uang_ujian`
-- 

CREATE TABLE `m_uang_ujian` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `nilai` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_uang_ujian`
-- 

INSERT INTO `m_uang_ujian` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d726cf836b61df5cc2897df1e42be505', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '50000');
INSERT INTO `m_uang_ujian` (`kd`, `kd_tapel`, `kd_kelas`, `nilai`) VALUES ('d1e7c66e6fb18e8e8478c286ac485b44', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '10000');

-- --------------------------------------------------------

-- 
-- Table structure for table `m_walikelas`
-- 

CREATE TABLE `m_walikelas` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_ruang` varchar(50) NOT NULL DEFAULT '',
  `kd_pegawai` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `m_walikelas`
-- 

INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('adfddd86cedd4d6cd8c8999d01b84aa0', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '1c217606333ac983b8760baf64cd8b8a', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('db14dd8a83b7e5c7a2a46b0abefde128', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '1c217606333ac983b8760baf64cd8b8a', '75b107399d4a2d26ccdc4817f8c7c8ed', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('4286bb32a71b7e464437cde375687427', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', 'f1d8793368955b20185eebc6cc532a3d', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('33acdc5ccd69c53c5d3813b8c242da90', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '1ca1210fab344eccd77b4f5f1e2cc569', 'af2e94e92ff53b8592d7c1fdaf0c9edc', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('d5f9cc3b51560be4aa9d9e1b013a3be6', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '1ca1210fab344eccd77b4f5f1e2cc569', '75b107399d4a2d26ccdc4817f8c7c8ed', 'edc5b859d5d26ed9c06a34ac72c2aed5');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('5a39b6476c4d59de1fc076e89e4dd785', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4fcf418adddd67383212bc1d22c61e98', 'b9f286b3403b958369e0ec3423f1a733', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('e30abed2bfd51c66ceeb769692f7d020', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4fcf418adddd67383212bc1d22c61e98', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('f671d439f9976b3c46fbaa1a0c48dc9d', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4fcf418adddd67383212bc1d22c61e98', '75b107399d4a2d26ccdc4817f8c7c8ed', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('9f32176678defa22002146e0f75c17dd', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', 'b9f286b3403b958369e0ec3423f1a733', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('5e676cdbcd2d981d17eb01e2f140424a', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('ba0bc09ec1d7d96339e39ea4244b659f', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1c217606333ac983b8760baf64cd8b8a', '75b107399d4a2d26ccdc4817f8c7c8ed', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('c09c7d1329d1ae89722f06a9524cb444', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1ca1210fab344eccd77b4f5f1e2cc569', 'af2e94e92ff53b8592d7c1fdaf0c9edc', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('9482e4649af0e69ab35240c58cacf7ad', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '1ca1210fab344eccd77b4f5f1e2cc569', '75b107399d4a2d26ccdc4817f8c7c8ed', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('9ebe300f1ef8e07e058e3d4d0aa4083c', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', 'b9f286b3403b958369e0ec3423f1a733', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('b061448d27b5c440ccfe525dca6c7c92', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8581148fda4cba20aa220b5bea5585d5');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('a777c6ee5d2c44554f0602ea16d36f5b', '2a771e8ba89dd288743d4839d61185bc', '2df89d4a12f44a5cc897d6814760687d', '4fcf418adddd67383212bc1d22c61e98', '75b107399d4a2d26ccdc4817f8c7c8ed', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('f55a27d92d61680b7e58c283a68d25de', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1c217606333ac983b8760baf64cd8b8a', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('a9097c06d10b68acdb4bc02751f6baec', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1c217606333ac983b8760baf64cd8b8a', '75b107399d4a2d26ccdc4817f8c7c8ed', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('f49effb1045721f38350d9f62cb8b516', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', '75b107399d4a2d26ccdc4817f8c7c8ed', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('c962b5a2ce1861370106ac7b8044c90f', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('2792aae3c6e5f0257bd7d3f35d3dd611', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '1ca1210fab344eccd77b4f5f1e2cc569', 'b9f286b3403b958369e0ec3423f1a733', 'edc5b859d5d26ed9c06a34ac72c2aed5');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('d375f5066fc0c1134adbe78a1991e66c', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', '75b107399d4a2d26ccdc4817f8c7c8ed', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('4be7cfe2847aec1ef63d92aff999460c', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4fcf418adddd67383212bc1d22c61e98', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('b7df5b29f1db96c95b7dcbc8fe555f50', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4fcf418adddd67383212bc1d22c61e98', '75b107399d4a2d26ccdc4817f8c7c8ed', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('3cdda0bc5b2c1fddbaa26fdfdb4008b4', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', 'b9f286b3403b958369e0ec3423f1a733', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('59be48b39fe7b9f4d2bec6f32b6c0487', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '9d768710c2d056869f252b7a59a84c8c', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('7c5f3e9672e07721613b64746ab6746f', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'b9f286b3403b958369e0ec3423f1a733', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('86dabe27f6e24b4294ba8bcd97b02038', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '75b107399d4a2d26ccdc4817f8c7c8ed', '8d804e81dcaa079c870be3138edf8006');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('20100341d74b311ec1e4615e38b24470', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'af2e94e92ff53b8592d7c1fdaf0c9edc', 'fd81e50177b43431264d5a9c8499b2a9');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('3e14f532ca7ea42bb04d5f4a07e98015', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', 'f1d8793368955b20185eebc6cc532a3d', '850a678c48b6f41b58d0b5678c6042bf');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('24984973fa4c6b44fe7a47c9c84a45e4', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '4ca9dc826b48c794175b27fad223ff9e', '4b011fa0d4299e61fc27b1fa1432a1b4', '3be17d09596cd245484fed3a4f5576eb');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('642957adbade8a6d698bc833150fb31c', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', 'af2e94e92ff53b8592d7c1fdaf0c9edc', '8ce91ca2473b2f64575ef9284bf36640');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('7e39ee227d725e0c469fcd0adf495393', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', '4b011fa0d4299e61fc27b1fa1432a1b4', '002d8634798be7bded45c82e6a9c69d4');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('3211b2eb05d5933969eaa4167b6bb4ed', '2a771e8ba89dd288743d4839d61185bc', '3be17d09596cd245484fed3a4f5576eb', '4ca9dc826b48c794175b27fad223ff9e', 'f1d8793368955b20185eebc6cc532a3d', '9f545dc8f390f4c8c779bb25c326cbb3');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('230935fd9692c8acdd23a4a04d8cdf7f', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '761328c3fd8f3bec20fd885d28ca22d2', '4b011fa0d4299e61fc27b1fa1432a1b4', '2df89d4a12f44a5cc897d6814760687d');
INSERT INTO `m_walikelas` (`kd`, `kd_tapel`, `kd_kelas`, `kd_keahlian`, `kd_ruang`, `kd_pegawai`) VALUES ('b229cb1c7dc998c9d513fbc678beab32', '2a771e8ba89dd288743d4839d61185bc', '27de8f38a90dd1755acd801abefcbb42', '761328c3fd8f3bec20fd885d28ca22d2', 'af2e94e92ff53b8592d7c1fdaf0c9edc', 'fd81e50177b43431264d5a9c8499b2a9');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_absensi`
-- 

CREATE TABLE `siswa_absensi` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_absensi` varchar(50) NOT NULL DEFAULT '',
  `tgl` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `keperluan` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_absensi`
-- 

INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0f8f1acec82db9374eb535741603828a', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-01', '00:00:00', 'o');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('715d57bd7401dd74447f5faa87423c54', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-02', '00:00:00', 'u');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4c690dc70a9ad646c9d1666c05db77ba', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-03', '00:00:00', 'y');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('424c91ec6d41baca6388a694f71c73c5', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-04', '00:00:00', 'n');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('fc316836574cf4203bebdea6b078c08f', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a4d9cab25b9808fa86d64a087c5f4ffc', '7c3a68f7ad86846a2f9764361d3566dd', 'd1e7c66e6fb18e8e8478c286ac485b44', '2008-01-06', '17:45:00', 'r');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e61fffb5e51c695b9461ab21469718af', '7c3a68f7ad86846a2f9764361d3566dd', 'd1e7c66e6fb18e8e8478c286ac485b44', '2008-01-07', '00:00:00', 'y');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('87c5f2e7ae8cd94198d35a0316f5cb79', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-08', '00:00:00', 'e');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('3b8ffcfa14bfe48e9a4261f33500e858', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-09', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('7129b399ba41aa13a57f05f8836776bb', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-10', '00:00:00', 'h');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5ef65cdca6802cd3b890899a12973f62', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-11', '00:00:00', 'fd');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('7f4c216ce01c12f3b65bf4de191fe771', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('322e1eddff629cb76aeaa382e4453527', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-13', '00:00:00', 'f');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6a6d930a4fe9736d2d5c5043b79c593b', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-14', '00:00:00', 'f');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5e5b037da28c02d558d30b100d07e37b', '7c3a68f7ad86846a2f9764361d3566dd', '1bb73a74f58b3ba76720a0f3ab332e59', '2008-01-15', '00:00:00', 'trrr');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ae90c057a27c8b37b3a2f63171fd30f2', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-16', '00:00:00', 'tyyyyu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('761f1c9068eba981c46978edeb6f4599', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-17', '00:00:00', 'sd');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6a595f8953ed5f907a13915f61306d48', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-18', '00:00:00', 'fuuuu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('75923bfce281e73256a6d19e982d875a', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('12f88a75793bc57eed5fa88904c6e462', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-20', '00:00:00', 'gsd');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0b2a8e50004c7639a1f6252f6e9ebc61', '7c3a68f7ad86846a2f9764361d3566dd', '1bb73a74f58b3ba76720a0f3ab332e59', '2008-01-21', '09:57:00', 'gh');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('64ee4bc0b699bfa57084c09e7b217aee', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-22', '00:00:00', 'wagu tenan lah....');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a52d1c9d8f31a9390086307b18afeb28', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-23', '00:00:00', 'df');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('31f55e8805fac480264002174d851ed2', '7c3a68f7ad86846a2f9764361d3566dd', 'd1e7c66e6fb18e8e8478c286ac485b44', '2008-01-24', '11:00:00', 'siti');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9418f61669b36ee9fa42151f1dcccb8b', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-25', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('98f70a14d48d69ab4a4b6bbe74e4f519', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('56bf702ac53adfe89087e361cc5e7cd8', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-27', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('8dba3b3e7e44f56638fac2f50b39f924', '7c3a68f7ad86846a2f9764361d3566dd', '4fcf418adddd67383212bc1d22c61e98', '2008-01-28', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2c0ffc4b2bc60e7fdc59a9bba80d2a1a', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-29', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9000ce4af908698bc823f4fbaa0ae3a9', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-30', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('00f1983ba5a9579289480a0b735dcb62', '7c3a68f7ad86846a2f9764361d3566dd', '', '2008-01-31', '00:00:00', 'wagu');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('24efb439207bb032373ee04242c3ea58', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-01', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('36327eaefa4a690bc0ac6e39462e60b8', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-02', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('157756e9672b380102431d4e303dbb7e', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5f608d8a5a1e4045300b5ddb664259e4', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c6556b80ecdc1e14cc906e3064b4596c', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('421f70c85f445a7eab64e64fd0d292b6', '4996201dc16847071cbbc69cfdd44260', 'd1e7c66e6fb18e8e8478c286ac485b44', '2008-01-06', '10:30:00', 'xstrix');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f46388cb434e4c4ae4b0ef5d7284e37c', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f6d84d465d6344657e9f02c171411477', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9f2aa8660c4d251bff8ef57c75f3024b', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cea608f0790dd6cb6271053f3ac0ea49', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a8c47b04c999816f0a29ab88f51a22ea', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('361a3a6f72f5a49a5ea3c96b84c44f45', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c0e6a8363d4111c32d5d6d2a33667c9c', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('25ff5dc21b07df2563b5e32c9b9673c7', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('fe37084c1f6bd123e22866791b46167c', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cd28bb9ed9aee9d02ac06b2e911018b2', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2e07fa40a927cf1c9cfb1a2e789dd215', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4c1a109613bf2f74b2cc30bbf16a01c6', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('3cd009dd1c2328b68ff2744b2fb37ec6', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('16aa853a0837f847c82734dfb56d6bde', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('78c4d8ddc48cae2be65191510917350f', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b8865eb6a6bd093bf189fffe207d744e', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('7cb929c0cc9d63bde4c126f57cdc4414', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1d9abd7b2e02b33b7f090e4d8b1ad5dc', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b3f4400f61cec5df25f17b50281ccadf', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a0d0ce22d74b6f8ef2992c83d6706295', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cbd373e27e6252200a7a6b75ffcd005c', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c7ab3b0afb453ceb86f1d9ad9b5b7dd9', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e85929c39321b0505b9cd4488f7e8726', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c6591fc6a2ecd1a59b5f87f175988a4f', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('31ed0e59d62055f006cd69efb2f12bc9', '4996201dc16847071cbbc69cfdd44260', '', '2008-01-31', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2bd8bec538a7d6903e98390f134b5bf5', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '1bb73a74f58b3ba76720a0f3ab332e59', '2008-01-01', '01:01:00', 'x');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f6f0d365bd270be1ef6016b70e8b5a33', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd1e7c66e6fb18e8e8478c286ac485b44', '2008-01-02', '03:04:00', 'x');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('556ffd367d052bc94038cb92d8419266', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('64286464c9615e953ab16515478225d0', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f06187f9b0f81bbc4a3b6a72c12054bd', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('db4fedbd16bdbc7540b313b892379b94', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-06', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e3d960fc4d61f9287d2bdd9abfb40a8a', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('50e0c019c548a9fd3832feb1fdcfaff0', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('71ec9962b4fc827547a976aefd9f6c25', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0a93910f52cf0fdbde86efdab233ac6c', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1f3676891959d83ed7d124fe3f7d3fce', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('28de7752a3450a23dc4937aadddb5481', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e697b828c1d17e39d11b569014d1c96e', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('98f2d53764fe5bb799885c838cdd3b53', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e41d6265e71e10711640102623a6fcc3', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4a795608eda5a9d460fc80dae9ad34c6', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('779b61de8564e15f60bf002ae5374a3b', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('350b687a81ea3d57694443dc57906759', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('67d030bc0b544b980a289d8a5a9b98ca', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e346160829cd4ed99bde73aba472ae02', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('fde7f275ab5d9b076e9cb9c5a83adcf7', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e85d2f8d0f89e5529a5e04cc37849662', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e7a34a27954de837cc838a346defc8f4', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6bc9fcabed7a5beb0b5c1edf3ca7e1b0', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5adacaa2851d7ffcebb7ba50057f4d2a', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('afa96b70264f653a4b08fc609d8d4658', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e3d2056ac1960f5041c791f64bb31a95', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ffdd0870d39cc585fb282d6883420dc7', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('06ae1cafcf6351903e57da6ad43a1b9b', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2b20decace0a17390689f84a77013870', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('11a85519ebf98f2047a765145a4ac714', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', '2008-01-31', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('7c5aa7b0f8cdd05db95713131b950603', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-01', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1aae7ff3ced611f84bc9d88571e8425f', 'd1bb4677907c3066abba8f8f7b0d3434', '1bb73a74f58b3ba76720a0f3ab332e59', '2008-01-02', '07:06:00', 'x');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5658b0c44704b932dda2a10471a51382', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('8412b73210033c314b76a7dfbdded544', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9f55cfbb7f0e86b2942103a6f58b120e', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e72de6f1a5bfce4070a3ffdf615b5fd8', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-06', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('3dfdb9feddee97e7928d77227e47c646', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1ef531ca72a59f182b7e231af668701d', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('63468f630dab563161a7be38e1c7f972', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f203ce910160446d5141e6ab39ccd413', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cf8f0d8aefc47beddab7969be6c97866', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9adb589f5c709aa32ee5824447f4fa3e', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('58886197f020afdde7adbb75189eeab7', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e8d31b2755e00e03a72d79d13a9b15fc', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ffb151c81f3240fded97c3a785ab9d35', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0938015ada596c3c3ad656f58707fe1a', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4f42de3453c6de32ab76082fd50ebe96', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ea9e1697eafd9f19bba57fa63817c191', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5a9f9af01b72d7aa32e4bbfbbdaed97a', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2bc0bfe2476245e3764cf48cea5875f6', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('bbad715775e69f989e6bd8c1ad53e4f2', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('05b2788caf4fbf2ec4c15c68e8ba63b5', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('857f3317baae0469c2e158bab09aa2d1', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('bfa164e5c5fbb588727e649584eb501d', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('693d5de96a840103c8c31bf0de2ac75b', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('dcf45e3cc4473831b54a986221ca6393', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('38539c845422c55bb490dfc36950199b', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('12a5428937476421bb1ba560d224de12', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('30ed5d03ae7f0297c2ccfb02002e2463', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c27f99dd15e1934e0d24d0e63b7e4f8a', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9af8a0b051313fc5dc07cd1f77d6dd3d', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2008-01-31', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('40aa3a9a5eda11013dbb9db8c849a654', 'd1bb4677907c3066abba8f8f7b0d3434', '1bb73a74f58b3ba76720a0f3ab332e59', '2009-01-01', '08:08:00', '8');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('999f39b85bfe7218bb346720cade8223', 'd1bb4677907c3066abba8f8f7b0d3434', '1bb73a74f58b3ba76720a0f3ab332e59', '2009-01-02', '10:00:00', 'x');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a2e63f51fd410af9cec8c63447158aa2', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('673a6fd72193a79d614cf6450fcd9ef8', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6cb75a5f7dd37ac9380f537f4c0c96e0', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('be4a53347cd630fec765c4013a95b136', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-06', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('516592902cfe3257548933d256dec4e1', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('18fde4d93523700c405105819885ae1a', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ba6d3657b0f099dc15d06077731d1ef8', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c80345b84de77866c32971a3db444810', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6dcf7becd7d18accfa83910946269cdf', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6f35052a72d9a90c2391d8abaac7c162', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('212b680c69611e6ce42245c8b140d9cb', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('bc6d8775d3d2f70411665fc327ab69d4', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f6f500d3213583f9b6e15b872ea8b18b', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5298d33a20698fa5ddb02ae71dd6f74c', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('d3bbbb4b409f1c2a80310c62abb9ce57', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5bb0af6adf032fa4c7ea47039947c986', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5825797704665b626baa1821884bc227', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ea127fa6fc914487108328c774d30579', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a69f38bbd4f925ae4d9eff664eb56a89', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('03adacac8c0a4536fd7bdb039fb2005e', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0d6662722991e9fe02316575ccb1bdda', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9f33238055f30b5d7dd2eb3af05a0748', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b8022a99b494d696e14a9400504596b4', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a9888a5e90364bff1982232a8fa36c28', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('83d9f0501bf1df251c9d85eed46ab723', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1e0741493d01c37522c72a4a22fb6560', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a53947f08bd8f86225e6a287ace73fa6', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('0bace5730987786c192294f7da2b3800', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b38bc8acbae7e037fa6041680fcec807', 'd1bb4677907c3066abba8f8f7b0d3434', '', '2009-01-31', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('eac1dacc79ba738e7b0ed4968c3f25ce', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-01', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('5268431b73b98b7efa20617c2f4e834f', 'f78e58e3d8d18775f418762e9426b43d', 'd1e7c66e6fb18e8e8478c286ac485b44', '2010-03-02', '11:11:00', '11');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c7290b78563d592743677f1fc3790d80', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('51142a4af0b40463be209e527c124abf', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('fbec5fb5625fe0f9a68422a45192716b', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2aa8e4af8238a1093456eba47dc435b3', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-06', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('094c39f4259b9d1da9035a4b8353e89c', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b7de4421e7deb9866959003a33bd9d27', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2fd7e44c198596d4371ea54d5989186d', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('26d51800589c50a354c1dcc42af33bb7', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ae389ead59db4eecef7a4582619fd571', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1369cc9286d9593fabd54ad2ab1833a6', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('837ce8d346affc70501c7c72f9fef94c', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('d7be20e6c0fc446e840142cffe592e8c', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('dca4d2308174503e81c17ccb92d083fe', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('415c02debc991c5f04ee0e1e1a11cbba', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cd37052bb6a647283d5ac1ecdb69fbc9', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e736bceebb3826589eace9df5d5087a9', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('264a890ef3c69614042e8740a1fa0ebf', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('fc95de7b8a5e8567103393848413ea0c', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c417ea232e39d150a29df9ceb84b9b94', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b56440a109e24b202bfa0a5f046b03c1', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('485f60f5f57a8db04a9e71874137bdeb', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('cd3a69b4cc33685b79775c222e922cbc', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9243bfecdd4b46e12393a68bc115ddd8', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b758dc969837d3f38ac618f232f5a17b', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('23036381bbee99e393a01005a526ba06', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1d989d28211159e46b800ca738104096', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4a35bbba4d82637b15890d3549764cd2', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('97e83dac1b1918044082f070f046f8a2', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('d59dccb8c120d60a940a0fc9adb0a130', 'f78e58e3d8d18775f418762e9426b43d', '', '2010-03-31', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('d3307b914d9e64dba40fe0d6ff163108', 'f78e58e3d8d18775f418762e9426b43d', '1bb73a74f58b3ba76720a0f3ab332e59', '2009-07-01', '11:11:00', '11');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('4620a3cf848b2aee3543a3f3d39fdd58', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-02', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('56364f7e36cf530a5ef45be9f234ac1e', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-03', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('8f67334dcd1a7dafd48717c56d8cead5', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-04', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('de62ca2170efdce9ffbe58aacaec4514', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-05', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('728b154df56fbdaeea92ea5195316044', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-06', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('31af5aba3e99bb90253658400d13eeaf', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-07', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('c54698dbc41a51e8e111256e61b1c459', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-08', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('2f8230cae3919c2bbbcc29342eb46dd6', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-09', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('1a18e9f670eb949f3e5f4c7c615f72ff', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-10', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('7e76a713f037608890c17cc640489efb', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-11', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('33e5e2399a46c5f365ff2821c8c422f8', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-12', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6dd5b51780cd730f9eced6faf3258224', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-13', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('85a8d2e552cced8c8fdbe25d3367d6e9', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-14', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('feafc9c2e6df37d12bcb2d7ba82bc56b', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-15', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('f5a9a7386924bb93877e4cc4eaac16ee', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-16', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9939eb2bf7a355d4d7f7cc2f2bfb2f64', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-17', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('24dc15feaa69e092e0039162faf065f9', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-18', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9080220a18bbfd785a2523ab2c57c857', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-19', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('daf11a18d99390e5eec72aea354dd45b', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-20', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b0ef6737bb6da01e55521ed9a623bc5f', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-21', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('9d6085606e653b1136c972c5611c0ce4', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-22', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a9a48bc4f1a8ee40b4d675a2f72497b5', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-23', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('248bef29d0023e806ef05e1e18b1880d', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-24', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('6599bd8bce2a1231573e5d8fdaabf098', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-25', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('e566e0509bb49a4cfbcbaa69dce0608f', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-26', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('d9dac8d506413d447f3493253da9600c', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-27', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('a52d58994f8d54d20448e0339ac2a0d4', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-28', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('ed087c5f149898add011f2e777a4d243', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-29', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('01bd541d013e6cfecf3986482818080c', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-30', '00:00:00', '');
INSERT INTO `siswa_absensi` (`kd`, `kd_siswa_kelas`, `kd_absensi`, `tgl`, `jam`, `keperluan`) VALUES ('b2530664516a106c01a50488a8b97796', 'f78e58e3d8d18775f418762e9426b43d', '', '2009-07-31', '00:00:00', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_catatan`
-- 

CREATE TABLE `siswa_catatan` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `catatan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_catatan`
-- 

INSERT INTO `siswa_catatan` (`kd`, `kd_siswa_kelas`, `kd_smt`, `catatan`) VALUES ('8936b2f9c18266f5008b0e95842b9d7c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'aaaaaaaaaaaaccc');
INSERT INTO `siswa_catatan` (`kd`, `kd_siswa_kelas`, `kd_smt`, `catatan`) VALUES ('05542c1f9428f3d4d0b3f5e05aa1a610', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', 'eeeexxx');
INSERT INTO `siswa_catatan` (`kd`, `kd_siswa_kelas`, `kd_smt`, `catatan`) VALUES ('a3e648d73c15234e10e3f146a7344ef0', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', 'xxx');
INSERT INTO `siswa_catatan` (`kd`, `kd_siswa_kelas`, `kd_smt`, `catatan`) VALUES ('e0c4856a4ffd9ab759a84b5137cddcfe', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', 'xxx');
INSERT INTO `siswa_catatan` (`kd`, `kd_siswa_kelas`, `kd_smt`, `catatan`) VALUES ('700b464f9a48f6b5130a325d54b168b0', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'xxxx');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_ekstra`
-- 

CREATE TABLE `siswa_ekstra` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_ekstra` varchar(50) NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_ekstra`
-- 

INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('d0bd40f7688b08f27a22b34e85f42eaf', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '40a9b1401bebc29d47f6fdb71ea603f8', 'C', 'z');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('b2f58198c211ff08d1097e30853f496e', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '76fcf4589702a0c082805f9678339788', 'B', 'y');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('dfb446e9bf3596ba3a6bc9b4a274a497', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '163c3b94b1707ba18bd8adb74587c179', 'A', 'x');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('434a4dc1cf29497dd03832dc82faab90', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '163c3b94b1707ba18bd8adb74587c179', 'A', 'x');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('99e04e67f4fa749217dcdc45a6297120', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '76fcf4589702a0c082805f9678339788', 'C', 'y');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('4b702c48c6eaeea38b63b9e813ddd0ba', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', '40a9b1401bebc29d47f6fdb71ea603f8', 'B', 'z');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('1e18e4eb016ac0958c9a31acc932ea1b', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', '76fcf4589702a0c082805f9678339788', 'A', 'x');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('6a8a6ee0a3a5c5b30f460ef26107c796', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', '163c3b94b1707ba18bd8adb74587c179', 'B', 'xxx');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('c7ce7a1ed2abc9ab011cc35df25d2029', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', 'aaff4bcfcaa595218fbca83667c64c95', 'C', 'yhn');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('cf047dab9b461253a50a84430e1d68f5', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '40a9b1401bebc29d47f6fdb71ea603f8', 'C', 'z');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('915a063e32a022a874c0c9063603c108', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '76fcf4589702a0c082805f9678339788', 'B', 'x');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('401342ef7c16ca397866eee6b6d425d3', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '40a9b1401bebc29d47f6fdb71ea603f8', 'A', 'y');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('0af4fedb0b17a73b8bc267d9b912ed38', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '3497319974c63ee32ca758f7d24b37b3', 'C', 'x');
INSERT INTO `siswa_ekstra` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_ekstra`, `predikat`, `ket`) VALUES ('434f46121dd7e6ff5f34df9270f9c913', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '951178296270eec3522cd7ffdbae4f3a', '', '333');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_kelas`
-- 

CREATE TABLE `siswa_kelas` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_ruang` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa` varchar(50) NOT NULL DEFAULT '',
  `no_absen` char(2) NOT NULL DEFAULT '',
  `status` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_kelas`
-- 

INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('5656ff51c3172fc75985e4b5c9acead8', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '3be17d09596cd245484fed3a4f5576eb', 'b9f286b3403b958369e0ec3423f1a733', '5656ff51c3172fc75985e4b5c9acead8', '01', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('20a672f750d99eedfc25358f6ad823e9', '2a771e8ba89dd288743d4839d61185bc', '1c217606333ac983b8760baf64cd8b8a', '2df89d4a12f44a5cc897d6814760687d', 'b9f286b3403b958369e0ec3423f1a733', '20a672f750d99eedfc25358f6ad823e9', '02', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('9b0001d3a5a4c413f0bb8e697b0e513f', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', 'b9f286b3403b958369e0ec3423f1a733', '9b0001d3a5a4c413f0bb8e697b0e513f', '01', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('d1bb4677907c3066abba8f8f7b0d3434', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'd1bb4677907c3066abba8f8f7b0d3434', '03', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('1239a2153fdca93a77792920147fefde', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '3be17d09596cd245484fed3a4f5576eb', 'b9f286b3403b958369e0ec3423f1a733', '1239a2153fdca93a77792920147fefde', '02', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('f78e58e3d8d18775f418762e9426b43d', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'f78e58e3d8d18775f418762e9426b43d', '01', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('9f053182c0baf443eb5a128c079e66f1', 'd13e816e1bd8d00e0e5824fc430faf25', '', '2df89d4a12f44a5cc897d6814760687d', '', 'd1bb4677907c3066abba8f8f7b0d3434', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('745151372e41f279049e15b8581101fe', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '828b3ff12044b06ea2883e49d9f0c8ca', '03', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('da79d7a0df7a9674215684e59fae3f99', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', 'b9f286b3403b958369e0ec3423f1a733', '9df67984eb5b17402c198697043f4f79', '00', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('707eec219afc171e0ca0c8edddb9c2dc', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '06', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('42c41be520e6d2b8fdc65c195d4cb17b', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'aa3f24c48079c1f8377b03dde903c8fb', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('fcf53650ad936a726ed8543b5f161176', 'd13e816e1bd8d00e0e5824fc430faf25', '', '2df89d4a12f44a5cc897d6814760687d', '', 'f78e58e3d8d18775f418762e9426b43d', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('c1a56add45d549f8b5d255a38766ee10', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '0e5267e7c36c7632be0d77268227da57', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('d7665d82933b2c133cd170a26ecdb4eb', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '1b225a69d9cae82e37b519e7414400f2', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('25e067eac4bae9935662bd1910140758', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'f2f413dd8d2e990ea9237da3e85da7fd', '07', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('5ec98879784b1b34d9c435ef9cbc46c9', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'b2da94a37523f3470522ca1c6b24a01a', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('e4164c4684a11dc6280980fdad528d63', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '11cfe1d90e135a00921b7840a2f2344b', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('df40e522e4a806316da97e07c489245e', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '55c5057ef6ff1ec5bf13abfa9c50c355', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('1fb13fb80626eddda11a8ac150f332d2', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '955502590c5a96118ee2094bdb67b0da', '08', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('5cddbd065046defaa55ebde48c90bbf0', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '6efd409ae577467870c6a953c795e354', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('18af94eb25e22c5c701909ee1ebd5030', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'c55d3e4e70156bcbb7ca36f99decfd16', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('b4181b15cc347d62bffc6f6a0232c16c', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '39649f774ae93f2c89744803a5f02b98', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('b2851dde70ca3f8d96c289cd09abcc31', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '323c7e218fe4e7a5024ad8876d7aba61', '04', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('abdb3896947ef4e9d15c23b8be674b7b', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'd0a08bdd829a4bc434eee62ad72a0d51', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('2598986cd23729e49576c1172fdda43b', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '9ac37c64bc6a6b9047d10d672b48c9be', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('e8581df77e3752faa1330a2555cfbb6c', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '5f9669d6a9d83c78c29e9588e0bfe673', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('d86d1f4604aebbce1354b8d76595a8b8', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '75d2955e361d2953471f64faf05a7af2', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('aa94222cdb141089821b6991e0d18939', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '8fb2b0711fea15b4823d347e4776600a', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('87350eda7c87a088b5e51cec40721f85', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '4f02ede76296b003f512032785e5c19e', '02', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('3c9c1036652e2ee0737448d2650d59da', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '4c30e2eb6684359f4c8baa77313e5a50', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('81ab2b00bbcda427aee7125e4ff0e2d5', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '953caf11ce76653b10ff61ff8a3a13bc', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('90688d86531ecceec6edd103025473cd', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'b8178962fbfb9b0be71d3d7a7297d3eb', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('f80bb9e9996ea60a2c2cc9e2d41df72d', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '7dd230c57099924bfa4a02e1b62151c6', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('6547e7fe5711a6a680bfd0e9f6a12db8', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', 'cd522621df3b6e6ddb40788e9d2984c3', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('0169f594c22c832b89e07af0f55b7c87', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '0a246af7bd397521f108ce21368f1d36', '09', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('1ef93cefaa4829cd78ef4978aba3fd7c', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '2787382f3b83f03c407eba8de660bd16', '05', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('1b703ce39d9c21a42ef0613da447837e', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '639f03bd658dc30affafaa63a897b4d3', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('29338185a452b735ee859f0d24e577f6', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '2040c4401658a0dbe07325e910feec1f', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('6c8c4cc4bde53d551da1a5523f4ee3af', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '8129daed93e584be5ac5ee9e5623b06b', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('f2cce067dbd7b00ce63d4a13dcc38f37', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '34a64fb4deab766b70ec00c5e30af2b7', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('a9b71ad6a57587cff5706612eebc72e5', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', '', '2b88a29ea1d2419963b3b514d401953e', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('bab16df94e985c9430df37ff87ff5adc', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', 'f78e58e3d8d18775f418762e9426b43d', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('a49ff8e01174f253c382564be885a35f', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('c17fdeef2493a77fbd60f3967eaafee8', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', 'd1bb4677907c3066abba8f8f7b0d3434', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('2cb31ef74f36af5b32fd57ca2aa745f7', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '828b3ff12044b06ea2883e49d9f0c8ca', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('1bcfba827cf91b3eed31b208b2959b06', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', 'f2f413dd8d2e990ea9237da3e85da7fd', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('5cd4066ffe98e547b4717d1929e61737', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '955502590c5a96118ee2094bdb67b0da', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('5a600523c7faa41b11c1abb23748d536', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '323c7e218fe4e7a5024ad8876d7aba61', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('8c91d59a7f8307ae357de94c644cff09', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '4f02ede76296b003f512032785e5c19e', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('4f54876914679e810cd2f984d4cde468', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '0a246af7bd397521f108ce21368f1d36', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('7d8f4e134c4000842e55329fc174b5e5', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '2787382f3b83f03c407eba8de660bd16', '', 'false');
INSERT INTO `siswa_kelas` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_siswa`, `no_absen`, `status`) VALUES ('33b9e47ae2e817cc78b8654c9bcc953b', 'd13e816e1bd8d00e0e5824fc430faf25', '4ca9dc826b48c794175b27fad223ff9e', '2df89d4a12f44a5cc897d6814760687d', '', '', '', 'false');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_lulus`
-- 

CREATE TABLE `siswa_lulus` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL,
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `lulus` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_lulus`
-- 

INSERT INTO `siswa_lulus` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `lulus`) VALUES ('57de8f3735d5f466eeb29bd90e6160f4', '1239a2153fdca93a77792920147fefde', 'd13e816e1bd8d00e0e5824fc430faf25', 'false');
INSERT INTO `siswa_lulus` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `lulus`) VALUES ('4e0ebde1a79be9d520e5a645c6698aa1', '5656ff51c3172fc75985e4b5c9acead8', 'd13e816e1bd8d00e0e5824fc430faf25', 'true');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_naik`
-- 

CREATE TABLE `siswa_naik` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL,
  `kd_tapel` varchar(50) NOT NULL DEFAULT '',
  `kd_kelas` varchar(50) NOT NULL,
  `naik` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_naik`
-- 

INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('fcf53650ad936a726ed8543b5f161176', 'f78e58e3d8d18775f418762e9426b43d', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('9f053182c0baf443eb5a128c079e66f1', 'd1bb4677907c3066abba8f8f7b0d3434', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('bab16df94e985c9430df37ff87ff5adc', 'bab16df94e985c9430df37ff87ff5adc', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('a49ff8e01174f253c382564be885a35f', 'a49ff8e01174f253c382564be885a35f', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('c17fdeef2493a77fbd60f3967eaafee8', 'c17fdeef2493a77fbd60f3967eaafee8', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('2cb31ef74f36af5b32fd57ca2aa745f7', '2cb31ef74f36af5b32fd57ca2aa745f7', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('1bcfba827cf91b3eed31b208b2959b06', '1bcfba827cf91b3eed31b208b2959b06', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('5cd4066ffe98e547b4717d1929e61737', '5cd4066ffe98e547b4717d1929e61737', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('5a600523c7faa41b11c1abb23748d536', '5a600523c7faa41b11c1abb23748d536', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('8c91d59a7f8307ae357de94c644cff09', '8c91d59a7f8307ae357de94c644cff09', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('4f54876914679e810cd2f984d4cde468', '4f54876914679e810cd2f984d4cde468', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('7d8f4e134c4000842e55329fc174b5e5', '7d8f4e134c4000842e55329fc174b5e5', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');
INSERT INTO `siswa_naik` (`kd`, `kd_siswa_kelas`, `kd_tapel`, `kd_kelas`, `naik`) VALUES ('33b9e47ae2e817cc78b8654c9bcc953b', '33b9e47ae2e817cc78b8654c9bcc953b', 'd13e816e1bd8d00e0e5824fc430faf25', '2df89d4a12f44a5cc897d6814760687d', 'true');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_nh`
-- 

CREATE TABLE `siswa_nh` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_prog_pddkn` varchar(50) NOT NULL,
  `nilkd` varchar(15) NOT NULL DEFAULT '',
  `nilai` char(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_nh`
-- 

INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('540b513def55d0df7f0f15dc49eec948', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '90');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('b34ce72633d4f99f3bd2a973279a2e0d', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '1NR1', '80');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('09523cb5067d8c4f1c730a5960d41ca3', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '1NR2', '70');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('cb14f357998b3b6a54e5b5bbc261da81', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '60');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('7cd8e72b259d0398e784e058622ab543', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '2NR1', '50');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('9745f53a30a5103c8f2757ebaa1b1b99', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '2NR2', '60');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('db756de5a5baecb67080d77fd8e06b0c', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH1', '05');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('b0a5e5800502ad52a9648cdd9f8e4f1f', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', '1NR1', '06');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('40d396d9a4e32f55ed7578a42ae6793f', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', '1NR2', '07');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3a018d46835b65fcfd394f83270d527f', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH2', '08');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3d6f75889ec4d70217d03d3d818d8f53', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', '2NR1', '09');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8b1cb9ff469f50f77f7defea0b70b601', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', '2NR2', '08');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('306b7d2e4115b278059c42ae76eaa413', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '08');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8f1ba3fa51213d5fd678fb27363fc73c', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR1', '07');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('1fcf962e3246dd098cebcd61c96ad634', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR2', '06');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('74dd790114c47716b992a85bea647abc', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '07');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('a4105d6dbe545aa7839846e90adeb35e', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR1', '08');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('97e9d8203c66b5e3fe079b08515af954', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR2', '09');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('050454a23d7967473d42a16ec1bb97f4', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', 'NH1', '89');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3c3302687bb05356f2a7af75478dbf77', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', '1NR1', '70');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('e653fe9c024f6ac93bd72a07d5711c42', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', '1NR2', '66');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('4a5f22f710c705cf2a548b6dc13a2179', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', 'NH2', '57');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('47b68e0c9545a5cd23b403884cd1c7a3', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', '2NR1', '87');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('f2b7728b1e3caf8dcb13deec7b55672a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', '2NR2', '45');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('f0d5371f8985446bc2415ec421e2f4c6', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '89');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('78fdc038be496266d7c96f0d4a2578a4', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR1', '56');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('165d5b4bba7950858fe6bc31af932791', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR2', '78');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8ba7ccf3272e8391d8356e51dec95cf1', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '98');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3a6f9b87535483e9c7bfd6b66e1dc160', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR1', '56');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('257d63efc8f3caed3df29744c0d802f7', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR2', '78');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('57a7881fab81790cdb63ca00d2657698', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '98');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('d2ead3d59e15f6fa5323cd7f229c653c', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR1', '78');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('371327f4dd6d03d502c6d4411791599e', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR2', '67');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('923768694ec9b0858679236c65918fbd', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '87');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('13d373580dca099928fdff9c637264f4', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR1', '57');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('e8073cc3ec6190b68a4292265c7f7ed3', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR2', '68');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('77fcc63a26d07d276428066d5ef9587a', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '98');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3a79f04618dc39ea856b7fe565155a27', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR1', '76');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('0b265d9a277e1de4832ae907f012a2f4', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '1NR2', '78');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8fb293be077a58acf2cd3a54d5b622d8', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '98');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('feaa4cf4ed16c7b0223c17701cdf1eff', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR1', '68');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3ab42b7fc36d77bdda637c9bb4d33c3d', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '2NR2', '98');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('443b2064cc26287337064edbe5b3a88f', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', 'NH1', '01');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('e355f8e1d80377e10bac33ec716d5487', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '1NR1', '02');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('1c5f619136742b719c1f3890fddb258a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '1NR2', '03');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c584ba431793b31b187c1c330ef10241', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', 'NH2', '04');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('94be5c80d80e4fef76f81d472c9bd2d8', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '2NR1', '05');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('be9324da88b395a5fea98a3a9220066e', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '2NR2', '06');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('cb871d99c65bfad9b1936093124b202a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', 'NH1', '12');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('59bac8441b2e81a783adf4cdb8da1e6a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', '1NR1', '78');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8a54588e8803062beeb6bc5cd3217c9f', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', '1NR2', '65');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('744d9f551ad85ea910aa9d686b108841', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', 'NH2', '45');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('e008f8c981895c58a03924cb56e7d045', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', '2NR1', '67');
INSERT INTO `siswa_nh` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('93f1127ee30956ee2f5fe9c442c567de', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', '2NR2', '67');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_nh_rata`
-- 

CREATE TABLE `siswa_nh_rata` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_prog_pddkn` varchar(50) NOT NULL,
  `nilkd` char(3) NOT NULL DEFAULT '',
  `nilai` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_nh_rata`
-- 

INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('d38e6c13c7edfca3750df385724711d9', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '90');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('ff63b269df7c22cdfa2939e9f57de88e', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '60');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('0e30bfe03ca159811eb7f7a74850c901', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH1', '07');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c960c2d2810be9e9f9930cfb03f9be38', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH2', '09');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('ccc1fd671688415eeb4a4c251e85a54f', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '08');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('66085e168e28b99f4243d60d1ff74e2d', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '09');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('ce0cf31c56499b2a6b5a749e5b56b1ed', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', 'NH1', '89');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c5329c429ed7e825fe966805d3789cdf', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', 'NH2', '87');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('4407a880e0293d49f0d4c70b0d4554c1', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '89');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('3d25d2d0eb5d237fa34f28d7abd1f067', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '98');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('bd8fb322f1b0863f988c3a55fd963384', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '98');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('494d67d56acb5020ce4c03ac430234b0', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '87');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('1b721b3bef071a1e602ed008eae76f88', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH1', '98');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('a54e633c1493478edb3926cec32438b3', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', 'NH2', '98');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('4fbf553a6b8014b5820b14ce2b52b368', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', 'NH1', '03');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('7e982ca46268e0a29f6c630d73e12cc1', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', 'NH2', '06');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('60fbb0b118f8c84cea86a752f4e09b47', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c676f9e4f272bfc3c7a42a47b7c2f2c0', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('dc10020c1cc9331cd9fa425dcd8b0dcb', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '5157b981af8d3315ad70be3b62f3803a', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('aaddedd948f8aec425dd56763c02fee8', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '5157b981af8d3315ad70be3b62f3803a', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('e6bd8e5253c574b413f70c73dbaf67cf', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '3c9f301d2afd7414c5ec51a6e9687946', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('042f103c549625f6cddf795702f8a008', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '3c9f301d2afd7414c5ec51a6e9687946', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('34e39ea7eb2a1e775e579e85b474155a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '9efac0e475dc2f723bb7f1b6cad1a371', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('6e2ad3ef571a9308f261bd34c55c0f4a', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '9efac0e475dc2f723bb7f1b6cad1a371', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c2a4928c3a71d49fa2f4f2021b897558', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'f7265d26a8ede183e98ccad5441f01cd', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('068e2e6d6eed93d52eba1ca581cc3dc0', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'f7265d26a8ede183e98ccad5441f01cd', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('1834cbee90ab0ca508c0be6a46bdde77', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', 'f71319cae7ef94d92ce847527ad0b32c', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('237c2e21ccce496efb5a2e2d178e129c', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', 'f71319cae7ef94d92ce847527ad0b32c', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('56c2683247ff7e4a90c032a860dd4d9f', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'eb67b990e0f77ca7ce23542656bc886b', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('8d70d7faa11e78c971afa50b54e332eb', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'eb67b990e0f77ca7ce23542656bc886b', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('66e6246b092f814b2681c2539e01137c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '2bf0ccdbb4d3ebbcb990af74bd78c658', 'NH1', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('c92876dc76b76140c9bba5808368d3f1', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '2bf0ccdbb4d3ebbcb990af74bd78c658', 'NH2', '00');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('a7376ef56cda25862fa138801b6852a2', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', 'NH1', '78');
INSERT INTO `siswa_nh_rata` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nilkd`, `nilai`) VALUES ('b50e5d0548ed4d9d1ef23f2f17643b06', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', 'NH2', '67');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_nilai_prog_pddkn`
-- 

CREATE TABLE `siswa_nilai_prog_pddkn` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_prog_pddkn` varchar(50) NOT NULL,
  `nh` varchar(2) NOT NULL,
  `tugas` varchar(2) NOT NULL,
  `uts` varchar(2) NOT NULL,
  `uas` varchar(2) NOT NULL,
  `praktek` varchar(2) NOT NULL,
  `sikap` varchar(1) NOT NULL,
  `total_kognitif` varchar(5) NOT NULL,
  `total_psikomotorik` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_nilai_prog_pddkn`
-- 

INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('2cb36738513db1eb5435266c0dc0a53b', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '23', '45', '67', '78', '0', 'B', '48', '70');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('28c17931a34e44291a5237dd405090d3', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'ad0efad9dd0abaec4b8f9aaa489ec2f1', '8', '6', '5', '6', '9', 'C', '6', '9');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('a2a8a6c39237faec46335e3fd0ed9285', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '9', '7', '6', '7', '6', 'C', '7', '6');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('c3a9b8a0dc3f655a02b34846003b6e13', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '87f6b1d5ecf9e60c4ea0bdc89b2085e5', '88', '76', '88', '97', '45', '', '87', '45');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('0a471fdfc9e5e2c3c63b62bfb35c8f14', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '93', '56', '77', '87', '56', 'A', '78', '56');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('e5c2fefc8585027ee21a72096f08503b', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '93', '76', '56', '78', '78', 'B', '76', '78');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('ca18eb1a8bbc6fec68db4b7b65a83a6d', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '8b290bf3b1b039227841d89f5f145a80', '98', '98', '67', '98', '78', 'A', '90', '78');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('fd6b79ebb39eaaec0ec0dfa217dc0729', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '15', '28', '37', '46', '57', 'A', '0', '7');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('49f42b494980c116583b8f7196109c8e', '707eec219afc171e0ca0c8edddb9c2dc', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('24a64fd89e4f6279253ae0c4e00aa21b', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '23', '45', '67', '78', '63', 'B', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('c08b8a2c9ddfdbe409c86bffb8b92a4b', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('459380b5640574c7e6de4bb19233c5fc', '25e067eac4bae9935662bd1910140758', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('a1fcd8508b87481faaed73c0e7e35535', '1fb13fb80626eddda11a8ac150f332d2', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('f6bece7fcfa00645461d55a5f265f49b', 'b2851dde70ca3f8d96c289cd09abcc31', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('619b38a8e08a653799bbb47064bb86f2', '87350eda7c87a088b5e51cec40721f85', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('f5386c5af07afdb9e15647ae85d7b91a', '0169f594c22c832b89e07af0f55b7c87', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('71215e164946e7c4cf332e180762a856', '1ef93cefaa4829cd78ef4978aba3fd7c', 'b060de380c57384744177849d22fb584', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '', '', '', '', '', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('2dc89db7184da60ef790275d3f30a75f', 'f78e58e3d8d18775f418762e9426b43d', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '15', '28', '37', '46', '0', 'A', '28', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('5209f1f404f10e238fb00e1b7659523c', '707eec219afc171e0ca0c8edddb9c2dc', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('e16ad1cab5b74ae73e3fd51817a6f037', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '23', '45', '67', '78', '0', 'B', '48', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('54973262c3384e26f8cc0b8690aa154b', '745151372e41f279049e15b8581101fe', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('eb87f70b64ef226d69e5606c3a8caaa4', '25e067eac4bae9935662bd1910140758', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('17456ca866a8eacd5df3410ec7311e14', '1fb13fb80626eddda11a8ac150f332d2', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('a6396966b6bea008e8ec375cedba3efb', 'b2851dde70ca3f8d96c289cd09abcc31', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('d3d0beb231d0cde6517fa0c77387ce85', '87350eda7c87a088b5e51cec40721f85', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('d17749f0d029da5bc2208f68b5ac12c1', '0169f594c22c832b89e07af0f55b7c87', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('7b964431659487c9499ce23f2ff5e564', '1ef93cefaa4829cd78ef4978aba3fd7c', '900e28393edf271632735d0bb6e9b31c', 'e2812f19ee06fbf2f9c2b27fa55ae5db', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('b60dddf1f467bfb128742a7d433ffcf7', 'f78e58e3d8d18775f418762e9426b43d', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '15', '28', '37', '46', '0', 'A', '28', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('f76ebab89e2d240f63bd5f7220453267', '707eec219afc171e0ca0c8edddb9c2dc', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('b7de7c2f76e45acdda222ca5ea4381c1', '745151372e41f279049e15b8581101fe', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('3520a969e2c458697f1d4485eecb95b5', '25e067eac4bae9935662bd1910140758', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('1bd2e3523fea930c5d4b1a18c4ddf069', '1fb13fb80626eddda11a8ac150f332d2', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('8b7a1a7887481315ee19a2de31b4bde0', 'b2851dde70ca3f8d96c289cd09abcc31', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('8785da600b2dc1d0d411ceea4103398e', '87350eda7c87a088b5e51cec40721f85', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('f2976f71580224acdbc0d0bd2b3e0469', '0169f594c22c832b89e07af0f55b7c87', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('8d64e32df2c30e912367cc7a16037856', '1ef93cefaa4829cd78ef4978aba3fd7c', '900e28393edf271632735d0bb6e9b31c', '8b290bf3b1b039227841d89f5f145a80', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `siswa_nilai_prog_pddkn` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_prog_pddkn`, `nh`, `tugas`, `uts`, `uas`, `praktek`, `sikap`, `total_kognitif`, `total_psikomotorik`) VALUES ('c19cac59868969513400e5046d2da958', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'e3050c2fe9297974cbf4328fa4f98d42', '73', '67', '54', '56', '87', 'A', '63', '87');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_pribadi`
-- 

CREATE TABLE `siswa_pribadi` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_smt` varchar(50) NOT NULL DEFAULT '',
  `kd_pribadi` varchar(50) NOT NULL,
  `predikat` varchar(1) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_pribadi`
-- 

INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('6eb40eed10ca4f6eaa5564db29ab630e', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '1239a2153fdca93a77792920147fefde', 'A', '2');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('309ae607c94a1f744869f0fa2a692beb', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '64ee4bc0b699bfa57084c09e7b217aee', 'B', '7');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('309ae607c94a1f744869f0fa2a692beb', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', 'a4d9cab25b9808fa86d64a087c5f4ffc', 'A', '4');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('6eb40eed10ca4f6eaa5564db29ab630e', 'd1bb4677907c3066abba8f8f7b0d3434', 'b060de380c57384744177849d22fb584', '6a595f8953ed5f907a13915f61306d48', 'K', '1');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('3e4316435c0a48169093a307e4cb6bf3', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', '1239a2153fdca93a77792920147fefde', 'A', 'x');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('3e4316435c0a48169093a307e4cb6bf3', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', '64ee4bc0b699bfa57084c09e7b217aee', 'B', 'y');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('3e4316435c0a48169093a307e4cb6bf3', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', 'a4d9cab25b9808fa86d64a087c5f4ffc', 'C', 'z');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('3e4316435c0a48169093a307e4cb6bf3', '745151372e41f279049e15b8581101fe', 'b060de380c57384744177849d22fb584', '6a595f8953ed5f907a13915f61306d48', 'K', 'w');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('f716b96fd86d303fad7a701f322e1979', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', '1239a2153fdca93a77792920147fefde', 'A', 'a');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('f716b96fd86d303fad7a701f322e1979', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', '64ee4bc0b699bfa57084c09e7b217aee', 'B', 's');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('f716b96fd86d303fad7a701f322e1979', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', 'a4d9cab25b9808fa86d64a087c5f4ffc', 'C', 'd');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('f716b96fd86d303fad7a701f322e1979', 'da79d7a0df7a9674215684e59fae3f99', 'b060de380c57384744177849d22fb584', '6a595f8953ed5f907a13915f61306d48', 'K', 'f');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('05dcbb531b576a9a50f45e7b65dd2042', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '1239a2153fdca93a77792920147fefde', 'A', '1');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('05dcbb531b576a9a50f45e7b65dd2042', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '64ee4bc0b699bfa57084c09e7b217aee', 'B', '2');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('05dcbb531b576a9a50f45e7b65dd2042', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', 'a4d9cab25b9808fa86d64a087c5f4ffc', 'C', '3');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('05dcbb531b576a9a50f45e7b65dd2042', 'd1bb4677907c3066abba8f8f7b0d3434', '900e28393edf271632735d0bb6e9b31c', '6a595f8953ed5f907a13915f61306d48', 'K', '4');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('beb7ff32fe74e05ef963cac85c13ca8c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '1239a2153fdca93a77792920147fefde', '', '45');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('beb7ff32fe74e05ef963cac85c13ca8c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '64ee4bc0b699bfa57084c09e7b217aee', 'B', '');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('beb7ff32fe74e05ef963cac85c13ca8c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', 'a4d9cab25b9808fa86d64a087c5f4ffc', 'A', '666');
INSERT INTO `siswa_pribadi` (`kd`, `kd_siswa_kelas`, `kd_smt`, `kd_pribadi`, `predikat`, `ket`) VALUES ('beb7ff32fe74e05ef963cac85c13ca8c', 'f78e58e3d8d18775f418762e9426b43d', 'b060de380c57384744177849d22fb584', '6a595f8953ed5f907a13915f61306d48', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_rangking`
-- 

CREATE TABLE `siswa_rangking` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_tapel` varchar(50) NOT NULL,
  `kd_keahlian` varchar(50) NOT NULL,
  `kd_kelas` varchar(50) NOT NULL,
  `kd_ruang` varchar(50) NOT NULL,
  `kd_smt` varchar(50) NOT NULL,
  `kd_siswa_kelas` varchar(50) NOT NULL,
  `total_kognitif` varchar(5) NOT NULL,
  `rata_kognitif` varchar(5) NOT NULL,
  `total_psikomotorik` varchar(5) NOT NULL,
  `rata_psikomotorik` varchar(5) NOT NULL,
  `total` varchar(5) NOT NULL,
  `rangking` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_rangking`
-- 

INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('d2bb0d6bc69f637f5b0e4d51f803b6b5', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', '745151372e41f279049e15b8581101fe', '29', '7', '24', '6', '53', '4');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('4d2391eea844fca527b8f3b32542107b', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', 'f78e58e3d8d18775f418762e9426b43d', '228', '57', '195', '49', '423', '3');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('95507daf5c1e49e64fb0c5e6f3c3d732', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', 'd1bb4677907c3066abba8f8f7b0d3434', '90', '90', '78', '78', '168', '2');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('7b47129363b909e0e2e53c1a4ca9bd1b', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', 'da79d7a0df7a9674215684e59fae3f99', '353', '71', '304', '61', '657', '1');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('e4aa0444f32fe7edafd1d1eb563b4786', '2a771e8ba89dd288743d4839d61185bc', '9d768710c2d056869f252b7a59a84c8c', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', '707eec219afc171e0ca0c8edddb9c2dc', '7', '7', '6', '6', '13', '5');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('e38aafdd6247fc00c2147e1029d0f503', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', '900e28393edf271632735d0bb6e9b31c', 'd1bb4677907c3066abba8f8f7b0d3434', '77', '39', '79', '40', '156', '1');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('a2a8a6c39237faec46335e3fd0ed9285', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', '707eec219afc171e0ca0c8edddb9c2dc', '7', '7', '6', '6', '13', '4');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('c3a9b8a0dc3f655a02b34846003b6e13', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', 'f78e58e3d8d18775f418762e9426b43d', '228', '57', '195', '49', '423', '1');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('e5c2fefc8585027ee21a72096f08503b', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', '87350eda7c87a088b5e51cec40721f85', '76', '76', '78', '78', '154', '3');
INSERT INTO `siswa_rangking` (`kd`, `kd_tapel`, `kd_keahlian`, `kd_kelas`, `kd_ruang`, `kd_smt`, `kd_siswa_kelas`, `total_kognitif`, `rata_kognitif`, `total_psikomotorik`, `rata_psikomotorik`, `total`, `rangking`) VALUES ('ca18eb1a8bbc6fec68db4b7b65a83a6d', '2a771e8ba89dd288743d4839d61185bc', '4ca9dc826b48c794175b27fad223ff9e', '27de8f38a90dd1755acd801abefcbb42', 'b9f286b3403b958369e0ec3423f1a733', 'b060de380c57384744177849d22fb584', 'd1bb4677907c3066abba8f8f7b0d3434', '90', '90', '78', '78', '168', '2');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_uang_gedung`
-- 

CREATE TABLE `siswa_uang_gedung` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_uang_gedung` varchar(50) NOT NULL DEFAULT '',
  `tgl_bayar` date NOT NULL DEFAULT '0000-00-00',
  `ket` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_uang_gedung`
-- 

INSERT INTO `siswa_uang_gedung` (`kd`, `kd_siswa_kelas`, `kd_uang_gedung`, `tgl_bayar`, `ket`) VALUES ('6af20a984d2929e8f9f0fe1b42a87c32', '7c3a68f7ad86846a2f9764361d3566dd', 'cefc9a3a9dcc568bcad726dde2b71e7c', '2008-02-03', 'xxxx');
INSERT INTO `siswa_uang_gedung` (`kd`, `kd_siswa_kelas`, `kd_uang_gedung`, `tgl_bayar`, `ket`) VALUES ('95fa2f75ddcb8fd38d6196cc8055a12a', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'cefc9a3a9dcc568bcad726dde2b71e7c', '2008-03-02', 'xstrix');
INSERT INTO `siswa_uang_gedung` (`kd`, `kd_siswa_kelas`, `kd_uang_gedung`, `tgl_bayar`, `ket`) VALUES ('91df26fa3ed32371d5cdb3ef090ee2de', 'f78e58e3d8d18775f418762e9426b43d', 'cefc9a3a9dcc568bcad726dde2b71e7c', '2007-01-01', 'xx');
INSERT INTO `siswa_uang_gedung` (`kd`, `kd_siswa_kelas`, `kd_uang_gedung`, `tgl_bayar`, `ket`) VALUES ('3d4aaeed32dfb08d83202478a2a330a6', 'd1bb4677907c3066abba8f8f7b0d3434', 'cefc9a3a9dcc568bcad726dde2b71e7c', '2009-04-03', 'xx');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_uang_lain`
-- 

CREATE TABLE `siswa_uang_lain` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_uang_lain` varchar(50) NOT NULL DEFAULT '',
  `tgl_bayar` date NOT NULL DEFAULT '0000-00-00',
  `ket` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_uang_lain`
-- 

INSERT INTO `siswa_uang_lain` (`kd`, `kd_siswa_kelas`, `kd_uang_lain`, `tgl_bayar`, `ket`) VALUES ('21a97fafb926a723f1799b906974bed4', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '2008-04-13', 'yyyyy');
INSERT INTO `siswa_uang_lain` (`kd`, `kd_siswa_kelas`, `kd_uang_lain`, `tgl_bayar`, `ket`) VALUES ('7eeb0972d9404b61ba1d20afe340cfcd', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '0000-00-00', '');
INSERT INTO `siswa_uang_lain` (`kd`, `kd_siswa_kelas`, `kd_uang_lain`, `tgl_bayar`, `ket`) VALUES ('f233db7a946f6b6994f8a687f3c8732f', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '2008-03-10', 'x');
INSERT INTO `siswa_uang_lain` (`kd`, `kd_siswa_kelas`, `kd_uang_lain`, `tgl_bayar`, `ket`) VALUES ('82c166f57ef14d234a37186b5cea9562', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '2008-09-04', 'xu');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_uang_spp`
-- 

CREATE TABLE `siswa_uang_spp` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_uang_spp` varchar(50) NOT NULL DEFAULT '',
  `bln` char(2) NOT NULL DEFAULT '',
  `thn` varchar(4) NOT NULL DEFAULT '',
  `tgl_bayar` date NOT NULL DEFAULT '0000-00-00',
  `ket` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_uang_spp`
-- 

INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('0ca1c95f1a4408341e03bfd1dd62b48e', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '7', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('11d1f2aa4f59484d127b891b6dc09e0f', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '8', '2008', '0000-00-00', 'yyy');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('506358d9b05578b173c4c1e1384b5e8b', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '9', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('23eb33218ec22c8d1a4b522423738bf0', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '10', '2008', '2008-09-19', 'tt');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('6bbcfdf667842027242edc70172415d2', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '11', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ad5c33b70d9228979635506b9a0f8cad', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '12', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('7e94bdb5004bd3369b3c36857f1e7056', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '1', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('9392e170d716da4a4eca364d6d69cb0c', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '2', '2009', '2007-07-16', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('d06de7566ade25d4202d086dc78c44ec', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '3', '2009', '0000-00-00', 'rrr');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('962a1b70a68885c97ecc6501fdd9f561', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '4', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('2e5fb56d036214bb6defcf0420868c7f', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '5', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('0136894393158e45a1857e97593cf98a', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '6', '2009', '0000-00-00', 'dd');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('f3456c7313e4fa6a8931ff47a503056c', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '7', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('95475c37ac5864bfd10a7ee816a0d5d1', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '8', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('144a26e1ad960ecb976339043b80669d', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '9', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('31152f0cbe47b11bbdcc93673a2884ba', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '10', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('d191fc5e943ec8795f30f55f198a372e', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '11', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('d0b82dc41f1b7d79b7ccee8cd6c3ad6f', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '12', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('9c6347f267242f0a3e77b98381506b9c', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '1', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('24e588aa8c8d32543553cc1fdfb11e3a', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '2', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('8ce9f70bf887195fdc1a701f7076eec9', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '3', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('5a4f85df851049d7e0384103b95aca1b', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '4', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('c75eb86f5f4ed90e95444aa4685a5beb', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '5', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('394ee9845fdc13ddb4b510e3c93bf95e', '20a672f750d99eedfc25358f6ad823e9', 'd1e7c66e6fb18e8e8478c286ac485b44', '6', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('a8e57752e36aad6fc82626421a7e7471', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '7', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('c96f176649c1e3b1b8766ca8cb280d0c', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '8', '2008', '2008-06-05', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('bd4a2bcf5067756334beacbec0396746', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '9', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('2f9188dfa5c8e42c98f206870173a207', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '10', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('bfcd189a369eb06f7a2756683911333a', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '11', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ee4ec900c20666b1405c6fa5054e0244', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '12', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('a519f25edcbe998c6e4d7f21b32a7f5d', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '1', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('09102dc9b68ac3b6705e162945cd62c3', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '2', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ba330fb22929bf38d2d1cc3316a3c28b', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '3', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ac7b52d723ffeb92e8833b38a0c3c92e', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '4', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('92dc13547303cee3c62624a6fa21dd26', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '5', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('a09f7448f40e94fea81704f8466d47a0', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '6', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('03c26ff1bcf7e4aac5a316dc6c11b7bd', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '7', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('53b55af36f6e3f64c3c5dc961af31dfd', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '8', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('055ef34059424cec07104f68b2b9b2b2', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '9', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('b39005c100a8c47ce21fb7bb8527b4d6', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '10', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('c9807338eb670d4105e7014c53f19c58', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '11', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ad6c3ad1e95ac8b5d986beca11e9ff96', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '12', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('17cbc5ada65f5449447b3f36cdec2bfd', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '1', '2009', '2009-04-17', 'x');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('dd9743ee247f282f2fbdd51d90601302', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '2', '2009', '2008-10-09', 'x');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('3a034304a8463c8dfa71fc6393bba88b', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '3', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('edd1c8d014196eabc94298068c549b75', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '4', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('894ed5d2f7f549c2d6a6d46da72e6dcd', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '5', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('d888c9b94d00a8f51e595251f8879844', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '6', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('5f4ea953dc6dd125ab921eeefb3287ad', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '7', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('f67a9ec0f00a7f4bbffe3c4c6a2988a8', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '8', '2008', '2008-09-04', 'x');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('28f22689790de7c114b462a00510c50a', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '9', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('03012a69da645328bac3688cc80a7745', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '10', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('099efee402fecb7cf67518a3bd8616eb', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '11', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('36fec45736402bd927f4b56ec45ecf7b', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '12', '2008', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('47fe78077964cf0fa61e450486dcdc28', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '1', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('b184f8ad1bb795d79387063832ff01dc', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '2', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('71127e129ab16a4a949f783e497001f2', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '3', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('243bcc6b1ae48c0c0594390b40e39012', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '4', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('2e1b888af1c90a6176ce0e0b4d799ec5', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '5', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('24a042021fc999f37bcc524d2f4c7603', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '6', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('57122d2ad32704342504da146c37bd57', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '7', '2009', '2010-06-04', 'x');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('67833a563c462f521767052ce015b3fd', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '8', '2009', '2009-06-04', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('ccc2686d1a0022019d11d26ec069a4a1', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '9', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('16d66e7bd1f4daba0632f47f61bef0d4', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '10', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('5d35d97eeddc7fe2a5077841fe6a08af', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '11', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('2be81223597b997877a3721fdb775c33', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '12', '2009', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('5f3592de13ba08a45027a1a3fcf97802', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '1', '2010', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('69b67aae7fea97764b7ef7b7e8061f43', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '2', '2010', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('802bc168e4e703fb4a0d41258ed0e52a', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '3', '2010', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('02769d1b906d5a3a172a5810e1720d12', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '4', '2010', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('b980a9ad4db2a0cb72df69ff68f95a6f', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '5', '2010', '0000-00-00', '');
INSERT INTO `siswa_uang_spp` (`kd`, `kd_siswa_kelas`, `kd_uang_spp`, `bln`, `thn`, `tgl_bayar`, `ket`) VALUES ('42583ec4acf85f72f47b960e0509d127', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '6', '2010', '0000-00-00', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_uang_ujian`
-- 

CREATE TABLE `siswa_uang_ujian` (
  `kd` varchar(50) NOT NULL DEFAULT '',
  `kd_siswa_kelas` varchar(50) NOT NULL DEFAULT '',
  `kd_uang_ujian` varchar(50) NOT NULL DEFAULT '',
  `tgl_bayar` date NOT NULL DEFAULT '0000-00-00',
  `ket` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `siswa_uang_ujian`
-- 

INSERT INTO `siswa_uang_ujian` (`kd`, `kd_siswa_kelas`, `kd_uang_ujian`, `tgl_bayar`, `ket`) VALUES ('14707861ef5f5a79225f185c3a722ef5', '7c3a68f7ad86846a2f9764361d3566dd', 'd726cf836b61df5cc2897df1e42be505', '2008-03-05', 'hhhh');
INSERT INTO `siswa_uang_ujian` (`kd`, `kd_siswa_kelas`, `kd_uang_ujian`, `tgl_bayar`, `ket`) VALUES ('40393c2a37bdf6ab3f5ffbd9074d3ba8', 'e0ddb27a1258a4cd5fe31f5f0f3413ad', 'd726cf836b61df5cc2897df1e42be505', '2007-01-02', '');
INSERT INTO `siswa_uang_ujian` (`kd`, `kd_siswa_kelas`, `kd_uang_ujian`, `tgl_bayar`, `ket`) VALUES ('bc69d35762b79fc42ba8cc76cc853c6e', 'f78e58e3d8d18775f418762e9426b43d', 'd726cf836b61df5cc2897df1e42be505', '2007-04-06', 'x');
INSERT INTO `siswa_uang_ujian` (`kd`, `kd_siswa_kelas`, `kd_uang_ujian`, `tgl_bayar`, `ket`) VALUES ('b96b99b5b6369c15268a4b0fb023fc4f', 'd1bb4677907c3066abba8f8f7b0d3434', 'd726cf836b61df5cc2897df1e42be505', '2008-03-02', 'xy');
