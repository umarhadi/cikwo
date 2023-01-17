<?php
include 'protect.php';
include '../des/encrypt.php';
?>
<h2>Detail Pembelian</h2>
<?php
$query = $conn->query("SELECT * FROM pembelian JOIN pelanggan ON
	pembelian.id_pelanggan=pelanggan.id_pelanggan
	WHERE pembelian.id_pembelian='$_GET[id]'");

$detail = $query->fetch_assoc();

$encrypt_result = [
	'tanggal' => trim($detail['tanggal_pembelian']),
	'bayar' => trim($detail['total_pembelian'])
];

$decrypt_result = array();

$desModule = new Encrypt();

foreach ($encrypt_result as $key => $value) {
	$plaintext = "";
	$ciphertext = "";

	$arr_ciphertext = str_split($value, 64);

	foreach ($arr_ciphertext as $i) {
		$decrypt = $desModule->decrypt($i, '12345678');
		$plaintext .= $desModule->read_bin($decrypt);
		$ciphertext .= $desModule->read_bin($i);
	}

	$decrypt_result[$key] = $plaintext;
}
?>
<p><strong><?php echo $detail['nama_pelanggan']; ?></strong><br></p>
<p>
	Nomer Telepon: <?php echo $detail['telepon_pelanggan']; ?><br>
	Email: <?php echo $detail['email_pelanggan']; ?>
</p>
<p>
	Tanggal : <?php echo $decrypt_result['tanggal']; ?><br>
	Total : Rp.<?php echo number_format(intval($decrypt_result['bayar'])); ?>
</p>

<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Nama Produk</th>
				<th>Harga</th>
				<th>Jumlah</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no = 1;
			$query = $conn->query("SELECT * FROM pembelian_produk JOIN produk 
				ON pembelian_produk.id_produk=produk.id_produk
				WHERE pembelian_produk.id_pembelian='$_GET[id]'");
			while ($data = $query->fetch_assoc()) {
			?>
				<tr>
					<td><?php echo $no++; ?></td>
					<td><?php echo $data['nama_produk']; ?></td>
					<td>Rp.<?php echo number_format($data['harga_produk']); ?></td>
					<td><?php echo $data['jumlah'] ?></td>
					<td>Rp.<?php echo number_format($data['harga_produk'] * $data['jumlah']); ?></td>
				</tr>
			<?php
			} ?>
		</tbody>
	</table>
</div>