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
require("../../inc/cek/admks.php");
require("../../inc/class/paging.php");
$tpl = LoadTpl("../../template/index.html"); 


nocache;

//nilai
$filenya = "raport.php";
$judul = "Raport Siswa";
$judulku = "[$ks_session : $nip4_session.$nm4_session] ==> $judul";
$judulz = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$s = nosql($_REQUEST['s']);

$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&kelkd=$kelkd&keahkd=$keahkd&".
			"rukd=$rukd&page=$page";




//focus...
if (empty($tapelkd))
	{
	$diload = "document.formx.tapel.focus();";
	}
else if (empty($kelkd))
	{
	$diload = "document.formx.kelas.focus();";
	}
else if (empty($keahkd))
	{
	$diload = "document.formx.keahlian.focus();";
	}
else if (empty($rukd))
	{
	$diload = "document.formx.ruang.focus();";
	}
else if (empty($smtkd))
	{
	$diload = "document.formx.smt.focus();";
	}
	



//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/menu/admks.php");
xheadline($judul);


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$filenya.'">
<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Tahun Pelajaran : ';
echo "<select name=\"tapel\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qtpx = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd = '$tapelkd'");
$rowtpx = mysql_fetch_assoc($qtpx);
$tpx_kd = nosql($rowtpx['kd']);
$tpx_thn1 = nosql($rowtpx['tahun1']);
$tpx_thn2 = nosql($rowtpx['tahun2']);

echo '<option value="'.$tpx_kd.'">'.$tpx_thn1.'/'.$tpx_thn2.'</option>';

$qtp = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd <> '$tapelkd' ".
						"ORDER BY tahun1 ASC");
$rowtp = mysql_fetch_assoc($qtp);
				
do
	{
	$tpkd = nosql($rowtp['kd']);
	$tpth1 = nosql($rowtp['tahun1']);
	$tpth2 = nosql($rowtp['tahun2']);

	echo '<option value="'.$filenya.'?tapelkd='.$tpkd.'">'.$tpth1.'/'.$tpth2.'</option>';
	}
while ($rowtp = mysql_fetch_assoc($qtp));

echo '</select>, 


Kelas : ';
echo "<select name=\"kelas\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);
$btxkd = nosql($rowbtx['kd']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<option value="'.$btxkd.'">'.$btxkelas.'</option>';

$qbt = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd <> '$kelkd' ".
						"ORDER BY no ASC");
$rowbt = mysql_fetch_assoc($qbt);
				
do
	{
	$btkd = nosql($rowbt['kd']);
	$btkelas = nosql($rowbt['kelas']);
	
	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$btkd.'">'.$btkelas.'</option>';
	}
while ($rowbt = mysql_fetch_assoc($qbt));


echo '</select>, 

Keahlian : ';
echo "<select name=\"keahlian\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qprgx = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keahkd'");
$rowprgx = mysql_fetch_assoc($qprgx);
$prgx_kd = nosql($rowprgx['kd']);
$prgx_bid = balikin($rowprgx['bidang']);
$prgx_prog = balikin($rowprgx['program']);

echo '<option value="'.$prgx_kd.'">'.$prgx_bid.' - '.$prgx_prog.'</option>';

$qprg = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd <> '$keahkd' ".
						"ORDER BY bidang ASC");
$rowprg = mysql_fetch_assoc($qprg);
				
do
	{
	$prg_kd = nosql($rowprg['kd']);
	$prg_bid = balikin($rowprg['bidang']);
	$prg_prog = balikin($rowprg['program']);
	
	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$prg_kd.'">'.$prg_bid.' - '.$prg_prog.'</option>';
	}
while ($rowprg = mysql_fetch_assoc($qprg));

echo '</select>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Ruang : ';
echo "<select name=\"ruang\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qrux = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd = '$rukd'");
$rowrux = mysql_fetch_assoc($qrux);

$ruxkd = nosql($rowrux['kd']);
$ruxruang = balikin($rowrux['ruang']);

echo '<option value="'.$ruxkd.'">'.$ruxruang.'</option>';

$qru = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd <> '$rukd' ".
						"ORDER BY ruang ASC");
$rowru = mysql_fetch_assoc($qru);
				
do
	{
	$ru_kd = nosql($rowru['kd']);
	$ru_ru = balikin($rowru['ruang']);
	
	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$ru_kd.'">'.$ru_ru.'</option>';
	}
while ($rowru = mysql_fetch_assoc($qru));

echo '</select>, 

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
if (empty($tapelkd))
	{
	echo '<font color="#FF0000"><strong>TAHUN PELAJARAN Belum Dipilih...!</strong></font>';
	}

else if (empty($kelkd))
	{
	echo '<font color="#FF0000"><strong>KELAS Belum Dipilih...!</strong></font>';
	}
	
else if (empty($keahkd))
	{
	echo '<font color="#FF0000"><strong>KEAHLIAN Belum Dipilih...!</strong></font>';
	}

else if (empty($rukd))
	{
	echo '<font color="#FF0000"><strong>RUANG Belum Dipilih...!</strong></font>';
	}

else if (empty($smtkd))
	{
	echo '<font color="#FF0000"><strong>SEMESTER Belum Dipilih...!</strong></font>';
	}


else
	{
	//query	  
	$p = new Pager();
	$start = $p->findStart($limit);
	
	$sqlcount = "SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
					"FROM m_siswa, siswa_kelas ".
					"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
					"AND siswa_kelas.kd_tapel = '$tapelkd' ".
					"AND siswa_kelas.kd_kelas = '$kelkd' ".
					"AND siswa_kelas.kd_keahlian = '$keahkd' ".
					"AND siswa_kelas.kd_ruang = '$rukd' ".
					"ORDER BY round(siswa_kelas.no_absen) ASC";
	$sqlresult = $sqlcount;
				
	$count = mysql_num_rows(mysql_query($sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
	$target = $ke;
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysql_fetch_array($result);

	//nek ada
	if ($count != 0)
		{
		echo '<br>
		<table width="500" border="1" cellpadding="3" cellspacing="0">
	    <tr bgcolor="'.$warnaheader.'">
		<td width="27" align="center"><strong>No.</strong></td>
		<td width="27" align="center"><strong>NIS</strong></td>
		<td align="center"><strong>Nama Siswa</strong></td>
		<td width="27">&nbsp;</td>
	    </tr>';
	
	
		do
			{
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
	
			$nomer = $nomer + 1;
			$skkd = nosql($data['skkd']);
			$no_absen = nosql($data['no_absen']);
			$nis = nosql($data['nis']);
			$nama = balikin($data['nama']);
			
			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td align="center"><input name="SW'.$nomer.'" type="hidden" value="'.$kd.'">'.$no_absen.'</td>
			<td>'.$nis.'</td>
			<td>'.$nama.'</td>
			<td>
			[<a href="raport_pdf.php?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&skkd='.$skkd.'" target="_blank" title="Lihat Raport..."><img src="'.$sumber.'/img/pdf.gif" width="16" height="16" border="0"></a>]
			</td>
			</tr>';
	  		}
		while ($data = mysql_fetch_assoc($result));
	
		echo '</table>
		<table width="500" border="0" cellspacing="0" cellpadding="1">
	    <tr> 
		<td align="right">'.$pagelist.'</td>
	    </tr>
		</table>';
		}
	else
		{
		echo '<font color="#FF0000"><strong>TIDAK ADA DATA SISWA.</strong></font>';		
		}
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