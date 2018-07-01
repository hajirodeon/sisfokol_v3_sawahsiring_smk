<?php
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
/////// SISFOKOL_SMK_v3.0_(sawah_siring)_FREE       ///////
/////// (Sistem Informasi Sekolah untuk SMK)        ///////
///////////////////////////////////////////////////////////
/////// Dibuat oleh : 								///////
/////// Agus Muhajir, S.Kom 						///////
/////// URL 	: http://sisfokol.wordpress.com 	///////
/////// E-Mail	: 									///////
///////		* hajirodeon@yahoo.com 					///////
///////		* hajirodeon@gmail.com					///////
/////// HP/SMS	: 081-829-88-54 					///////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////



//nilai
$maine = "$sumber/admtu/index.php";


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<table bgcolor="#E4D6CC" width="100%" border="0" cellspacing="0" cellpadding="5">
<tr>
<td>';
//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//home //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<a href="'.$maine.'" title="Home" class="menuku"><strong>Home</strong>&nbsp;&nbsp;</A> | ';
//home //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//setting ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu1"><strong>SETTING</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu1" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/s/pass.php" title="Ganti Password">Ganti Password</a>
</LI>
</UL>';
//setting ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//master ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu2"><strong>MASTER</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu2" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/m/tapel.php" title="Tahun Pelajaran">Tahun Pelajaran</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/ruang.php" title="Ruang">Ruang</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/pangkat.php" title="Pangkat">Pangkat</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/jabatan.php" title="Jabatan">Jabatan</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/golongan.php" title="Golongan">Golongan</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/agama.php" title="Agama">Agama</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/pekerjaan.php" title="Pekerjaan">Pekerjaan</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/ijazah.php" title="Ijazah">Ijazah</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/status.php" title="Status">Status</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/akta.php" title="Akta">Akta</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/m/pegawai.php" title="Pegawai">Pegawai</a>
</LI>
</UL>';
//master ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//akademik //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu3"><strong>AKADEMIK</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu3" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/akad/keahlian.php" title="Keahlian">Keahlian</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/akad/ekstra.php" title="Ekstra">Ekstra</a>
</LI>

<LI>
<a href="#" title="Program Pendidikan">Program Pendidikan</a>
	<UL>
	<LI>
	<a href="'.$sumber.'/admtu/akad/prog_pddkn.php" title="Data Program Pendidikan">Data Program Pendidikan</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/prog_pddkn_kelas.php" title="Program Pendidikan per Kelas">Program Pendidikan per Kelas</a>
	</LI>
	</UL>
</LI>

<LI>
<a href="#" title="Guru">Guru</a>
	<UL>
	<LI>
	<a href="'.$sumber.'/admtu/akad/guru.php" title="Data Guru">Data Guru</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/guru_prog_pddkn_r.php" title="Guru Program Pendidikan per Ruang">Guru Program Pendidikan per Ruang</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/guru_prog_pddkn_tmp.php" title="Penempatan Guru Mengajar">Penempatan Guru Mengajar</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/wk.php" title="Wali Kelas">Wali Kelas</a>
	</LI>
	</UL>
</LI>

<LI>
<a href="'.$sumber.'/admtu/akad/siswa.php" title="Siswa">Siswa</a>
	<UL>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa.php" title="Data Siswa">Data Siswa</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa_tmp_k.php" title="Penempatan Siswa per Kelas">Penempatan Siswa per Kelas</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa_tmp_kea.php" title="Penempatan Siswa per Keahliean">Penempatan Siswa per Keahlian</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa_tmp_r.php" title="Penempatan Siswa per Ruang">Penempatan Siswa per Ruang</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa_kenaikan.php" title="Kenaikan Kelas">Kenaikan Kelas</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/akad/siswa_history.php" title="History Kelas">History Kelas</a>
	</LI>
	</UL>
</LI>
</UL>';
//akademik //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//jadwal ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu4"><strong>JADWAL</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu4" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/jwal/pel.php" title="Jadwal Pelajaran">Jadwal Pelajaran</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/jwal/guru.php" title="Jadwal Guru Mengajar">Jadwal Guru Mengajar</a>
</LI>
</UL>';
//jadwal ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//penilaian /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<a href="'.$sumber.'/admtu/nil/nilai.php" title="Penilaian" class="menuku"><strong>PENILAIAN</strong>&nbsp;&nbsp;</A> | ';
//penilaian /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//keuangan //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu5"><strong>KEUANGAN</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu5" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/keu/set.php" title="Set Keuangan">Set Keuangan</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/keu/siswa.php" title="Keuangan Siswa">Keuangan Siswa</a>
</LI>
</UL>';
//keuangan //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//absensi ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu6"><strong>ABSENSI</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu6" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/abs/harian.php" title="Absensi Harian Siswa">Absensi Harian Siswa</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/abs/rekap_kelas.php" title="Rekap Absensi per Kelas Ruang">Rekap Absensi Per Kelas Ruang</a>
</LI>
</UL>';
//absensi ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//inventaris ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu7"><strong>INVENTARIS</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu7" class="flexdropdownmenu">
<LI>
<a href="'.$sumber.'/admtu/inv/brg.php" title="Daftar Barang">Daftar Barang</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/inv/tmp_brg.php" title="Penempatan per Barang">Penempatan per Barang</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/inv/tmp_keah.php" title="Penempatan per Keahlian">Penempatan per Keahlian</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/inv/lab.php" title="Laboratorium">Laboratorium</a>
</LI>
<LI>
<a href="'.$sumber.'/admtu/inv/peng_lab.php" title="Penggunaan Lab.">Penggunaan Lab.</a>
</LI>
</UL>';
//inventaris ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//laporan ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="#" class="menuku" data-flexmenu="flexmenu8"><strong>LAPORAN</strong>&nbsp;&nbsp;</A> |
<UL id="flexmenu8" class="flexdropdownmenu">
<LI>
<a href="#" title="Keuangan Siswa">Keuangan Siswa</a>
	<UL>
	<LI>
	<a href="'.$sumber.'/admtu/lap/u_siswa_gedung.php" title="Uang Gedung">Uang Gedung</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/lap/u_siswa_ujian.php" title="Uang Ujian">Uang Ujian</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/lap/u_siswa_spp.php" title="Uang SPP">Uang SPP</a>
	</LI>
	<LI>
	<a href="'.$sumber.'/admtu/lap/u_siswa_lain.php" title="Uang Lain-Lain">Uang Lain-Lain</a>
	</LI>
	</UL>
</LI>

<LI>
<a href="'.$sumber.'/admtu/lap/abs_rekap_kelas.php" title="Rekap Absensi per Kelas Ruang">Rekap Absensi per Kelas Ruang</a>
</LI>
</UL>';
//laporan ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//logout ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<A href="'.$sumber.'/admtu/logout.php" title="Logout / KELUAR" class="menuku"><strong>LogOut</strong></A>
</td>
</tr>
</table>';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>