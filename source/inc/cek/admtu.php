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



///cek session //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$kd5_session = nosql($_SESSION['kd5_session']);
$nip5_session = nosql($_SESSION['nip5_session']);
$nm5_session = balikin2($_SESSION['nm5_session']);
$username5_session = nosql($_SESSION['username5_session']);
$tu_session = nosql($_SESSION['tu_session']);
$pass5_session = nosql($_SESSION['pass5_session']);
$hajirobe_session = nosql($_SESSION['hajirobe_session']);

$qbw = mysql_query("SELECT admin_tu.*, m_pegawai.* ".
						"FROM admin_tu, m_pegawai ".
						"WHERE admin_tu.kd_pegawai = m_pegawai.kd ".
						"AND admin_tu.kd = '$kd5_session' ".
						"AND m_pegawai.usernamex = '$username5_session' ".
						"AND m_pegawai.passwordx = '$pass5_session'");
$rbw = mysql_fetch_assoc($qbw);
$tbw = mysql_num_rows($qbw);

if (($tbw == 0) OR (empty($kd5_session)) 
	OR (empty($username5_session)) 
	OR (empty($pass5_session)) 
	OR (empty($tu_session)) 
	OR (empty($hajirobe_session)))
	{
	//diskonek
	xfree($qbw);
	xclose($koneksi);
		
	//re-direct
	$pesan = "ANDA BELUM LOGIN. SILAHKAN LOGIN DAHULU...!!!";
	pekem($pesan, $sumber);
	exit();
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>