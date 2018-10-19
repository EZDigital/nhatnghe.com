<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>Untitled Document</title>
   </head>
   <body>
      <?php
         require_once "database.php";
         $tt = new database;
         
         // Số sản phẩm ở mỗi trang
         $sp=10;
         //Tinh tong san pham:
         $kq = $tt->ListSanPham();
         $tsp = mysqli_num_rows($kq);
         
         
         //Tinh tong so trang:
         $tst=ceil($tsp/$sp); // ceil: hàm làm tròn
         
         //Tinh page hien hanh
         if(isset($_GET['page'])) {
         $page=$_GET['page']; 
         }
         else { 
         $page=1;
         }
         
         //Tinh vi tri lay san pham:
         $vitri=($page-1)*$sp;
         ?>
      <table width="600" border="1" style="margin:auto">
         <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Hình</th>
            <th>Mô Tả</th>
            <th>Giá</th>
         </tr>
         <?php 
            $i = 1;
            //Lay san pham theo vi tri:
            $kq2 = $tt->ListSanPhamTheoViTri($vitri,$sp);
            	
            while ($row = $kq2->fetch_assoc())
            {			
            ?>    
         <tr>
            <td align="center"><?php echo $i++; ?></td>
            <td> <?php echo $row['TenSP']; ?></td>
            <td align="center"><img src="<?php echo $row['UrlHinh'];?>" height="100px"/></td>
            <td> <?php echo $row['MoTa']; ?></td>
            <td align="right"><?php echo $row['Gia']."000đ"; ?></td>
         </tr>
         <?php 
            }
            ?>     
      </table>
      <p align="center">Trang: <?php for($i=1;$i<=$tst;$i++){
         if($i==$page)
         echo "<span style='font-size:20px;color:red; font-weight:bold;'>".$i."</span> &nbsp;";
         else
         echo "<a href='p.php?page=$i'>$i</a> &nbsp;"; 
         }?></p>
   </body>
</html>