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
require("../../inc/class/paging.php");
require("../../inc/cek/admtu.php");
$tpl = LoadTpl("../../template/index.html");


nocache;

//nilai
$filenya = "nilai.php";
$judul = "Penilaian";
$judulku = "[$tu_session : $nip5_session.$nm5_session] ==> $judul";
$juduly = $judul;
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$skkd = nosql($_REQUEST['skkd']);
$progkd = nosql($_REQUEST['progkd']);
$s = nosql($_REQUEST['s']);
$page = nosql($_REQUEST['page']);

//page...
if ((empty($page)) OR ($page == "0"))
	{
	$page = "1";
	}

$ke = "$filenya?tapelkd=$tapelkd&smtkd=$smtkd&kelkd=$kelkd&".
			"keahkd=$keahkd&rukd=$rukd&skkd=$skkd&progkd=$progkd&page=$page";




//PROSES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//entry nilai prog_pddkn
if ($_POST['btnSMP'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);
	$progkd = nosql($_POST['progkd']);
	$rata_nh = nosql($_POST['rata_nh']);
	$total_nil = nosql($_POST['total_nil']);
	$total_rata = nosql($_POST['total_rata']);
	$tugas = nosql($_POST['tugas']);
	$uts = nosql($_POST['uts']);
	$uas = nosql($_POST['uas']);
	$praktek = nosql($_POST['praktek']);
	$sikap = nosql($_POST['sikap']);

	//looping NH
	for ($i=1;$i<=$jml_nh;$i++)
		{
		//looping NR
		for ($k=1;$k<=$jml_nr;$k++)
			{
			//nilai
			$xnh = "NH";
			$xnh1 = "$xnh$i";
			$xnh2 = "$xnh$i";
			$xnhxx = nosql($_POST["$xnh1"]);

			//nek se-digit
			if (strlen($xnhxx) == 1)
				{
				$xnhxx = "0$xnhxx";
				}

			//nek lebih dari 100
			if ($xnhxx > 100)
				{
				$xnhxx = "00";
				}



			$xnr = "NR";
			$xnr1 = "$i$xnr$k";
			$xnr2 = "$i$xnr$k";
			$xnrxx = nosql($_POST["$xnr1"]);

			//nek se-digit
			if (strlen($xnrxx) == 1)
				{
				$xnrxx = "0$xnrxx";
				}

			//nek lebih dari 100
			if ($xnrxx > 100)
				{
				$xnrxx = "00";
				}


			//jika NH ****************************************************************************************
			if ($xnh == "NH")
				{
				//random
				$xxhr = rand(1,1000);
				$xxh = md5("$x$i$k$xxhr");

				//cek
				$qc = mysql_query("SELECT * FROM siswa_nh ".
									"WHERE kd_siswa_kelas = '$skkd' ".
									"AND kd_smt = '$smtkd' ".
									"AND kd_prog_pddkn = '$progkd' ".
									"AND left(nilkd,3) = '$xnh2'");
				$rc = mysql_fetch_assoc($qc);
				$tc = mysql_num_rows($qc);


				//update
				if ($tc != 0)
					{
					mysql_query("UPDATE siswa_nh SET nilai = '$xnhxx' ".
									"WHERE kd_smt = '$smtkd' ".
									"AND kd_prog_pddkn = '$progkd' ".
									"AND left(nilkd,3) = '$xnh2' ".
									"AND kd_siswa_kelas = '$skkd'");
					}
				else //insert
					{
					mysql_query("INSERT INTO siswa_nh(kd, kd_siswa_kelas, kd_smt, ".
									"kd_prog_pddkn, nilkd, nilai) VALUES ".
									"('$xxh', '$skkd', '$smtkd', ".
									"'$progkd', '$xnh2', '$xnhxx')");
					}
				}



			//jika NR ****************************************************************************************
			if ($xnr == "NR")
				{
				//random
				$xxrr = rand(1,1000);
				$xxr = md5("$x$i$k$xxrr");

				//cek
				$qc = mysql_query("SELECT * FROM siswa_nh ".
									"WHERE kd_siswa_kelas = '$skkd' ".
									"AND kd_smt = '$smtkd' ".
									"AND kd_prog_pddkn = '$progkd' ".
									"AND left(nilkd,4) = '$xnr2'");
				$rc = mysql_fetch_assoc($qc);
				$tc = mysql_num_rows($qc);


				//update
				if ($tc != 0)
					{
					mysql_query("UPDATE siswa_nh SET nilai = '$xnrxx' ".
									"WHERE kd_smt = '$smtkd' ".
									"AND kd_prog_pddkn = '$progkd' ".
									"AND left(nilkd,4) = '$xnr2' ".
									"AND kd_siswa_kelas = '$skkd'");
					}
				else //insert
					{
					mysql_query("INSERT INTO siswa_nh(kd, kd_siswa_kelas, kd_smt, ".
									"kd_prog_pddkn, nilkd, nilai) VALUES ".
									"('$xxr', '$skkd', '$smtkd', ".
									"'$progkd', '$xnr2', '$xnrxx')");
					}
				}
			}
		}




	//nilai lainnya ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$qcc = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_prog_pddkn = '$progkd'");
	$rcc = mysql_fetch_assoc($qcc);
	$tcc = mysql_num_rows($qcc);

	//jika ada, update
	if ($tcc != 0)
		{
		mysql_query("UPDATE siswa_nilai_prog_pddkn SET nh = '$rata_nh', ".
						"tugas = '$tugas', ".
						"uts = '$uts', ".
						"uas = '$uas', ".
						"praktek = '$praktek', ".
						"sikap = '$sikap', ".
						"total_kognitif = '$total_rata', ".
						"total_psikomotorik = '$praktek' ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_smt = '$smtkd' ".
						"AND kd_prog_pddkn = '$progkd'");
		}

	//jika blm ada, insert
	else
		{
		mysql_query("INSERT INTO siswa_nilai_prog_pddkn(kd, kd_siswa_kelas, nh, kd_smt, kd_prog_pddkn, tugas, uts, uas, praktek, sikap, ".
						"total_kognitif, total_psikomotorik) VALUES ".
						"('$x', '$skkd', '$rata_nh', '$smtkd', '$progkd', '$tugas', '$uts', '$uas', '$praktek', '$sikap', ".
						"'$total_rata', '$praktek')");
		}
	//nilai lainnya ///////////////////////////////////////////////////////////////////////////////////////////////////////////////



	//rangking //////////////////////////////////////////////////////////////////////////////////////////////////////
	//total_kognitif
	$qjum = mysql_query("SELECT SUM(total_kognitif) AS total_kognitif ".
							"FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rjum = mysql_fetch_assoc($qjum);
	$tjum = mysql_num_rows($qjum);
	$total_kognitif = round(nosql($rjum['total_kognitif']));


	//rata_kognitif
	$qjum2 = mysql_query("SELECT AVG(total_kognitif) AS rata_kognitif ".
							"FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rjum2 = mysql_fetch_assoc($qjum2);
	$tjum2 = mysql_num_rows($qjum2);
	$rata_kognitif = round(nosql($rjum2['rata_kognitif']));


	//total_psikomotorik
	$qjum3 = mysql_query("SELECT SUM(total_psikomotorik) AS total_psikomotorik ".
							"FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rjum3 = mysql_fetch_assoc($qjum3);
	$tjum3 = mysql_num_rows($qjum3);
	$total_psikomotorik = round(nosql($rjum3['total_psikomotorik']));


	//rata_psikomotorik
	$qjum4 = mysql_query("SELECT AVG(total_psikomotorik) AS rata_psikomotorik ".
							"FROM siswa_nilai_prog_pddkn ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rjum4 = mysql_fetch_assoc($qjum4);
	$tjum4 = mysql_num_rows($qjum4);
	$rata_psikomotorik = round(nosql($rjum4['rata_psikomotorik']));


	//total
	$total_nilai = round($total_kognitif + $total_psikomotorik);


	//cek
	$qgk = mysql_query("SELECT * FROM siswa_rangking ".
							"WHERE kd_tapel = '$tapelkd' ".
							"AND kd_keahlian = '$keahkd' ".
							"AND kd_kelas = '$kelkd' ".
							"AND kd_ruang = '$rukd' ".
							"AND kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rgk = mysql_fetch_assoc($qgk);
	$tgk = mysql_num_rows($qgk);

	//jika ada
	if ($tgk != 0)
		{
		//update
		mysql_query("UPDATE siswa_rangking SET total_kognitif = '$total_kognitif', ".
						"rata_kognitif = '$rata_kognitif', ".
						"total_psikomotorik = '$total_psikomotorik', ".
						"rata_psikomotorik = '$rata_psikomotorik', ".
						"total = '$total_nilai' ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_smt = '$smtkd'");
		}
	else
		{
		//insert
		mysql_query("INSERT INTO siswa_rangking(kd, kd_tapel, kd_keahlian, kd_kelas, kd_ruang, ".
						"kd_siswa_kelas, kd_smt, total_kognitif, rata_kognitif, ".
						"total_psikomotorik, rata_psikomotorik, total) VALUES ".
						"('$x', '$tapelkd', '$keahkd', '$kelkd', '$rukd', ".
						"'$skkd', '$smtkd', '$total_kognitif', '$rata_kognitif', ".
						"'$total_psikomotorik', '$rata_psikomotorik', '$total_nilai')");
		}



	//pemberian rangking............................................................................................
	$qgki = mysql_query("SELECT * FROM siswa_rangking ".
							"WHERE kd_tapel = '$tapelkd' ".
							"AND kd_keahlian = '$keahkd' ".
							"AND kd_kelas = '$kelkd' ".
							"AND kd_ruang = '$rukd' ".
							"AND kd_smt = '$smtkd' ".
							"ORDER BY round(total) DESC");
	$rgki = mysql_fetch_assoc($qgki);
	$tgki = mysql_num_rows($qgki);

	//nek ada
	if ($tgki != 0)
		{
		do
			{
			//nilai
			$nox = $nox + 1;
			$gki_kd = nosql($rgki['kd']);

			mysql_query("UPDATE siswa_rangking SET rangking = '$nox' ".
							"WHERE kd = '$gki_kd'");
			}
		while ($rgki = mysql_fetch_assoc($qgki));
		}
	//rangking //////////////////////////////////////////////////////////////////////////////////////////////////////



	//re-direct
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd&progkd=$progkd";
	xloc($ke);
	exit();
	}




//tambah ekstra
if ($_POST['btnSMP2'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);
	$ekstra = nosql($_POST['ekstra']);

	//jika null
	if (empty($ekstra))
		{
		//re-direct
		$pesan = "Ekstra Belum Dipilih. Harap Diperhatikan.";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
		pekem($pesan,$ke);
		exit();
		}
	else
		{
		//cek
		$qcc = mysql_query("SELECT * FROM siswa_ekstra ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_ekstra = '$ekstra'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);

		//nek ada
		if ($tcc != 0)
			{
			//re-direct
			$pesan = "Ekstra ini telah diambil. Harap Diperhatikan.";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//insert
			mysql_query("INSERT INTO siswa_ekstra(kd, kd_siswa_kelas, kd_smt, kd_ekstra) VALUES ".
							"('$x', '$skkd', '$smtkd', '$ekstra')");

			//re-direct
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			xloc($ke);
			exit();
			}
		}
	}




//jika hapus ekstra
if ($_POST['btnHPS'])
	{
	//ambil nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);
	$jml = nosql($_POST['jml']);


	//ambil semua
	for ($i=1; $i<=$jml;$i++)
		{
		//ambil nilai
		$yuk = "item";
		$yuhu = "$yuk$i";
		$kd = nosql($_POST["$yuhu"]);

		//del
		mysql_query("DELETE FROM siswa_ekstra ".
						"WHERE kd = '$kd'");
		}

	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
	xloc($ke);
	exit();
	}




//jika simpan ekstra
if ($_POST['btnSMP3'])
	{
	//ambil nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);
	$jml = nosql($_POST['jml']);


	//ambil semua
	for ($i=1; $i<=$jml;$i++)
		{
		//ambil nilai
		$xkdt = "sekd";
		$xkdt1 = "$xkdt$i";
		$xkdtxx = nosql($_POST["$xkdt1"]);

		$xkst = "predikat_ekstra";
		$xkst1 = "$xkst$i";
		$xkstxx = nosql($_POST["$xkst1"]);

		$xket = "ket_ekstra";
		$xket1 = "$xket$i";
		$xketxx = cegah($_POST["$xket1"]);

		//update
		mysql_query("UPDATE siswa_ekstra SET predikat = '$xkstxx', ".
						"ket = '$xketxx' ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_smt = '$smtkd' ".
						"AND kd = '$xkdtxx'");
		}


	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
	xloc($ke);
	exit();
	}




//jika simpan pribadi
if ($_POST['btnSMP4'])
	{
	//ambil nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);

	//query
	$qkst = mysql_query("SELECT * FROM m_pribadi ".
							"ORDER BY pribadi ASC");
	$rkst = mysql_fetch_assoc($qkst);
	$tkst = mysql_num_rows($qkst);

	//ambil semua
	do
		{
		//ambil nilai
		$noxzi = $noxzi + 1;

		$xkdt = "prikd";
		$xkdt1 = "$xkdt$noxzi";
		$xkdtxx = nosql($_POST["$xkdt1"]);

		$xkst = "predikat_pribadi";
		$xkst1 = "$xkst$noxzi";
		$xkstxx = nosql($_POST["$xkst1"]);

		$xket = "ket_pribadi";
		$xket1 = "$xket$noxzi";
		$xketxx = nosql($_POST["$xket1"]);


		//cek
		$qcc = mysql_query("SELECT * FROM siswa_pribadi ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_pribadi = '$xkdtxx'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);

		//nek ada
		if ($tcc != 0)
			{
			//update
			mysql_query("UPDATE siswa_pribadi SET predikat = '$xkstxx', ".
							"ket = '$xketxx' ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_pribadi = '$xkdtxx'");
			}
		//jika blm ada
		else
			{
			mysql_query("INSERT INTO siswa_pribadi(kd, kd_siswa_kelas, kd_smt, kd_pribadi, predikat, ket) VALUES ".
							"('$x', '$skkd', '$smtkd', '$xkdtxx', '$xkstxx', '$xketxx')");
			}
		}
	while ($rkst = mysql_fetch_assoc($qkst));



	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
	xloc($ke);
	exit();
	}




//jika simpan catatan
if ($_POST['btnSMP5'])
	{
	//ambil nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$smtkd = nosql($_POST['smtkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$skkd = nosql($_POST['skkd']);
	$catatan = cegah($_POST['catatan']);


	//cek
	$qcc = mysql_query("SELECT * FROM siswa_catatan ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rcc = mysql_fetch_assoc($qcc);
	$tcc = mysql_num_rows($qcc);

	//nek ada
	if ($tcc != 0)
		{
		//update
		mysql_query("UPDATE siswa_catatan SET catatan = '$catatan' ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_smt = '$smtkd'");
		}
	//jika blm ada
	else
		{
		mysql_query("INSERT INTO siswa_catatan(kd, kd_siswa_kelas, kd_smt, catatan) VALUES ".
						"('$x', '$skkd', '$smtkd', '$catatan')");
		}


	//diskonek
	xfree($qbw);
	xclose($koneksi);

	//auto-kembali
	$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
	xloc($ke);
	exit();
	}





//kenaikan kelas
if ($_POST['btnSMP6'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$tpfkd = nosql($_POST['tpfkd']);
	$tpfthn1 = nosql($_POST['tpfthn1']);
	$tpfthn2 = nosql($_POST['tpfthn2']);
	$kelasx = nosql($_POST['kelasx']);
	$skkd = nosql($_POST['skkd']);
	$swkd = nosql($_POST['swkd']);


	//nek null
	if (empty($tpfkd))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Tahun Pelajaran : $tpfthn1/$tpfthn2, Belum Ada. Silahkan Anda Setting Dahulu Tahun Pelajaran Tersebut...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
		pekem($pesan,$ke);
		exit();
		}

	else if (empty($kelasx))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Kenaikan atau Tinggal Kelas, Belum Ditentukan. Silahkan Diulangi...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
		pekem($pesan,$ke);
		exit();
		}

	else
		{
		//cek
		$qcc = mysql_query("SELECT * FROM siswa_kelas ".
								"WHERE kd_tapel = '$tpfkd' ".
								"AND kd_siswa = '$swkd'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);

		//nek ada
		if ($tcc != 0)
			{
			//update
			mysql_query("UPDATE siswa_kelas SET kd_kelas = '$kelasx' ".
							"WHERE kd_tapel = '$tpfkd' ".
							"AND kd_siswa = '$swkd'");

			//kenaikan
			if ($kelasx == $kelkd)
				{
				//tinggal kelas
				$naik_ket = "false";
				}
			else
				{
				//naik kelas
				$naik_ket = "true";
				}


			//cek
			$qcc1 = mysql_query("SELECT * FROM siswa_naik ".
									"WHERE kd_tapel = '$tpfkd' ".
									"AND kd_siswa_kelas = '$skkd'");
			$rcc1 = mysql_fetch_assoc($qcc1);
			$tcc1 = mysql_num_rows($qcc1);

			if ($tcc1 != 0)
				{
				//siswa_naik
				mysql_query("UPDATE siswa_naik SET naik = '$naik_ket', ".
								"kd_kelas = '$kelasx' ".
								"WHERE kd_tapel = '$tpfkd' ".
								"AND kd_siswa_kelas = '$skkd'");
				}
			else
				{
				//siswa_naik
				mysql_query("INSERT INTO siswa_naik(kd, kd_tapel, kd_kelas, kd_siswa_kelas, naik) VALUES ".
								"('$x', '$tpfkd', '$kelasx', '$skkd', '$naik_ket')");
				}


			//diskonek
			xfree($qbw);
			xclose($koneksi);

			//re-direct
			$pesan = "Kenaikan atau Tinggal Kelas, Berhasil Dilakukan. Silahkan Lakukan Penempatan Keahlian dan Ruang untuk Siswa Tersebut...!!";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//baru
			mysql_query("INSERT INTO siswa_kelas(kd, kd_tapel, kd_kelas, kd_siswa) VALUES ".
							"('$x', '$tpfkd', '$kelasx', '$swkd')");


			//kenaikan
			if ($kelasx == $kelkd)
				{
				//tinggal kelas
				$naik_ket = "false";
				}
			else
				{
				//naik kelas
				$naik_ket = "true";
				}


			//siswa_naik
			mysql_query("INSERT INTO siswa_naik(kd, kd_tapel, kd_kelas, kd_siswa_kelas, naik) VALUES ".
							"('$x', '$tpfkd', '$kelasx', '$skkd', '$naik_ket')");

			//re-direct
			$pesan = "Kenaikan atau Tinggal Kelas, Berhasil Dilakukan. Silahkan Lakukan Penempatan Keahlian dan Ruang untuk Siswa Tersebut...!!";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			pekem($pesan,$ke);
			exit();
			}
		}
	}





//kelulusan
if ($_POST['btnSMP7'])
	{
	//nilai
	$tapelkd = nosql($_POST['tapelkd']);
	$kelkd = nosql($_POST['kelkd']);
	$keahkd = nosql($_POST['keahkd']);
	$rukd = nosql($_POST['rukd']);
	$tpfkd = nosql($_POST['tpfkd']);
	$lulus = nosql($_POST['lulus']);
	$skkd = nosql($_POST['skkd']);


	//nek null
	if (empty($lulus))
		{
		//diskonek
		xfree($qbw);
		xclose($koneksi);

		//re-direct
		$pesan = "Kelulusan Belum Ditentukan. Harap diperhatikan...!!";
		$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
		pekem($pesan,$ke);
		exit();
		}

	else
		{
		//cek
		$qcc = mysql_query("SELECT * FROM siswa_lulus ".
								"WHERE kd_tapel = '$tpfkd' ".
								"AND kd_siswa_kelas = '$skkd'");
		$rcc = mysql_fetch_assoc($qcc);
		$tcc = mysql_num_rows($qcc);

		//nek ada
		if ($tcc != 0)
			{
			//update
			mysql_query("UPDATE siswa_lulus SET lulus = '$lulus' ".
							"WHERE kd_tapel = '$tpfkd' ".
							"AND kd_siswa_kelas = '$skkd'");

			//diskonek
			xfree($qbw);
			xclose($koneksi);


			//re-direct
			$pesan = "Lulus atau Tidak Lulus, Berhasil Dilakukan.";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			pekem($pesan,$ke);
			exit();
			}
		else
			{
			//baru
			mysql_query("INSERT INTO siswa_lulus(kd, kd_tapel, kd_siswa_kelas, lulus) VALUES ".
							"('$x', '$tpfkd', '$skkd', '$lulus')");

			//re-direct
			$pesan = "Lulus atau Tidak Lulus, Berhasil Dilakukan.";
			$ke = "$filenya?tapelkd=$tapelkd&kelkd=$kelkd&keahkd=$keahkd&rukd=$rukd&smtkd=$smtkd&skkd=$skkd";
			pekem($pesan,$ke);
			exit();
			}
		}
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
else if (empty($skkd))
	{
	$diload = "document.formx.siswa.focus();";
	}







//isi *START
ob_start();

//js
require("../../inc/js/jumpmenu.js");
require("../../inc/js/swap.js");
require("../../inc/js/checkall.js");
require("../../inc/js/number.js");
require("../../inc/menu/admtu.php");
xheadline($judul);

//view //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo '<form name="formx" method="post" action="'.$filenya.'">
<table bgcolor="'.$warnaover.'" width="100%" border="0" cellspacing="0" cellpadding="3">
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
	$tpkd = nosql($rowtp['kd']);
	$tpth1 = nosql($rowtp['tahun1']);
	$tpth2 = nosql($rowtp['tahun2']);

	echo '<option value="'.$filenya.'?tapelkd='.$tpkd.'">'.$tpth1.'/'.$tpth2.'</option>';
	}
while ($rowtp = mysql_fetch_assoc($qtp));

echo '</select>,

Kelas : ';
echo "<select name=\"kelas\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);

$btxkd = nosql($rowbtx['kd']);
$btxno = nosql($rowbtx['no']);
$btxkelas = nosql($rowbtx['kelas']);

echo '<option value="'.$btxkd.'">'.$btxkelas.'</option>';

$qbt = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd <> '$kelkd' ".
						"ORDER BY round(no) ASC");
$rowbt = mysql_fetch_assoc($qbt);

do
	{
	$btkd = nosql($rowbt['kd']);
	$btkelas = nosql($rowbt['kelas']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$btkd.'">'.$btkelas.'</option>';
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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$prg_kd.'">'.$prg_bid.' - '.$prg_prog.'</option>';
	}
while ($rowprg = mysql_fetch_assoc($qprg));

echo '</select>
</td>
</tr>
</table>

<table bgcolor="'.$warna02.'" width="100%" border="0" cellspacing="0" cellpadding="3">
<tr>
<td>
Ruang : ';
echo "<select name=\"ruang\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qrux = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd = '$rukd'");
$rowrux = mysql_fetch_assoc($qrux);

$ruxkd = nosql($rowrux['kd']);
$ruxruang = balikin($rowrux['ruang']);

echo '<option value="'.$ruxkd.'">'.$ruxruang.'</option>';

$qru = mysql_query("SELECT * FROM m_ruang ".
						"WHERE kd <> '$rukd' ".
						"ORDER BY ruang ASC");
$rowru = mysql_fetch_assoc($qru);

do
	{

	$ru_kd = nosql($rowru['kd']);
	$ru_ru = balikin($rowru['ruang']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$ru_kd.'">'.$ru_ru.'</option>';
	}
while ($rowru = mysql_fetch_assoc($qru));

echo '</select>,

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

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$st_kd.'">'.$st_smt.'</option>';
	}
while ($rowst = mysql_fetch_assoc($qst));

echo '</select>,

Siswa : ';
echo "<select name=\"siswa\" onChange=\"MM_jumpMenu('self',this,0)\">";

//terpilih
$qstdx = mysql_query("SELECT m_siswa.*, m_siswa.kd AS mskd, siswa_kelas.* ".
						"FROM m_siswa, siswa_kelas ".
						"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
						"AND siswa_kelas.kd_tapel = '$tapelkd' ".
						"AND siswa_kelas.kd_kelas = '$kelkd' ".
						"AND siswa_kelas.kd_keahlian = '$keahkd' ".
						"AND siswa_kelas.kd_ruang = '$rukd' ".
						"AND siswa_kelas.kd = '$skkd'");
$rowstdx = mysql_fetch_assoc($qstdx);
$stdx_skkd = nosql($rowstdx['mskd']);
$stdx_no = nosql($rowstdx['no_absen']);
$stdx_nis = nosql($rowstdx['nis']);
$stdx_nama = balikin($rowstdx['nama']);

echo '<option value="'.$stdx_skkd.'" selected>'.$stdx_no.'. '.$stdx_nis.'. '.$stdx_nama.'</option>';

$qstd = mysql_query("SELECT m_siswa.*, siswa_kelas.*, siswa_kelas.kd AS skkd ".
						"FROM m_siswa, siswa_kelas ".
						"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
						"AND siswa_kelas.kd_tapel = '$tapelkd' ".
						"AND siswa_kelas.kd_kelas = '$kelkd' ".
						"AND siswa_kelas.kd_keahlian = '$keahkd' ".
						"AND siswa_kelas.kd_ruang = '$rukd' ".
						"AND siswa_kelas.kd <> '$skkd' ".
						"ORDER BY round(siswa_kelas.no_absen) ASC");
$rowstd = mysql_fetch_assoc($qstd);

do
	{
	$std_skkd = nosql($rowstd['skkd']);
	$std_no = nosql($rowstd['no_absen']);
	$std_nis = nosql($rowstd['nis']);
	$std_nama = balikin($rowstd['nama']);

	echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&skkd='.$std_skkd.'">'.$std_no.'. '.$std_nis.'. '.$std_nama.'</option>';
	}
while ($rowstd = mysql_fetch_assoc($qstd));

echo '</select>


<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
<input name="rukd" type="hidden" value="'.$rukd.'">
<input name="kelkd" type="hidden" value="'.$kelkd.'">
<input name="keahkd" type="hidden" value="'.$keahkd.'">
<input name="smtkd" type="hidden" value="'.$smtkd.'">
<input name="progkd" type="hidden" value="'.$progkd.'">
<input name="skkd" type="hidden" value="'.$skkd.'">
</td>
</tr>
</table>
<br>';


//nek drg
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

else if (empty($rukd))
	{
	echo '<font color="#FF0000"><strong>RUANG Belum Dipilih...!</strong></font>';
	}

else if (empty($smtkd))
	{
	echo '<font color="#FF0000"><strong>SEMESTER Belum Dipilih...!</strong></font>';
	}

else if (empty($skkd))
	{
	echo '<font color="#FF0000"><strong>SISWA Belum Dipilih...!</strong></font>';
	}

else
	{
	echo '[<a href="nilai_pdf.php?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&skkd='.$skkd.'" target="_blank" title="Lihat Raport..."><img src="'.$sumber.'/img/pdf.gif" width="16" height="16" border="0"></a>]
	<hr>
	<p>
	<big>
	<strong>Nilai KOGNITIF, Psikomotorik, dan Afektif : </strong>
	</big>
	<br>';

	echo "<select name=\"prog_pddkn\" onChange=\"MM_jumpMenu('self',this,0)\">";

	//terpilih
	$qstdx = mysql_query("SELECT * FROM m_prog_pddkn ".
							"WHERE kd = '$progkd'");
	$rowstdx = mysql_fetch_assoc($qstdx);
	$stdx_kd = nosql($rowstdx['kd']);
	$stdx_jnskd = nosql($rowstdx['kd_jenis']);
	$stdx_pel = balikin($rowstdx['prog_pddkn']);

	//jenis
	$qjnsx = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
							"WHERE kd = '$stdx_jnskd'");
	$rjnsx = mysql_fetch_assoc($qjnsx);
	$tjnsx = mysql_num_rows($qjnsx);
	$jnsx_jenis = balikin($rjnsx['jenis']);

	echo '<option value="'.$stdx_kd.'">'.$jnsx_jenis.' --> '.$stdx_pel.'</option>';


	//list
	$qstd = mysql_query("SELECT m_prog_pddkn.*, m_prog_pddkn.kd AS mpkd, m_prog_pddkn_kelas.* ".
							"FROM m_prog_pddkn, m_prog_pddkn_kelas ".
							"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
							"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
							"AND m_prog_pddkn_kelas.kd_keahlian = '$keahkd' ".
							"AND m_prog_pddkn.kd <> '$progkd' ".
							"ORDER BY round(m_prog_pddkn.no) ASC, ".
							"round(m_prog_pddkn.no_sub) ASC");
	$rowstd = mysql_fetch_assoc($qstd);

	do
		{
		$std_kd = nosql($rowstd['mpkd']);
		$std_jnskd = nosql($rowstd['kd_jenis']);
		$std_pel = balikin($rowstd['prog_pddkn']);

		//jenis
		$qjns = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
								"WHERE kd = '$std_jnskd'");
		$rjns = mysql_fetch_assoc($qjns);
		$tjns = mysql_num_rows($qjns);
		$jns_jenis = balikin($rjns['jenis']);


		echo '<option value="'.$filenya.'?tapelkd='.$tapelkd.'&kelkd='.$kelkd.'&keahkd='.$keahkd.'&rukd='.$rukd.'&smtkd='.$smtkd.'&skkd='.$skkd.'&progkd='.$std_kd.'">'.$jns_jenis.' --> '.$std_pel.'</option>';
		}
	while ($rowstd = mysql_fetch_assoc($qstd));

	echo '</select>
	<br>';

	//nek null
	if (empty($progkd))
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
									"AND kd_prog_pddkn = '$progkd' ".
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
									"AND kd_prog_pddkn = '$progkd' ".
									"AND left(nilkd,3) = '$nhxre'");
	  		$rre = mysql_fetch_assoc($qre);

	  		//remidi
	  		$qre2 = mysql_query("SELECT MAX(nilai) AS d2 ".
									"FROM siswa_nh ".
									"WHERE kd_siswa_kelas = '$skkd' ".
									"AND kd_smt = '$smtkd' ".
									"AND kd_prog_pddkn = '$progkd' ".
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
									"AND kd_prog_pddkn = '$progkd' ".
									"AND kd_siswa_kelas = '$skkd' ".
									"AND left(nilkd,3) = '$nhxre'");
			$rcc = mysql_fetch_assoc($qcc);
			$tcc = mysql_num_rows($qcc);


			if ($tcc != 0) //update
				{
				mysql_query("UPDATE siswa_nh_rata SET nilai = '$nil' ".
								"WHERE kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$progkd' ".
								"AND kd_siswa_kelas = '$skkd' ".
								"AND left(nilkd,3) = '$nhxre'");
				}
			else
				{
				//insert-kan
				$xy = md5("$x$i$nomer");
				mysql_query("INSERT INTO siswa_nh_rata(kd, kd_siswa_kelas, kd_smt, ".
								"kd_prog_pddkn, nilkd, nilai) VALUES ".
								"('$xy', '$skkd', '$smtkd', ".
								"'$progkd', '$nhxre', '$nil')");
				}
			//penentuan rata - rata /////////////////////////////////////////////////////////////////////////////////////////////////



			echo '<td>
			<input name="'.$xnh.'" type="text" value="'.$nil_nh.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">
			</td>';

			//looping jml. NR Remidi
			for ($j=1;$j<=$jml_nr;$j++)
				{
				//nilai
				$nr = "NR";
				$xnr = "$i$nr$j$nomorx";
				$xnr2 = "$i$nr$j";

				//query
				$qnil2 = mysql_query("SELECT * FROM siswa_nh ".
										"WHERE kd_siswa_kelas = '$skkd' ".
										"AND kd_smt = '$smtkd' ".
										"AND kd_prog_pddkn = '$progkd' ".
										"AND left(nilkd,4) = '$xnr2'");
				$rnil2 = mysql_fetch_assoc($qnil2);
				$tnil2 = mysql_num_rows($qnil2);
				$nil2_nr = nosql($rnil2['nilai']);

				echo '<td>
				<input name="'.$xnr.'" type="text" value="'.$nil2_nr.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">
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
								"AND kd_prog_pddkn = '$progkd'");
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
								"AND kd_prog_pddkn = '$progkd'");
		$rsni = mysql_fetch_assoc($qsni);
		$tsni = mysql_num_rows($qsni);
		$sni_rata = round(nosql($rsni['rata']));


		//total
		$xpel_total = round($sni_rata + $xpel_tugas + $xpel_uts + $xpel_uas);


		//require rumus
		require("../../inc/rumus_kognitif.php");


		//rangking-nya....
		$qkju = mysql_query("SELECT * FROM siswa_rangking ".
								"WHERE kd_tapel = '$tapelkd' ".
								"AND kd_keahlian = '$keahkd' ".
								"AND kd_kelas = '$kelkd' ".
								"AND kd_ruang = '$rukd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_siswa_kelas = '$skkd'");
		$rkju = mysql_fetch_assoc($qkju);
		$kju_rangking = nosql($rkju['rangking']);



		//jumlah siswa sekelas
		$qjks = mysql_query("SELECT * FROM siswa_kelas ".
								"WHERE kd_tapel = '$tapelkd' ".
								"AND kd_keahlian = '$keahkd' ".
								"AND kd_kelas = '$kelkd' ".
								"AND kd_ruang = '$rukd'");
		$rjks = mysql_fetch_assoc($qjks);
		$tjks = mysql_num_rows($qjks);



		echo 'Rata2 NH :
		<input name="rata_nh" type="text" value="'.$sni_rata.'" size="4" class="input" readonly>,

		Tugas :
		<input name="tugas" type="text" value="'.$xpel_tugas.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">,

		UTS :
		<input name="uts" type="text" value="'.$xpel_uts.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">,

		UAS :
		<input name="uas" type="text" value="'.$xpel_uas.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">,

		Total Nilai :
		<input name="total_nil" type="text" value="'.$xpel_total.'" size="4" class="input" readonly>,

		Total Rata2 :
		<input name="total_rata" type="text" value="'.$xpel_rata.'" size="4" class="input" readonly>
		</p>

		<p>
		<strong>Nilai Praktek / Psikomotorik</strong>
		<br>
		<input name="praktek" type="text" value="'.$xpel_praktek.'" size="2" maxlength="2" onKeyPress="return numbersonly(this, event)">
		</p>

		<p>
		<strong>Nilai Sikap / Afektif</strong>
		<br>
		<select name="sikap">
		<option value="'.$xpel_sikap.'" selected>'.$xpel_sikap.'</option>
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="C">C</option>
		<option value="D">D</option>
		<option value="E">E</option>
		</select>
		</p>

		<p>
		Rangking ke :
		<input name="rangking" type="text" value="'.$kju_rangking.'" size="3" class="input" readonly> dari
		<input name="total_siswa" type="text" value="'.$tjks.'" size="3" class="input" readonly> Siswa.
		</p>

		<br>

		<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
	    <input name="rukd" type="hidden" value="'.$rukd.'">
	    <input name="kelkd" type="hidden" value="'.$kelkd.'">
		<input name="keahkd" type="hidden" value="'.$keahkd.'">
	    <input name="smtkd" type="hidden" value="'.$smtkd.'">
	    <input name="progkd" type="hidden" value="'.$progkd.'">
		<input name="skkd" type="hidden" value="'.$skkd.'">
		<input name="btnSMP" type="submit" value="SIMPAN">';
		}


	echo '<hr>
	<br>

	<p>
	<big><strong>Ekstrakurikuler / Life Skill : </strong></big>
	<br>

	<select name="ekstra">
	<option value="" selected></option>';

	//daftar ekstra
	$qkst = mysql_query("SELECT * FROM m_ekstra ".
							"ORDER BY ekstra ASC");
	$rkst = mysql_fetch_assoc($qkst);
	$tkst = mysql_num_rows($qkst);

	//nek ada
	if ($tkst != 0)
		{
		do
			{
			//nilai
			$kst_kd = nosql($rkst['kd']);
			$kst_ekstra = balikin($rkst['ekstra']);

			echo '<option value="'.$kst_kd.'">'.$kst_ekstra.'</option>';
			}
		while ($rkst = mysql_fetch_assoc($qkst));
		}

	echo '</select>
	<input name="tapelkd" type="hidden" value="'.$tapelkd.'">
    <input name="rukd" type="hidden" value="'.$rukd.'">
    <input name="kelkd" type="hidden" value="'.$kelkd.'">
	<input name="keahkd" type="hidden" value="'.$keahkd.'">
    <input name="smtkd" type="hidden" value="'.$smtkd.'">
	<input name="skkd" type="hidden" value="'.$skkd.'">
	<input name="btnSMP2" type="submit" value="Tambah >>">
	<br>';



	//daftar ekstra yang diikuti
	$qkuti = mysql_query("SELECT siswa_ekstra.*, siswa_ekstra.kd AS sekd, m_ekstra.* ".
							"FROM siswa_ekstra, m_ekstra ".
							"WHERE siswa_ekstra.kd_ekstra = m_ekstra.kd ".
							"AND siswa_ekstra.kd_siswa_kelas = '$skkd' ".
							"AND siswa_ekstra.kd_smt = '$smtkd' ".
							"ORDER BY m_ekstra.ekstra ASC");
	$rkuti = mysql_fetch_assoc($qkuti);
	$tkuti = mysql_num_rows($qkuti);

	//nek ada
	if ($tkuti != 0)
		{
		echo '<table width="600" border="1" cellspacing="0" cellpadding="3">
		<tr bgcolor="'.$warnaheader.'">
		<td width="5"></td>
		<td><strong>Nama Ekstra</strong></td>
		<td width="50"><strong>Predikat</strong></td>
		<td width="250"><strong>Keterangan</strong></td>
		</tr>';

		do
			{
			//nilai
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

			$nomx = $nomx + 1;
			$kuti_kd = nosql($rkuti['sekd']);
			$kuti_ekstra = balikin($rkuti['ekstra']);
			$kuti_predikat = nosql($rkuti['predikat']);
			$kuti_ket = balikin($rkuti['ket']);

			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td>
			<input name="sekd'.$nomx.'" type="hidden" value="'.$kuti_kd.'">
			<input type="checkbox" name="item'.$nomx.'" value="'.$kuti_kd.'">
			</td>
			<td>'.$kuti_ekstra.'</td>
			<td>
			<select name="predikat_ekstra'.$nomx.'">
			<option value="'.$kuti_predikat.'" selected>'.$kuti_predikat.'</option>
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
			<option value="K">K</option>
			</select>
			</td>
			<td>
			<input name="ket_ekstra'.$nomx.'" type="text" size="50" value="'.$kuti_ket.'">
			</td>
			</tr>';
			}
		while ($rkuti = mysql_fetch_assoc($qkuti));

		echo '</table>

		<table width="600" border="0" cellspacing="0" cellpadding="3">
		<tr>
		<td>
		<input name="jml" type="hidden" value="'.$tkuti.'">
		<input name="btnALL" type="button" value="SEMUA" onClick="checkAll('.$tkuti.')">
		<input name="btnBTL" type="reset" value="BATAL">
		<input name="btnHPS" type="submit" value="HAPUS">
		<input name="btnSMP3" type="submit" value="SIMPAN">
		</td>
		</tr>
		</table>';
		}
	else
		{
		echo '<font color="#FF0000"><strong>Belum Punya EKSTRA...!</strong></font>';
		}


	echo '<hr>
	</p>
	<br>

	<p>
	<big>
	<strong>Ketidakhadiran / Absensi :</strong>
	</big>
	<br>';

	//absensi
	$qabs = mysql_query("SELECT * FROM m_absensi ".
							"ORDER BY absensi ASC");
	$rabs = mysql_fetch_assoc($qabs);
	$tabs = mysql_num_rows($qabs);

	//nek ada
	if ($tabs != 0)
		{
		echo '<table width="300" border="1" cellspacing="0" cellpadding="3">
		<tr bgcolor="'.$warnaheader.'">
		<td width="5"><strong>No.</strong></td>
		<td><strong>Nama Absensi</strong></td>
		<td width="75"><strong>Jml. Hari</strong></td>
		</tr>';

		do
			{
			//nilai
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

			$nomxy = $nomxy + 1;
			$abs_kd = nosql($rabs['kd']);
			$abs_absensi = balikin($rabs['absensi']);

			//jml. absensi...
			$qbsi = mysql_query("SELECT * FROM siswa_absensi ".
									"WHERE kd_siswa_kelas = '$skkd' ".
									"AND kd_absensi = '$abs_kd'");
			$rbsi = mysql_fetch_assoc($qbsi);
			$tbsi = mysql_num_rows($qbsi);


			echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
			echo '<td>
			<input name="kd'.$nomx.'" type="hidden" value="'.$abs_kd.'">
			'.$nomxy.'
			</td>
			<td>
			'.$abs_absensi.'
			</td>
			<td>
			'.$tbsi.'
			</td>
			</tr>';
			}
		while ($rabs = mysql_fetch_assoc($qabs));

		echo '</table>';
		}

	echo '<hr>
	</p>
	<br>

	<p>
	<big>
	<strong>Kepribadian :</strong>
	</big>
	<br>';

	//daftar pribadi
	$qpri = mysql_query("SELECT * FROM m_pribadi ".
							"ORDER BY pribadi ASC");
	$rpri = mysql_fetch_assoc($qpri);
	$tpri = mysql_num_rows($qpri);

	echo '<table width="600" border="1" cellspacing="0" cellpadding="3">
	<tr bgcolor="'.$warnaheader.'">
	<td width="5"><strong>No.</strong></td>
	<td><strong>Nama Kepribadian</strong></td>
	<td width="50"><strong>Predikat</strong></td>
	<td width="250"><strong>Keterangan</strong></td>
	</tr>';

	do
		{
		//nilai
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

		$nomxz = $nomxz + 1;
		$pri_kd = nosql($rpri['kd']);
		$pri_pribadi = balikin($rpri['pribadi']);

		//pribadinya...
		$qprix = mysql_query("SELECT * FROM siswa_pribadi ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_pribadi = '$pri_kd'");
		$rprix = mysql_fetch_assoc($qprix);
		$tprix = mysql_num_rows($qprix);
		$prix_predikat = nosql($rprix['predikat']);
		$prix_ket = balikin($rprix['ket']);

		echo "<tr valign=\"top\" bgcolor=\"$warna\" onmouseover=\"this.bgColor='$warnaover';\" onmouseout=\"this.bgColor='$warna';\">";
		echo '<td>
		<input name="prikd'.$nomxz.'" type="hidden" value="'.$pri_kd.'">
		'.$nomxz.'.
		</td>
		<td>'.$pri_pribadi.'</td>
		<td>
		<select name="predikat_pribadi'.$nomxz.'">
		<option value="'.$prix_predikat.'" selected>'.$prix_predikat.'</option>
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="C">C</option>
		<option value="K">K</option>
		</select>
		</td>
		<td>
		<input name="ket_pribadi'.$nomxz.'" type="text" size="50" value="'.$prix_ket.'">
		</td>
		</tr>';
		}
	while ($rpri = mysql_fetch_assoc($qpri));

	echo '</table>

	<table width="600" border="0" cellspacing="0" cellpadding="3">
	<tr>
	<td>
	<input name="jml" type="hidden" value="'.$tkuti.'">
	<input name="btnSMP4" type="submit" value="SIMPAN">
	</td>
	</tr>
	</table>';


	echo '<hr>
	</p>
	<br>

	<p>
	<big><strong>Catatan Wali Kelas :</strong></big>
	<br>';

	//catatan...
	$qcatx = mysql_query("SELECT * FROM siswa_catatan ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd'");
	$rcatx = mysql_fetch_assoc($qcatx);
	$tcatx = mysql_num_rows($qcatx);
	$catx_catatan = balikin($rcatx['catatan']);

	echo '<textarea name="catatan" cols="50" rows="5" wrap="virtual">'.$catx_catatan.'</textarea>
	<br>
	<input name="btnSMP5" type="submit" value="SIMPAN">
	<hr>
	</p>';



	//jika kenaikan kelas (X, XI)
	if ((($btxno == "1") OR ($btxno == "2")) AND ($stx_no  == "2"))
		{
		//terjemahkan tapel
		$tpy_thn1 = $tpx_thn1 + 1;
		$tpy_thn2 = $tpx_thn2 + 1;

		$qtpf = mysql_query("SELECT * FROM m_tapel ".
								"WHERE tahun1 = '$tpy_thn1' ".
								"AND tahun2 = '$tpy_thn2'");
		$rtpf = mysql_fetch_assoc($qtpf);
		$tpf_kd = nosql($rtpf['kd']);

		//terjemahkan kelas
		$qbf = mysql_query("SELECT * FROM m_kelas ".
								"WHERE kd = '$kelkd'");
		$rbf = mysql_fetch_assoc($qbf);
		$bf_no = nosql($rbf['no']);
		$bf_nox = $bf_no + 1;
		$bf_noy = $bf_no - 1;

		echo '<br>
		<p>
		<big><strong>Keterangan Naik/Tinggal Kelas :</strong></big>
		<br>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
	    <td>
		<input name="tpfkd" type="hidden" value="'.$tpf_kd.'">
		<input name="swkd" type="hidden" value="'.$stdx_skkd.'">
		<input name="tpfthn1" type="hidden" value="'.$tpy_thn1.'">
		<input name="tpfthn2" type="hidden" value="'.$tpy_thn2.'">
		Tahun Pelajaran Baru : <strong>'.$tpy_thn1.'/'.$tpy_thn2.'</strong>,
		Kelas Baru : ';

		//naik...?
		$qnuk = mysql_query("SELECT siswa_naik.*, m_kelas.* ".
								"FROM siswa_naik, m_kelas ".
								"WHERE siswa_naik.kd_kelas = m_kelas.kd ".
								"AND siswa_naik.kd_siswa_kelas = '$skkd' ".
								"AND siswa_naik.kd_tapel = '$tpf_kd'");
		$rnuk = mysql_fetch_assoc($qnuk);
		$nuk_kelas = nosql($rnuk['kelas']);
		$nuk_naik = nosql($rnuk['naik']);


		if ($nuk_naik == "true")
			{
			$nuk_naik_ket = "Naik Kelas : $nuk_kelas";
			}
		else if ($nuk_naik == "false")
			{
			$nuk_naik_ket = "Tinggal Kelas : $nuk_kelas";
			}
		else
			{
			$nuk_naik_ket = "-";
			}

		echo '<select name="kelasx">
		<option value="'.$nuk_naik.'" selected>'.$nuk_naik_ket.'</option>';

		$qbt = mysql_query("SELECT * FROM m_kelas ".
								"WHERE no <= '$bf_nox' ".
								"AND no > '$bf_noy' ".
								"ORDER BY round(no) DESC");
		$rowbt = mysql_fetch_assoc($qbt);

		do
			{
			$btkd = nosql($rowbt['kd']);
			$btno = nosql($rowbt['no']);
			$btkelas = nosql($rowbt['kelas']);

			//tinggal kelas
			if ($btno == $btxno)
				{
				$kel_ket = "Tinggal Kelas : $btkelas";
				}

			//naik kelas
			else
				{
				$kel_ket = "Naik Kelas : $btkelas";
				}

			echo '<option value="'.$btkd.'">'.$kel_ket.'</option>';
			}
		while ($rowbt = mysql_fetch_assoc($qbt));

		echo '</select>
    	<input name="btnSMP6" type="submit" value="SIMPAN">
		</td>
		</tr>
		</table>
		</p>';
		}

	//jika kelulusan
	else if (($btxno == "3") AND ($stx_no  == "2"))
		{
		//terjemahkan tapel
		$tpy_thn1 = $tpx_thn1 + 1;
		$tpy_thn2 = $tpx_thn2 + 1;

		//tapel baru
		$qtpf = mysql_query("SELECT * FROM m_tapel ".
								"WHERE tahun1 = '$tpy_thn1' ".
								"AND tahun2 = '$tpy_thn2'");
		$rtpf = mysql_fetch_assoc($qtpf);
		$tpf_kd = nosql($rtpf['kd']);


		//status kelulusan
		$qlus = mysql_query("SELECT * FROM siswa_lulus ".
								"WHERE kd_tapel = '$tpf_kd' ".
								"AND kd_siswa_kelas = '$skkd'");
		$rlus = mysql_fetch_assoc($qlus);
		$lus_nilai = nosql($rlus['lulus']);

		//lulus ato tidal
		if ($lus_nilai == "true")
			{
			$lus_ket = "Lulus";
			}
		else if ($lus_nilai == "false")
			{
			$lus_ket = "Tidak Lulus";
			}

		echo '<br>
		<p>
		<big><strong>Keterangan Lulus/Tidak Lulus :</strong></big>
		<br>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
	    <td>
		<input name="tpfkd" type="hidden" value="'.$tpf_kd.'">
		<input name="swkd" type="hidden" value="'.$stdx_skkd.'">
		<input name="tpfthn1" type="hidden" value="'.$tpy_thn1.'">
		<input name="tpfthn2" type="hidden" value="'.$tpy_thn2.'">
		Tahun Pelajaran Baru : <strong>'.$tpy_thn1.'/'.$tpy_thn2.'</strong>,
		<select name="lulus">
		<option value="'.$lus_nilai.'" selected>'.$lus_ket.'</option>
		<option value="true">Lulus</option>
		<option value="false">Tidak Lulus</option>
		</select>
    	<input name="btnSMP7" type="submit" value="SIMPAN">
		</td>
		</tr>
		</table>
		</p>';
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