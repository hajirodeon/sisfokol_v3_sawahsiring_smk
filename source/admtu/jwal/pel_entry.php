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
$filenya = "pel_entry.php";
$judul = "Entry Jadwal Pelajaran";
$judulku = "[$tu_session : $nip5_session. $nm5_session] ==> $judul";
$judulx = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$keakd = nosql($_REQUEST['keakd']);
$kelkd = nosql($_REQUEST['kelkd']);
$rukd = nosql($_REQUEST['rukd']);
$kd = nosql($_REQUEST['kd']);
$s = nosql($_REQUEST['s']);


//focus
$diload = "document.formx.hari.focus();";



//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//nek batal
if ($_POST['btnBTL'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$keakd = nosql($_POST['keakd']);
	$kelkd = nosql($_POST['kelkd']);
	$rukd = nosql($_POST['rukd']);
	
	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//re-direct
	$ke = "pel.php?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
	xloc($ke);
	exit();
	}





//nek simpan
if ($_POST['btnSMP'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$keakd = nosql($_POST['keakd']);
	$kelkd = nosql($_POST['kelkd']);
	$rukd = nosql($_POST['rukd']);
	$kd = nosql($_POST['kd']);
	$hari = nosql($_POST['hari']);
	$jam = nosql($_POST['jam']);
	$pel = nosql($_POST['pel']);
	$lama = nosql($_POST['lama']);
	
	
	//nek null
	if ((empty($hari)) OR (empty($jam)) OR (empty($pel)) OR (empty($lama)))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!";
		$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//nek edit
		if ($s == "edit")
			{
			//dapatkan lama jam mengajar...			
			for($j=1;$j<=$lama;$j++)
				{
				//jika satu...
				if ($j == "1")
					{
					$ku_jam = $jam;
					}
				
				else
					{
					$ku_jam = $dd;
					}
					
				//query	
				$qkuji = mysql_query("SELECT * FROM m_jam ".
												"WHERE kd = '$jam'");
				$rkuji = mysql_fetch_assoc($qkuji);
				$tkuji = mysql_num_rows($qkuji);
				$kuji_jam = nosql($rkuji['jam']);
					
				//jenjang max penambahan
				$kuji_max = round($kuji_jam + ($j - 1));

					
				//terpilih
				$qkujix = mysql_query("SELECT * FROM m_jam ".
												"WHERE jam = '$kuji_max'");
				$rkujix = mysql_fetch_assoc($qkujix);
				$tkujix = mysql_num_rows($qkujix);
				$kujix_kd = nosql($rkujix['kd']);
					
				
				//netralkan dahulu
				mysql_query("DELETE FROM jadwal ".
									"WHERE kd_tapel = '$tapelkd' ".
									"AND kd_smt = '$smtkd' ".
									"AND kd_keahlian = '$keakd' ".
									"AND kd_kelas = '$kelkd' ".
									"AND kd_ruang = '$rukd' ".
									"AND kd = '$kd'");
						
				//query
				mysql_query("INSERT INTO jadwal(kd, kd_tapel, kd_smt, kd_keahlian, kd_kelas, ".
								"kd_ruang, kd_jam, kd_hari, kd_guru_prog_pddkn) VALUES ".
								"('$x', '$tapelkd', '$smtkd', '$keakd', '$kelkd', ".
								"'$rukd', '$kujix_kd', '$hari', '$pel')");
								
						
				//mysql_query("UPDATE jadwal SET kd_hari = '$hari', ".
				//					"kd_jam = '$kujix_kd', ".
				//					"kd_guru_prog_pddkn = '$pel' ".
				//					"AND kd_smt = '$smtkd' ".
				//					"AND kd_keahlian = '$keakd' ".
				//					"AND kd_kelas = '$kelkd' ".
				//					"AND kd_ruang = '$rukd' ".
				//					"AND kd = '$kd'");	
				}
					
			//mysql_query("UPDATE jadwal SET kd_hari = '$hari', ".
			//				"kd_jam = '$jam', ".
			//				"kd_guru_prog_pddkn = '$pel' ".
			//				"WHERE kd_tapel = '$tapelkd' ".
			//				"AND kd_smt = '$smtkd' ".
			//				"AND kd_keahlian = '$keakd' ".
			//				"AND kd_kelas = '$kelkd' ".
			//				"AND kd_ruang = '$rukd' ".
			//				"AND kd = '$kd'");				
			
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$ke = "pel.php?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
			xloc($ke);
			exit();
			}
			
		else if (empty($s)) //nek baru
			{
			//cek terisi...		
			$qcc = mysql_query("SELECT * FROM jadwal ".
									"WHERE kd_tapel = '$tapelkd' ".
									"AND kd_smt = '$smtkd' ".
									"AND kd_keahlian = '$keakd' ".
									"AND kd_kelas = '$kelkd' ".
									"AND kd_ruang = '$rukd' ".
									"AND kd_jam = '$jam' ".
									"AND kd_hari = '$hari'");					
			$rcc = mysql_fetch_assoc($qcc);
			$tcc = mysql_num_rows($qcc);
			
			
			//cek telah mengajar pada ruang kelas berbeda, pada hari, jam, dan guru sama [gak boleh tubrukan...].
			$qcc1 = mysql_query("SELECT jadwal.*, m_guru_prog_pddkn.* ".
									"FROM jadwal, m_guru_prog_pddkn ".
									"WHERE jadwal.kd_guru_prog_pddkn = m_guru_prog_pddkn.kd ".
									"AND jadwal.kd_tapel = '$tapelkd' ".
									"AND jadwal.kd_smt = '$smtkd' ".
									"AND jadwal.kd_keahlian = '$keakd' ".
									"AND jadwal.kd_kelas = '$kelkd' ".
									"AND jadwal.kd_jam = '$jam' ".
									"AND jadwal.kd_hari = '$hari'");					
			$rcc1 = mysql_fetch_assoc($qcc1);
			$tcc1 = mysql_num_rows($qcc1);
			
			
			
			
	
			//nek ada
			if ($tcc != 0)
				{
				//diskonek
				xfree($qbw);
				xclose($koneksi);

				//re-direct
				$pesan = "Jadwal Sudah Terisi. Harap Diperhatikan...!!";
				$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
				pekem($pesan,$ke);
				exit();
				}
			
			//jika tubrukan
			else if ($tcc1 != 0)
				{
				//diskonek
				xfree($qbw);
				xclose($koneksi);

				//re-direct
				$pesan = "Guru Tersebut Telah Mengajar Pada Ruang Kelas Lain. Harap Diperhatikan...!!";
				$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
				pekem($pesan,$ke);
				exit();
				}
			
			
			else	
				{
				//dapatkan lama jam mengajar...				
				for($j=1;$j<=$lama;$j++)
					{		
					//query	
					$qkuji = mysql_query("SELECT * FROM m_jam ".
													"WHERE kd = '$jam'");
					$rkuji = mysql_fetch_assoc($qkuji);
					$tkuji = mysql_num_rows($qkuji);
					$kuji_jam = nosql($rkuji['jam']);

					
					//jenjang max penambahan
					$kuji_max = round($kuji_jam + ($j - 1));

					
					//terpilih
					$qkujix = mysql_query("SELECT * FROM m_jam ".
													"WHERE jam = '$kuji_max'");
					$rkujix = mysql_fetch_assoc($qkujix);
					$tkujix = mysql_num_rows($qkujix);
					$kujix_kd = nosql($rkujix['kd']);
					
									
					//query
					mysql_query("INSERT INTO jadwal(kd, kd_tapel, kd_smt, kd_keahlian, kd_kelas, ".
									"kd_ruang, kd_jam, kd_hari, kd_guru_prog_pddkn) VALUES ".
									"('$x', '$tapelkd', '$smtkd', '$keakd', '$kelkd', ".
									"'$rukd', '$kujix_kd', '$hari', '$pel')");
					}
				
				//diskonek
				xfree($qbw);
				xclose($koneksi);

				//re-direct
				$ke = "pel.php?tapelkd=$tapelkd&smtkd=$smtkd&keakd=$keakd&kelkd=$kelkd&rukd=$rukd";
				xloc($ke);
				exit();
				}
			}
		}	
	}





//nek edit
if ($s == "edit")
	{
	//query
	$qdir = mysql_query("SELECT * FROM jadwal ".
							"WHERE kd_tapel = '$tapelkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_keahlian = '$keakd' ".
							"AND kd_kelas = '$kelkd' ".
							"AND kd_ruang = '$rukd' ".
							"AND kd = '$kd'");
	$rdir = mysql_fetch_assoc($qdir);
	$dir_harikd = nosql($rdir['kd_hari']);
	$dir_jamkd = nosql($rdir['kd_jam']);
	$dir_gmkd = nosql($rdir['kd_guru_prog_pddkn']);
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//js
require("../../inc/menu/admtu.php"); 
require("../../inc/js/number.js");
xheadline($judul);

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">
<table width="100%" bgcolor="'.$warnaover.'" cellspacing="0" cellpadding="3">
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

Keahlian : ';
//terpilih
$qkeax = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keakd'");
$rowkeax = mysql_fetch_assoc($qkeax);

$keax_kd = nosql($rowkeax['kd']);
$keax_bid = balikin($rowkeax['bidang']);
$keax_pro = balikin($rowkeax['program']);

echo '<strong>'.$keax_bid.' - '.$keax_pro.'</strong>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr valign="top">
<td>
Kelas : ';
//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);

$btxkd = nosql($rowbtx['kd']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<strong>'.$btxkelas.'</strong>,  

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

<table width="100%" border="0" cellspacing="0" cellpadding="3">
<tr valign="top">
<td>
<strong>Hari : </strong>
<br>';


//hari-terpilih
$qhrix = mysql_query("SELECT * FROM m_hari ".
						"WHERE kd = '$dir_harikd'");
$rhrix = mysql_fetch_assoc($qhrix);
$hrix_kd = nosql($rhrix['kd']);
$hrix_hr = balikin($rhrix['hari']);

echo '<select name="hari">
<option value="'.$hrix_kd.'" selected>'.$hrix_hr.'</option>';
//hari
$qhri = mysql_query("SELECT * FROM m_hari ".
						"WHERE kd <> '$hrix_kd' ".
						"ORDER BY round(no) ASC");
$rhri = mysql_fetch_assoc($qhri);

do
	{
	$hri_kd = nosql($rhri['kd']);
	$hri_hr = balikin($rhri['hari']);
		
	echo '<option value="'.$hri_kd.'">'.$hri_hr.'</option>';
	}
while ($rhri = mysql_fetch_assoc($qhri));

echo '</select>
<br><br>
<strong>Jam ke-: </strong>
<br>';


//jam-terpilih
$qjmx = mysql_query("SELECT * FROM m_jam ".
						"WHERE kd = '$dir_jamkd'");
$rjmx = mysql_fetch_assoc($qjmx);
$jmx_kd = nosql($rjmx['kd']);
$jmx_jam = nosql($rjmx['jam']);

echo '<select name="jam">
<option value="'.$jmx_kd.'" selected>'.$jmx_jam.'</option>';
//jam
$qjm = mysql_query("SELECT * FROM m_jam ".
						"WHERE kd <> '$jmx_kd' ".
						"ORDER BY round(jam) ASC");
$rjm = mysql_fetch_assoc($qjm);

do
	{
	$jm_kd = nosql($rjm['kd']);
	$jm_hr = nosql($rjm['jam']);
		
	echo '<option value="'.$jm_kd.'">'.$jm_hr.'</option>';
	}
while ($rjm = mysql_fetch_assoc($qjm));

echo '</select>
<br><br>

<strong>Lama Mengajar : </strong>
<br>
<input type="text" name="lama" value="'.$lama.'" size="2" maxlength="1" onKeyPress="return numbersonly(this, event)"> Jam
<br><br>

<strong>Program Pendidikan :</strong><br>';

//program pendidikan-terpilih
$qpelx = mysql_query("SELECT jadwal.*, m_guru.*, m_guru_prog_pddkn.*, m_guru_prog_pddkn.kd AS mmkd, ".
						"m_prog_pddkn.*, m_pegawai.* ".
						"FROM jadwal, m_guru, m_guru_prog_pddkn, m_prog_pddkn, m_pegawai ".
						"WHERE jadwal.kd_guru_prog_pddkn = m_guru_prog_pddkn.kd ".
						"AND m_guru_prog_pddkn.kd_guru = m_guru.kd ".
						"AND m_guru_prog_pddkn.kd_prog_pddkn = m_prog_pddkn.kd ".
						"AND m_guru_prog_pddkn.kd_ruang = '$rukd' ".
						"AND m_guru.kd_tapel = '$tapelkd' ".
						"AND m_guru.kd_keahlian = '$keakd' ".
						"AND m_guru.kd_kelas = '$kelkd' ".
						"AND m_guru.kd_pegawai = m_pegawai.kd ".
						"AND jadwal.kd = '$kd'");
$rpelx = mysql_fetch_assoc($qpelx);
$pelx_kd = nosql($rpelx['mmkd']);
$pelx_pel = balikin($rpelx['prog_pddkn']);
$pelx_nip = nosql($rpelx['nip']);
$pelx_nm = balikin($rpelx['nama']);

echo '<select name="pel">
<option value="'.$pelx_kd.'" selected>'.$pelx_pel.' ['.$pelx_nip.'. '.$pelx_nm.']</option>';

//mata pelajaran
$qpel = mysql_query("SELECT m_guru.*, m_guru_prog_pddkn.*, m_guru_prog_pddkn.kd AS mmkd, ".
						"m_prog_pddkn.*, m_pegawai.* ".
						"FROM m_guru, m_guru_prog_pddkn, m_prog_pddkn, m_pegawai ".
						"WHERE m_guru_prog_pddkn.kd_guru = m_guru.kd ".
						"AND m_guru_prog_pddkn.kd_prog_pddkn = m_prog_pddkn.kd ".
						"AND m_guru_prog_pddkn.kd_ruang = '$rukd' ".
						"AND m_guru.kd_tapel = '$tapelkd' ".
						"AND m_guru.kd_keahlian = '$keakd' ".
						"AND m_guru.kd_kelas = '$kelkd' ".
						"AND m_guru.kd_pegawai = m_pegawai.kd ".
						"AND m_guru_prog_pddkn.kd <> '$pelx_kd' ".
						"ORDER BY m_prog_pddkn.prog_pddkn ASC");
$rpel = mysql_fetch_assoc($qpel);

do
	{
	$pel_kd = nosql($rpel['mmkd']);
	$pel_pel = balikin($rpel['prog_pddkn']);
	$pel_nip = nosql($rpel['nip']);
	$pel_nm = balikin($rpel['nama']);
		
	echo '<option value="'.$pel_kd.'">'.$pel_pel.' ['.$pel_nip.'. '.$pel_nm.']</option>';
	}
while ($rpel = mysql_fetch_assoc($qpel));

echo '</select>

<br><br>
<input name="s" type="hidden" value="'.$s.'">
<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
<input name="smtkd" type="hidden" value="'.$smtkd.'">
<input name="keakd" type="hidden" value="'.$keakd.'">
<input name="kelkd" type="hidden" value="'.$kelkd.'">
<input name="rukd" type="hidden" value="'.$rukd.'">
<input name="kd" type="hidden" value="'.$kd.'">
<input name="btnSMP" type="submit" value="SIMPAN">
<input name="btnBTL" type="submit" value="BATAL">
</td>
</tr>
</table>
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
xfree($qbw);
xclose($koneksi);
exit();
?>