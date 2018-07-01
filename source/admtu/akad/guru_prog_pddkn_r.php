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
$filenya = "guru_prog_pddkn_r.php";
$judul = "Guru Program Pendidikan per Ruang";
$judulku = "[$tu_session : $nip5_session.$nm5_session] ==> $judul";
$judulx = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$keakd = nosql($_REQUEST['keakd']);
$kelkd = nosql($_REQUEST['kelkd']);
$rukd = nosql($_REQUEST['rukd']);
$jnskd = nosql($_REQUEST['jnskd']);
$s = nosql($_REQUEST['s']);
$ke = "$filenya?tapelkd=$tapelkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd&jnskd=$jnskd";



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
else if (empty($rukd))
	{
	$diload = "document.formx.ruang.focus();";
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
	if ((empty($pelkd)) OR (empty($gurkd)))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//cek
		$qc = mysql_query("SELECT m_guru_prog_pddkn.*, m_guru.*, m_pegawai.* ".
							"FROM m_guru_prog_pddkn, m_guru, m_pegawai ".
							"WHERE m_guru_prog_pddkn.kd_guru = m_guru.kd ".
							"AND m_guru.kd_pegawai = m_pegawai.kd ".
							"AND m_guru_prog_pddkn.kd_ruang = '$rukd' ".
							"AND m_guru_prog_pddkn.kd_prog_pddkn = '$pelkd' ".
							"AND m_guru_prog_pddkn.kd_guru = '$gurkd'");
		$rc = mysql_fetch_assoc($qc);
		$tc = mysql_num_rows($qc);
		$c_nip = nosql($rc['nip']);
		$c_nama = balikin2($rc['nama']);


		//nek ada, msg
		if ($tc != 0)
			{
			//re-direct
			$pesan = "Program Pendidikan dengan Guru : [$c_nip].$c_nama, SUDAH ADA. SILAHKAN GANTI...!";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//query
			mysql_query("INSERT INTO m_guru_prog_pddkn(kd, kd_guru, kd_ruang, kd_prog_pddkn) VALUES ".
							"('$x', '$gurkd', '$rukd', '$pelkd')");

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
	$pkd = nosql($_REQUEST['pkd']);
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

echo '</select>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
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
						"ORDER BY round(no) ASC");
$rowbt = mysql_fetch_assoc($qbt);

do
	{
	$btkd = nosql($rowbt['kd']);
	$btkelas = nosql($rowbt['kelas']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$keakd.'&kelkd='.$btkd.'">'.$btkelas.'</option>';
	}
while ($rowbt = mysql_fetch_assoc($qbt));

echo '</select>,
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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$keakd.'&kelkd='.$kelkd.'&rukd='.$ru_kd.'">'.$ru_ru.'</option>';
	}
while ($rowru = mysql_fetch_assoc($qru));

echo '</select>,

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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&keakd='.$keakd.'&kelkd='.$kelkd.'&rukd='.$rukd.'&jnskd='.$jn_kd.'">'.$jn_jns.'</option>';
	}
while ($rowjn = mysql_fetch_assoc($qjn));

echo '</select>

<input name="tapelkd" type="hidden" value="'.nosql($_REQUEST['tapelkd']).'">
<input name="keakd" type="hidden" value="'.nosql($_REQUEST['keakd']).'">
<input name="kelkd" type="hidden" value="'.nosql($_REQUEST['kelkd']).'">
<input name="rukd" type="hidden" value="'.nosql($_REQUEST['rukd']).'">


</td>
</tr>
</table>
<br>';

//nilai
$keakd = nosql($_REQUEST['keakd']);
$kelkd = nosql($_REQUEST['kelkd']);
$rukd = nosql($_REQUEST['rukd']);
$jnskd = nosql($_REQUEST['jnskd']);

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
else if (empty($rukd))
	{
	echo '<strong><font color="#FF0000">RUANG Belum Dipilih...!</font></strong>';
	}
else if (empty($jnskd))
	{
	echo '<strong><font color="#FF0000">JENIS PROGRAM PENDIDIKAN Belum Dipilih...!</font></strong>';
	}
else
	{
	echo 'TAMBAH --> <select name="pelkd">
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

	echo '</select>';


	echo '<select name="gurkd">
	<option value="" selected>-GURU-</option>';

	//daftar guru
	$qg = mysql_query("SELECT m_guru.*, m_guru.kd AS mgkd, m_pegawai.* ".
							"FROM m_guru, m_pegawai ".
							"WHERE m_guru.kd_pegawai = m_pegawai.kd ".
							"AND m_guru.kd_tapel = '$tapelkd' ".
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

	echo '</select>
	<input name="tapelkd" type="hidden" value="'.nosql($_REQUEST['tapelkd']).'">
	<input name="keakd" type="hidden" value="'.nosql($_REQUEST['keakd']).'">
	<input name="kelkd" type="hidden" value="'.nosql($_REQUEST['kelkd']).'">
	<input name="rukd" type="hidden" value="'.nosql($_REQUEST['rukd']).'">
	<input name="btnSMP" type="submit" value="SIMPAN"></p>';

	//query
	$q = mysql_query("SELECT m_prog_pddkn_kelas.*, m_prog_pddkn.*, m_prog_pddkn.kd AS mmkd ".
						"FROM m_prog_pddkn_kelas, m_prog_pddkn ".
						"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
						"AND m_prog_pddkn_kelas.kd_keahlian = '$keakd' ".
						"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
						"AND m_prog_pddkn.kd_jenis = '$jnskd' ".
						"ORDER BY round(m_prog_pddkn.no, m_prog_pddkn.no_sub) ASC");
	$row = mysql_fetch_assoc($q);
	$total = mysql_num_rows($q);

	if ($total != 0)
		{
		echo '<table width="600" border="1" cellpadding="3" cellspacing="0">
	    <tr bgcolor="'.$warnaheader.'">
		<td width="5" valign="top"><strong>No.</strong></td>
	    <td valign="top"><strong><font color="'.$warnatext.'">Nama Program Pendidikan</font></strong></td>
	    <td width="300" valign="top"><strong><font color="'.$warnatext.'">Guru</font></strong></td>
	    </tr>';

		do {
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
			$mmkd = nosql($row['mmkd']);
			$pel = balikin2($row['prog_pddkn']);

			echo "<tr bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";

			echo '<td width="17"><input name="kdx'.$nomer.'" type="hidden" value="'.$mmkd.'">'.$nomer.'. </td>
    		<td>'.$pel.'</td>
			<td>';

			//guru-nya
			$quru = mysql_query("SELECT m_pegawai.*, m_pegawai.kd AS mpkd, m_guru.*, m_guru_prog_pddkn.*, ".
									"m_guru_prog_pddkn.kd AS mgmkd ".
									"FROM m_pegawai, m_guru, m_guru_prog_pddkn ".
									"WHERE m_guru.kd_pegawai = m_pegawai.kd ".
									"AND m_guru_prog_pddkn.kd_guru = m_guru.kd ".
									"AND m_guru.kd_tapel = '$tapelkd' ".
									"AND m_guru.kd_keahlian = '$keakd' ".
									"AND m_guru.kd_kelas = '$kelkd' ".
									"AND m_guru_prog_pddkn.kd_ruang = '$rukd' ".
									"AND m_guru_prog_pddkn.kd_prog_pddkn = '$mmkd'");
			$ruru = mysql_fetch_assoc($quru);


			do
				{
				$gkd = nosql($ruru['mgmkd']);
				$mpkd = nosql($ruru['mpkd']);
				$gnam = balikin2($ruru['nama']);

				//nek null
				if (empty($gkd))
					{
					echo "-";
					}
				else
					{
					echo '<strong>*</strong> '.$gnam.'
					[<a href="'.$ke.'&s=hapus&pkd='.$mmkd.'&gkd='.$gkd.'" title="HAPUS --> '.$gnam.'"><img src="'.$sumber.'/img/delete.gif" width="16" height="16" border="0"></a>]. <br>';
					}
				}
			while ($ruru = mysql_fetch_assoc($quru));


			echo '</td>
    		</tr>';
			}
		while ($row = mysql_fetch_assoc($q));

		echo '</table>
		<table width="600" border="0" cellspacing="0" cellpadding="3">
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