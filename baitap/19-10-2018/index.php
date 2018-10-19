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
$kq = $tt->ListSanPham();
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
		while ($row = $kq->fetch_assoc())
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

  
</body>
</html>