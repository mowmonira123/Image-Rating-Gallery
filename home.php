<?php
require_once('config.php'); 
if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>

<!DOCTYPE html>
<html>
<head>
<title>gallery</title>

<style type="text/css">
	.star_rated { color: gold; }
	.star {text-shadow: 0 0 1px #F48F0A; cursor: pointer;  }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
function ratestar(id, rate){
  $.post( "rating.php", { fName: 'update', proid: id, rating: rate })
  .done(function( data ) {
    //alert( "Data Loaded: " + data );
    location.reload();
  });
}
</script>
</head>
<body>
<?php
	include 'rating.php';
	$db = new Rating();
	$data = $db->select();
?>
      
 <div class="row row-cols-4 row-cols-md-3 row-cols-sm-1 row-cols-lg-4 py-2">
  
  <?php
       foreach($data as $pro) {
  ?>

  <div class="col p-2 item">
    <a href="javascript:void(0)" data-id="<?php echo $pro[4] ?>" class="img-item">
      <div class='img-view'>
        <img src="<?php echo validate_image($pro[4]) ?>" class="img-thumbnail img-fluid img-thumb" alt="img" loading="lazy">
      </div>
    </a>
     
     <div id="card-body">
        <div class="star">
	<?php
	for($i = 1; $i <= 5; $i++) {
	if($i <= $pro[3]) {
	?>
	<span class="star_rated" onclick="ratestar(<?php echo $pro[0]; ?>, <?php echo $i; ?>)">&#x2605;</span>
	<?php }  else {  ?>
	<span onclick="ratestar(<?php echo $pro[0]; ?>, <?php echo $i; ?>)">&#x2605;</span>
	<?php  }
	}
	?>
	</div>
       Rating : <span id='numeric_rating_<?php echo $product_id; ?>'><?php echo $pro[3]; ?></span> 
        </div>
  </div>
  
  <?php } ?>
</div>

</body>
</html>