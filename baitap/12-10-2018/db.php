<?php
   class database {
   
   	public $host = "localhost";
   	public $user = "root";
   	public $pass = "";
   	public $dbname = "webphp";
   	private $db;
   
   		function __construct(){
   			$this->db = new mysqli( $this->host, $this->user, $this->pass, $this->dbname);
   			$this->db->set_charset("utf8");
   		}
   
   		function listCasi() {
   			$sql= "SELECT idCS, HoTenCS FROM webnhac_casi";
   			$res = $this->db->query($sql);
   			return $res;
   			}
   		function listBaiHat($idCS) {
   			$sql= "SELECT idBH, TenBH, idCS FROM webnhac_baihat Where idCS={$idCS}";
   			$res = $this->db->query($sql);
   			return $res;
   			}			
   }
   
   ?>
