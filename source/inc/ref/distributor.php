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
$filenya = "distributor.php";
$judul = "Distributor";



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
Berikut para Distributor yang turut serta dalam penyebaran LinuxBIASAWAE dan SISFOKOL,
</strong>
</font>
</big>
<hr>
</p>

<p>
Wilayah Kendal, Jawa Tengah :
<br>
<strong>Rifki Yusuf</strong>. posisi : BHOSS Digital Printing.
<br>
<strong>Lukman Hakim Soufian</strong>. posisi : BHOSS Digital Printing.
<br>
<strong>Agus Muhajir</strong>. posisi : BIASAWAE Production.
<br>
<strong>Candra Purnama</strong>. posisi : Nenggolo Curug Sewu, patean. SMK AYK Patean.
<br>
<strong>Suprihadi</strong>. posisi : Ringinarum. SMA Muhammadiyah 1 Weleri.
<br>
<strong>Muhamad Kurniawan</strong>. posisi : BUMI Komputer. Purin, Kendal.
<br>
</p>

<p>
Wilayah Sragen, Jawa Tengah :
<br>
<strong>Didik Setyawan </strong>. posisi : Mondokan.
<br>
</p>

<p>
<strong>Wilayah Semarang, Jawa Tengah :</strong>
<br>
<strong>M.Khosim Aminy</strong>.
<br>
<strong>Budhi Setiyawan</strong>. posisi : Banyumanik.
<br>
<strong>Hartadi Subagiyo</strong>. posisi : Pedurungan.
<br>
<strong>Julius Adi.H</strong>. posisi : Tambak Aji, Ngaliyan.
<br>
<strong>Heri Tri Luqman</strong>. posisi : Fakultas Pendidikan, UNNES.
<br>
<strong>Hasan Kamal</strong>. posisi : Wakil Cabang NU, Kec.Sayung Demak.
<br>
</p>

<p>
Wilayah Kudus, Jawa Tengah :
<br>
<strong>Mirza Aziz Qodari</strong>.
<br>
</p>

<p>
Wilayah Bali :
<br>
<strong>I Made Budi Adyana </strong>. posisi : http://toko.baliwae.com/
<br>
<strong>I Putu Agus Eka Pratama, ST</strong>. posisi : http://bytescode.wordpress.com/
<br>
</p>

<p>
Wilayah Bandung :
<br>
<strong>Reza Ervani</strong>. posisi : Rumah Ilmu Indonesia.
<br>
</p>

<p>
Wilayah Demak, Jawa Tengah :
<br>
<strong>Agus Riyanto </strong>. posisi : CLEO Team Production.
<br>
</p>

<p>
Wilayah Jakarta Utara :
<br>
<strong>Nahar Miladi Murron</strong>. posisi : Kec. Koja, Jakarta Utara (http://dikantara.sch.id/).
<br>
</p>

<p>
Wilayah Jakarta Selatan :
<br>
<strong>Henkie Prabancono</strong> (idrepo.or.id)
<br>
</p>

<p>
Wilayah Batang, Jawa Tengah :
<br>
<strong>Yvux Purbo</strong>.
<br>
</p>

<p>
Wilayah Wonosobo, Jawa Tengah :
<br>
<strong>Erika Sandy Putri</strong>.
<br>
</p>

<p>
Wilayah malang, Jawa Timur :
<br>
Toha Mustofa Nurhabib.
<br>
</p>

<p>
Wilayah Bogor :
<br>
<strong>M Randy Mandala Putra</strong>. posisi : Ds. Bantar Jaya, Kec. Rancabungur. Yayasan Muztahidin Al-Ayubi - BORCESS.
<br>
</p>

<p>
Wilayah Solo, Jawa Tengah :
<br>
<strong>Ibnu Hajar</strong>.
<br>
</p>

<p>
wilayah sulawesi :
<br>
<strong>Ibnu Hajar</strong>.
<br>
</p>

<p>
Wilayah Pekanbaru, Riau :
<br>
<strong>Harun Mukhtar</strong>. Fakultas Ilmu Komputer, Universitas Muhammadiyah Riau.
<br>
</p>

<p>
Wilayah Probolinggo :
<br>
<strong>M.Eksan</strong>.
<br>
</p>

<p>
Wilayah Kebumen, Jawa Tengah :
<br>
<strong>AGUS FAURIZAN</strong>. SMPN 1 Kutowinangun d/a Jl. Stasiun No.06 Kutowinangun, Kebumen, Jateng.
<br>
</p>

<p>
Wilayah Jakarta Selatan :
<br>
<strong>David Rahadian Osmond</strong>. Dr.Osmond IT consulting. Kebagusan 4 Komplek Sabar Ganda No.5 Pasar Minggu JakSel.
<br>
</p>

<p>
Wilayah Pekalongan, Jawa Tengah :
<br>
<strong>Wiwiek Hayyin</strong>.
<br>
</p>

<p>
Wilayah Pasar Baru, Bandung :
<br>
<strong>Yosef Brahmantyo</strong>. Toko Sircinta Pasar Baru Lantai 1 blok E1-17-19 Bandung.
<br>
</p>

<p>
<strong>Abdul Latif,SSi</strong>. Jl Mandirejo No 69 Merakurak Tuban.
<br>
</p>

<p>
<strong>Zaenudin</strong>. Majalengka, Jawa Barat.
<br>
</p>

<p>
<strong>W. Karseno</strong>. Jl. Srigunting Gg. Bangau Utara No. 4 Randugunting Tegal 52131.
<br>
</p>


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
<input name="btnKLR" type="button" value="KELUAR >>" onClick="ajaxwin5.close();">
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