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
require("../../inc/class/paging2.php");
$tpl = LoadTpl("../../template/index.html"); 

nocache;

//nilai
$filenya = "tmp_keah.php";
$judul = "Penempatan per Keahlian";
$judulku = "[$tu_session : $nip5_session. $nm5_session] ==> $judul";
$judulx = $judul;
$s = nosql($_REQUEST['s']);
$brgkd = nosql($_REQUEST['brgkd']);
$keakd = nosql($_REQUEST['keakd']);
$page = nosql($_REQUEST['page']);
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

//focus
$diload = "document.formx.keahlian.focus();";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//jika tambah
if ($_POST['btnTBH'])
	{
	$brgkd = nosql($_POST['brg']);
	$keakd = nosql($_POST['keakd']);
	$jml = nosql($_POST['jml']);
	$page = nosql($_POST['page']);
	
	
	//nek null
	if ((empty($brgkd)) OR (empty($jml)))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		$ke = "$filenya?keakd=$keakd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{ 
		///cek
		$qcc = mysql_query("SELECT * FROM inv_brg_keahlian ".
								"WHERE kd_brg = '$brgkd' ".
								"AND kd_keahlian = '$keakd'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);
		$cc_jml = nosql($rcc['jml']);
		
		
		//jml. yang telah dipakai
		$qtok = mysql_query("SELECT SUM(jml) AS pake FROM inv_brg_keahlian ".
								"WHERE kd_brg = '$brgkd'");
		$rtok = mysql_fetch_assoc($qtok);
		$ttok = mysql_num_rows($qtok);
		$tok_jml = nosql($rtok['pake']);
		
		
		//jml. total
		$qsto = mysql_query("SELECT * FROM inv_stock ".
								"WHERE kd_brg = '$brgkd'");
		$rsto = mysql_fetch_assoc($qsto);
		$tsto = mysql_num_rows($qsto);
		$sto_jml = nosql($rsto['jml']);
		
		
		//jml. sisa
		$t_sisa = round($sto_jml - $tok_jml);
		
		
		
		//jika sisa tidak mencukupi. . .
		if ($t_sisa < $jml)
			{
			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//auto-kembali
			$pesan = "Jumlah Barang Tidak Mencukupi. Harap Diperhatikan...!!";
			$ke = "$filenya?keakd=$keakd&page=$page";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//nek ada, update aja
			if ($tcc != 0)
				{
				//query
				mysql_query("UPDATE inv_brg_keahlian SET jml = jml + '$jml' ".
								"WHERE kd_brg = '$brgkd' ".
								"AND kd_keahlian = '$keakd'");		
		
				//diskonek
				xfree($qbw);
				xclose($koneksi);
	
				//re-direct
				$ke = "$filenya?keakd=$keakd";
				xloc($ke);
				exit();	
				}
			else
				{
				//query
				mysql_query("INSERT INTO inv_brg_keahlian(kd, kd_keahlian, kd_brg, jml) VALUES ".
								"('$x', '$keakd', '$brgkd', '$jml')");		
		
				//diskonek
				xfree($qbw);
				xclose($koneksi);
	
				//re-direct
				$ke = "$filenya?keakd=$keakd";
				xloc($ke);
				exit();
				}
			}
		}	
	}





//jika hapus
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$page = nosql($_POST['page']);
	$keakd = nosql($_POST['keakd']);
	
		
	//query
	$p = new Pager();
	$start = $p->findStart($limit);
	
	$sqlcount = "SELECT inv_brg.*, inv_brg_keahlian.* ".
					"FROM inv_brg, inv_brg_keahlian ".
					"WHERE inv_brg_keahlian.kd_brg = inv_brg.kd ".
					"AND inv_brg_keahlian.kd_keahlian = '$keakd' ".
					"ORDER BY inv_brg.kode ASC";
	$sqlresult = $sqlcount;
				
	$count = mysql_num_rows(mysql_query($sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysql_fetch_array($result);

	//ambil semua
	do
		{
		//nilai
		$i = $i + 1;
		$yuk = "item";
		$yuhu = "$yuk$i";
		$xkd = nosql($_POST["$yuhu"]);
	
		//del 
		mysql_query("DELETE FROM inv_brg_keahlian ".
						"WHERE kd_keahlian = '$keakd' ".
						"AND kd = '$xkd'");		
		}
	while ($data = mysql_fetch_assoc($result));

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$ke = "$filenya?keakd=$keakd&page=$page";
	xloc($ke);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();


//js
require("../../inc/js/swap.js"); 
require("../../inc/js/checkall.js");
require("../../inc/js/jumpmenu.js");
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
	
	echo '<option value="'.$filenya.'?keakd='.$kea_kd.'">'.$kea_bid.' - '.$kea_pro.'</option>';
	}
while ($rowkea = mysql_fetch_assoc($qkea));

echo '</select>
</td>
</tr>
</table>';

//jika null
if (empty($keakd))
	{
	echo '<p>
	<font color="red"><strong>Keahlian Belum Dipilih...!!.</strong></font>
	</p>';
	}
else
	{
	//item barang
	$qtem = mysql_query("SELECT * FROM inv_brg ".
							"ORDER BY kode ASC");
	$rtem = mysql_fetch_assoc($qtem);
	$ttem = mysql_num_rows($qtem);
				
	echo '<p>
	<select name="brg">
	<option value="" selected>-Item Barang-</option>';
	
	do
		{
		//nilai
		$tem_kd = nosql($rtem['kd']);
		$tem_kode = nosql($rtem['kode']);
		$tem_nama = balikin2($rtem['nama']);
			
		
		//jml. yang telah dipakai
		$qtok = mysql_query("SELECT SUM(jml) AS pake FROM inv_brg_keahlian ".
								"WHERE kd_brg = '$tem_kd'");
		$rtok = mysql_fetch_assoc($qtok);
		$ttok = mysql_num_rows($qtok);
		$tok_jml = nosql($rtok['pake']);
		
		
		//jml. total
		$qsto = mysql_query("SELECT * FROM inv_stock ".
								"WHERE kd_brg = '$tem_kd'");
		$rsto = mysql_fetch_assoc($qsto);
		$tsto = mysql_num_rows($qsto);
		$sto_jml = nosql($rsto['jml']);
		
		
		//jml. sisa
		$t_sisa = round($sto_jml - $tok_jml);
				
		echo '<option value="'.$tem_kd.'">'.$tem_kode.'. '.$tem_nama.' (Sisa : '.$t_sisa.')</option>';
		}
	while ($rtem = mysql_fetch_assoc($qtem));	
	
	echo '</select>, 
	Jumlah : 
	<input name="jml" type="text" value="" size="5" maxlength="5">
	<input name="btnTBH" type="submit" value="TAMBAH >>">
	</p>';
	
	
	
	
	//query
	$p = new Pager();
	$start = $p->findStart($limit);
		
	$sqlcount = "SELECT inv_brg.*, inv_brg_keahlian.*, inv_brg_keahlian.kd AS ikd ".
					"FROM inv_brg, inv_brg_keahlian ".
					"WHERE inv_brg_keahlian.kd_brg = inv_brg.kd ".
					"AND inv_brg_keahlian.kd_keahlian = '$keakd' ".
					"ORDER BY inv_brg.kode ASC";
	$sqlresult = $sqlcount;
					
	$count = mysql_num_rows(mysql_query($sqlcount));
	$pages = $p->findPages($count, $limit);
	$result = mysql_query("$sqlresult LIMIT ".$start.", ".$limit);
	$target = "$filenya?keakd=$keakd";
	$pagelist = $p->pageList($_GET['page'], $pages, $target);
	$data = mysql_fetch_array($result);
	
	
	if ($count != 0)
		{
		echo '<p>
		<table width="600" border="1" cellspacing="0" cellpadding="3">
		<tr valign="top" bgcolor="'.$warnaheader.'">
		<td width="1%">&nbsp;</td>
		<td width="50"><strong><font color="'.$warnatext.'">Kode</font></strong></td>
		<td><strong><font color="'.$warnatext.'">Nama</font></strong></td>
		<td><strong><font color="'.$warnatext.'">Jumlah</font></strong></td>
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
			$i_kd = nosql($data['ikd']);
			$i_kode = nosql($data['kode']);
			$i_nama = balikin2($data['nama']);
			$i_jml = nosql($data['jml']);
				
			//nek null
			if (empty($i_jml))
				{
				$i_jml = "0";
				}
	
			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td> 
			<input type="checkbox" name="item'.$nomer.'" value="'.$i_kd.'"> 
	        </td>	
			<td>'.$i_kode.'</td>
			<td>'.$i_nama.'</td>
			<td>'.$i_jml.'</td>
			</tr>';				
			} 
		while ($data = mysql_fetch_assoc($result)); 
			
		echo '</table>
		<table width="600" border="0" cellspacing="0" cellpadding="3">
		<tr> 
		<td width="300">
		<input name="page" type="hidden" value="'.$page.'"> 
		<input name="keakd" type="hidden" value="'.$keakd.'"> 
		<input name="btnALL" type="button" value="SEMUA" onClick="checkAll('.$limit.')"> 
		<input name="btnBTL" type="reset" value="BATAL"> 
		<input name="btnHPS" type="submit" value="HAPUS"> 
		</td>
		<td align="right">Total : <strong><font color="#FF0000">'.$count.'</font></strong> Data. '.$pagelist.'</td>
		</tr>
		</table>
		</p>';
		}
	
	else
		{
		echo '<font color="red"><strong>TIDAK ADA DATA.</strong></font>';
		}
	}


echo '</td>
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