<?php
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/////// SISFOKOL_SLTA_v3.0_(sawah_siring)_FREE           ///////
/////// (Sistem Informasi Sekolah untuk SLTA)            ///////
////////////////////////////////////////////////////////////////
/////// Dibuat oleh :                                    ///////
/////// Agus Muhajir, S.Kom                              ///////
/////// URL 	: http://sisfokol.wordpress.com          ///////
/////// E-Mail	:                                        ///////
///////		* hajirodeon@yahoo.com                   ///////
///////		* hajirodeon@gmail.com                   ///////
/////// HP/SMS	: 081-829-88-54                          ///////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////


//ambil nilai
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
$tpl = LoadTpl("../../template/login.html");


nocache;

//nilai
$filenya = "donatur.php";
$judul = "Donatur";



//isi *START
ob_start();

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">
<table width="600" border="0" cellspacing="5" cellpadding="0">
<tr valign="top">
<td>
<p>
<hr>
<big>
<font color="violet">
<strong>
Daftar Donatur Pengembangan SISFOKOL (Sejak tahun 2005, Sampai tahun 2010).
</strong>
</font>
</big>
<hr>
</p>

<p>
<em>
*[<strong>OmahBIASAWAE and <a href="http://sisfokol.wordpress.com" target="_blank" title="SISFOKOL">SISFOKOL</a>, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>Dimensi Sell, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>BHOSS Digital Printing, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>Distro Linux SchoolOnffline, Onno W. Purbo</strong>].
<br>
*[<strong>Distro Linux BlankOn, Rahman Yusri</strong>].
<br>
*[<strong><a href="http://yahoogroup.com/groups/kendal_foss/" target="_blank" title="Komunitas Kendal-FOSS">Komunitas Kendal-FOSS</a></strong>].
<br>
*[<strong>Majalah InfoLINUX</strong>].
<br>
*[<strong>SMA Muhammadiyah 1 Weleri, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>SMA Negeri 1 Pati, Jawa Tengah</strong>].
<br>
*[<strong>SMA Negeri 2 Pati, Jawa Tengah</strong>].
<br>
*[<strong>SMKN 01 Samarinda</strong>].
<br>
*[<strong>SMKN 04 Samarinda</strong>].
<br>
*[<strong><a href="http://www.ittelkom.ac.id" target="_blank" title="ITTELKOM.AC.ID">ITTELKOM.AC.ID</a></strong>].
<br>
*[<strong>SD Negeri Tegorejo 1, Kendal, Jawa Tengah</strong>].
<br>
*[<strong><a href="http://www.smpn4palu.sch.id" target="_blank" title="SMPN4PALU.SCH.ID">SMPN4PALU.SCH.ID</a></strong>].
<br>
*[<strong><a href="http://www.infolinux.web.id" target="_blank" title="InfoLINUX">InfoLINUX</a></strong>].
<br>
*[<strong><a href="http://toko.baliwae.com" target="_blank" title="TOKO.BALIWAE.COM">TOKO.BALIWAE.COM</a></strong>].
<br>
*[<strong>SMP Pondok Modern Selamat, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>SMA Negeri 1 Kendal, Jawa Tengah</strong>].
<br>
*[<strong>IKIP PGRI Bojonegoro, Jawa Timur</strong>].
<br>
*[<strong>SMK NU 03 Kaliwungu, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>MA Hasyim Asy\'ari, Jepara, Jawa Tengah</strong>].
<br>
*[<strong>Rumah Ilmu Indonesia</strong>].
<br>
*[<strong>Kampus UNNES Semarang</strong>].
<br>
*[<strong>Rumah Ilmu Indonesia, Bandung</strong>].
<br>
*[<strong>Kampus STAN, Bintaro Jaya, Tangerang</strong>].
<br>
*[<strong>Kampus UGM Yogyakarta</strong>].
<br>
*[<strong>Kampus UI Jakarta</strong>].
<br>
*[<strong>SMKN 01 Serang, Banten</strong>].
<br>
*[<strong>SMPN 18 Bandung</strong>].
<br>
*[<strong>PT. Javatechno Mandiri Indonesia, Kartasura</strong>].
<br>
*[<strong>SMA Negeri Tomo, Sumedang, Jawa Barat</strong>].
<br>
*[<strong>SMP Wachid Hasjim, Lamongan, Jawa Timur</strong>].
<br>
*[<strong>UII Yogyakarta</strong>].
<br>
*[<strong>Apartemen Sudirman Park, Jakarta Barat</strong>].
<br>
*[<strong>SMK TI Airlangga, Samarinda</strong>].
<br>
*[<strong>Karang Talun, Cilacap Utara, Jawa Tengah</strong>]
<br>
*[<strong>PUSPITEK Serpong, Tangerang</strong>].
<br>
*[<strong>Kotagede, Yogyakarta</strong>].
<br>
*[<strong><a href="http://bytescode.wordpress.com" target="_blank" title="BYTESCODE.WORDPRESS.COM">BYTESCODE.WORDPRESS.COM</a></strong>]
<br>
*[<strong>Perumda Sukoharjo, Pati, Jawa Tengah</strong>].
<br>
*[<strong>Bumi Teluk Jambe, Karawang, Jawa Barat</strong>].
<br>
*[<strong>Klub Guru Yogyakarta</strong>].
<br>
*[<strong>SMA Negeri 03 Rembang, Jawa Tengah</strong>].
<br>
*[<strong>Villa Dago, Pamulang, Tangerang</strong>].
<br>
*[<strong>MA MAI Purwakarta, Jawa Barat</strong>].
<br>
*[<strong>SMKN 1 Majalengka, Jawa Barat</strong>].
<br>
*[<strong>SMAN 1 Mallusetasi, Sulawesi Selatan</strong>].
<br>
*[<strong>SMKN 1 Cibinong, Bogor</strong>].
<br>
*[<strong>SMP Kusuma Bangsa, Palembang</strong>].
<br>
*[<strong>Giwangan, Umbulharjo, Yogyakarta</strong>].
<br>
*[<strong>Tebet Timur Dalam, Jakarta Selatan</strong>].
<br>
*[<strong>MTS NU 15 Jurang Agung, Plantungan, Kendal, Jawa Tengah</strong>].
<br>
*[<strong>MTS AL-HIKMAH Kalikabong, Purbalingga</strong>].
<br>
*[<strong>Seberang Palinggam, Padang</strong>].
<br>
*[<strong>SMKN 1 Sukadana, Lampung Timur</strong>].
<br>
*[<strong>SMK Erna Dumai, Riau</strong>].
<br>
*[<strong>SMAN 1 Sooko, Mojokerto, Jawa Timur</strong>].
<br>
*[<strong>SMAN1PSB.COM, Kalimantan Timur</strong>].
<br>
*[<strong>SMAN 1 MATAULI PANDAN, Tapanuli Tengah, Sumatera Utara</strong>].
<br>
*[<strong>SMP IT UmmulQuro, Bogor</strong>].
<br>
*[<strong>SMKN Pasirian, Lumajang, Jawa Timur</strong>].
<br>
*[<strong>SMK Tanjung Priok 1, Jakarta Utara</strong>].
<br>
*[<strong>MTSN 1 Pemalang, Jawa Tengah</strong>].
<br>
*[<strong>SMK Pancasila 1 Kutoarjo, Jawa Tengah</strong>].
<br>
*[<strong>SMK Bhakti Praja 45, Batang, Jawa Tengah</strong>].
<br>
*[<strong>SMKN 02 Kendal, Jawa Tengah</strong>].
<br>
*[<strong>Panglima Sudirman, Gresik, Jawa Tengah</strong>].
<br>
*[<strong>Mahakam, Palangkaraya</strong>].
<br>
*[<strong>Sumedang, Pangkal Pinang, Bangka Belitung</strong>].
<br>
*[<strong>SMK PGRI 1 Gresik</strong>].
<br>
*[<strong>SMKN 1 Bontang, Kalimantan Timur</strong>].
<br>
*[<strong>http://www.ictgk.co.nr</strong>].
<br>
*[<strong>http://mirror.smk-karya-budi.sch.id/sisfokol/</strong>].
<br>
*[<strong>http://www.idrepo.or.id/</strong>].
<br>
*[<strong>http://kambing.ui.ac.id/</strong>].
<br>
*[<strong>http://www.rumahilmu.org/</strong>].
<br>
*[<strong>http://www.baliexoticcoffee.com/</strong>].
<br>
Dan beberapa pihak yang tidak ingin disebutkan namanya...
<br>
<br>

Thanks. Goodluck. Semoga SISFOKOL karya saya ini, bisa bermanfaat untuk sekolah dan masyarakat. Amin.
<br>
<br>

<strong>
<font color="red">
Bravo
</font>
<font color="blue">
Freedom Software
</font>
<font color="red">
based
</font>
<font color="green">Open Source</font>.
</strong>
<br>
<br>

Salam,
<br>
<br>
<strong>Agus Muhajir,S.Kom</strong>
<br>
Linux BIASAWAE and SISFOKOL Developer
<hr>
<br>
<br>


</td>
</tr>
</table>

<hr>
<input name="btnKLR" type="button" value="KELUAR >>" onClick="ajaxwin2.close();">
<hr>
<br>
</form>';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");


//diskonek
xclose($koneksi);
exit();
?>