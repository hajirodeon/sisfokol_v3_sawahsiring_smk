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




session_start();

//fungsi - fungsi
require("../../inc/config.php");
require("../../inc/fungsi.php");
require("../../inc/koneksi.php");
require("../../inc/cek/admgr.php");
$tpl = LoadTpl("../../template/index.html");


nocache;

//nilai
$filenya = "nilai_import.php";
$judul = "Import Nilai";
$judulku = "[$guru_session : $nip1_session.$nm1_session] ==> $judul";
$juduly = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$mapelkd = nosql($_REQUEST['mapelkd']);
$rukd = nosql($_REQUEST['rukd']);




//PROSES //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//fungsi baca file excel
function parseExcel($excel_file_name_with_path)
	{
	$data = new Spreadsheet_Excel_Reader();
	$data->setOutputEncoding('CP1251');
	$data->read($excel_file_name_with_path);

	$colname=array('NO','NIS','NAMA','NH','TUGAS','UTS','UAS','TOTAL','RATA','PRAKTEK','SIKAP', );

	for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++)
		{
		for ($j = 1; $j <= $data->sheets[0]['numCols']; $j++)
			{
			$product[$i-1][$j-1]=$data->sheets[0]['cells'][$i][$j];
			$product[$i-1][$colname[$j-1]]=$data->sheets[0]['cells'][$i][$j];
			}
		}

	return $product;
	}





//batal
if ($_POST['btnBTL'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$rukd = nosql($_POST['rukd']);
	$filex_namex = $_POST['filex_namex'];


	//hapus file
	$path1 = "../../filebox/excel/$filex_namex";
	unlink ($path1);

	//re-direct
	$ke = "nilai.php?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&mapelkd=$mapelkd&rukd=$rukd&smtkd=$smtkd";
	xloc($ke);
	exit();
	}





//import sekarang
if ($_POST['btnIMx'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$mapelkd = nosql($_POST['mapelkd']);
	$rukd = nosql($_POST['rukd']);
	$filex_namex = $_POST['filex_namex'];

	//nek null
	if (empty($filex_namex))
		{
		//null-kan
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "nilai.php?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&mapelkd=$mapelkd&rukd=$rukd&smtkd=$smtkd&s=import";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//deteksi .jpg
		$ext_filex = substr($filex_namex, -4);

		if ($ext_filex == ".xls")
			{
			//nilai
			$path1 = "../../filebox/excel";

			//file-nya...
			$uploadfile = "$path1/$filex_namex";

			//require
			require_once '../../inc/class/excel/excel.php';

			$prod=parseExcel($uploadfile);
			$cprod = count($prod);
			for($i=1;$i<$cprod;$i++)
				{
				$i_xyz = md5("$x$i");
				$i_no = addslashes($prod[$i][NO]);
				$i_nis = addslashes($prod[$i][NIS]);
				$i_nama = addslashes($prod[$i][NAMA]);
				$i_nh = addslashes($prod[$i][NH]);
				$i_tugas = addslashes($prod[$i][TUGAS]);
				$i_uts = addslashes($prod[$i][UTS]);
				$i_uas = addslashes($prod[$i][UAS]);
				$i_total = addslashes($prod[$i][TOTAL]);
				$i_rata = addslashes($prod[$i][RATA]);
				$i_praktek = addslashes($prod[$i][PRAKTEK]);
				$i_sikap = addslashes($prod[$i][SIKAP]);

				//ke mysql
				$qcc = mysql_query("SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
							"FROM m_siswa, siswa_kelas ".
							"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
							"AND siswa_kelas.kd_tapel = '$tapelkd' ".
							"AND siswa_kelas.kd_kelas = '$kelkd' ".
							"AND siswa_kelas.kd_keahlian = '$keahkd' ".
							"AND siswa_kelas.kd_ruang = '$rukd' ".
							"AND m_siswa.nis = '$i_nis'");
				$rcc = mysql_fetch_assoc($qcc);
				$tcc = mysql_num_rows($qcc);
				$cc_skkd = nosql($rcc['skkd']);

				//jika ada
				if ($tcc != 0)
					{
					//entry...
					$qcc1 = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
								"WHERE kd_siswa_kelas = '$cc_skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$mapelkd'");
					$rcc1 = mysql_fetch_assoc($qcc1);
					$tcc1 = mysql_num_rows($qcc1);


					//jika ada, update
					if ($tcc1 != 0)
						{
						mysql_query("UPDATE siswa_nilai_prog_pddkn SET nh = '$i_nh', ".
								"tugas = '$i_tugas', ".
								"uts = '$i_uts', ".
								"uas = '$i_uas', ".
								"praktek = '$i_praktek', ".
								"sikap = '$i_sikap', ".
								"total_kognitif = '$i_rata' ".
								"WHERE kd_siswa_kelas = '$cc_skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$mapelkd'");
						}

					//jika blm ada, insert
					else
						{
						mysql_query("INSERT INTO siswa_nilai_prog_pddkn(kd, kd_siswa_kelas, kd_smt, kd_prog_pddkn, ".
								"nh, tugas, uts, uas, praktek, sikap, ".
								"total_kognitif) VALUES ".
								"('$i_xyz', '$cc_skkd', '$smtkd', '$mapelkd', ".
								"'$i_nh', '$i_tugas', '$i_uts', '$i_uas', '$i_praktek', '$i_sikap', ".
								"'$i_rata')");
						}
					}
				}


			//hapus file, jika telah import
			$path1 = "../../filebox/excel/$filex_namex";
			unlink ($path1);

			//null-kan
			xclose($koneksi);

			//re-direct
			$ke = "nilai.php?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&mapelkd=$mapelkd&rukd=$rukd&smtkd=$smtkd";
			xloc($ke);
			exit();
			}
		else
			{
			//null-kan
			xclose($koneksi);

			//salah
			$pesan = "Bukan File .xls . Harap Diperhatikan...!!";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&mapelkd=$mapelkd&rukd=$rukd&smtkd=$smtkd&mapelkd=$mapelkd&s=import";
			pekem($pesan,$ke);
			exit();
			}
		}
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/menu/admgr.php");
xheadline($judul);


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" enctype="multipart/form-data" action="'.$filenya.'">
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

echo '<strong>'.$tpx_thn1.'/'.$tpx_thn2.'</strong>,

Kelas : ';

//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
			"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);
$btxkd = nosql($rowbtx['kd']);
$btxno = nosql($rowbtx['no']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<strong>'.$btxkelas.'</strong>,


Keahlian : ';
//terpilih
$qprgx = mysql_query("SELECT * FROM m_keahlian ".
			"WHERE kd = '$keahkd'");
$rowprgx = mysql_fetch_assoc($qprgx);
$prgx_kd = nosql($rowprgx['kd']);
$prgx_prog = balikin($rowprgx['program']);
$prgx_bid = balikin($rowprgx['bidang']);


echo '<b>'.$prgx_prog.' - '.$prgx_bid.'</b>,

Ruang : ';
//terpilih
$qrux = mysql_query("SELECT * FROM m_ruang ".
			"WHERE kd = '$rukd'");
$rowrux = mysql_fetch_assoc($qrux);
$ruxkd = nosql($rowrux['kd']);
$ruxruang = balikin($rowrux['ruang']);

echo '<strong>'.$ruxruang.'</strong>,

Semester : ';
//terpilih
$qstx = mysql_query("SELECT * FROM m_smt ".
			"WHERE kd = '$smtkd'");
$rowstx = mysql_fetch_assoc($qstx);
$stx_kd = nosql($rowstx['kd']);
$stx_no = nosql($rowstx['no']);
$stx_smt = nosql($rowstx['smt']);

echo '<strong>'.$stx_smt.'</strong>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Program Pendidikan : ';
//terpilih
$qstdx = mysql_query("SELECT * FROM m_prog_pddkn ".
			"WHERE kd = '$mapelkd'");
$rowstdx = mysql_fetch_assoc($qstdx);
$stdx_kd = nosql($rowstdx['kd']);
$stdx_pel = balikin($rowstdx['prog_pddkn']);


echo '<strong>'.$stdx_pel.'</strong>
</td>
</tr>
</table>';

$filex_namex = $_REQUEST['filex_namex'];

//nilai
$path1 = "../../filebox/excel/$filex_namex";

//file-nya...
$uploadfile = $path1;


echo '<p>
Nama File Yang di-Import : <strong>'.$filex_namex.'</strong>
<br>
<input name="filex_namex" type="hidden" value="'.$filex_namex.'">
<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
<input name="rukd" type="hidden" value="'.$rukd.'">
<input name="kelkd" type="hidden" value="'.$kelkd.'">
<input name="keahkd" type="hidden" value="'.$keahkd.'">
<input name="mapelkd" type="hidden" value="'.$mapelkd.'">
<input name="smtkd" type="hidden" value="'.$smtkd.'">
<input name="btnBTL" type="submit" value="<< BATAL">
<input name="btnIMx" type="submit" value="IMPORT Sekarang>>">
</p>
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