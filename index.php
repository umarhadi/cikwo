<?php
    session_start();    
    include 'koneksi.php';
    error_reporting(0);
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">

    <title>
     
    </title>

    <meta name="keywords" content="">

    <link href='https://fontbit.io/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="asset/css/font-awesome.css" rel="stylesheet">
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="asset/css/animate.min.css" rel="stylesheet">
    <link href="asset/css/owl.carousel.css" rel="stylesheet">
    <link href="asset/css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="asset/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="asset/css/custom.css" rel="stylesheet">

    <script src="asset/js/respond.min.js"></script>

    <link rel="shortcut icon" href="logo.png">
</head>

<body>

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
 <div id="top">
    <div class="container">
        <div class="col-md-6" data-animate="fadeInDown">
            <ul class="menu">
                <li><a href="profile.php">Selamat datang, <?php echo $_SESSION['login']['nama_pelanggan']; ?></a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </div>
    </div>
</div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

 <div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

                <a class="navbar-brand home" href="index.php" data-animate-hover="bounce">
                    <img src="logo.png" class="hidden-xs">
                    <img src="logo.png" class="visible-xs"><span class="sr-only">Cikwo Coffe : Halaman Utama</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="index.php">Beranda</a>
                    </li>
                    <li> <a href="all-menu.php">Menu</a>
                    </li>
                    <li> <a href="warung.php">Kategori</a>
                    </li>
                    <li> <a href="contact.php">Hubungi Kami</a>
                    </li>
                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">
                <?php                     
                    if (!$_SESSION['keranjang']) {
                    ?>
                        <div class="navbar-collapse collapse right" id="basket-overview">
                            <a href="cart.php" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Keranjang Belanja</span></a>
                        </div>
                    <?php        
                    }
                    else{
                    $item = count($_SESSION['keranjang']);
                    ?>
                        <div class="navbar-collapse collapse right" id="basket-overview">
                            <a href="cart.php" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">Keranjang Belanja (<?php echo $item;?>)</span></a>
                        </div>
                    <?php
                    }
                ?>
            </div>
     </div>
     <!-- /.container -->
 </div>
 <!-- /#navbar -->

 <!-- *** NAVBAR END *** -->



 <div id="all">

    <div id="content">

        <div class="container">
            <div class="col-md-12">
                <div id="main-slider">
                    <?php 
                    $q_slider=$conn->query("SELECT * FROM produk ORDER BY RAND() LIMIT 5");
                    while ($slider=$q_slider->fetch_assoc()) {
                        ?>
                        <div class="item">
                            <img src="foto_produk/<?php echo $slider['foto_produk']; ?>" style="height:553px;width:1200px;" class="img-responsive">
                        </div>
                        <?php
                    }
                    ?>  
                </div>
                <!-- /#main-slider -->
            </div>
        </div>
		
<!-- *** HOT PRODUCT SLIDESHOW ***
_________________________________________________________ -->
<div id="hot">

    <div class="box">
        <div class="container">
            <div class="col-md-12">
                <h1>Menu Favorit</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="product-slider">
            <?php  
            $query=$conn->query("SELECT*FROM produk ORDER BY likes DESC");
            while ($data=$query->fetch_assoc()) {
                ?>
                <div class="item">
                    <div class="product">
                        <div class="flip-container">
                            <div class="flipper">
                                <div class="front">
                                    <a href="detail_produk.php?id=<?php echo $data['id_produk']; ?>">
                                        <img src="foto_produk/<?php echo $data['foto_produk'];?>" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="back">
                                    <a href="detail_produk.php?id=<?php echo $data['id_produk']; ?>">
                                        <img src="foto_produk/<?php echo $data['foto_produk'];?>" alt="" class="img-responsive">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <a href="detail_produk.php?id=<?php echo $data['id_produk']; ?>" class="invisible">
                            <img src="foto_produk/<?php echo $data['foto_produk'];?>" alt="" class="img-responsive">
                        </a>
                        <div class="text">
                            <h3><a href="detail_produk.php?id=<?php echo $data['id_produk']; ?>"><?php echo $data['nama_produk']; ?></a></h3>
                            <p class="price">Rp.<?php echo number_format($data['harga_produk']); ?></p>
                        </div>
                        <!-- /.text -->
                    </div>
                    <!-- /.product -->
                </div>
                <?php
            }
            ?>
        </div>
        <!-- /.product-slider -->
    </div>
    <!-- /.container -->

</div>
<!-- /#hot -->

<!-- *** HOT END *** -->

<!-- *** ADVANTAGES HOMEPAGE ***
_________________________________________________________ -->
<div id="advantages">

    <div class="container">
        <div class="same-height-row">
            <div class="col-sm-4">
                <div class="box same-height">
				<h3><i class="fa fa-phone"></i>Telpon/Whatsapp</h3>
                    <p>085158799719</p>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="box same-height">
				<h3><i class="fa fa-map-marker"></i>Lokasi</h3>
                   
                    <p> Jl. Lintas Liwa, Gunung Sugih tepatnya di depan hotel Sahabat utama kabupaten Lampung Barat </p>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="box same-height">
				<h3><i class="fa fa-instagram"></i>Instagram</h3>
                    <p><a href="https://www.instagram.com/cikwo.coffee.liwa">@cikwo.coffe.liwa</a></p>
                </div>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /#advantages -->

<!-- *** ADVANTAGES END *** -->



<div class="box text-center" data-animate="fadeInUp">
    <div class="container">
        <div class="col-md-12">
            <h3 class="text-uppercase"> Tempat Nongkrong Baru Muli Mekhanai Liwa </h3>

            <p class="lead">Menyediakan Berbagai Macam Kopi, makanan Kuliner Khas Lampung <a href="warung.php">Ayo Pesan Sekarang !</a>
            </p>
        </div>
    </div>
</div>

<div class="container">

    <div class="col-md-12" data-animate="fadeInUp">

    </div>

</div>
<!-- /#blog-homepage -->
</div>
</div>
<!-- /.container -->

<!-- *** BLOG HOMEPAGE END *** -->


</div>
<!-- /#content -->

        <!-- *** COPYRIGHT ***
 _________________________________________________________ -->
 <div id="copyright">
    <div class="container">
        <div class="col-md-6">
            <p class="pull-left">© Cikwo Coffe-2021</p>
        </div>
        <div class="col-md-6">
            <p class="pull-right">&copy; 2022, Andi Apriansah
            </p>
        </div>
    </div>
</div>
<!-- *** COPYRIGHT END *** -->

</div>
<!-- /#all -->
    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
 <script src="asset/js/jquery-1.11.0.min.js"></script>
 <script src="asset/js/bootstrap.min.js"></script>
 <script src="asset/js/jquery.cookie.js"></script>
 <script src="asset/js/waypoints.min.js"></script>
 <script src="asset/js/modernizr.js"></script>
 <script src="asset/js/bootstrap-hover-dropdown.js"></script>
 <script src="asset/js/owl.carousel.min.js"></script>
 <script src="asset/js/front.js"></script>


</body>

</html>