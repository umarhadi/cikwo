<?php
include 'protect.php';
include '../des/encrypt.php';
?>
<h2>Data Pembelian</h2>

<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Nama Pelanggan</th>
				<th>Tanggal</th>
				<th>Status</th>
				<th>Total</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no = 1;
			$query = $conn->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan");

			while ($data = $query->fetch_assoc()) {

				$encrypt_result = [
					'tanggal' => trim($data['tanggal_pembelian']),
					'bayar' => trim($data['total_pembelian'])
				];

				$decrypt_result = [];

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
				<tr>
					<td><?php echo $no++; ?></td>
					<td><?php echo $data['nama_pelanggan']; ?></td>
					<td><?php echo htmlspecialchars_decode($decrypt_result['tanggal']); ?></td>
					<td><?php echo $data['status']; ?></td>
					<td>Rp.<?php echo number_format(intval($decrypt_result['bayar'])); ?></td>
					<td>
						<a href="index.php?halaman=detail&id=<?php echo $data['id_pembelian']; ?>" class="btn btn-info">Detail</a>
						<a href="index.php?halaman=status&id=<?php echo $data['id_pembelian']; ?>" class="btn btn-warning">Ubah Status</a>
					</td>
				</tr>
			<?php
			}
			?>
		</tbody>
	</table>
</div>