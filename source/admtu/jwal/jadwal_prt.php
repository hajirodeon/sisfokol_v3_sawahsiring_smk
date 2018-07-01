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




//ambil nilai
require("../../inc/config.php"); 
require("../../inc/fungsi.php"); 
require("../../inc/koneksi.php");   
$tpl = LoadTpl("../../template/print.html"); 



nocache;

//nilai
$filenya = "jadwal_prt.php";
$judul = "Jadwal Pelajaran";
$judulku = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keakd = nosql($_REQUEST['keakd']);
$rukd = nosql($_REQUEST['rukd']);
$s = nosql($_REQUEST['s']);



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//re-direct print...
$ke = "pel.php?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
$diload = "window.print();location.href='$ke'";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();



//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
xheadline($judul);

echo '<table width="1000" bgcolor="'.$warnaover.'" cellspacing="0" cellpadding="3">
<tr valign="top">
<td>
Tahun Pelajaran : ';

//terpilih
$qtpx = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd = '$tapelkd'");
$rowtpx = mysql_fetch_assoc($qtpx);
$tpx_kd = nosql($rowtpx['kd']);
$tpx_thn1 = nosql($rowtpx['tahun1']);
$tpx_thn2 = nosql($rowtpx['tahun2']);

echo '<strong>'.$tpx_thn1.'/'.$tpx_thn2.'</strong>, 

Semester : ';
//terpilih
$qsmtx = mysql_query("SELECT * FROM m_smt ".
						"WHERE kd = '$smtkd'");
$rowsmtx = mysql_fetch_assoc($qsmtx);
$smtx_kd = nosql($rowsmtx['kd']);
$smtx_smt = nosql($rowsmtx['smt']);

echo '<strong>'.$smtx_smt.'</strong>, 

Kelas : ';
//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);

$btxkd = nosql($rowbtx['kd']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<strong>'.$btxkelas.'</strong>, 

Keahlian : ';
//terpilih
$qprgx = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keakd'");
$rowprgx = mysql_fetch_assoc($qprgx);
$prgx_kd = nosql($rowprgx['kd']);
$prgx_bid = balikin($rowprgx['bidang']);
$prgx_prog = balikin($rowprgx['program']);

echo '<strong>'.$prgx_bid.' - '.$prgx_prog.'</strong>, 

Ruang : ';
//terpilih
$qrux = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd = '$rukd'");
$rowrux = mysql_fetch_assoc($qrux);

$rux_kd = nosql($rowrux['kd']);
$rux_ru = balikin($rowrux['ruang']);

echo '<strong>'.$rux_ru.'</strong>
</td>
</tr>
</table>
<br>

<table width="1000" border="1" cellspacing="0" cellpadding="3">
<tr valign="top" bgcolor="'.$warnaheader.'">
<td>&nbsp;</td>';
	
//hari
$qhri = mysql_query("SELECT * FROM m_hari ".
						"ORDER BY round(no) ASC");
$rhri = mysql_fetch_assoc($qhri);
	
do
	{
	$hri_kd = nosql($rhri['kd']);
	$hri_hr = balikin($rhri['hari']);
			
	echo '<td width="16%" valign="top"><strong>'.$hri_hr.'</strong></td>';
	}
while ($rhri = mysql_fetch_assoc($qhri));
	
echo '</tr>';
	
	
//jam
$qjm = mysql_query("SELECT * FROM m_jam ".
						"ORDER BY round(jam) ASC");
$rjm = mysql_fetch_assoc($qjm);

do
	{
	//nilai
	if ($warna_set ==0)
		{
		$warna = $warna01;	
		$warna_set = 1;
		}	
	else
		{
		$warna = $warna02;
		$warna_set = 0;
		}
				
	$jm_kd = nosql($rjm['kd']);
	$jm_jam = nosql($rjm['jam']);
	
		
	//hari
	$qhri = mysql_query("SELECT * FROM m_hari ".
							"ORDER BY round(no) ASC");
	$rhri = mysql_fetch_assoc($qhri);
		
		
	echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
	echo '<td valign="top"><strong>'.$jm_jam.'.</strong></td>';
			
	do
		{
		$hri_kd = nosql($rhri['kd']);
		$hri_hr = balikin($rhri['hari']);
				
				
		//datane...
		$qdte = mysql_query("SELECT jadwal.*, jadwal.kd AS jdkd, m_guru.*, ".
								"m_pegawai.*, m_prog_pddkn.*, m_guru_prog_pddkn.* ".
								"FROM jadwal, m_guru, m_pegawai, m_prog_pddkn, m_guru_prog_pddkn ".
								"WHERE jadwal.kd_guru_prog_pddkn = m_guru_prog_pddkn.kd ".
								"AND m_guru_prog_pddkn.kd_prog_pddkn = m_prog_pddkn.kd ".
								"AND m_guru_prog_pddkn.kd_guru = m_guru.kd ".
								"AND m_guru.kd_pegawai = m_pegawai.kd ".							
								"AND jadwal.kd_tapel = '$tapelkd' ".
								"AND jadwal.kd_smt = '$smtkd' ".
								"AND jadwal.kd_kelas = '$kelkd' ".
								"AND jadwal.kd_keahlian = '$keakd' ".
								"AND jadwal.kd_ruang = '$rukd' ".
								"AND jadwal.kd_jam = '$jm_kd' ".
								"AND jadwal.kd_hari = '$hri_kd'");
		$rdte = mysql_fetch_assoc($qdte);
		$tdte = mysql_num_rows($qdte);
		$dte_kd = nosql($rdte['jdkd']);
		$dte_nip = nosql($rdte['nip']);
		$dte_nm = balikin($rdte['nama']);
		$dte_pel = balikin($rdte['xpel']);
			
		//nek ada
		if ($tdte != 0)
			{
			echo '<td width="160" valign="top">
			<strong>'.$dte_pel.'</strong>
			<br>
			<em>'.$dte_nip.'. '.$dte_nm.'.</em>
			</td>';
			}
		else
			{
			echo '<td width="160" valign="top">-</td>';
			}				
		}
	while ($rhri = mysql_fetch_assoc($qhri));
	
	echo '</tr>';
	}
while ($rjm = mysql_fetch_assoc($qjm));
	
echo '</table>
</form>
<br>
<br>
<br>';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//isi
$isi = ob_get_contents();
ob_end_clean();


require("../../inc/niltpl.php");


//diskonek
xclose($koneksi);
exit();
?>