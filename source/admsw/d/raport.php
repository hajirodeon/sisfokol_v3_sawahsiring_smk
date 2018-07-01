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



session_start();

//fungsi - fungsi
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/admsw.php");
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/index.html"); 

nocache;

//nilai
$filenya = "raport.php";
$judul = "Raport";
$judulku = "[$siswa_session : $nis2_session.$nm2_session] ==> $judul";
$judulz = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$smtkd = nosql($_REQUEST['smtkd']);
$s = nosql($_REQUEST['s']);

	
$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&kelkd=$kelkd&keahkd=$keahkd&".
			"rukd=$rukd&smtkd=$smtkd";



//focus...
if (empty($smtkd))
	{
	$diload = "document.formx.smt.focus();";
	}

	




//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/menu/admsw.php");


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$filenya.'">';
xheadline($judul);
echo ' [<a href="../index.php" title="Daftar Detail">DAFTAR DETAIL</a>]

<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Tahun Pelajaran : ';
//terpilih
$qtpx = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd = '$tapelkd'");
$rowtpx = mysql_fetch_assoc($qtpx);
$tpx_thn1 = nosql($rowtpx['tahun1']);
$tpx_thn2 = nosql($rowtpx['tahun2']);


echo '<strong>'.$tpx_thn1.'/'.$tpx_thn2.'</strong>, 
Kelas : ';
//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);
$btx_kelas = nosql($rowbtx['kelas']);

echo '<strong>'.$btx_kelas.'</strong>, 
Keahlian : ';
//terpilih
$qprgx = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keahkd'");
$rowprgx = mysql_fetch_assoc($qprgx);
$prgx_kd = nosql($rowprgx['kd']);
$prgx_bid = balikin($rowprgx['bidang']);
$prgx_prog = balikin($rowprgx['program']);
$prgx_keah = "$prgx_bid - $prgx_prog";
	
	
echo '<strong>'.$prgx_keah.'</strong>, 
Ruang : ';
//terpilih
$qrugx = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd = '$rukd'");
$rowrugx = mysql_fetch_assoc($qrugx);

$rugx_kd = nosql($rowrugx['kd']);
$rugx_ru = balikin($rowrugx['ruang']);

echo '<strong>'.$rugx_ru.'</strong>
</td>
</tr>
</table>';

echo '<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Semester : ';

echo "<select name=\"smt\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qstx = mysql_query("SELECT * FROM m_smt ".
						"WHERE kd = '$smtkd'");
$rowstx = mysql_fetch_assoc($qstx);
$stx_kd = nosql($rowstx['kd']);
$stx_smt = nosql($rowstx['smt']);

echo '<option value="'.$stx_kd.'">'.$stx_smt.'</option>';

$qst = mysql_query("SELECT * FROM m_smt ".
						"WHERE kd <> '$smtkd' ".
						"ORDER BY smt ASC");
$rowst = mysql_fetch_assoc($qst);
				
do
	{
	$st_kd = nosql($rowst['kd']);
	$st_smt = nosql($rowst['smt']);
	
	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$st_kd.'">'.$st_smt.'</option>';
	}
while ($rowst = mysql_fetch_assoc($qst));

echo '</select>
</td>
</tr>
</table>';

//nek drg
if (empty($smtkd))
	{
	echo '<font color="#FF0000"><strong>SEMESTER Belum Dipilih...!</strong></font>';
	}

else
	{
	//query	  
	$qdata = mysql_query("SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
							"FROM m_siswa, siswa_kelas ".
							"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
							"AND siswa_kelas.kd_tapel = '$tapelkd' ".
							"AND siswa_kelas.kd_kelas = '$kelkd' ".
							"AND siswa_kelas.kd_keahlian = '$keahkd' ".
							"AND siswa_kelas.kd_ruang = '$rukd' ".
							"AND siswa_kelas.kd_siswa = '$kd2_session' ");
	$rdata = mysql_fetch_assoc($qdata);
	$tdata = mysql_num_rows($qdata);
	$skkd = nosql($rdata['skkd']);
	
	echo '[<a href="raport_pdf.php?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&skkd='.$skkd.'" target="_blank" title="Lihat Raport..."><img src="'.$sumber.'/img/pdf.gif" width="16" height="16" border="0"></a>]';
	}

echo '</form>
<br>
<br>
<br>';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//isi
$isi = ob_get_contents();
ob_end_clean();

require("../../inc/niltpl.php");



//diskonek
xfree($qbw);
xclose($koneksi);
exit();
?>