<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>Untitled Document</title>
   </head>
   <body>
      <?php 
         include_once('db.php');
         $TTCS = new database;
         $res_CS = $TTCS->listCasi();
         
         ?>
      <h1>Ca Lẻ</h1>
      <?php while ($DSCS=$res_CS->fetch_assoc()) { ?>
      <ul>
         <?php $res_BH = $TTCS->listBaiHat($DSCS['idCS']); ?>
         <?php if (mysqli_num_rows($res_BH) >=1) { ?>
         <li>
            <?php echo $DSCS["HoTenCS"]; ?>
            <?php while ($DSBH=$res_BH->fetch_assoc()) { ?>            	
            <ol><?php echo $DSBH["TenBH"];?></ol>
            <?php } ?>
            <?php } ?>
         </li>
      </ul>
      <?php } ?>
   </body>
</html>
