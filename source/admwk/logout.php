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
require("../inc/config.php"); 
require("../inc/fungsi.php"); 

nocache;

//hapus session
session_unset($hajirobe3_session);
session_unset($kd3_session);
session_unset($nip3_session);
session_unset($nm3_session);
session_unset($wk_session);
session_unset($username3_session);
session_unset($pass3_session);
session_unset();
session_destroy();

//re-direct
xloc($sumber);
exit();
?>