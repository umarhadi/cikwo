<?php include 'protect.php'; ?>X
<h2>Ubah Status Pembelian</h2>
<?php 
	$query=$conn->query("SELECT * FROM pembelian WHERE id_pembelian='$_GET[id]'");
	$data=$query->fetch_assoc();
?>
<form role="form" method="POST">
	<div class="form-group">
        <select class="form-control" name="status">
            <option value="dibayar">Dibayar</option>
            <option value="batal">Batal</option>
        </select>
	</div>
	<button class="btn btn-primary" name="submit">Ubah</button>
</form>
<?php 
	if (isset($_POST['submit'])) {
		$query = $conn->query("UPDATE pembelian SET status='$_POST[status]' WHERE id_pembelian='$_GET[id]'");
		echo "<script>location='index.php?halaman=pembelian';</script>";
	}
?>