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
$filenya = "prog_pddkn_kelas.php";
$judul = "Program Pendidikan Per Kelas";
$judulku = "[$tu_session : $nip5_session. $nm5_session] ==> $judul";
$judulx = $judul;
$keakd = nosql($_REQUEST['keakd']);
$kelkd = nosql($_REQUEST['kelkd']);
$jnskd = nosql($_REQUEST['jnskd']);
$ke = "$filenya?keakd=$keakd&kelkd=$kelkd&jnskd=$jnskd";



//focus...
if (empty($keakd))
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
	$keakd = nosql($_POST['keakd']);
	$kelkd = nosql($_POST['kelkd']);
	$jnskd = nosql($_POST['jnskd']);
	$progdik = nosql($_POST['progdik']);

	//jika null
	if (empty($progdik))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//cek
		$qcc = mysql_query("SELECT m_prog_pddkn_kelas.*, m_prog_pddkn.* ".
								"FROM m_prog_pddkn_kelas, m_prog_pddkn ".
								"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
								"AND m_prog_pddkn_kelas.kd_keahlian = '$keakd' ".
								"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
								"AND m_prog_pddkn_kelas.kd_prog_pddkn = '$progdik'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);
		$pel = balikin2($rcc['prog_pddkn']);

		//not null
		if ($tcc != 0)
			{
			//re-direct
			$pesan = "Program Pendidikan : $pel, Sudah Ada. Silahkan Ganti Yang Lain...!!";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//query
			mysql_query("INSERT INTO m_prog_pddkn_kelas(kd, kd_keahlian, kd_kelas, kd_prog_pddkn) VALUES ".
							"('$x', '$keakd', '$kelkd', '$progdik')");

			//diskonek
			xfree($qcc);
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			xloc($ke);
			exit();
			}
		}
	}


//jika hapus
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$jml = nosql($_POST['jml']);
	$keakd = nosql($_POST['keakd']);
	$kelkd = nosql($_POST['kelkd']);
	$jnskd = nosql($_POST['jnskd']);


	//ambil semua
	for ($i=1; $i<=$jml;$i++)
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del
		mysql_query("DELETE FROM m_prog_pddkn_kelas ".
						"WHERE kd_keahlian = '$keakd' ".
						"AND kd_kelas = '$kelkd' ".
						"AND kd = '$kd'");
		}

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
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

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">
<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Keahlian : ';
echo "<select name=\"keahlian\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qbtx = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keakd'");
$rowbtx = mysql_fetch_assoc($qbtx);

$btxkd = nosql($rowbtx['kd']);
$btxbid = balikin($rowbtx['bidang']);
$btxpro = balikin($rowbtx['program']);

echo '<option value="'.$btxkd.'">'.$btxbid.' - '.$btxpro.'</option>';

//keahlian
$qbt = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd <> '$keakd' ".
						"ORDER BY bidang ASC");
$rowbt = mysql_fetch_assoc($qbt);

do
	{
	$btkd = nosql($rowbt['kd']);
	$btbid = balikin($rowbt['bidang']);
	$btpro = balikin($rowbt['program']);

	echo '<option value="'.$filenya.'?keakd='.$btkd.'">'.$btbid.' - '.$btpro.'</option>';
	}
while ($rowbt = mysql_fetch_assoc($qbt));

echo '</select>,

Kelas : ';
echo "<select name=\"kelas\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qkelx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowkelx = mysql_fetch_assoc($qkelx);

$kelx_kd = nosql($rowkelx['kd']);
$kelx_kelas = nosql($rowkelx['kelas']);

echo '<option value="'.$kelx_kd.'">'.$kelx_kelas.'</option>';

//kelas
$qkel = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd <> '$kelkd' ".
						"ORDER BY no ASC");
$rowkel = mysql_fetch_assoc($qkel);

do
	{
	$kel_kd = nosql($rowkel['kd']);
	$kel_kelas = nosql($rowkel['kelas']);

	echo '<option value="'.$filenya.'?keakd='.$keakd.'&kelkd='.$kel_kd.'">'.$kel_kelas.'</option>';
	}
while ($rowkel = mysql_fetch_assoc($qkel));

echo '</select>,

Jenis : ';
echo "<select name=\"jenis\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qjnx = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
						"WHERE kd = '$jnskd'");
$rowjnx = mysql_fetch_assoc($qjnx);

$jnx_kd = nosql($rowjnx['kd']);
$jnx_jns = balikin($rowjnx['jenis']);

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

	echo '<option value="'.$filenya.'?keakd='.$keakd.'&kelkd='.$kelkd.'&jnskd='.$jn_kd.'">'.$jn_jns.'</option>';
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
if (empty($keakd))
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
	//query
	$q = mysql_query("SELECT m_prog_pddkn_kelas.*, m_prog_pddkn_kelas.kd AS mpkd, ".
						"m_prog_pddkn.*, m_prog_pddkn.kd AS mkkd ".
						"FROM m_prog_pddkn_kelas, m_prog_pddkn ".
						"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
						"AND m_prog_pddkn_kelas.kd_keahlian = '$keakd' ".
						"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
						"AND m_prog_pddkn.kd_jenis = '$jnskd' ".
						"ORDER BY round(m_prog_pddkn.no, m_prog_pddkn.no_sub) ASC");
	$row = mysql_fetch_assoc($q);
	$total = mysql_num_rows($q);

	echo '<select name="progdik">
    <option value="" selected>-TAMBAH PROGRAM PENDIDIKAN-</option>';

	//prog_pddkn
	$qsp = mysql_query("SELECT * FROM m_prog_pddkn ".
							"WHERE kd_jenis = '$jnskd' ".
							"ORDER BY prog_pddkn ASC");
	$rowsp = mysql_fetch_assoc($qsp);

	do
		{
		$spkd = nosql($rowsp['kd']);
		$spaspek = balikin2($rowsp['prog_pddkn']);

		echo '<option value="'.$spkd.'">'.$spaspek.'</option>';
        }
	while ($rowsp = mysql_fetch_assoc($qsp));

	echo '</select>
	<input name="btnSMP" type="submit" value="&gt;&gt;&gt;">
	<table width="500" border="1" cellpadding="3" cellspacing="0">
	<tr valign="top" bgcolor="'.$warnaheader.'">
	<td>&nbsp;</td>
	<td><strong><font color="'.$warnatext.'">Nama Program Pendidikan</font></strong></td>
    </tr>';

	if ($total != 0)
		{
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
			$mkkd = nosql($row['mkkd']);
			$pel = balikin2($row['prog_pddkn']);

			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td width="20">
			<input type="checkbox" name="item'.$nomer.'" value="'.$mpkd.'">
			</td>
			<td>'.$pel.'</td>
			</tr>';
			}
		while ($row = mysql_fetch_assoc($q));
		}

	echo '</table>
	<table width="500" border="0" cellspacing="0" cellpadding="3">
	<tr>
	<td width="326">
	<input name="btnALL" type="button" value="SEMUA" onClick="checkAll('.$total.')">
	<input name="btnBTL" type="reset" value="BATAL">
	<input name="btnHPS" type="submit" value="HAPUS">
	<input name="jml" type="hidden" value="'.$total.'">
	<input name="keakd" type="hidden" value="'.$keakd.'">
	<input name="kelkd" type="hidden" value="'.$kelkd.'">
	<input name="jnskd" type="hidden" value="'.$jnskd.'">
	</td>
	<td align="right">Total : <strong><font color="#FF0000">'.$total.'</font></strong> Data.</td>
	</tr>
	</table>';
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