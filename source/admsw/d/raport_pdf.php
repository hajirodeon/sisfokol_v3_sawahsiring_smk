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
require("../../inc/config.php"); 
require("../../inc/fungsi.php"); 
require("../../inc/koneksi.php"); 
require("../../inc/class/nilai.php");

nocache;

//nilai
$tapelkd = nosql($_REQUEST['tapelkd']);
$smtkd = nosql($_REQUEST['smtkd']);
$kelkd = nosql($_REQUEST['kelkd']);
$keahkd = nosql($_REQUEST['keahkd']);
$rukd = nosql($_REQUEST['rukd']);
$skkd = nosql($_REQUEST['skkd']);
$judul = "RAPORT";



//start class
$pdf=new PDF('P','mm','A4');
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetTitle($judul);
$pdf->SetAuthor($author);
$pdf->SetSubject($description);
$pdf->SetKeywords($keywords);

//data diri
$qd = mysql_query("SELECT m_siswa.*, siswa_kelas.* ".
					"FROM m_siswa, siswa_kelas ".
					"WHERE siswa_kelas.kd_siswa = m_siswa.kd ".
					"AND siswa_kelas.kd = '$skkd'");
$rd = mysql_fetch_assoc($qd);
$nama = balikin2($rd['nama']);
$nis = nosql($rd['nis']);


//kelas
$qk = mysql_query("SELECT * FROM m_kelas ".
					"WHERE kd = '$kelkd'");
$rk = mysql_fetch_assoc($qk);
$rkel = nosql($rk['kelas']);


//keahlian
$qpro = mysql_query("SELECT * FROM m_keahlian ".
					"WHERE kd = '$keahkd'");
$rpro = mysql_fetch_assoc($qpro);
$pro_bidang = balikin($rpro['bidang']);
$pro_program = balikin($rpro['program']);
$pro_keah = "$pro_bidang - $pro_program";



//ruang
$qu = mysql_query("SELECT * FROM m_ruang ".
					"WHERE kd = '$rukd'");
$ru = mysql_fetch_assoc($qu);
$rru = balikin($ru['ruang']);
$kelas = "$rkel-$rru";


//smt
$qmt = mysql_query("SELECT * FROM m_smt ".
					"WHERE kd = '$smtkd'");
$rmt = mysql_fetch_assoc($qmt);
$smt = balikin($rmt['smt']);

//tapel
$qtp = mysql_query("SELECT * FROM m_tapel ".
					"WHERE kd = '$tapelkd'");
$rtp = mysql_fetch_assoc($qtp);
$thn1 = nosql($rtp['tahun1']);
$thn2 = nosql($rtp['tahun2']);
$tapel = "$thn1/$thn2";

//walikelas
$qwk = mysql_query("SELECT m_walikelas.*, m_pegawai.* ".
						"FROM m_walikelas, m_pegawai ".
						"WHERE m_walikelas.kd_pegawai = m_pegawai.kd ".
						"AND m_walikelas.kd_tapel = '$tapelkd' ".
						"AND m_walikelas.kd_kelas = '$kelkd' ".
						"AND m_walikelas.kd_keahlian = '$keahkd' ".
						"AND m_walikelas.kd_ruang = '$rukd'");
$rwk = mysql_fetch_assoc($qwk);
$nwk = balikin2($rwk['nama']);



///////////////////////////////////////////////////////// HALAMAN I //////////////////////////////////////////////////////////////////////

//header page ///////////////////////////////////////////
$pdf->SetY(10);
$pdf->SetX(10);
$pdf->Headerku();


//header table //////////////////////////////////////////
$htg = 15; //tinggi
$hkr = 5; //dari kiri
$pdf->SetFont('Times','B',7);

//posisi
$pdf->SetY(45);
$pdf->SetFillColor(233,233,233);

//no
$pdf->SetX(10);
$pdf->Cell(5,15,'NO.',1,0,'C',1);

//prog_pddkn
$pdf->SetX(15);
$pdf->Cell(45,15,'K O M P O N E N',1,0,'C',1);

//kkm
$pdf->SetX(60);
$pdf->Cell(15,10,'K K M',1,0,'C',1);

//angka
$pdf->SetY(55);
$pdf->SetX(60);
$pdf->Cell(15,5,'Angka',1,0,'C',1);

//nilai hasil belajar
$pdf->SetY(45);
$pdf->SetX(75);
$pdf->Cell(105,5,'Nilai Hasil Belajar',1,0,'C',1);

//kognitif
$pdf->SetY(50);
$pdf->SetX(75);
$pdf->Cell(45,5,'Pengetahuan',1,0,'C',1);

//angka
$pdf->SetY(55);
$pdf->SetX(75);
$pdf->Cell(10,5,'Angka',1,0,'C',1);

//huruf
$pdf->SetY(55);
$pdf->SetX(85);
$pdf->Cell(35,5,'Huruf',1,0,'C',1);

//psikomotorik
$pdf->SetY(50);
$pdf->SetX(120);
$pdf->Cell(45,5,'Praktik',1,0,'C',1);

//angka
$pdf->SetY(55);
$pdf->SetX(120);
$pdf->Cell(10,5,'Angka',1,0,'C',1);

//huruf
$pdf->SetY(55);
$pdf->SetX(130);
$pdf->Cell(35,5,'Huruf',1,0,'C',1);

//afektif
$pdf->SetY(50);
$pdf->SetX(165);
$pdf->Cell(15,5,'Sikap',1,0,'C',1);

//predikat
$pdf->SetY(55);
$pdf->SetX(165);
$pdf->Cell(15,5,'Predikat',1,0,'C',1);
/////////////////////////////////////////////////////////



//mapel /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$pdf->SetFillColor(233,233,233);
$pdf->SetY(60);
$pdf->SetX(10);
$pdf->Cell(5,5,'A.',1,0,'C',1);

$pdf->SetX(15);
$pdf->Cell(165,5,'Program Pendidikan',1,0,'L',1);



//jenis
$pdf->SetY(65);
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('Times','',7);

//query
$qjnsp = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
						"ORDER BY round(no) ASC");
$rjnsp = mysql_fetch_assoc($qjnsp);
$tjnsp = mysql_num_rows($qjnsp);


do
	{
	//nilai - jenis
	$jnsp_kd = nosql($rjnsp['kd']);
	$jnsp_no = nosql($rjnsp['no']);
	$jnsp_jenis = balikin($rjnsp['jenis']);
	
	$pdf->SetFont('Times','B',7);
	$pdf->Cell(170,5,$jnsp_jenis,1,0,'L');	
	$pdf->Ln();
	
	
	//data mapel
	$pdf->SetFont('Times','',7);
	
	//query
	$qpel = mysql_query("SELECT m_prog_pddkn.*, m_prog_pddkn.kd AS pelkd, m_prog_pddkn_kelas.* ".
							"FROM m_prog_pddkn, m_prog_pddkn_kelas ".
							"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
							"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
							"AND m_prog_pddkn_kelas.kd_keahlian = '$keahkd' ".
							"AND m_prog_pddkn.kd_jenis = '$jnsp_kd' ".
							"ORDER BY m_prog_pddkn.prog_pddkn ASC"); 
	$rpel = mysql_fetch_assoc($qpel);
	$tpel = mysql_num_rows($qpel);

	//jika nol
	if (empty($tpel))
		{
		$tpel = 1;
		}


	do
		{
		//nilai
		$pelkd = nosql($rpel['pelkd']);
		$pel = substr(balikin2($rpel['xpel']),0,35);
		$pel_kkm = nosql($rpel['kkm']);
		
		//mapel /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//posisi
		$pdf->SetX(10);
		$nilY = 5;

		//jika jnsno = 1
		if ($jnsp_no == 1)
			{
			$j = $j + 1;
			$pdf->Cell(5,$nilY,"$j.",1,0,'C');
			}
		//jika jnsno = 2
		else if ($jnsp_no == 2)
			{
			$k = $k + 1;
			$pdf->Cell(5,$nilY,"$k.",1,0,'C');
			}
		//jika jnsno = 3
		else if ($jnsp_no == 3)
			{
			$m = $m + 1;
			$pdf->Cell(5,$nilY,"$m.",1,0,'C');
			}

		$pdf->Cell(45,$nilY,$pel,1,0,'L');
	
		//nilainya...
		$qpelx = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$pelkd'");
		$rpelx = mysql_fetch_assoc($qpelx);
		$tpelx = mysql_num_rows($qpelx);
	
		//jika ada
		if ($tpelx != 0)
			{
			$pelx_kognitif = nosql($rpelx['total_kognitif']);
			$pelx_psikomotorik = nosql($rpelx['total_psikomotorik']);
			$pelx_sikap = nosql($rpelx['sikap']);
			}
		else
			{
			$pelx_kognitif = "-";
			$pelx_psikomotorik = "-";
			$pelx_sikap = "-";
			}
	
	
		$pdf->Cell(15,$nilY,$pel_kkm,1,0,'L');
		$pdf->Cell(10,$nilY,$pelx_kognitif,1,0,'L');
		$pdf->Cell(35,$nilY,xongkof($pelx_kognitif),1,0,'L');
		$pdf->Cell(10,$nilY,$pelx_psikomotorik,1,0,'L');
		$pdf->Cell(35,$nilY,xongkof($pelx_psikomotorik),1,0,'L');
		$pdf->Cell(15,$nilY,$pelx_sikap,1,0,'L');
		$pdf->Ln();
		}
	while ($rpel = mysql_fetch_assoc($qpel));
	}
while ($rjnsp = mysql_fetch_assoc($qjnsp));




//jumlah nilai //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$pdf->SetFillColor(255,255,255);
$pdf->SetX(10);
$pdf->Cell(5,15,'',1,0,'C',1);

//nilaine...
$qnilx = mysql_query("SELECT * FROM siswa_rangking ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_tapel = '$tapelkd' ".
						"AND kd_keahlian = '$keahkd' ".
						"AND kd_kelas = '$kelkd' ".
						"AND kd_ruang = '$rukd' ".
						"AND kd_smt = '$smtkd'");
$rnilx = mysql_fetch_assoc($qnilx);
$tnilx = mysql_num_rows($qnilx);
$nilx_total_kognitif = nosql($rnilx['total_kognitif']);
$nilx_rata_kognitif = nosql($rnilx['rata_kognitif']);
$nilx_total_psikomotorik = nosql($rnilx['total_psikomotorik']);
$nilx_rata_psikomotorik = nosql($rnilx['rata_psikomotorik']);
$nilx_rangking = nosql($rnilx['rangking']);


//jumlah siswa sekelas
$qjks = mysql_query("SELECT * FROM siswa_kelas ".
						"WHERE kd_tapel = '$tapelkd' ".
						"AND kd_keahlian = '$keahkd' ".
						"AND kd_kelas = '$kelkd' ".
						"AND kd_ruang = '$rukd'");
$rjks = mysql_fetch_assoc($qjks);
$tjks = mysql_num_rows($qjks);


//peringkat ke...
$jks_nilx_rangking = xongkof($nilx_rangking);
$jks_tjks = xongkof($tjks);
$jks_rangking = "$nilx_rangking ( $jks_nilx_rangking) dari $tjks ( $jks_tjks) siswa";




//jumlah nilai
$pdf->SetX(15);
$pdf->SetFont('Times','',5);
$pdf->Cell(45,5,'Jumlah Nilai :',1,0,'R');
$pdf->Cell(15,5,'-',1,0,'L');
$pdf->Cell(10,5,$nilx_total_kognitif,1,0,'L');
$pdf->Cell(35,5,xongkof($nilx_total_kognitif),1,0,'L');
$pdf->Cell(10,5,$nilx_total_psikomotorik,1,0,'L');
$pdf->Cell(35,5,xongkof($nilx_total_psikomotorik),1,0,'L');
$pdf->Cell(15,5,'-',1,0,'L');

//nilai rata - rata
$pdf->Ln();
$pdf->SetX(15);
$pdf->SetFont('Times','',5);
$pdf->Cell(45,5,'Nilai Rata - Rata :',1,0,'R');
$pdf->Cell(15,5,'-',1,0,'L');
$pdf->Cell(10,5,$nilx_rata_kognitif,1,0,'L');
$pdf->Cell(35,5,xongkof($nilx_rata_kognitif),1,0,'L');
$pdf->Cell(10,5,$nilx_rata_psikomotorik,1,0,'L');
$pdf->Cell(35,5,xongkof($nilx_rata_psikomotorik),1,0,'L');
$pdf->Cell(15,5,'-',1,0,'L');

//peringkat ke...
$pdf->Ln();
$pdf->SetX(15);
$pdf->SetFont('Times','',5);
$pdf->Cell(45,5,'Peringkat Ke :',1,0,'R');
$pdf->Cell(120,5,$jks_rangking,1,0,'C');





//Tanda tangan dan tgl ////////////////////////////////////////
$pdf->SetFont('Times','B',10);

$pdf->SetY($pdf->GetY()+15);
$pdf->SetX(130);
$nil_tgl = "$sek_kota, $tanggal $arrbln1[$bulan] $tahun";
$pdf->Cell(50,5,$nil_tgl,0,0,'R');

$pdf->SetY($pdf->GetY()+10);
$pdf->SetX(75);
$pdf->Cell(50,5,'Mengetahui',0,0,'C');

$pdf->SetY($pdf->GetY()+5);
$pdf->SetX(10);
$pdf->Cell(50,5,'Orang Tua / Wali Peserta Didik',0,0,'C');

$pdf->SetX(75);
$pdf->Cell(50,5,'Kepala Sekolah',0,0,'C');

$pdf->SetX(130);
$pdf->Cell(50,5,'Wali Kelas',0,0,'C');

$pdf->SetY($pdf->GetY()+20);
$pdf->SetX(10);

//ortu
$pdf->SetX(11);
$pdf->Cell(50,2,'(....................................)',0,0,'C');


//kepala sekolah
$qks = mysql_query("SELECT admin_ks.*, m_pegawai.* ".
						"FROM admin_ks, m_pegawai ".
						"WHERE admin_ks.kd_pegawai = m_pegawai.kd");
$rks = mysql_fetch_assoc($qks);
$tks = mysql_num_rows($qks);
$ks_nip = nosql($rks['nip']);
$ks_nama = balikin($rks['nama']);

//posisi
$pdf->SetX(75);
$pdf->Cell(50,2,'(...'.$ks_nama.'...)',0,0,'C');


//wali kelas
if (empty($nwk))
	{
	$pdf->SetX(130);
	$pdf->Cell(50,2,'(....................................)',0,0,'C'); 
	}
else
	{
	$pdf->SetX(130);
	$pdf->Cell(50,2,'(...'.$nwk.'...)',0,0,'C'); 
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////// HALAMAN II ///////////////////////////////////////////////////////////////////
$pdf->AddPage();

//header page ///////////////////////////////////////////
$pdf->SetY(10);
$pdf->SetX(10);
$pdf->Headerku();


//header table //////////////////////////////////////////
$htg = 15; //tinggi
$hkr = 5; //dari kiri
$pdf->SetFont('Times','B',7);

//posisi
$pdf->SetY(45);
$pdf->SetFillColor(233,233,233);

//no
$pdf->SetX(10);
$pdf->Cell(5,10,'NO.',1,0,'C',1);

//prog_pddkn
$pdf->SetX(15);
$pdf->Cell(45,10,'K O M P O N E N',1,0,'C',1);

//kompetensi
$pdf->SetX(60);
$pdf->Cell(120,10,'KETERCAPAIAN KOMPETENSI',1,0,'C',1);
/////////////////////////////////////////////////////////



//prog_pddkn /////////////////////////////////////////////////
$pdf->SetFillColor(233,233,233);
$pdf->Ln();
$pdf->SetX(10);
$pdf->Cell(5,7,'B.',1,0,'C',1);

$pdf->SetX(15);
$pdf->Cell(165,7,'Program Pendidikan',1,0,'L',1);


$pdf->Ln();
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('Times','',7);


//query
$qjnsp = mysql_query("SELECT * FROM m_prog_pddkn_jns ".
						"ORDER BY round(no) ASC");
$rjnsp = mysql_fetch_assoc($qjnsp);
$tjnsp = mysql_num_rows($qjnsp);


do
	{
	//nilai - jenis
	$jnsp_kd = nosql($rjnsp['kd']);
	$jnsp_no = nosql($rjnsp['no']);
	$jnsp_jenis = balikin($rjnsp['jenis']);
	
	$pdf->SetFont('Times','B',7);
	$pdf->Cell(170,5,$jnsp_jenis,1,0,'L');
	$pdf->Ln();
	
	
	//data mapel
	$pdf->SetFont('Times','',7);
	
	//query
	$qpel = mysql_query("SELECT m_prog_pddkn.*, m_prog_pddkn.kd AS pelkd, m_prog_pddkn_kelas.* ".
							"FROM m_prog_pddkn, m_prog_pddkn_kelas ".
							"WHERE m_prog_pddkn_kelas.kd_prog_pddkn = m_prog_pddkn.kd ".
							"AND m_prog_pddkn_kelas.kd_kelas = '$kelkd' ".
							"AND m_prog_pddkn_kelas.kd_keahlian = '$keahkd' ".
							"AND m_prog_pddkn.kd_jenis = '$jnsp_kd' ".
							"ORDER BY m_prog_pddkn.prog_pddkn ASC"); 
	$rpel = mysql_fetch_assoc($qpel);
	$tpel = mysql_num_rows($qpel);

	//jika nol
	if (empty($tpel))
		{
		$tpel = 1;
		}


	do
		{
		//nilai
		$pelkd = nosql($rpel['pelkd']);
		$pel = substr(balikin2($rpel['xpel']),0,35);
		$pel_kkm = nosql($rpel['kkm']);
		
		//mapel /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//posisi
		$pdf->SetX(10);
		$nilY = 5;

		//jika jnsno = 1
		if ($jnsp_no == 1)
			{
			$n = $n + 1;
			$pdf->Cell(5,$nilY,"$n.",1,0,'C');
			}
		//jika jnsno = 2
		else if ($jnsp_no == 2)
			{
			$o = $o + 1;
			$pdf->Cell(5,$nilY,"$o.",1,0,'C');
			}
		//jika jnsno = 3
		else if ($jnsp_no == 3)
			{
			$p = $p + 1;
			$pdf->Cell(5,$nilY,"$p.",1,0,'C');
			}



		//kompetensi
		//nh1
		$qnh1 = mysql_query("SELECT * FROM siswa_nh_rata ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$pelkd' ".
								"AND nilkd = 'NH1'");
		$rnh1 = mysql_fetch_assoc($qnh1);
		$x_nh1 = nosql($rnh1['nilai']);
		
		//nh2
		$qnh2 = mysql_query("SELECT * FROM siswa_nh_rata ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$pelkd' ".
								"AND nilkd = 'NH2'");
		$rnh2 = mysql_fetch_assoc($qnh2);
		$x_nh2 = nosql($rnh2['nilai']);
	
		//nh3-nya
		$qnh3 = mysql_query("SELECT * FROM siswa_nh_rata ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$pelkd' ".
								"AND nilkd = 'NH3'");
		$rnh3 = mysql_fetch_assoc($qnh3);
		$x_nh3 = nosql($rnh3['nilai']);
	
	
		//uts dan uas
		$qtss = mysql_query("SELECT * FROM siswa_nilai_prog_pddkn ".
								"WHERE kd_siswa_kelas = '$skkd' ".
								"AND kd_smt = '$smtkd' ".
								"AND kd_prog_pddkn = '$pelkd'");
		$rtss = mysql_fetch_assoc($qtss);
		$x_uts = nosql($rtss['uts']);
		$x_uas = nosql($rtss['uas']);
		
			
		//deskripsi NH1 //////////////////////////////////////
		if ($x_nh1 < $pel_kkm)
			{
			$nh1_ket = "SK1 Belum Tercapai";
			}
		else if ($x_nh1 == $pel_kkm)
			{
			$nh1_ket = "SK1 Tercapai";
			}
		else if ($x_nh1 > $pel_kkm)
			{
			$nh1_ket = "SK1 Terlampaui";
			}
			
				
		//deskripsi NH2 //////////////////////////////////////
		if ($x_nh2 < $pel_kkm)
			{
			$nh2_ket = "SK2 Belum Tercapai";
			}
		else if ($x_nh2 == $pel_kkm)	
			{
			$nh2_ket = "SK2 Tercapai";
			}
		else if ($x_nh2 > $pel_kkm)
			{
			$nh2_ket = "SK2 Terlampaui";
			}
				
			
		//deskripsi NH3 //////////////////////////////////////
		if ($x_nh3 < $pel_kkm)
			{
			$nh3_ket = "SK3 Belum Tercapai";
			}
		else if ($x_nh3 == $pel_kkm)
			{
			$nh3_ket = "SK3 Tercapai";
			}
		else if ($x_nh3 > $pel_kkm)
			{
			$nh3_ket = "SK3 Terlampaui";
			}
			
			
		//deskripsi UTS //////////////////////////////////////
		if ($x_uts < $pel_kkm)
			{
			$uts_ket = "SK4 Belum Tercapai";
			}
		else if ($x_uts == $pel_kkm)
			{
			$uts_ket = "SK4 Tercapai";
			}
		else if ($x_uts > $pel_kkm)
			{
			$uts_ket = "SK4 Terlampaui";
			}
			
				
		//deskripsi UAS //////////////////////////////////////
		if ($x_uas < $pel_kkm)
			{
			$uas_ket = "SK5 Belum Tercapai";
			}
		else if ($x_uas == $pel_kkm)
			{
			$uas_ket = "SK5 Tercapai";
			}
		else if ($x_uas > $pel_kkm)
			{
			$uas_ket = "SK5 Terlampaui";
			}
			
			
			
		//ket kompetensi 
		$ket_k = "$nh1_ket, $nh2_ket, $nh3_ket, $uts_ket, $uas_ket";
		
		
		$pdf->Cell(45,$nilY,$pel,1,0,'L');
		$pdf->Cell(120,5,$ket_k,1,0,'L');		
		$pdf->Ln();
		}
	while ($rpel = mysql_fetch_assoc($qpel));
	}
while ($rjnsp = mysql_fetch_assoc($qjnsp));











////////////////////////////////////////////////////////// HALAMAN III //////////////////////////////////////////////////////////////////
//halaman ketiga /////////////////////////////////////////
$pdf->AddPage();

//header page/////////////////////////////////////////////
$pdf->SetY(10);
$pdf->SetX(10);
$pdf->Headerku();



//ekstra /////////////////////////////////////////////////
//posisi
$pdf->SetY(45);

//font & color
$pdf->SetFillColor(233,233,233);
$pdf->SetFont('Times','B',7);

//no
$pdf->SetX(10);
$pdf->Cell(5,5,'C',1,0,'C',1);

$pdf->SetX(15);
$pdf->Cell(50,5,'Pengembangan Diri ',1,0,'L',1);

$pdf->SetX(65);
$pdf->Cell(15,5,'Predikat',1,0,'C',1);

$pdf->SetX(80);
$pdf->Cell(100,5,'Keterangan',1,0,'C',1);


$pdf->Ln();
$pdf->SetFillColor(255,255,255);

//daftar ekstra yang diikuti
$qkuti = mysql_query("SELECT siswa_ekstra.*, siswa_ekstra.kd AS sekd, m_ekstra.* ".
						"FROM siswa_ekstra, m_ekstra ".
						"WHERE siswa_ekstra.kd_ekstra = m_ekstra.kd ".
						"AND siswa_ekstra.kd_siswa_kelas = '$skkd' ".
						"AND siswa_ekstra.kd_smt = '$smtkd' ".
						"ORDER BY m_ekstra.ekstra ASC");
$rkuti = mysql_fetch_assoc($qkuti);
$tkuti = mysql_num_rows($qkuti);

do
	{
	$pdf->SetX(10);
	
	$nomx = $nomx + 1;
	$kuti_kd = nosql($rkuti['sekd']);
	$kuti_ekstra = balikin($rkuti['ekstra']);
	$kuti_ekstrax = "$nomx. $kuti_ekstra";
	$kuti_predikat = nosql($rkuti['predikat']);
	$kuti_ket = balikin($rkuti['ket']);
			
	$pdf->Cell(5,5,'',1,0,'C',1);
	$pdf->Cell(50,5,$kuti_ekstrax,1,0,'L',1);
	$pdf->Cell(15,5,$kuti_predikat,1,0,'C',1);
	$pdf->Cell(100,5,$kuti_ket,1,0,'L',1);
	$pdf->Ln();
	}
while ($rkuti = mysql_fetch_assoc($qkuti));




//absensi ///////////////////////////////////////////////
//posisi
$pdf->Ln();
$pdf->SetFillColor(233,233,233);
$pdf->SetFont('Times','B',7);

//no
$pdf->SetX(10);
$pdf->Cell(5,5,'D',1,0,'C',1);

$pdf->SetX(15);
$pdf->Cell(50,5,'Ketidakhadiran',1,0,'L',1);

$pdf->SetX(65);
$pdf->Cell(115,5,'Jumlah Hari',1,0,'L',1);


$pdf->Ln();
$pdf->SetFillColor(255,255,255);

//absensi
$qabs = mysql_query("SELECT * FROM m_absensi ".
						"ORDER BY absensi ASC");
$rabs = mysql_fetch_assoc($qabs);
$tabs = mysql_num_rows($qabs);

do
	{
	$pdf->SetX(10);

	$nomxz = $nomxz + 1;	
	$abs_kd = nosql($rabs['kd']);
	$abs_absensi = balikin($rabs['absensi']);
	$abs_absensix = "$nomxz. $abs_absensi";
			
	//jml. absensi...
	$qbsi = mysql_query("SELECT * FROM siswa_absensi ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_absensi = '$abs_kd'");
	$rbsi = mysql_fetch_assoc($qbsi);
	$tbsi = mysql_num_rows($qbsi);
	
	//nek null
	if (empty($tbsi))
		{
		$tbsix = "- hari";
		}
	else
		{
		$tbsix = "$tbsi hari";
		}
		
		
	
	$pdf->Cell(5,5,'',1,0,'C',1);
	$pdf->Cell(50,5,$abs_absensix,1,0,'L',1);
	$pdf->Cell(115,5,$tbsix,1,0,'L',1);
	$pdf->Ln();
	}
while ($rabs = mysql_fetch_assoc($qabs));




//pribadi ///////////////////////////////////////////////
//posisi
$pdf->Ln();
$pdf->SetFillColor(233,233,233);
$pdf->SetFont('Times','B',7);

//no
$pdf->SetX(10);
$pdf->Cell(5,5,'E',1,0,'C',1);

$pdf->SetX(15);
$pdf->Cell(50,5,'Kepribadian',1,0,'L',1);

$pdf->SetX(65);
$pdf->Cell(15,5,'Predikat',1,0,'C',1);

$pdf->SetX(80);
$pdf->Cell(100,5,'Keterangan',1,0,'C',1);


$pdf->Ln();
$pdf->SetFillColor(255,255,255);

//daftar pribadi
$qpri = mysql_query("SELECT * FROM m_pribadi ".
						"ORDER BY pribadi ASC");
$rpri = mysql_fetch_assoc($qpri);
$tpri = mysql_num_rows($qpri);

do
	{
	$pdf->SetX(10);

	$nomuz = $nomuz + 1;	
	$pri_kd = nosql($rpri['kd']);
	$pri_pribadi = balikin($rpri['pribadi']);
	$pri_pribadix = "$nomuz. $pri_pribadi";
		
	//pribadinya...
	$qprix = mysql_query("SELECT * FROM siswa_pribadi ".
							"WHERE kd_siswa_kelas = '$skkd' ".
							"AND kd_smt = '$smtkd' ".
							"AND kd_pribadi = '$pri_kd'");
	$rprix = mysql_fetch_assoc($qprix);
	$tprix = mysql_num_rows($qprix);
	$prix_predikat = nosql($rprix['predikat']);
	$prix_ket = balikin($rprix['ket']);
	
	
	$pdf->Cell(5,5,'',1,0,'C',1);
	$pdf->Cell(50,5,$pri_pribadix,1,0,'L',1);
	$pdf->Cell(15,5,$prix_predikat,1,0,'C',1);
	$pdf->Cell(100,5,$prix_ket,1,0,'L',1);
	$pdf->Ln();
	}
while ($rpri = mysql_fetch_assoc($qpri));



//catatan ///////////////////////////////////////////////
//posisi
$pdf->Ln();
$pdf->SetFillColor(233,233,233);
$pdf->SetFont('Times','B',7);

//catatan
$qcatx = mysql_query("SELECT * FROM siswa_catatan ".
						"WHERE kd_siswa_kelas = '$skkd' ".
						"AND kd_smt = '$smtkd'");
$rcatx = mysql_fetch_assoc($qcatx);
$tcatx = mysql_num_rows($qcatx);
$catx_catatan = balikin($rcatx['catatan']);

//posisi
$pdf->SetX(10);
$pdf->Cell(170,5,'Catatan Wali Kelas',1,0,'L',1);

$pdf->Ln();
$pdf->SetX(10);
$pdf->SetFillColor(255,255,255);
$pdf->Cell(170,30,$catx_catatan,1,0,'C',1);


	
		

//naik ato lulus, ///////////////////////////////////////////////
//posisi
$pdf->Ln();
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('Times','B',7);


//tapel
$qtpx = mysql_query("SELECT * FROM m_tapel ".
						"WHERE kd = '$tapelkd'");
$rowtpx = mysql_fetch_assoc($qtpx);
$tpx_kd = nosql($rowtpx['kd']);
$tpx_thn1 = nosql($rowtpx['tahun1']);
$tpx_thn2 = nosql($rowtpx['tahun2']);



//kelas
$qbtx = mysql_query("SELECT * FROM m_kelas ".
						"WHERE kd = '$kelkd'");
$rowbtx = mysql_fetch_assoc($qbtx);
$btxkd = nosql($rowbtx['kd']);
$btxno = nosql($rowbtx['no']);
$btxkelas = nosql($rowbtx['kelas']);

//smt
$qstx = mysql_query("SELECT * FROM m_smt ".
						"WHERE kd = '$smtkd'");
$rowstx = mysql_fetch_assoc($qstx);
$stx_kd = nosql($rowstx['kd']);
$stx_no = nosql($rowstx['no']);
$stx_smt = nosql($rowstx['smt']);

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
		
	
	//naik...?
	$qnuk = mysql_query("SELECT * FROM siswa_naik ".
							"WHERE kd_siswa_kelas = '$skkd'");
	$rnuk = mysql_fetch_assoc($qnuk);
	$nuk_naik = nosql($rnuk['naik']);
		
		
	if ($nuk_naik == "true")
		{
		//posisi
		$pdf->Ln();
		$pdf->SetX(10);
		$pdf->Cell(170,5,'Keterangan Kenaikan Kelas : NAIK',1,0,'L',1);
		}
	else if ($nuk_naik == "false")
		{
		//posisi
		$pdf->Ln();
		$pdf->SetX(10);
		$pdf->Cell(170,5,'Keterangan Kenaikan Kelas : TIDAK NAIK',1,0,'L',1);
		}
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
		//posisi
		$pdf->Ln();
		$pdf->SetX(10);
		$pdf->Cell(170,5,'Telah menyelesaikan seluruh Program Pembelajaran di $sek_nama, sampai kelas XII',1,0,'L',1);
		}
	else if ($lus_nilai == "false")
		{
		//posisi
		$pdf->Ln();
		$pdf->SetX(10);
		$pdf->Cell(170,5,'TIDAK LULUS',1,0,'L',1);
		}
	}












//Tanda tangan dan tgl ////////////////////////////////////////
$pdf->SetFont('Times','B',10);

$pdf->SetY($pdf->GetY()+50);
$pdf->SetX(130);
$nil_tgl = "$sek_kota, $tanggal $arrbln1[$bulan] $tahun";
$pdf->Cell(50,5,$nil_tgl,0,0,'R');

$pdf->SetY($pdf->GetY()+10);
$pdf->SetX(75);
$pdf->Cell(50,5,'Mengetahui',0,0,'C');

$pdf->SetY($pdf->GetY()+5);
$pdf->SetX(10);
$pdf->Cell(50,5,'Orang Tua / Wali Peserta Didik',0,0,'C');

$pdf->SetX(75);
$pdf->Cell(50,5,'Kepala Sekolah',0,0,'C');

$pdf->SetX(130);
$pdf->Cell(50,5,'Wali Kelas',0,0,'C');

$pdf->SetY($pdf->GetY()+20);
$pdf->SetX(10);

//ortu
$pdf->SetX(11);
$pdf->Cell(50,2,'(....................................)',0,0,'C');


//kepala sekolah
$qks = mysql_query("SELECT admin_ks.*, m_pegawai.* ".
						"FROM admin_ks, m_pegawai ".
						"WHERE admin_ks.kd_pegawai = m_pegawai.kd");
$rks = mysql_fetch_assoc($qks);
$tks = mysql_num_rows($qks);
$ks_nip = nosql($rks['nip']);
$ks_nama = balikin($rks['nama']);

//posisi
$pdf->SetX(75);
$pdf->Cell(50,2,'(...'.$ks_nama.'...)',0,0,'C');


//wali kelas
if (empty($nwk))
	{
	$pdf->SetX(130);
	$pdf->Cell(50,2,'(....................................)',0,0,'C'); 
	}
else
	{
	$pdf->SetX(130);
	$pdf->Cell(50,2,'(...'.$nwk.'...)',0,0,'C'); 
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







	
//output-kan ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$pdf->Output("raport_$nis.pdf",I);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>