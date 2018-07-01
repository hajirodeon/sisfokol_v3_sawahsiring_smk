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
require("../../inc/cek/admwk.php");
$tpl = LoadTpl("../../template/index.html"); 


nocache;

//nilai
$filenya = "nilai.php";
$swkd = nosql($_REQUEST['swkd']);
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$mapelkd = nosql($_REQUEST['mapelkd']);
$s = nosql($_REQUEST['s']);


$ke = "$filenya?swkd=$swkd&tapelkd=$tapelkd&smtkd=$smtkd&kelkd=$kelkd&".
			"keahkd=$keahkd&rukd=$rukd&mapelkd=$mapelkd";


			
//siswa ne
$qsiw = mysql_query("SELECT siswa_kelas.*, siswa_kelas.kd AS skkd, m_siswa.* ".
						"FROM siswa_kelas, m_siswa ".
						"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
						"AND siswa_kelas.kd_tapel = '$tapelkd' ".
						"AND siswa_kelas.kd_keahlian = '$keahkd' ".
						"AND siswa_kelas.kd_kelas = '$kelkd' ".
						"AND siswa_kelas.kd_ruang = '$rukd' ".
						"AND m_siswa.kd = '$swkd'");
$rsiw = mysql_fetch_assoc($qsiw);
$siw_nis = nosql($rsiw['nis']);
$siw_nama = balikin($rsiw['nama']);
$skkd = nosql($rsiw['skkd']);


//judul
$judul = "Nilai Siswa : ($siw_nis).$siw_nama";
$judulku = "[$wk_session : $nip3_session.$nm3_session] ==> $judul";
$juduly = $judul;


//focus
if (empty($smtkd))
	{
	$diload = "document.formx.smt.focus();";
	}
else if (empty($mapelkd))
	{
	$diload = "document.formx.mapel.focus();";
	}



//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/menu/admwk.php");


//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$filenya.'">
<table>
<tr>
<td>';
xheadline($judul);
echo '</td>
<td>
[<a href="detail.php?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'" title="Daftar Siswa">Daftar Siswa</a>]
</td>
</table>';

//tapel
$qpel = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd = '$tapelkd'");
$rpel = mysql_fetch_assoc($qpel);
$pel_thn1 = nosql($rpel['tahun1']);
$pel_thn2 = nosql($rpel['tahun2']);

//kelas
$qkel = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rkel = mysql_fetch_assoc($qkel);
$kel_kelas = nosql($rkel['kelas']);

//keahlian
$qpro = mysql_query("SELECT * FROM m_keahlian ".
						"WHERE kd = '$keahkd'");				
$rpro = mysql_fetch_assoc($qpro);
$pro_bidang = balikin($rpro['bidang']);
$pro_program = balikin($rpro['program']);
$pro_keah = "$pro_bidang - $pro_program";



//ruang
$qru = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd = '$rukd'");
$rru = mysql_fetch_assoc($qru);
$ru_ruang = balikin($rru['ruang']);



echo '<table bgcolor="'.$warnaover.'" width="100%" cellspacing="0" cellpadding="3">
<tr valign="top">
<td>
<strong>Tahun Pelajaran :</strong> '.$pel_thn1.'/'.$pel_thn2.', 
<strong>Kelas :</strong> '.$kel_kelas.',
<strong>Keahlian :</strong> '.$pro_keah.',
<strong>Ruang :</strong> '.$ru_ruang.'
</td>
</tr>
</table>


<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
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
	$st_kd = nosql($rowst["kd"]);
	$st_smt = nosql($rowst["smt"]);
	
	echo '<option value="'.$filenya.'?swkd='.$swkd.'&tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$st_kd.'">'.$st_smt.'</option>';
	}
while ($rowst = mysql_fetch_assoc($qst));

echo '</select>, 
Program Pendidikan : ';
echo "<select name=\"mapel\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qstdx = mysql_query("SELECT m_prog_pddkn.*, m_prog_pddkn.kd AS mpkd, ".
						"m_prog_pddkn_jns.* ".
						"FROM m_prog_pddkn, m_prog_pddkn_jns ".
						"WHERE m_prog_pddkn.kd_jenis = m_prog_pddkn_jns.kd ".
						"AND m_prog_pddkn.kd = '$mapelkd'");
$rowstdx = mysql_fetch_assoc($qstdx);
$stdx_kd = nosql($rowstdx['kd']);
$stdx_pel = balikin($rowstdx['prog_pddkn']);
$stdx_jenis = balikin($rowstdx['jenis']);

echo '<option value="'.$stdx_kd.'">'.$stdx_jenis.' --> '.$stdx_pel.'</option>';


//daftar
$qstd = mysql_query("SELECT m_prog_pddkn.*, m_prog_pddkn.kd AS mpkd, m_prog_pddkn_kelas.*, ".
						"m_prog_pddkn_jns.* ".
						"FROM m_prog_pddkn, m_prog_pddkn_kelas, m_prog_pddkn_jns ".
						"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
						"AND m_prog_pddkn.kd_jenis = m_prog_pddkn_jns.kd ".
						"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
						"AND m_prog_pddkn_kelas.kd_keahlian = '$keahkd' ".
						"AND m_prog_pddkn_kelas.kd <> '$mapelkd' ".
						"ORDER BY round(m_prog_pddkn.no) ASC, ".
						"round(m_prog_pddkn.no_sub) ASC");
$rowstd = mysql_fetch_assoc($qstd);
				
do
	{
	$std_kd = nosql($rowstd['mpkd']);
	$std_pel = balikin2($rowstd['prog_pddkn']);
	$std_jns = balikin2($rowstd['jenis']);
	
	echo '<option value="'.$filenya.'?swkd='.$swkd.'&tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&mapelkd='.$std_kd.'">'.$std_jns.' --> '.$std_pel.'</option>';
	}
while ($rowstd = mysql_fetch_assoc($qstd));

echo '</select>
</td>
</tr>
</table>
<br>';


//nek drg
if (empty($smtkd))
	{
	echo '<font color="#FF0000"><strong>SEMESTER Belum Dipilih...!</strong></font>';
	}

else if (empty($mapelkd))
	{
	echo '<font color="#FF0000"><strong>PROGRAM PENDIDIKAN Belum Dipilih...!</strong></font>';
	}

else
	{
	echo '<table width="100%" border="1" cellspacing="0" cellpadding="3">
	<tr bgcolor="'.$warnaheader.'">';
	//looping jml. NH
	for ($i=1;$i<=$jml_nh;$i++)
		{
		//nilai
		$nh = "NH";
		$xnh = "$nh$i";
			
		echo '<td><strong>'.$xnh.'</strong></td>';
		
		//looping jml. NR Remidi
		for ($j=1;$j<=$jml_nr;$j++)
			{
			//nilai
			$nr = "NR";
			$xnr = "$i$nr$j";
				
			echo '<td><strong>'.$xnr.'</strong></td>';
			}
		}
		
	echo '</tr>';
	echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			
	//looping jml. NH
	for ($i=1;$i<=$jml_nh;$i++)
		{
		//nilai
		$nh = "NH";
		$xnh = "$nh$i";
		$xnh2 = "$nh$i";
			
		//query
		$qnil = mysql_query("SELECT * FROM siswa_nh ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".										
								"AND kd_prog_pddkn = '$mapelkd' ".
								"AND left(nilkd,3) = '$xnh2'");
		$rnil = mysql_fetch_assoc($qnil);
		$tnil = mysql_num_rows($qnil);
		$nil_nh = nosql($rnil['nilai']);
					
				
				
		//penentuan rata - rata /////////////////////////////////////////////////////////////////////////////////////////////////
	   	$nhxre = "NH$i";
		$nrxrei = $i;
		$nrxrej = "NR";
		$nrxre = "$i$nrxrej";
	  
  	  	//nh
	  	$qre = mysql_query("SELECT MAX(nilai) AS d ".
								"FROM siswa_nh ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$mapelkd' ".
								"AND left(nilkd,3) = '$nhxre'");
		$rre = mysql_fetch_assoc($qre);
	  
		//remidi
		$qre2 = mysql_query("SELECT MAX(nilai) AS d2 ".
								"FROM siswa_nh ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$mapelkd' ".
								"AND left(nilkd,3) = '$nrxre'");
	  	$rre2 = mysql_fetch_assoc($qre2);
	  
		//nilai  
		$xre = $rre['d'];
		$xre2 = $rre2['d2'];
	  
		//nek - nek....
		if ($xre2 > $xre)
			{
			$yre = round($xre2);
	
			//nek one
			if (strlen($yre) == 1)
				{
				$nil = "0$yre";
				}
			else
				{
				$nil = $yre;
				}
			}
		else 
			{
			$yre = round($xre);

			//nek one
			if (strlen($yre) == 1)
				{
				$nil = "0$yre";
				}
			else
				{
				$nil = $yre;
				}
			}



		//cek
		$qcc = mysql_query("SELECT * FROM siswa_nh_rata ".
								"WHERE kd_smt = '$smtkd' ".			
								"AND kd_prog_pddkn = '$mapelkd' ".
								"AND kd_siswa_kelas = '$skkd' ".
								"AND left(nilkd,3) = '$nhxre'");	
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);
		
	
		if ($tcc != 0) //update
			{
			mysql_query("UPDATE siswa_nh_rata SET nilai = '$nil' ".
							"WHERE kd_smt = '$smtkd' ".
							"AND kd_prog_pddkn = '$mapelkd' ".
							"AND kd_siswa_kelas = '$skkd' ".
							"AND left(nilkd,3) = '$nhxre'"); 
			}
		else 
			{
			//insert-kan
			$xy = md5("$x$i");
			mysql_query("INSERT INTO siswa_nh_rata(kd, kd_siswa_kelas, kd_smt, ".
							"kd_prog_pddkn, nilkd, nilai) VALUES ".
							"('$xy', '$skkd', '$smtkd', ".
							"'$mapelkd', '$nhxre', '$nil')");
			}  	
			//penentuan rata - rata /////////////////////////////////////////////////////////////////////////////////////////////////
					
						
							
		echo '<td>
		'.$nil_nh.'
		</td>';
			
		//looping jml. NR Remidi
		for ($j=1;$j<=$jml_nr;$j++)
			{
			//nilai
			$nr = "NR";
			$xnr = "$i$nr$j";
			$xnr2 = "$i$nr$j";
				
			//query
			$qnil2 = mysql_query("SELECT * FROM siswa_nh ".
									"WHERE kd_siswa_kelas = '$skkd' ".
									"AND kd_smt = '$smtkd' ".										
									"AND kd_prog_pddkn = '$mapelkd' ".
									"AND left(nilkd,4) = '$xnr2'");
			$rnil2 = mysql_fetch_assoc($qnil2);
			$tnil2 = mysql_num_rows($qnil2);
			$nil2_nr = nosql($rnil2['nilai']);
		
			echo '<td>
			'.$nil2_nr.'
			</td>';
			}
		}
		
	echo '</tr>
	</table>
	<br>';
	
	//nilainya
	$qxpel = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_prog_pddkn = '$mapelkd'");
	$rxpel = mysql_fetch_assoc($qxpel);
	$txpel = mysql_num_rows($qxpel);
	$xpel_tugas = nosql($rxpel['tugas']);
	$xpel_uts = nosql($rxpel['uts']);
	$xpel_uas = nosql($rxpel['uas']);
	$xpel_praktek = nosql($rxpel['praktek']);
	$xpel_sikap = nosql($rxpel['sikap']);
		
	//rata - rata NH
	$qsni = mysql_query("SELECT AVG(nilai) AS rata ".
							"FROM siswa_nh_rata ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_prog_pddkn = '$mapelkd'");
	$rsni = mysql_fetch_assoc($qsni);
	$tsni = mysql_num_rows($qsni);
	$sni_rata = round(nosql($rsni['rata']));
		
		
	//total
	$xpel_total = round($sni_rata + $xpel_tugas + $xpel_uts + $xpel_uas);
	
	//require rumus
	require("../../inc/rumus_kognitif.php");
		
	

	echo 'Rata2 NH : <strong>'.$sni_rata.'</strong>, 
		
	Tugas : <strong>'.$xpel_tugas.'</strong>,
		
	UTS : <strong>'.$xpel_uts.'</strong>,
		
	UAS : <strong>'.$xpel_uas.'</strong>, 
	
	Total Nilai : <strong>'.$xpel_total.'</strong>, 
		
	Total Rata2 : <strong>'.$xpel_rata.'</strong>
	</p>
		
	<p>
	<strong>Nilai Praktek / Psikomotorik :</strong>
	<br>
	<strong>'.$xpel_praktek.'</strong>
	</p>
		
	<p>
	<strong>Nilai Sikap / Afektif :</strong>
	<br>
	<strong>'.$xpel_sikap.'</strong>
	</p>';
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