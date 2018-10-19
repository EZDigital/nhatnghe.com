<?php
class database{
	public $host="localhost";
	public $user="root";
	public $pass="";
	public $dbname="banhang";
	private $db;
	function __construct(){
	   $this->db = new mysqli ($this->host, $this->user, $this->pass, 
						$this->dbname);
	   $this->db->set_charset("utf8"); 
	} 
	//các method
	//Danh sach sản phẩm
	function ListSanPham(){
		$sql="select * from webtm_sanpham";
		$kq = $this->db->query($sql);	
		return $kq;
	}
	
	//lấy sản phẩm theo vị trí
	function ListSanPhamTheoViTri($vitri,$sp){
		$sql = "select * from webtm_sanpham limit $vitri,$sp";
		$kq = $this->db->query($sql);	
		return $kq;
	}
	
	
} //class dbcon
?> 
