<?php
require __DIR__.'/vendor/autoload.php';
use Sastrawi\Stemmer\StemmerFactory;
    class Cosine {
        public function __construct() {
        }

        /**
         * sentence is text(document) which will be classified as ham or spam
         * @return category- ham/spam
         */
        public function preproc($sentence) {

            // extracting keywords from input text/sentence
            $keywordsArray = $this -> tokenize($sentence);  
        }
        
        public function ambilToken(){
            require 'config.php';
            $sql = mysqli_query($connection, "SELECT id,term FROM tbtoken");
            $tbtoken = [];
            while ($result = mysqli_fetch_assoc($sql)){
             array_push($tbtoken,$result);
            }
            return $tbtoken;
        }
        public function Q($query){
               //connectionecting to database
               require 'config.php';
               // kembali jika query kososng
               if(!$query){
                    return;
               }
               mysqli_query($connection, "TRUNCATE TABLE tbq");
               // ekstraksi keyword
               $keywordsArray = $this -> tokenize($query);        
               $tbtoken = $this->ambilToken();
                foreach ($tbtoken as $token) {
                    //menyamakan isi dari token dengan query
                    mysqli_query($connection, "INSERT into tbq (idtoken,count) values($token[id],0)") or die(mysqli_error($connection));
                    foreach($keywordsArray as $word){
                        //jika ada yang sama lagi, akan count akan bertambah
                        if($token['term'] == $word){
                            mysqli_query($connection, "UPDATE tbq set count = count + 1 where idtoken = $token[id]") or die(mysqli_error($connection));
                        }
                        
                    }
                    
                }         
               //closing connectionection
               $connection -> close();
        }

        public function Dn(){
            require './config.php';
            $stemmerFactory = new StemmerFactory;
            $stemmer  = $stemmerFactory->createStemmer();

            mysqli_query($connection, "TRUNCATE TABLE tbdn");

            $sql = mysqli_query($connection, "SELECT id,judul FROM tbjudul") or die(mysqli_error($connection));
            $tbjudul = [];
            while ($result = mysqli_fetch_assoc($sql)){
                array_push($tbjudul,$result);
            }
            $tbtoken = $this->ambilToken();
            foreach($tbjudul as $judul){
                $output = $stemmer->stem($judul['judul']);
                $keywordsArray = $this -> tokenize($output);
                foreach($tbtoken as $token){
                    mysqli_query($connection, "INSERT into tbdn (idtoken,idjudul,count) values($token[id],$judul[id],0)") or die(mysqli_error($connection));
                    foreach($keywordsArray as $word){
                        if($token['term'] == $word){
                            mysqli_query($connection, "UPDATE tbdn set count = count + 1 where idtoken = $token[id] and idjudul = $judul[id]") or die(mysqli_error($connection));
                        }
                    }
                }
                
            }
            
        }

        public function Dfidf(){
            require './config.php';
            //mencari n
            $sql = mysqli_query($connection,"SELECT count(*) as total FROM tbjudul");
            $count = mysqli_fetch_assoc($sql);
            $n = $count['total'];

            //mencari tf
            $tbq = [];
            $tbdn = [];
            $tbtoken = [];
            //ambil data dari tbq
            $sql = mysqli_query($connection,"SELECT * FROM tbq");
            while($q = mysqli_fetch_assoc($sql)){
                //idjudul q adalah q
                $q['idjudul'] = 'Q';
                array_push($tbq,$q);
            }
            // var_dump($tbq);
            //ambil data dari tbdn
            $sql = mysqli_query($connection,"SELECT * FROM tbdn");
            while($dn = mysqli_fetch_assoc($sql)){
                array_push($tbdn,$dn);
            }
            // var_dump($tbdn);
            //combine array tbq and tbdn
            foreach($tbq as $q){
                array_push($tbdn,$q);
            }
            $tf = $tbdn;
            // var_dump($tf);

            //menghitung df
            $sql = mysqli_query($connection,"SELECT id,term FROM tbtoken");
            while($term = mysqli_fetch_assoc($sql)){
                array_push($tbtoken,$term);
            }
            // var_dump($tbtoken);
            //gabung dn dan q berdasarkan token
            foreach($tbtoken as $token){
                $sql = mysqli_query($connection,"SELECT * FROM tbq where idtoken = $token[id]");
                while($q = mysqli_fetch_assoc($sql)){
                //idjudul q adalah q
                $q['idjudul'] = 'Q';
                // var_dump($q);
                $df[$token['term']][] = $q['count'];
                // array_push($tbq,$q);
                }
                $sql = mysqli_query($connection,"SELECT * FROM tbdn where idtoken = $token[id]");
                while($dn = mysqli_fetch_assoc($sql)){
                //idjudul q adalah q
                $df[$token['term']][] = $dn['count'];
                // var_dump($dn);
                // array_push($tbq,$q);
                }
            }
            var_dump($df);
            $totaldf = [];
            foreach($df as $hitungdf){
                $hitungdf = 
            }




        }
        
        //initial nama to null
        public function train($sentence,$nama = null) {

                //connectionecting to database
                require 'config.php';


                // memasukkan data training besserta labelnya
                if($nama){
                    $sql = mysqli_query($connection, "INSERT into tbjudul (judul,nama) values('$sentence','$nama')");
                }
                // $sql = mysqli_query($connection, "INSERT into tbjudul (judul) values('$sentence')");

                // ekstraksi keyword
                $keywordsArray = $this -> tokenize($sentence);
                // update tabel frekuensi kata
                foreach ($keywordsArray as $word) {

                    // if this word is already present with given category then update count else insert
                   $sql = mysqli_query($connection, "SELECT count(*) as total FROM tbtoken WHERE term = '$word' ");
                   $count = mysqli_fetch_assoc($sql);

                    //rumus bobot

                   if ($count['total'] == 0) {
                        $sql = mysqli_query($connection, "INSERT into tbtoken (term,count) values('$word',1)");
                   } else {
                       $sql = mysqli_query($connection, "UPDATE tbtoken set count = count + 1 where term = '$word'");
                   }
                }

                //closing connectionection
                $connection -> close();
        }

        /**
         * this function takes a paragraph of text as input and returns an array of keywords.
         */

        private function tokenize($sentence) {
           $stopWords = array(
            'yang', 'untuk', 'pada', 'ke', 'para', 'namun', 'menurut', 'antara', 'dia', 'dua',
            'ia', 'seperti', 'jika', 'jika', 'sehingga', 'kembali', 'dan', 'tidak', 'ini', 'karena',
            'kepada', 'oleh', 'saat', 'harus', 'sementara', 'setelah', 'belum', 'kami', 'sekitar',
            'bagi', 'serta', 'di', 'dari', 'telah', 'sebagai', 'masih', 'hal', 'ketika', 'adalah',
            'itu', 'dalam', 'bisa', 'bahwa', 'atau', 'hanya', 'kita', 'dengan', 'akan', 'juga',
            'ada', 'mereka', 'sudah', 'saya', 'terhadap', 'secara', 'agar', 'lain', 'anda',
            'begitu', 'mengapa', 'kenapa', 'yaitu', 'yakni', 'daripada', 'itulah', 'lagi', 'maka',
            'tentang', 'demi', 'dimana', 'kemana', 'pula', 'sambil', 'sebelum', 'sesudah', 'supaya',
            'guna', 'kah', 'pun', 'sampai', 'sedang', 'selagi', 'sementara', 'tetapi', 'apakah',
            'kecuali', 'sebab', 'selain', 'seolah', 'seraya', 'terus', 'tanpa', 'agak', 'boleh',
            'dapat', 'dsb', 'dst', 'dll', 'dahulu', 'dulunya', 'anu', 'demikian', 'tapi', 'ingin',
            'juga', 'nggak', 'mari', 'nanti', 'melainkan', 'oh', 'ok', 'seharusnya', 'sebetulnya',
            'setiap', 'setidaknya', 'sesuatu', 'pasti', 'saja', 'toh', 'ya', 'walau', 'tolong',
            'tentu', 'amat', 'apalagi', 'bagaimanapun','nih','aku', 'kok', 'di', 'dan', 'atau', 
            'tolong', 'kan', 'itu', 'sini', 'agar', 'ini', 'mati','nih','dong','ada','apa', 'adalah',
            'sudah','untuk', 'dengan', 'kurang', 'jadi','maka','kapan','dimana','siapa','akan','dengan','supaya','jadinya','deh','yang'
        );

            //removing all the characters which ar not letters, numbers or space
            $sentence = preg_replace("/[^a-zA-Z 0-9]+/", "", $sentence);

            //converting to lowercase
            $sentence = strtolower($sentence);

            //an empty array
            $keywordsArray = array();

            //splitting text into array of keywords
            //http://www.w3schools.com/php/func_string_strtok.asp
            $token =  strtok($sentence, " ");
            while ($token !== false) {

                //excluding elements of length less than 3
                if (!(strlen($token) <= 2)) {

                    //excluding elements which are present in stopWords array
                    //http://www.w3schools.com/php/func_array_in_array.asp
                    if (!(in_array($token, $stopWords))) {
                        array_push($keywordsArray, $token);
                    }
                }
                $token = strtok(" ");
            }
            return $keywordsArray;
        }

    }



?>
