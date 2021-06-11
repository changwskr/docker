<?php
$conn = mysqli_connect(
	'', // 엔드포인트 주소
	'', // username
	'', password
	''); // 데이터베이스 이름
​
	$sql = "SELECT * FROM topic";
$result = mysqli_query($conn, $sql);
​
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>WEB</title>
</head>
<body>
<h1>KPU University</h1>
<h3> 원하는 책의 제목 본문 저자를 입력하세요. </h3>
<form action="process_create.php" method="POST">
<p><input type="text" name="title" placeholder="제목 (ex)Harry Porter"></p>
<p><input type="text" name="description" placeholder="본 문 (ex)magic stone"></p>
<p><input type="text" name="author" placeholder="저자 (ex)rolling"></p>
<p><input type="submit"></p>
</form>
</body>
</html>

