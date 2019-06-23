<?php 
require __DIR__.'/vendor/autoload.php';
$stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
$stemmer  = $stemmerFactory->createStemmer();
require './preprocessing.php';
?>
<!doctype html>
<html lang="en">

<head>
    <title>Cosine Similarity</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <?php require './navbar.php' ?>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                <form method="POST" action="index.php">
                    <div class="form-row">
                        <div class="col">
                            <input type="text" class="form-control" name="q" id="pencarian" aria-describedby="helpId"
                                placeholder="Ketikan judul disini">
                        </div>
                        <div class="col">
                            <button type="submit" name="simpan" class="btn btn-primary">Cari</button>
                        </div>

                    </div>

                </form>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <!-- Daftar judul -->
                <table class="table table-hover table-inverse table-responsive">
                    <?php 
                        require './config.php';
                        $sql = mysqli_query($connection, "SELECT nama,judul,persen FROM tbjudul inner join tbcosine on tbjudul.id = tbcosine.idjudul");
                        ?>
                    <thead class="thead-inverse">
                        <tr>
                            <th>No</th>
                            <th>Nama Mahasiswa</th>
                            <th>Judul</th>
                            <th>Kecocokan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $i =0;
                            while ($row = mysqli_fetch_assoc($sql)): ?>
                        <tr>
                            <td scope="row"><?php echo $i+1 ?></td>
                            <td><?php echo $row['nama'] ?></td>
                            <td><?php echo $row['judul'] ?></td>
                            <td><?php echo $row['persen'] ?></td>
                        </tr>
                        <?php endwhile; 
                            mysqli_close($connection);
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <?php
    //@TODO:Improve Algorithm, kecocokan
    //Make better UX/UI
    if(isset($_POST['simpan'])){
        $q = $_POST['q'];
        $output = $stemmer->stem($q);
        $cosine = new Cosine;
        //Q akan mendapatkan nilai dari Q
        $cosine->Q($output);
        echo "<h2 style='text-align:center'>Anda mengajukan judul : ".$output."</h2>";
        //Dn akan mendapatkan nilai dari D1...n
        $cosine->Dn();
        $cosine->Dfidf();
        $cosine->Tfidf();
        $cosine->similarity();
    }
?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
</body>

</html>