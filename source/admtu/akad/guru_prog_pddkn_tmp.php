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

require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/admtu.php");
$tpl = LoadTpl("../../template/index.html");

nocache;

//nilai
$filenya = "guru_prog_pddkn_tmp.php";
$judul = "Penempatan Guru Mengajar";
$judulku = "[$tu_session : $nip5_session.$nm5_session] ==> $judul";
$judulx = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$keakd = nosql($_REQUEST['keakd']);
$kelkd = nosql($_REQUEST['kelkd']);
$jnskd = nosql($_REQUEST['jnskd']);
$s = nosql($_REQUEST['s']);
$ke = "$filenya?tapelkd=$tapelkd&keakd=$keakd&kelkd=$kelkd&jnskd=$jnskd";




//focus...
if (empty($tapelkd))
	{
	$diload = "document.formx.tapel.focus();";
	}
else if (empty($keakd))
	{
	$diload = "document.formx.keahlian.focus();";
	}
else if (empty($kelkd))
	{
	$diload = "document.formx.kelas.focus();";
	}
else if (empty($jnskd))
	{
	$diload = "document.formx.jenis.focus();";
	}





//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$keakd = nosql($_POST['keakd']);
	$kelkd = nosql($_POST['kelkd']);
	$rukd = nosql($_POST['rukd']);
	$jnskd = nosql($_POST['jnskd']);
	$pelkd = nosql($_POST['pelkd']);
	$gurkd = nosql($_POST['gurkd']);

	//nek null
	if ((empty($pelkd)) OR (empty($gurkd)) OR (empty($rukd)))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//cek
		$qc = mysql_query("SELECT m_guru_prog_pddkn.*, m_guru.* ".
							"FROM m_guru_prog_pddkn, m_guru ".
							"WHERE m_guru_prog_pddkn.kd_guru = m_guru.kd ".
							"AND m_guru.kd_keahlian = '$keakd' ".
							"AND m_guru.kd_kelas = '$kelkd' ".
							"AND m_guru_prog_pddkn.kd_ruang = '$rukd' ".
							"AND m_guru_prog_pddkn.kd_prog_pddkn = '$pelkd' ".
							"AND m_guru_prog_pddkn.kd_guru = '$gurkd'");
		$rc = mysql_fetch_assoc($qc);
		$tc = mysql_num_rows($qc);
		$guru = balikin2($rx['nama']);

		//nek ada, msg
		if ($tc != 0)
			{
			//re-direct
			$pesan = "Guru Tersebut Telah Mengajar Program Pendidikan Tersebut. Silahkan Ganti...!";
			pekem($pesan,$ke);
			}
		else
			{
			//query
			mysql_query("INSERT INTO m_guru_prog_pddkn(kd, kd_ruang, kd_prog_pddkn, kd_guru) VALUES ".
							"('$x', '$rukd', '$pelkd', '$gurkd')");

			//re-direct
			xloc($ke);
			exit();
			}
		}
	}



//jika hapus
if ($s == "hapus")
	{
	//nilai
	$tapelkd = nosql($_REQUEST['tapelkd']);
	$keakd = nosql($_REQUEST['keakd']);
	$kelkd = nosql($_REQUEST['kelkd']);
	$rukd = nosql($_REQUEST['rukd']);
	$jnskd = nosql($_REQUEST['jnskd']);
	$pelkd = nosql($_REQUEST['pelkd']);
	$gurkd = nosql($_REQUEST['gurkd']);
	$gkd = nosql($_REQUEST['gkd']);

	//query
	mysql_query("DELETE FROM m_guru_prog_pddkn ".
					"WHERE kd = '$gkd'");

	//re-direct
	xloc($ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/checkall.js");
require("../../inc/js/swap.js");
require("../../inc/menu/admtu.php");
xheadline($judul);

//VIEW //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$ke.'">
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

Keahlian : ';
echo "<select name=\"keahlian\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qkeax = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keakd'");
$rowkeax = mysql_fetch_assoc($qkeax);

$keax_kd = nosql($rowkeax['kd']);
$keax_bid = balikin($rowkeax['bidang']);
$keax_pro = balikin($rowkeax['program']);

echo '<option value="'.$keax_kd.'">'.$keax_bid.' - '.$keax_pro.'</option>';

$qkea = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd <> '$keakd' ".
						"ORDER BY bidang ASC");
$rowkea = mysql_fetch_assoc($qkea);

do
	{
	$kea_kd = nosql($rowkea['kd']);
	$kea_bid = balikin($rowkea['bidang']);
	$kea_pro = balikin($rowkea['program']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$kea_kd.'">'.$kea_bid.' - '.$kea_pro.'</option>';
	}
while ($rowkea = mysql_fetch_assoc($qkea));

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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$keakd.'&kelkd='.$btkd.'">'.$btkelas.'</option>';
	}
while ($rowbt = mysql_fetch_assoc($qbt));

echo '</select>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Jenis Program Pendidikan : ';
echo "<select name=\"jenis\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qjnx = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
						"WHERE kd = '$jnskd'");
$rowjnx = mysql_fetch_assoc($qjnx);

$jnx_kd = nosql($rowjnx['kd']);
$jnx_jns = nosql($rowjnx['jenis']);

echo '<option value="'.$jnx_kd.'">'.$jnx_jns.'</option>';

//jenis
$qjn = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
						"WHERE kd <> '$jnskd' ".
						"ORDER BY jenis ASC");
$rowjn = mysql_fetch_assoc($qjn);

do
	{
	$jn_kd = nosql($rowjn['kd']);
	$jn_jns = balikin($rowjn['jenis']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$keakd.'&kelkd='.$kelkd.'&jnskd='.$jn_kd.'">'.$jn_jns.'</option>';
	}
while ($rowjn = mysql_fetch_assoc($qjn));

echo '</select>

<input name="keakd" type="hidden" value="'.$keakd.'">
<input name="kelkd" type="hidden" value="'.$kelkd.'">
<input name="jnskd" type="hidden" value="'.$jnskd.'">
</td>
</tr>
</table>
<br>';


//nek blm
if (empty($tapelkd))
	{
	echo '<strong><font color="#FF0000">TAHUN PELAJARAN Belum Dipilih...!</font></strong>';
	}
else if (empty($keakd))
	{
	echo '<strong><font color="#FF0000">KEAHLIAN Belum Dipilih...!</font></strong>';
	}
else if (empty($kelkd))
	{
	echo '<strong><font color="#FF0000">KELAS Belum Dipilih...!</font></strong>';
	}
else if (empty($jnskd))
	{
	echo '<strong><font color="#FF0000">JENIS PROGRAM PENDIDIKAN Belum Dipilih...!</font></strong>';
	}
else
	{
	echo 'TAMBAH --> <select name="gurkd">
	<option value="" selected>-GURU-</option>';

	//daftar guru
	$qg = mysql_query("SELECT m_guru.*, m_guru.kd AS mgkd, m_pegawai.* ".
							"FROM m_guru, m_pegawai ".
							"WHERE m_guru.kd_pegawai = m_pegawai.kd ".
							"AND m_guru.kd_keahlian = '$keakd' ".
							"AND m_guru.kd_kelas = '$kelkd' ".
							"ORDER BY round(m_pegawai.nip) ASC");
	$rg = mysql_fetch_assoc($qg);

	do
		{
		$gkd = nosql($rg['mgkd']);
		$gnip = nosql($rg['nip']);
		$gnama = balikin2($rg['nama']);

		echo '<option value="'.$gkd.'">'.$gnip.'. '.$gnama.'</option>';
		}
	while ($rg = mysql_fetch_assoc($qg));

	echo '</select>,
	<select name="pelkd">
	<option value="" selected>-PROGRAM PENDIDIKAN-</option>';
	//daftar mapel
	$qbs = mysql_query("SELECT m_prog_pddkn_kelas.*, m_prog_pddkn.*, m_prog_pddkn.kd AS mmkd ".
							"FROM m_prog_pddkn_kelas, m_prog_pddkn ".
							"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
							"AND m_prog_pddkn_kelas.kd_keahlian = '$keakd' ".
							"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
							"AND m_prog_pddkn.kd_jenis = '$jnskd' ".
							"ORDER BY round(m_prog_pddkn.no, m_prog_pddkn.no_sub) ASC");
	$rbs = mysql_fetch_assoc($qbs);

	do
		{
		$bskd = nosql($rbs['mmkd']);
		$bspel = balikin2($rbs['prog_pddkn']);

		echo '<option value="'.$bskd.'">'.$bspel.'</option>';
		}
	while ($rbs = mysql_fetch_assoc($qbs));

	echo '</select>,
	<select name="rukd">
	<option value="" selected>-RUANG-</option>';
	//ruang
	$qrua = mysql_query("SELECT * FROM m_ruang ".
							"ORDER BY ruang ASC");
	$rrua = mysql_fetch_assoc($qrua);

	do
		{
		$ruakd = nosql($rrua['kd']);
		$rua = balikin2($rrua['ruang']);

		echo '<option value="'.$ruakd.'">'.$rua.'</option>';
		}
	while ($rrua = mysql_fetch_assoc($qrua));

	echo '</select>
	<input name="keakd" type="hidden" value="'.$keakd.'">
	<input name="kelkd" type="hidden" value="'.$kelkd.'">
	<input name="jnskd" type="hidden" value="'.$jnskd.'">
	<input name="btnSMP" type="submit" value="SIMPAN"></p>';

	//query
	$q = mysql_query("SELECT m_guru.*, m_guru.kd AS mgkd, m_pegawai.*, m_pegawai.kd AS mpkd ".
						"FROM m_guru, m_pegawai ".
						"WHERE m_guru.kd_pegawai = m_pegawai.kd ".
						"AND m_guru.kd_keahlian = '$keakd' ".
						"AND m_guru.kd_kelas = '$kelkd' ".
						"ORDER BY round(m_pegawai.nip) ASC");
	$row = mysql_fetch_assoc($q);
	$total = mysql_num_rows($q);

	if ($total != 0)
		{
		echo '<table width="700" border="1" cellpadding="3" cellspacing="0">
	    <tr bgcolor="'.$warnaheader.'">
		<td width="5" valign="top"><strong>No.</strong></td>
		<td width="5" valign="top"><strong>NIP</strong></td>
	    <td valign="top"><strong><font color="'.$warnatext.'">Guru</font></strong></td>
	    <td width="300" valign="top"><strong><font color="'.$warnatext.'">Ruang - Program Pendidikan</font></strong></td>
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
			$mpkd = nosql($row['mpkd']);
			$kd = nosql($row['mgkd']);
			$nip = nosql($row['nip']);
			$nama = balikin2($row['nama']);

			//nek null
			if (empty($nip))
				{
				$nip = "-";
				}

			echo "<tr bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td valign="top">'.$nomer.'. </td>
    		<td valign="top">'.$nip.'</td>
			<td valign="top">
			'.$nama.'
			</td>
			<td valign="top">';

			//pel-nya
			$quru = mysql_query("SELECT m_guru_prog_pddkn.*, m_guru_prog_pddkn.kd AS mgkd, ".
									"m_prog_pddkn.*, m_prog_pddkn.kd AS mpkd, ".
									"m_ruang.*, m_ruang.kd AS mrkd ".
									"FROM m_guru_prog_pddkn, m_prog_pddkn, m_ruang ".
									"WHERE m_guru_prog_pddkn.kd_prog_pddkn = m_prog_pddkn.kd ".
									"AND m_guru_prog_pddkn.kd_ruang = m_ruang.kd ".
									"AND m_guru_prog_pddkn.kd_guru = '$kd' ".
									"ORDER BY m_ruang.ruang ASC");
			$ruru = mysql_fetch_assoc($quru);

			do
				{
				$gkd = nosql($ruru['mgkd']);
				$gpel = balikin2($ruru['prog_pddkn']);
				$gru = nosql($ruru['ruang']);

				//nek null
				if (empty($gkd))
					{
					echo "-";
					}
				else
					{
					echo '<strong>*</strong>('.$gru.') '.$gpel.'
					[<a href="'.$ke.'&s=hapus&gkd='.$gkd.'" title="HAPUS --> '.$gpel.'"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>]. <br>';
					}
				}
			while ($ruru = mysql_fetch_assoc($quru));


			echo '</td>
    		</tr>';
			}
		while ($row = mysql_fetch_assoc($q));

		echo '</table>
		<table width="700" border="0" cellspacing="0" cellpadding="3">
	    <tr>
	    <td align="right">Total : <strong><font color="#FF0000">'.$total.'</font></strong> Data.</td>
	    </tr>
	  	</table>';
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
?>