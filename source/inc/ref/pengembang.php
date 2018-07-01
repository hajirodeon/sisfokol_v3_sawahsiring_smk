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
$filenya = "pengembang.php";
$judul = "Pengembang";



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
<strong>Pengembang/Penulis/Programmer/Pencipta SISFOKOL</strong>
</font>
</big>
<hr>
</p>

<p align="right">
<img src="img/author/hajir.jpg" width="222" height="420" border="5" align="left" hspace="10" vspace="10">
Pembuat produk SISFOKOL ini, bernama <strong>Agus Muhajir</strong>. Panggil saja : hajir.
<br>
Saya hanyalah seorang swasta yang telah fokus dalam pengembangan <em>project idealist</em> ini, sejak tahun 2005, disamping usaha swasta
lainnya.
</p>

<p align="right">
Mengenal dunia pemrograman internet, sejak SMU, sekitar tahun 1997. Saat itu hanyalah coba � coba, dan  terus semakin serius,
serta masih belajar secara autodidak sampai sekarang. Pemrograman yang pernah dipelajari, mulai dari ASP, CGI, Pearl, Visual Basic,
Delphi, Python, Pascal, C/C++/C#, PHP, dan lain sebagainya. Walaupun begitu, beberapa tahun terakhir lebih memilih PHP
sebagai fokus pemrograman.
</p>

<p align="right">
Pernah sekolah di : STIMIK-AKI Semarang, SMU Negeri 1 Kendal, SMP Pondok Pesantren Modern Kendal, dan SD Tegorejo 1 Pegandon Kendal.
Dan sekolah - sekolah lain, dengan gelar dan penguasaan bidang tertentu. Serta juga pernah bekerja ditempat lain (sebelum total swasta),
dan berprofesi tidak hanya dalam dunia komputer saja.
</p>

<p align="right">
Meskipun saya membuat SISFOKOL sebagai pengelolaan administrasi sekolah, pada dasarnya saya sendiri tidak pernah
menjadi guru ataupun komponen lain di sekolah. Hanya pernah jadi siswa aja. Referensi tentang sekolah saya dapatkan
dari <em>project - project</em> pembuatan program komputer (dahulu kala sebelum SISFOKOL ada). Dan dari beberapa teman dekat dan keluarga,
ditambah lagi dari tambahan ilmu yang ada di buku dan internet. Serta saran dan kritik dari para pengguna SISFOKOL.
</p>

<p align="right">
Semua kita tahu, SISFOKOL itu bersifat <strong>Free</strong>, dalam arti <strong>Freedom</strong>, dan tidak hanya bersifat <strong>Gratis</strong>
saja tapi <strong>bebas</strong>, serta akan selamanya bersifat <strong>OpenSource</strong>.
Walaupun begitu, sebenarnya tetap ada layanan komersial demi kelangsungan <em>idealist</em> ini.
Layanan komersial ini mulai dari : Paket CD Donasi, Kastumisasi, sampai dengan Pelatihan ataupun Workshop dan Seminar.
</p>

<p align="right">
Mungkin sekian dulu aja, profil saya. Jika ada hal lain yang perlu ditanyakan lagi, baik tentang diri saya ini
ataupun berkaitan dengan SISFOKOL, bisa anda hubungi ke :
<br>

<strong>URL : </strong>
<br>
<em>http://sisfokol.wordpress.com</em>
<br>
<br>

<strong>E-Mail : </strong>
<br>
<em>hajirodeon@yahoo.com, hajirodeon@gmail.com</em>
<br>
<br>

<strong>HP/SMS : </strong>
<br>
081-829-88-54.
<br>
<br>

<strong>Small Office Home Office/SOHO/OmahBIASAWAE and SISFOKOL : </strong>
<br>
<em>Utara Rel KA - Tegorejo - Pegandon - Kendal - Jawa Tengah.</em>
</p>

<br>
<br>
<br>
<br>
<br>
<p align="right">
Salam,
<br>
<br>
<strong>Agus Muhajir, S.Kom</strong>
<br>
[<em>SISFOKOL Developer</em>].
</p>

<hr>
<input name="btnKLR" type="button" value="KELUAR >>" onClick="ajaxwin4.close();">
<hr>
<br>
</td>
</tr>
</table>
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