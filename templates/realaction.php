<!DOCTYPE html>
<html>

<head>
  <title>Search Engine - Search</title>
  <meta charset="utf-8">
</head>


<body>
	<h1>Search Engine</h1>

	<form action='./realaction.php' method='get'>
		<input type='text' name='query' size='50' value='<?php echo $_GET['query']; ?>' 
                    required
                            data-fv-notempty-message="" />
		<input type='submit' />
	</form>
	<hr />
	<?php

	$cmd1 = "rm rankvector.txt";
	exec(escapeshellcmd($cmd1), $output, $status);

		$query = $_GET['query'];
		$terms = explode(" ", $query);
		$keys = "SELECT * FROM realsearch WHERE ";

		foreach ($terms as $each){
			$i++;
			if ($i == 1)
				$keys .= "keyword LIKE '%$each%' ";
			else
				$keys .= "OR keyword LIKE '%$each%' ";						
		}

mysql_connect("localhost", "root", "password");
mysql_select_db("search_engine");

		$keys = mysql_query($keys);
		$numrows = mysql_num_rows($keys);

		if($numrows > 0){

			$idarray = array();
			$outlinkarray = array();
			$i = 0;

			while($row = mysql_fetch_assoc($keys)){

				$newid = $row['id'];
				$newoutlinks = $row['outlinks'];

				$idarray[$i]=$row['id']; 
				$outlinkarray[$i]=$row['outlinks'];

				$i = $i+1;
			}			
		}
		else{echo "No result found!";}

	$myfile = fopen("outlink.txt", "w") or die("Unable to open file!");
	$gap = " ";
	for($x = 0; $x < $i; $x++){
	fwrite($myfile,$idarray[$x]);fwrite($myfile,$outlinkarray[$x]);fwrite($myfile,$gap);
	}
	fclose($myfile);

	$cmd = "octave pagerank.m";
	exec(escapeshellcmd($cmd), $output, $status);
	

		$fh = fopen("rankvector.txt", 'r') or die("File does not exist or you lack permission to open it");
		$line = fgets($fh);
		fclose($fh);
		$new = explode(",", $line);
		foreach ($new as $each){$ns .= "$each";}


	for($x = 0; $x <= $i; $x++){

		$kkeys = "SELECT * FROM realsearch WHERE id = $ns[$x] ";
		$kkeys = mysql_query($kkeys);
		$knumrows = mysql_num_rows($kkeys);
		if($knumrows > 0){
			while($row = mysql_fetch_assoc($kkeys)){
				$id = $row['id'];
				$title = $row['title'];
				$description = $row['description'];
				$keyword = $row['keyword'];
				$outlinks = $row['outlinks'];
				$link = $row['link'];
				echo "<h2><a href='$link'>$title</a></h2>";				
			}			
		}
	}


// disconnect
mysql_close();



	?>
<center>Hey! you complete.</center>
</body>

</html>
