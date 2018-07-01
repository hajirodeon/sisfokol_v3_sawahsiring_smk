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

//ambil nilai
require("../../inc/config.php"); 
require("../../inc/fungsi.php"); 
require("../../inc/koneksi.php"); 
require("../../inc/class/paging.php"); 
require("../../inc/cek/adm.php"); 
$tpl = LoadTpl("../../template/index.html"); 

nocache;

//nilai
$filenya = "reset_pass.php";
$diload = "document.formx.akses.focus();";
$judul = "Reset Password";
$judulku = "[$adm_session] ==> $judul";
$juduli = $judul;
$tpkd = nosql($_REQUEST['tpkd']);
$tipe = cegah($_REQUEST['tipe']);







//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_POST['btnRST'])
	{
	$tpkd = nosql($_POST['tpkd']);
	$tipe = cegah($_POST['tipe']);
	$page = nosql($_POST['page']);
	if ((empty($page)) OR ($page == "0"))
		{
		$page = "1";
		}
	
	
	//nek siswa .........................................................................................................................
	if ($tpkd == "tp01")
		{
		$tapelkd = nosql($_POST['tapelkd']);
		$kelkd = nosql($_POST['kelkd']);
		$keahkd = nosql($_POST['keahkd']);
		$item = nosql($_POST['item']);
		$passbarux = md5($passbaru);
		$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&page=$page";
		
		//cek
		//nek blm dipilih
		if (empty($item))
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Reset Password Gagal. Anda Belum Memilih Siswa.";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//query
			$qsuk = mysql_query("SELECT * FROM m_siswa ".
									"WHERE kd = '$item'");
			$rsuk = mysql_fetch_assoc($qsuk);
			$suk_nis = nosql($rsuk['nis']);
			$suk_nm = balikin($rsuk['nama']);
			$pesan = "NIS : $suk_nis, Nama : $suk_nm. Password Baru : $passbaru";
					
			//reset password
			mysql_query("UPDATE m_siswa SET passwordx = '$passbarux', ".
							"postdate = '$today' ".
							"WHERE kd = '$item'");
			
			//re-direct		
			pekem($pesan,$ke);
			exit();
			}
		}
	//...................................................................................................................................
	
	


	
	//nek pegawai .......................................................................................................................
	else if ($tpkd == "tp02")
		{
		$item = nosql($_POST['item']);
		$passbarux = md5($passbaru);
		$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&page=$page";
				
		//cek
		//nek null
		if (empty($item))
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Reset Password Gagal. Anda Belum Memilih Guru.";
			pekem($pesan,$ke);
			exit();
			}
		else
			{		
			//query
			$qsuk = mysql_query("SELECT * FROM m_pegawai ".
									"WHERE kd = '$item'");
			$rsuk = mysql_fetch_assoc($qsuk);
			$suk_nip = nosql($rsuk['nip']);
			$suk_nm = balikin($rsuk['nama']);
			$pesan = "NIP : $suk_nip, Nama : $suk_nm. Password Baru : $passbaru";
					
			//reset password
			mysql_query("UPDATE m_pegawai SET passwordx = '$passbarux', ".
							"postdate = '$today' ".
							"WHERE kd = '$item'");
			
			//re-direct		
			pekem($pesan,$ke);	
			exit();
			}
		}
	
	
	
	
	
	//nek kepala sekolah ................................................................................................................
	else if ($tpkd == "tp03")
		{
		$pegawai = nosql($_POST['pegawai']);
		$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&page=$page";
				
		//cek
		//nek null
		if (empty($pegawai))
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Silahkan tentukan dahulu yang menjadi Kepala Sekolah...";
			pekem($pesan,$ke);
			exit();
			}
		else
			{		
			//query
			$qsuk = mysql_query("SELECT * FROM admin_ks");
			$rsuk = mysql_fetch_assoc($qsuk);
			$tsuk = mysql_num_rows($qsuk);
			
			//jika ada
			if ($tsuk != 0)
				{
				//update
				mysql_query("UPDATE admin_ks SET kd = '$x', ".
								"kd_pegawai = '$pegawai'");
				}
			else
				{
				//insert
				mysql_query("INSERT INTO admin_ks (kd, kd_pegawai) VALUES ".
								"('$x', '$pegawai')");
				}	
						
			//re-direct		
			xloc($ke);
			exit();
			}
		}
	
	
	
	
	
	//nek tata usaha ....................................................................................................................
	else if ($tpkd == "tp04")
		{
		$pegawai = nosql($_POST['pegawai']);
		$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&page=$page";
				
		//cek
		//nek null
		if (empty($pegawai))
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Silahkan tentukan dahulu yang menjadi Petugas Tata Usaha...";
			pekem($pesan,$ke);
			exit();
			}
		else
			{		
			//query
			$qsuk = mysql_query("SELECT * FROM admin_tu");
			$rsuk = mysql_fetch_assoc($qsuk);
			$tsuk = mysql_num_rows($qsuk);
			
			//jika ada
			if ($tsuk != 0)
				{
				//update
				mysql_query("UPDATE admin_tu SET kd = '$x', ".
								"kd_pegawai = '$pegawai'");
				}
			else
				{
				//insert
				mysql_query("INSERT INTO admin_tu (kd, kd_pegawai) VALUES ".
								"('$x', '$pegawai')");
				}	
						
			//re-direct		
			xloc($ke);
			exit();
			}
		}
	
	
	
	
	
	//nek pustakawan ....................................................................................................................
	else if ($tpkd == "tp05")
		{
		$pegawai = nosql($_POST['pegawai']);
		$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&page=$page";
				
		//cek
		//nek null
		if (empty($pegawai))
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Silahkan tentukan dahulu yang menjadi Petugas Pustakawan...";
			pekem($pesan,$ke);
			exit();
			}
		else
			{		
			//query
			$qsuk = mysql_query("SELECT * FROM admin_pus");
			$rsuk = mysql_fetch_assoc($qsuk);
			$tsuk = mysql_num_rows($qsuk);
			
			//jika ada
			if ($tsuk != 0)
				{
				//update
				mysql_query("UPDATE admin_pus SET kd = '$x', ".
								"kd_pegawai = '$pegawai'");
				}
			else
				{
				//insert
				mysql_query("INSERT INTO admin_pus (kd, kd_pegawai) VALUES ".
								"('$x', '$pegawai')");
				}	
						
			//re-direct		
			xloc($ke);
			exit();
			}
		}
	}
	//...................................................................................................................................
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/menu/adm.php");
xheadline($judul);

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">
<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Akses : ';
echo "<select name=\"akses\" onChange=\"MM_jumpMenu('self',this,0)\">";
echo '<option value="'.$filenya.'?tpkd='.$tpkd.'" selected>'.$tipe.'</option>
<option value="'.$filenya.'?tpkd=tp01&tipe=Siswa">Siswa</option>
<option value="'.$filenya.'?tpkd=tp02&tipe=Pegawai">Pegawai</option>
<option value="'.$filenya.'?tpkd=tp03&tipe=Kepala Sekolah">Kepala Sekolah</option>
<option value="'.$filenya.'?tpkd=tp04&tipe=Tata Usaha">Tata Usaha</option>
<option value="'.$filenya.'?tpkd=tp05&tipe=Pustakawan">Pustakawan</option>
</select>
</td>
</tr>
</table>';

//nek siswa /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($tpkd == "tp01")
	{
	//nilai
	$tapelkd = nosql($_REQUEST['tapelkd']);
	$kelkd = nosql($_REQUEST['kelkd']);
	$keahkd = nosql($_REQUEST['keahkd']);
	$page = nosql($_REQUEST['page']);
	if ((empty($page)) OR ($page == "0"))
		{
		$page = "1";
		}
	
	$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&page=$page";



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
	
	
	
	//view
	echo '<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
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
		$tp_kd = nosql($rowtp['kd']);
		$tp_thn1 = nosql($rowtp['tahun1']);
		$tp_thn2 = nosql($rowtp['tahun2']);			
		
		echo '<option value="'.$filenya.'?tpkd='.$tpkd.'&tipe='.$tipe.'&tapelkd='.$tp_kd.'">'.$tp_thn1.'/'.$tp_thn2.'</option>';
		}
	while ($rowtp = mysql_fetch_assoc($qtp));

	echo '</select>, 

	Kelas : ';
	echo "<select name=\"kelas\" onChange=\"MM_jumpMenu('self',this,0)\">";
	
	//terpilih
	$qbtx = mysql_query("SELECT * FROM m_kelas ".
							"WHERE kd = '$kelkd'");
	$rowbtx = mysql_fetch_assoc($qbtx);
	$btx_kd = nosql($rowbtx['kd']);
	$btx_kelas = nosql($rowbtx['kelas']);
	
	
	echo '<option value="'.$btx_kd.'">'.$btx_kelas.'</option>';
	
	$qbt = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd <> '$kelkd' ".
						"ORDER BY no ASC");
	$rowbt = mysql_fetch_assoc($qbt);
					
	do
		{
		$bt_kd = nosql($rowbt['kd']);
		$bt_kelas = nosql($rowbt['kelas']);	
		
		echo '<option value="'.$filenya.'?tpkd='.$tpkd.'&tipe='.$tipe.'&tapelkd='.$tapelkd.'&kelkd='.$bt_kd.'">'.$bt_kelas.'</option>';
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
		
		echo '<option value="'.$filenya.'?tpkd='.$tpkd.'&tipe='.$tipe.'&tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$prg_kd.'">'.$prg_bid.' - '.$prg_prog.'</option>';
		}
	while ($rowprg = mysql_fetch_assoc($qprg));

	echo '</select>
	</td>
	</tr>
	</table>
	<br>';
	
	
	//nek blm dipilih
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
	else
		{
		//data ne....
		$p = new Pager();
		$start = $p->findStart($limit);
	
		$sqlcount = "SELECT m_siswa.*, m_siswa.kd AS mskd, siswa_kelas.* ".
						"FROM m_siswa, siswa_kelas ".
						"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
						"AND siswa_kelas.kd_tapel = '$tapelkd' ".
						"AND siswa_kelas.kd_kelas = '$kelkd' ".
						"AND siswa_kelas.kd_keahlian = '$keahkd' ".
						"ORDER BY round(m_siswa.nis) ASC";
		$sqlresult = $sqlcount;
				
		$count = mysql_num_rows(mysql_query($sqlcount));
		$pages = $p->findPages($count, $limit);
		$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
		$target = $ke;
		$pagelist = $p->pageList($_GET['page'], $pages, $target);
		$data = mysql_fetch_array($result);
	
		echo '<table width="500" border="1" cellpadding="3" cellspacing="0">
	    <tr bgcolor="'.$warnaheader.'">
		<td width="1">&nbsp;</td>
		<td width="50" valign="top"><strong>NIS</strong></td>
		<td valign="top"><strong>Nama</strong></td>
		<td width="150" valign="top"><strong>Postdate</strong></td>
	    </tr>';
		
		if ($count != 0)
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
				
				$kd = nosql($data['mskd']);
				$kd_kelas = nosql($data['kd_kelas']);
				$nis = nosql($data['nis']);
				$nama = balikin($data['nama']);
				$postdate = $data['postdate'];
				
				//nek null
				if ($postdate == "0000-00-00 00:00:00")
					{
					$postdate = "-";
					}
				
				echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
				echo '<td><input name="kd'.$nomer.'" type="hidden" value="'.$kd.'">
				<input type="radio" name="item" value="'.$kd.'">
				</td>
				<td valign="top">
				'.$nis.'
				</td>
				<td valign="top">
				'.$nama.'
				</td>
				<td valign="top">
				'.$postdate.'
				</td>
				</tr>';
		  		}
			while ($data = mysql_fetch_assoc($result));
			}
		
		echo '</table>
		<table width="500" border="0" cellspacing="0" cellpadding="3">
	    <tr>
		<td width="100">
		<input name="btnRST" type="submit" value="RESET">
		<input name="jml" type="hidden" value="'.$limit.'">
		<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
		<input name="kelkd" type="hidden" value="'.$kelkd.'">
		<input name="keahkd" type="hidden" value="'.$keahkd.'">
		<input name="tpkd" type="hidden" value="'.$tpkd.'">
		<input name="tipe" type="hidden" value="'.$tipe.'">
		<input name="page" type="hidden" value="'.$page.'">
		<input name="total" type="hidden" value="'.$count.'">
		</td>
		<td align="right"><font color="#FF0000"><strong>'.$count.'</strong></font> Data '.$pagelist.'</td>
	    </tr>
		</table>
		<br>
		<br>';
		}
	}





//nek pegawai ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if ($tpkd == "tp02")
	{
	//nilai
	$page = nosql($_REQUEST['page']);
	if ((empty($page)) OR ($page == "0"))
		{
		$page = "1";
		}
	
	$ke = "$filenya?tpkd=$tpkd&tipe=$tipe&page=$page";
	
	
	//data ne....
	$p = new Pager();
	$start = $p->findStart($limit);
	
	$sqlcount = "SELECT *  FROM m_pegawai ".
					"ORDER BY round(nip) ASC";
	$sqlresult = $sqlcount;
				
	$count = mysql_num_rows(mysql_query($sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
	$target = $ke;
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysql_fetch_array($result);
	
	echo '<br>
	<table width="500" border="1" cellpadding="3" cellspacing="0">
    <tr bgcolor="'.$warnaheader.'">
	<td width="1">&nbsp;</td>
	<td width="100" valign="top"><strong>NIP</strong></td>
	<td valign="top"><strong>Nama</strong></td>
	<td width="150" valign="top"><strong>Postdate</strong></td>
    </tr>';
		
	if ($count != 0)
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
			
			//nilai
			$dt_kd = nosql($data['kd']);
			$dt_nip = nosql($data['nip']);
			$dt_nama = balikin($data['nama']);
			$dt_postdate = $data['postdate'];
			
			//nek null
			if ($dt_postdate == "0000-00-00 00:00:00")
				{
				$dt_postdate = "-";
				}
			
				
			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td><input name="kd'.$nomer.'" type="hidden" value="'.$dt_kd.'">
			<input type="radio" name="item" value="'.$dt_kd.'">
			</td>
			<td valign="top">
			'.$dt_nip.'
			</td>
			<td valign="top">
			'.$dt_nama.'
			</td>
			<td valign="top">
			'.$dt_postdate.'
			</td>
			</tr>';
	  		}
		while ($data = mysql_fetch_assoc($result));
		}
		
	echo '</table>
	<table width="500" border="0" cellspacing="0" cellpadding="3">
    <tr>
	<td width="100">
	<input name="btnRST" type="submit" value="RESET">
	<input name="jml" type="hidden" value="'.$limit.'">
	<input name="kd" type="hidden" value="'.$dt_kd.'">
	<input name="tpkd" type="hidden" value="'.$tpkd.'">
	<input name="tipe" type="hidden" value="'.$tipe.'">
	<input name="page" type="hidden" value="'.$page.'">
	<input name="total" type="hidden" value="'.$count.'">
	</td>
	<td align="right"><font color="#FF0000"><strong>'.$count.'</strong></font> Data '.$pagelist.'</td>
    </tr>
	</table>
	<br>
	<br>';
	}




//nek kepala sekolah ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if ($tpkd == "tp03")
	{
	//terpilih
	$qpgdx = mysql_query("SELECT m_pegawai.*, m_pegawai.kd AS mpkd, admin_ks.* ".
							"FROM m_pegawai, admin_ks ".
							"WHERE admin_ks.kd_pegawai = m_pegawai.kd");
	$rpgdx = mysql_fetch_assoc($qpgdx);
	$pgdx_kd = nosql($rpgdx['mpkd']);
	$pgdx_nip = nosql($rpgdx['nip']);
	$pgdx_nama = balikin2($rpgdx['nama']);
	
	
	//view
	echo '<p>
	Pegawai : 
	<select name="pegawai">
	<option value="'.$pgdx_kd.'" selected>'.$pgdx_nip.'. '.$pgdx_nama.'</option>';

	$qpgd = mysql_query("SELECT * FROM m_pegawai ".
							"ORDER BY round(nip) ASC");
	$rpgd = mysql_fetch_assoc($qpgd);
					
	do
		{
		$pgd_kd = nosql($rpgd['kd']);
		$pgd_nip = nosql($rpgd['nip']);
		$pgd_nama = balikin2($rpgd['nama']);
		
		echo '<option value="'.$pgd_kd.'">'.$pgd_nip.'. '.$pgd_nama.'</option>';
		}
	while ($rpgd = mysql_fetch_assoc($qpgd));

	echo '</select>
	<br>
	<input name="tpkd" type="hidden" value="'.$tpkd.'">
	<input name="tipe" type="hidden" value="'.$tipe.'">
	<input name="btnRST" type="submit" value="SIMPAN">
	</p>
	<br><br>';
	}






//nek tata usaha ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if ($tpkd == "tp04")
	{
	//terpilih
	$qpgdx = mysql_query("SELECT m_pegawai.*, m_pegawai.kd AS mpkd, admin_tu.* ".
							"FROM m_pegawai, admin_tu ".
							"WHERE admin_tu.kd_pegawai = m_pegawai.kd");
	$rpgdx = mysql_fetch_assoc($qpgdx);
	$pgdx_kd = nosql($rpgdx['mpkd']);
	$pgdx_nip = nosql($rpgdx['nip']);
	$pgdx_nama = balikin2($rpgdx['nama']);
	
	
	//view
	echo '<p>
	Pegawai : 
	<select name="pegawai">
	<option value="'.$pgdx_kd.'" selected>'.$pgdx_nip.'. '.$pgdx_nama.'</option>';

	$qpgd = mysql_query("SELECT * FROM m_pegawai ".
							"ORDER BY round(nip) ASC");
	$rpgd = mysql_fetch_assoc($qpgd);
					
	do
		{
		$pgd_kd = nosql($rpgd['kd']);
		$pgd_nip = nosql($rpgd['nip']);
		$pgd_nama = balikin2($rpgd['nama']);
		
		echo '<option value="'.$pgd_kd.'">'.$pgd_nip.'. '.$pgd_nama.'</option>';
		}
	while ($rpgd = mysql_fetch_assoc($qpgd));

	echo '</select>
	<br>
	<input name="tpkd" type="hidden" value="'.$tpkd.'">
	<input name="tipe" type="hidden" value="'.$tipe.'">
	<input name="btnRST" type="submit" value="SIMPAN">
	</p>
	<br><br>';
	}



//nek pustakawan ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
else if ($tpkd == "tp05")
	{
	//terpilih
	$qpgdx = mysql_query("SELECT m_pegawai.*, m_pegawai.kd AS mpkd, admin_pus.* ".
							"FROM m_pegawai, admin_pus ".
							"WHERE admin_pus.kd_pegawai = m_pegawai.kd");
	$rpgdx = mysql_fetch_assoc($qpgdx);
	$pgdx_kd = nosql($rpgdx['mpkd']);
	$pgdx_nip = nosql($rpgdx['nip']);
	$pgdx_nama = balikin2($rpgdx['nama']);
	
	
	//view
	echo '<p>
	Pegawai : 
	<select name="pegawai">
	<option value="'.$pgdx_kd.'" selected>'.$pgdx_nip.'. '.$pgdx_nama.'</option>';

	$qpgd = mysql_query("SELECT * FROM m_pegawai ".
							"ORDER BY round(nip) ASC");
	$rpgd = mysql_fetch_assoc($qpgd);
					
	do
		{
		$pgd_kd = nosql($rpgd['kd']);
		$pgd_nip = nosql($rpgd['nip']);
		$pgd_nama = balikin2($rpgd['nama']);
		
		echo '<option value="'.$pgd_kd.'">'.$pgd_nip.'. '.$pgd_nama.'</option>';
		}
	while ($rpgd = mysql_fetch_assoc($qpgd));

	echo '</select>
	<br>
	<input name="tpkd" type="hidden" value="'.$tpkd.'">
	<input name="tipe" type="hidden" value="'.$tipe.'">
	<input name="btnRST" type="submit" value="SIMPAN">
	</p>
	<br><br>';
	}


echo '</form>';
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