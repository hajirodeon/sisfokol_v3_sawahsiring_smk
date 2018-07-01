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
$filenya = "ijazah.php";
$diload = "document.formx.ijazah.focus();";
$judul = "Ijazah";
$judulku = "[$tu_session : $nip5_session. $nm5_session] ==> $judul";
$judulx = $judul;
$s = nosql($_REQUEST['s']);




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//nek batal
if ($_POST['btnBTL'])
	{
	//diskonek
	xfree($qbw);
	xclose($koneksi);
		
	//re-direct
	xloc($filenya);
	exit();
	}
	
	
	
//jika edit
if ($s == "edit")
	{
	//nilai
	$kdx = nosql($_REQUEST['kd']);
	
	//query
	$qx = mysql_query("SELECT * FROM m_ijazah ".
						"WHERE kd = '$kdx'");
	$rowx = mysql_fetch_assoc($qx);
						
	$ijazah = balikin2($rowx['ijazah']);
	}
	
	
	
//jika simpan
if ($_POST['btnSMP'])
	{
	$s = nosql($_POST['s']);
	$kd = nosql($_POST['kd']);
	$ijazah = cegah2($_POST['ijazah']);
	
	//nek null
	if (empty($ijazah))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);
		
		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{ 
		///cek
		$qcc = mysql_query("SELECT * FROM m_ijazah ".
								"WHERE ijazah = '$ijazah'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);
				
		//nek ada
		if ($tcc != 0)
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);
			
			//re-direct	
			$pesan = "Ijazah : $ijazah, Sudah Ada. Silahkan Ganti Yang Lain...!!";
			pekem($pesan,$filenya);
			exit();
			}
		else
			{
			//jika baru
			if (empty($s))
				{
				//query
				mysql_query("INSERT INTO m_ijazah(kd, ijazah) VALUES ".
								"('$x', '$ijazah')");		
				
				//diskonek
				xfree($qbw);
				xclose($koneksi);
		
				//re-direct
				xloc($filenya);
				exit();
				}
			//jika update
			else if ($s == "edit")
				{
				//query
				mysql_query("UPDATE m_ijazah SET ijazah = '$ijazah' ".
								"WHERE kd = '$kd'");		
				
				//diskonek
				xfree($qbw);
				xclose($koneksi);
		
				//re-direct
				xloc($filenya);
				exit();
				}
			}
		}	
	}


//jika hapus
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$jml = nosql($_POST['jml']);

	//ambil semua
	for ($i=1; $i<=$jml;$i++) 
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);
	
		//del
		mysql_query("DELETE FROM m_ijazah ".
						"WHERE kd = '$kd'");
		}

	//diskonek
	xfree($qbw);
	xclose($koneksi);
		
	//auto-kembali
	xloc($filenya);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();

//query
$q = mysql_query("SELECT * FROM m_ijazah ".
					"ORDER BY ijazah ASC");
$row = mysql_fetch_assoc($q);
$total = mysql_num_rows($q);

//js
require("../../inc/js/checkall.js"); 
require("../../inc/js/swap.js"); 
require("../../inc/menu/admtu.php"); 
xheadline($judul);

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">
<p> 
<input name="ijazah" type="text" value="'.$ijazah.'" size="30">
<input name="btnSMP" type="submit" value="SIMPAN">
<input name="btnBTL" type="submit" value="BATAL">
</p>';

if ($total != 0)
	{
	echo '<table width="400" border="1" cellspacing="0" cellpadding="3">
	<tr valign="top" bgcolor="'.$warnaheader.'">
	<td width="1%">&nbsp;</td>
	<td width="1%">&nbsp;</td>
	<td><strong><font color="'.$warnatext.'">Ijazah</font></strong></td>
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
		$kd = nosql($row['kd']);
		$ijazah = balikin2($row['ijazah']);
		
		echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
		echo '<td> 
		<input type="checkbox" name="item'.$nomer.'" value="'.$kd.'"> 
        </td>
		<td>
		<a href="'.$filenya.'?s=edit&kd='.$kd.'">
		<img src="'.$sumber.'/img/edit.gif" width="16" height="16" border="0">
		</a>
		</td>
		<td width="90%">'.$ijazah.'</td>
        </tr>';				
		} 
	while ($row = mysql_fetch_assoc($q)); 

	echo '</table>
	<table width="400" border="0" cellspacing="0" cellpadding="3">
	<tr> 
	<td width="263">
	<input name="jml" type="hidden" value="'.$total.'"> 
	<input name="s" type="hidden" value="'.$s.'"> 
	<input name="kd" type="hidden" value="'.$kdx.'"> 
	<input name="btnALL" type="button" value="SEMUA" onClick="checkAll('.$total.')"> 
	<input name="btnBTL" type="submit" value="BATAL"> 
	<input name="btnHPS" type="submit" value="HAPUS"> 
	</td>
	<td align="right">Total : <strong><font color="#FF0000">'.$total.'</font></strong> Data.</td>
	</tr>
	</table>';
	}
else
	{
	echo '<p>
	<font color="red">
	<strong>TIDAK ADA DATA. Silahkan Entry Dahulu...!!</strong>
	</font>
	</p>';
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