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


//ambil nilai
require("inc/config.php");
require("inc/fungsi.php");
require("inc/koneksi.php");
$tpl = LoadTpl("template/login.html");


nocache;

//nilai
$filenya = "login.php";
$judul = $versi;
$diload = "document.formx.tipe.focus();";
$pesan = "PASSWORD SALAH. HARAP DIULANGI...!!!";
$s = nosql($_REQUEST['s']);


//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_POST['btnOK'])
	{
	//ambil nilai
	$tipe = nosql($_POST["tipe"]);
	$username = nosql($_POST["usernamex"]);
	$password = md5(nosql($_POST["passwordx"]));

	//cek null
	if ((empty($tipe)) OR (empty($username)) OR (empty($password)))
		{
		//diskonek
		xclose($koneksi);

		//re-direct
		$pesan = "Input Tidak Lengkap. Harap Diulangi...!!";
		pekem($pesan,$filenya);
		exit();
		}
	else
		{
		//jika tp01 --> GURU ................................................................................
		if ($tipe == "tp01")
			{
			//query
			$q = mysql_query("SELECT m_pegawai.*, m_pegawai.kd AS mpkd, m_guru.* ".
								"FROM m_pegawai, m_guru ".
								"WHERE m_guru.kd_pegawai = m_pegawai.kd ".
								"AND m_pegawai.usernamex = '$username' ".
								"AND m_pegawai.passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd1_session'] = nosql($row['mpkd']);
				$_SESSION['nip1_session'] = nosql($row['nip']);
				$_SESSION['nm1_session'] = balikin($row['nama']);
				$_SESSION['username1_session'] = $username;
				$_SESSION['pass1_session'] = $password;
				$_SESSION['guru_session'] = "GURU";
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "admgr/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................




		//jika tp02 --> SISWA ...............................................................................
		if ($tipe == "tp02")
			{
			//query
			$q = mysql_query("SELECT * FROM m_siswa ".
								"WHERE usernamex = '$username' ".
								"AND passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd2_session'] = nosql($row['kd']);
				$_SESSION['nis2_session'] = nosql($row['nis']);
				$_SESSION['username2_session'] = $username;
				$_SESSION['pass2_session'] = $password;
				$_SESSION['siswa_session'] = "SISWA";
				$_SESSION['nm2_session'] = balikin($row['nama']);
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "admsw/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................





		//jika tp03 --> WALI KELAS ..........................................................................
		if ($tipe == "tp03")
			{
			//query
			$q = mysql_query("SELECT m_walikelas.*, m_pegawai.*, m_pegawai.kd AS mpkd ".
								"FROM m_walikelas, m_pegawai ".
								"WHERE m_walikelas.kd_pegawai = m_pegawai.kd ".
								"AND m_pegawai.usernamex = '$username' ".
								"AND m_pegawai.passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd3_session'] = nosql($row['mpkd']);
				$_SESSION['nip3_session'] = nosql($row['nip']);
				$_SESSION['username3_session'] = $username;
				$_SESSION['pass3_session'] = $password;
				$_SESSION['wk_session'] = "WALI KELAS";
				$_SESSION['nm3_session'] = balikin($row['nama']);
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "admwk/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................





		//jika tp04 --> Kepala Sekolah ......................................................................
		if ($tipe == "tp04")
			{
			//query
			$q = mysql_query("SELECT admin_ks.*, admin_ks.kd AS akkd, m_pegawai.* ".
								"FROM admin_ks, m_pegawai ".
								"WHERE admin_ks.kd_pegawai = m_pegawai.kd ".
								"AND m_pegawai.usernamex = '$username' ".
								"AND m_pegawai.passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd4_session'] = nosql($row['akkd']);
				$_SESSION['nip4_session'] = nosql($row['nip']);
				$_SESSION['username4_session'] = $username;
				$_SESSION['pass4_session'] = $password;
				$_SESSION['ks_session'] = "Kepala Sekolah";
				$_SESSION['nm4_session'] = balikin($row['nama']);
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "admks/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................





		//jika tp05 --> Tata Usaha ..........................................................................
		if ($tipe == "tp05")
			{
			//query
			$q = mysql_query("SELECT admin_tu.*, admin_tu.kd AS atkd, m_pegawai.* ".
								"FROM admin_tu, m_pegawai ".
								"WHERE admin_tu.kd_pegawai = m_pegawai.kd ".
								"AND m_pegawai.usernamex = '$username' ".
								"AND m_pegawai.passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd5_session'] = nosql($row['atkd']);
				$_SESSION['nip5_session'] = nosql($row['nip']);
				$_SESSION['username5_session'] = $username;
				$_SESSION['pass5_session'] = $password;
				$_SESSION['tu_session'] = "Tata Usaha";
				$_SESSION['nm5_session'] = balikin($row['nama']);
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "admtu/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................





		//jika tp06 --> Administrator .......................................................................
		if ($tipe == "tp06")
			{
			//query
			$q = mysql_query("SELECT * FROM adminx ".
								"WHERE usernamex = '$username' ".
								"AND passwordx = '$password'");
			$row = mysql_fetch_assoc($q);
			$total = mysql_num_rows($q);

			//cek login
			if ($total != 0)
				{
				session_start();

				//nilai
				$_SESSION['kd6_session'] = nosql($row['kd']);
				$_SESSION['username6_session'] = $username;
				$_SESSION['pass6_session'] = $password;
				$_SESSION['adm_session'] = "Administrator";
				$_SESSION['hajirobe_session'] = $hajirobe;

				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				$ke = "adm/index.php";
				xloc($ke);
				exit();
				}
			else
				{
				//diskonek
				xfree($q);
				xclose($koneksi);

				//re-direct
				pekem($pesan, $filenya);
				exit();
				}
			}
		//...................................................................................................
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//isi *START
ob_start();

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form action="'.$filenya.'" method="post" name="formx">

<table width="990" bgcolor="'.$warnaover.'" border="0" cellspacing="5" cellpadding="0">
<tr valign="top">
<td valign="top">
<h1>
'.$sek_nama.'
</h1>
<em>
'.$sek_alamat.', '.$sek_kota.'
<br>
'.$sek_kontak.'
</em>
<br>
<br>

Tipe :
<select name="tipe">
<option value="" selected></option>
<option value="tp01">Guru</option>
<option value="tp02">Siswa</option>
<option value="tp03">Wali Kelas</option>
<option value="tp04">Kepala Sekolah</option>
<option value="tp05">Tata Usaha</option>
<option value="tp06">Administrator</option>
</select>,
Username :
<input name="usernamex" type="text" size="10" maxlength="15">,
Password :
<input name="passwordx" type="password" size="10" maxlength="15">
<br>
<input name="btnBTL" type="reset" value="BATAL">
<input name="btnOK" type="submit" value="OK &gt;&gt;&gt;">
</td>
<td width="300" valign="top">
<img src="'.$sumber.'/img/linux.gif" width="300" height="130" title="Bravo Freedom Software based Open Source...!!">
</td>
</tr>
</table>

<table width="990" bgcolor="'.$warna02.'" border="0" cellspacing="5" cellpadding="0">
<tr valign="top">
<td>
&copy;2010. <strong>{versi}</strong>
<br>
Blog :
<a href="{url}" target="_blank" title="{url}"><strong>{url}</strong></a>
<br>
<em>Dibuat Oleh :
<a href="{url}" target="_blank" onClick="openmypage4(); return false" onmouseover="showToolTip(event,\'Dibuat Oleh ; <br><strong>Agus Muhajir,S.Kom</strong>. <br>E-Mail : <br><i>hajirodeon@yahoo.com</i>\');return false" onmouseout="hideToolTip()"><font color="#FF0000">Agus Muhajir,S.Kom</font></a>.</em>
</td>
</tr>
</table>

<table width="990" border="0" cellspacing="5" cellpadding="0">
<tr valign="top">
<td>
<hr>
[<a href="#" onClick="openmypage(); return false" title="Filosofi Freedom Software dan OpenSource">Filosofi</a>]. -
[<a href="#" onClick="openmypage2(); return false" title="Daftar Donatur SISFOKOL_v3.0_code:Sawah_Siring (Free Download / Free Edition)">Donatur</a>]. -
[<a href="#" onClick="openmypage5(); return false" title="Daftar Distributor SISFOKOL_v3.0_code:Sawah_Siring (Free Download / Free Edition)">Distributor</a>]. -
[<a href="#" onClick="openmypage3(); return false" title="F.A.Q">F.A.Q</a>]. -
[<a href="#" onClick="openmypage4(); return false" title="Pengembang/Penulis/Programmer/Pencipta SISFOKOL">Pengembang</a>].
<hr>
</td>
</tr>
</table>
</form>';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//isi
$isi = ob_get_contents();
ob_end_clean();

require("inc/niltpl.php");


//diskonek
xclose($koneksi);
exit();
?>