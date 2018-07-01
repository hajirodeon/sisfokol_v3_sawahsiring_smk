<?php
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/////// SISFOKOL_SMK_v3.0_(sawah_siring)_FREE            ///////
/////// (Sistem Informasi Sekolah untuk SMK)             ///////
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



session_start();

//fungsi - fungsi
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/class/paging.php");
require("../../inc/cek/admgr.php");
$tpl = LoadTpl("../../template/index.html");


nocache;

//nilai
$filenya = "nilai.php";
$judul = "Nilai Raport";
$judulku = "[$guru_session : $nip1_session.$nm1_session] ==> $judul";
$juduly = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$mapelkd = nosql($_REQUEST['mapelkd']);
$s = nosql($_REQUEST['s']);
$page = nosql($_REQUEST['page']);

//page...
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&kelkd=$kelkd&".
			"keahkd=$keahkd&rukd=$rukd&mapelkd=$mapelkd&page=$page";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ke import
if ($_POST['btnIM'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$rukd = nosql($_POST['rukd']);


	//cek mapel
	if (empty($mapelkd))
		{
		//re-direct
		$pesan = "Mata Pelajaran Belum Dipilih. Harap Diperhatikan...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//re-direct
		$ke = "nilai.php?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd&s=import";
		xloc($ke);
		exit();
		}
	}





//import
if ($_POST['btnIM2'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$rukd = nosql($_POST['rukd']);
	$filex_namex = strip(strtolower($_FILES['filex_xls']['name']));

	//nek null
	if (empty($filex_namex))
		{
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd&s=import";
		pekem($pesan,$ke);
		}
	else
		{
		//deteksi .jpg
		$ext_filex = substr($filex_namex, -4);

		if ($ext_filex == ".xls")
			{
			//nilai
			$path1 = "../../filebox/excel";

			//mengkopi file
			copy($_FILES['filex_xls']['tmp_name'],"../../filebox/excel/$filex_namex");

			//re-direct
			$ke = "nilai_import.php?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd&filex_namex=$filex_namex";
			xloc($ke);
			exit();
			}
		else
			{
			//re-direct
			$pesan = "Bukan File .xls . Harap Diperhatikan...!!";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd&s=import";
			pekem($pesan,$ke);
			exit();
			}
		}
	}





//export
if ($_POST['btnEX'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$rukd = nosql($_POST['rukd']);


	//cek mapel
	if (empty($mapelkd))
		{
		//re-direct
		$pesan = "Mata Pelajaran Belum Dipilih. Harap Diperhatikan...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//require
		require('../../inc/class/excel/OLEwriter.php');
		require('../../inc/class/excel/BIFFwriter.php');
		require('../../inc/class/excel/worksheet.php');
		require('../../inc/class/excel/workbook.php');


		//mapel e...
		$qstdx = mysql_query("SELECT * FROM m_prog_pddkn ".
					"WHERE kd = '$mapelkd'");
		$rowstdx = mysql_fetch_assoc($qstdx);
		$stdx_kd = nosql($rowstdx['kd']);
		$stdx_jnskd = nosql($rowstdx['kd_jenis']);
		$stdx_pel = balikin($rowstdx['pel']);


		//nama file e...
		$i_filename = "Nilai_$stdx_pel.xls";
		$i_judul = "Nilai";


		//header file
		function HeaderingExcel($filename)
			{
			header("Content-type: application/vnd.ms-excel");
			header("Content-Disposition: attachment; filename=$filename" );
			header("Expires: 0");
			header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
			header("Pragma: public");
			}


		//bikin...
		HeaderingExcel($i_filename);
		$workbook = new Workbook("-");
		$worksheet1 =& $workbook->add_worksheet($i_judul);
		$worksheet1->set_column(0,0,5);
		$worksheet1->set_column(0,1,10);
		$worksheet1->set_column(0,2,30);
		$worksheet1->set_column(0,3,10);
		$worksheet1->set_column(0,4,10);
		$worksheet1->set_column(0,5,10);
		$worksheet1->set_column(0,6,10);
		$worksheet1->set_column(0,7,10);
		$worksheet1->set_column(0,8,10);
		$worksheet1->set_column(0,9,10);
		$worksheet1->set_column(0,10,10);
		$worksheet1->write_string(0,0,"NO.");
		$worksheet1->write_string(0,1,"NIS");
		$worksheet1->write_string(0,2,"NAMA");
		$worksheet1->write_string(0,3,"NH");
		$worksheet1->write_string(0,4,"TUGAS");
		$worksheet1->write_string(0,5,"UTS");
		$worksheet1->write_string(0,6,"UAS");
		$worksheet1->write_string(0,7,"TOTAL");
		$worksheet1->write_string(0,8,"RATA");
		$worksheet1->write_string(0,9,"PRAKTEK");
		$worksheet1->write_string(0,10,"SIKAP");



		//data
		$qdt = mysql_query("SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
					"FROM m_siswa, siswa_kelas ".
					"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
					"AND siswa_kelas.kd_tapel = '$tapelkd' ".
					"AND siswa_kelas.kd_kelas = '$kelkd' ".
					"AND siswa_kelas.kd_keahlian = '$keahkd' ".
					"AND siswa_kelas.kd_ruang = '$rukd' ".
					"ORDER BY round(m_siswa.nis) ASC");
		$rdt = mysql_fetch_assoc($qdt);

		do
		  	{
			//nilai
			$dt_nox = $dt_nox + 1;
			$dt_skkd = nosql($rdt['skkd']);
			$dt_no = nosql($rdt['no_absen']);
			$dt_nis = nosql($rdt['nis']);
			$dt_nama = balikin($rdt['nama']);

			//nil mapel
			$qxpel = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
						"WHERE kd_siswa_kelas = '$dt_skkd' ".
						"AND kd_smt = '$smtkd' ".
						"AND kd_prog_pddkn = '$mapelkd'");
			$rxpel = mysql_fetch_assoc($qxpel);
			$txpel = mysql_num_rows($qxpel);
			$xpel_nh = nosql($rxpel['nh']);
			$xpel_tugas = nosql($rxpel['tugas']);
			$xpel_uts = nosql($rxpel['uts']);
			$xpel_uas = nosql($rxpel['uas']);
			$xpel_tugas = nosql($rxpel['tugas']);
			$xpel_sikap = nosql($rxpel['sikap']);

			//total
			$xpel_total = round($sni_rata + $xpel_tugas + $xpel_uts + $xpel_uas);

			//require rumus
			require("../../inc/rumus_kognitif.php");


			//ciptakan
			$worksheet1->write_number($dt_nox,0,$dt_nox);
			$worksheet1->write_number($dt_nox,1,$dt_nis);
			$worksheet1->write_string($dt_nox,2,$dt_nama);
			$worksheet1->write_number($dt_nox,3,$xpel_nh);
			$worksheet1->write_number($dt_nox,4,$xpel_tugas);
			$worksheet1->write_number($dt_nox,5,$xpel_uts);
			$worksheet1->write_number($dt_nox,6,$xpel_uas);
			$worksheet1->write_number($dt_nox,7,$xpel_total);
			$worksheet1->write_number($dt_nox,8,$xpel_rata);
			$worksheet1->write_number($dt_nox,9,$xpel_praktek);
			$worksheet1->write_string($dt_nox,10,$xpel_sikap);
			}
		while ($rdt = mysql_fetch_assoc($qdt));


		//close
		$workbook->close();


		//diskonek
		xclose($koneksi);


		//re-direct
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd";
		$pesan = "Export Berhasil.";
		pekem($pesan,$ke);
		exit();
		}
	}





//entry nilai mapel
if ($_POST['btnSMP'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$page = nosql($_POST['page']);

	//page...
	if ((empty($page)) OR ($page == "0"))
		{
		$page = "1";
		}



	//daftar siswa
	$p = new Pager();
	$start = $p->findStart($limit);

	$sqlcount = "SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
			"FROM m_siswa, siswa_kelas ".
			"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
			"AND siswa_kelas.kd_tapel = '$tapelkd' ".
			"AND siswa_kelas.kd_kelas = '$kelkd' ".
			"AND siswa_kelas.kd_keahlian = '$keahkd' ".
			"AND siswa_kelas.kd_ruang = '$rukd' ".
			"ORDER BY round(m_siswa.nis) ASC";
	$sqlresult = $sqlcount;

	$count = mysql_num_rows(mysql_query($sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysql_fetch_array($result);


	do
		{
		//nilai
		$i_nomer = $i_nomer + 1;
		$xyz = md5("$x$i_nomer");
		$i_skkd = nosql($data['skkd']);
		$i_nis = nosql($data['nis']);
		$i_nama = balikin($data['nama']);


		//ambil nilai
		$xnh1 = "nh";
		$xnh2 = "$i_skkd$xnh1";
		$xnhx = nosql($_POST["$xnh2"]);

		$xtugas1 = "tugas";
		$xtugas2 = "$i_skkd$xtugas1";
		$xtugasx = nosql($_POST["$xtugas2"]);

		$xuts1 = "uts";
		$xuts2 = "$i_skkd$xuts1";
		$xutsx = nosql($_POST["$xuts2"]);

		$xuas1 = "uas";
		$xuas2 = "$i_skkd$xuas1";
		$xuasx = nosql($_POST["$xuas2"]);

		$xtotal_rata1 = "total_rata";
		$xtotal_rata2 = "$i_skkd$xtotal_rata1";
		$xtotal_ratax = nosql($_POST["$xtotal_rata2"]);

		$xpraktek1 = "praktek";
		$xpraktek2 = "$i_skkd$xpraktek1";
		$xpraktekx = nosql($_POST["$xpraktek2"]);

		$xsikap1 = "sikap";
		$xsikap2 = "$i_skkd$xsikap1";
		$xsikapx = nosql($_POST["$xsikap2"]);


		//nil mapel
		$qxpel = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
					"WHERE kd_siswa_kelas = '$i_skkd' ".
					"AND kd_smt = '$smtkd' ".
					"AND kd_prog_pddkn = '$mapelkd'");
		$rxpel = mysql_fetch_assoc($qxpel);
		$txpel = mysql_num_rows($qxpel);

		//total
		$xpel_total = round($sni_rata + $xpel_tugas + $xpel_uts + $xpel_uas);

		//require rumus
		require("../../inc/rumus_kognitif.php");




		//jika ada, update
		if ($txpel != 0)
			{
			mysql_query("UPDATE siswa_nilai_prog_pddkn SET nh = '$xnhx', ".
					"tugas = '$xtugasx', ".
					"uts = '$xutsx', ".
					"uas = '$xuasx', ".
					"praktek = '$xpraktekx', ".
					"sikap = '$xsikapx', ".
					"total_kognitif = '$xpel_rata' ".
					"WHERE kd_siswa_kelas = '$i_skkd' ".
					"AND kd_smt = '$smtkd' ".
					"AND kd_prog_pddkn = '$mapelkd'");
			}

		//jika blm ada, insert
		else
			{
			mysql_query("INSERT INTO siswa_nilai_prog_pddkn(kd, kd_siswa_kelas, kd_smt, kd_prog_pddkn, ".
					"nh, tugas, uts, uas, praktek, sikap, ".
					"total_kognitif) VALUES ".
					"('$xyz', '$i_skkd', '$smtkd', '$mapelkd', ".
					"'$xnhx', '$xtugasx', '$xutsx', '$xuasx', '$xpraktekx', '$xsikapx', ".
					"'$xpel_rata')");
			}
		}
	while ($data = mysql_fetch_assoc($result));




	//re-direct
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd&mapelkd=$mapelkd";
	xloc($ke);
	exit();
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////










//focus....focus...
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
require("../../inc/js/checkall.js");
require("../../inc/js/number.js");
require("../../inc/menu/admgr.php");


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$filenya.'" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>';
xheadline($judul);
echo ' [<a href="../index.php" title="Daftar Program Pendidikan">Daftar Program Pendidikan</a>]</td>
</tr>
</table>

<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Tahun Pelajaran : ';
//terpilih
$qtpx = mysql_query("SELECT * FROM m_tapel ".
			"WHERE kd = '$tapelkd'");
$rowtpx = mysql_fetch_assoc($qtpx);
$tpx_kd = nosql($rowtpx['kd']);
$tpx_thn1 = nosql($rowtpx['tahun1']);
$tpx_thn2 = nosql($rowtpx['tahun2']);

echo '<b>'.$tpx_thn1.'/'.$tpx_thn2.'</b>,

Kelas : ';
//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
			"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);
$btxkd = nosql($rowbtx['kd']);
$btxno = nosql($rowbtx['no']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<b>'.$btxkelas.'</b>,

Keahlian : ';
//terpilih
$qprgx = mysql_query("SELECT * FROM m_keahlian ".
			"WHERE kd = '$keahkd'");
$rowprgx = mysql_fetch_assoc($qprgx);
$prgx_kd = nosql($rowprgx['kd']);
$prgx_bid = balikin($rowprgx['bidang']);
$prgx_prog = balikin($rowprgx['program']);

echo '<b>'.$prgx_bid.' - '.$prgx_prog.'</b>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Ruang : ';
//terpilih
$qrux = mysql_query("SELECT * FROM m_ruang ".
			"WHERE kd = '$rukd'");
$rowrux = mysql_fetch_assoc($qrux);
$ruxkd = nosql($rowrux['kd']);
$ruxruang = balikin($rowrux['ruang']);

echo '<b>'.$ruxruang.'</b>,

Program Pendidikan : ';
//terpilih
$qstdx = mysql_query("SELECT * FROM m_prog_pddkn ".
			"WHERE kd = '$mapelkd'");
$rowstdx = mysql_fetch_assoc($qstdx);
$stdx_kd = nosql($rowstdx['kd']);
$stdx_pel = balikin($rowstdx['prog_pddkn']);

echo '<b>'.$stdx_pel.'</b>,
<br>
Semester : ';
echo "<select name=\"smt\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qstx = mysql_query("SELECT * FROM m_smt ".
			"WHERE kd = '$smtkd'");
$rowstx = mysql_fetch_assoc($qstx);
$stx_kd = nosql($rowstx['kd']);
$stx_no = nosql($rowstx['no']);
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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&mapelkd='.$mapelkd.'&smtkd='.$st_kd.'">'.$st_smt.'</option>';
	}
while ($rowst = mysql_fetch_assoc($qst));

echo '</select>

<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
<input name="rukd" type="hidden" value="'.$rukd.'">
<input name="kelkd" type="hidden" value="'.$kelkd.'">
<input name="keahkd" type="hidden" value="'.$keahkd.'">
<input name="smtkd" type="hidden" value="'.$smtkd.'">
<input name="mapelkd" type="hidden" value="'.$mapelkd.'">
<input name="btnIM" type="submit" value="IMPORT">
<input name="btnEX" type="submit" value="EXPORT">
</td>
</tr>
</table>';

//nek drg
if (empty($smtkd))
	{
	echo '<p>
	<font color="#FF0000"><strong>SEMESTER Belum Dipilih...!</strong></font>
	</p>';
	}
else
	{
	//jika import
	if ($s == "import")
		{
		echo '<p>
		Silahkan Masukkan File yang akan Di-Import :
		<br>
		<input name="filex_xls" type="file" size="30">
		<br>
		<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
		<input name="rukd" type="hidden" value="'.$rukd.'">
		<input name="kelkd" type="hidden" value="'.$kelkd.'">
		<input name="keahkd" type="hidden" value="'.$keahkd.'">
		<input name="mapelkd" type="hidden" value="'.$mapelkd.'">
		<input name="smtkd" type="hidden" value="'.$smtkd.'">
		<input name="s" type="hidden" value="'.$s.'">
		<input name="btnBTL" type="submit" value="BATAL">
		<input name="btnIM2" type="submit" value="IMPORT >>">
		</p>';
		}
	else
		{
		//daftar siswa
		$p = new Pager();
		$start = $p->findStart($limit);

		$sqlcount = "SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
				"FROM m_siswa, siswa_kelas ".
				"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
				"AND siswa_kelas.kd_tapel = '$tapelkd' ".
				"AND siswa_kelas.kd_kelas = '$kelkd' ".
				"AND siswa_kelas.kd_keahlian = '$keahkd' ".
				"AND siswa_kelas.kd_ruang = '$rukd' ".
				"ORDER BY round(m_siswa.nis) ASC";
		$sqlresult = $sqlcount;

		$count = mysql_num_rows(mysql_query($sqlcount));
		$pages = $p->findPages($count, $limit);
		$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
		$target = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd";
		$pagelist = $p->pageList($_GET['page'], $pages, $target);
		$data = mysql_fetch_array($result);


		echo '<table width="800" border="1" cellspacing="0" cellpadding="3">
		<tr bgcolor="'.$warnaheader.'">
		<td width="100"><strong>NIS</strong></td>
		<td><strong>NAMA</strong></td>
		<td width="50"><strong>NH</strong></td>
		<td width="50"><strong>TUGAS</strong></td>
		<td width="50"><strong>UTS</strong></td>
		<td width="50"><strong>UAS</strong></td>
		<td width="50"><strong>TOTAL</strong></td>
		<td width="50"><strong>PRAKTEK</strong></td>
		<td width="50"><strong>SIKAP</strong></td>
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

			//nilainya
			$i_skkd = nosql($data['skkd']);
			$i_nis = nosql($data['nis']);
			$i_nama = balikin($data['nama']);


			//nil mapel
			$qxpel = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
						"WHERE kd_siswa_kelas = '$i_skkd' ".
						"AND kd_smt = '$smtkd' ".
						"AND kd_prog_pddkn = '$mapelkd'");
			$rxpel = mysql_fetch_assoc($qxpel);
			$txpel = mysql_num_rows($qxpel);
			$xpel_nh = nosql($rxpel['nh']);
			$xpel_uts = nosql($rxpel['uts']);
			$xpel_uas = nosql($rxpel['uas']);
			$xpel_tugas = nosql($rxpel['tugas']);
			$xpel_praktek = nosql($rxpel['praktek']);
			$xpel_sikap = nosql($rxpel['sikap']);


			//total
			$xpel_total = round($sni_rata + $xpel_tugas + $xpel_uts + $xpel_uas);

			//require rumus
			require("../../inc/rumus_kognitif.php");



			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td>
			'.$i_nis.'
			</td>
			<td>
			'.$i_nama.'
			</td>
			<td>
			<input name="'.$i_skkd.'nh" type="text" value="'.$xpel_nh.'" size="2" maxlength="2" style="text-align:right" onKeyPress="return numbersonly(this, event)">
			</td>
			<td>
			<input name="'.$i_skkd.'tugas" type="text" value="'.$xpel_tugas.'" size="2" maxlength="2" style="text-align:right" onKeyPress="return numbersonly(this, event)">
			</td>
			<td>
			<input name="'.$i_skkd.'uts" type="text" value="'.$xpel_uts.'" size="2" maxlength="2" style="text-align:right" onKeyPress="return numbersonly(this, event)">
			</td>
			<td>
			<input name="'.$i_skkd.'uas" type="text" value="'.$xpel_uas.'" size="2" maxlength="2" style="text-align:right" onKeyPress="return numbersonly(this, event)">
			</td>
			<td>
			<input name="'.$i_skkd.'total_nil" type="text" value="'.$xpel_total.'" size="4" style="text-align:right" class="input" readonly>
			</td>
			<td>
			<input name="'.$i_skkd.'praktek" type="text" value="'.$xpel_praktek.'" size="2" maxlength="2" style="text-align:right" onKeyPress="return numbersonly(this, event)">
			</td>
			<td>
			<select name="'.$i_skkd.'sikap">
			<option value="'.$xpel_sikap.'" selected>'.$xpel_sikap.'</option>
			<option value="B">B</option>
			<option value="C">C</option>
			<option value="K">K</option>
			</select>
			</td>
			</tr>';
			}
		while ($data = mysql_fetch_assoc($result));


		echo '</table>
		<table width="800" border="0" cellspacing="0" cellpadding="3">
		<tr>
		<td width="300">
		<input name="page" type="hidden" value="'.$page.'">
		<input name="btnSMP" type="submit" value="SIMPAN">
		</td>
		<td align="right">
		'.$pagelist.'
		</td>
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


//diskonek
xfree($qbw);
xclose($koneksi);
exit();
?>