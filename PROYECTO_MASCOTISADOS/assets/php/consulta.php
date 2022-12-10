<html>
<head>
<title>Problema</title>
</head>
<body>
<?php
$mascotisados = mysqli_connect("localhost", "root", "",
"mascotisados") or
die("Problemas con la conexión");
$registros = mysqli_query($mascotisados, "select
codigo_rol,primer_nombre,apellido_paterno, apellido_materno, nickname, email,passaword
from usuarios") or
die("Problemas en el select:" . mysqli_error($conexion));
while ($reg = mysqli_fetch_array($registros)) {
echo "<br>";
echo "<hr>";
echo "codigo_rol:" . $reg['codigo_rol'] . "<br>";
echo "primer_nombre:" . $reg['primer_nombre'] . "<br>";
echo "apellido_paterno:" . $reg['apellido_paterno'] . "<br>";
echo "apellido_materno:". $reg['apellido_materno'] . "<br>";
echo "nickname:" . $reg['nickname'] . "<br>";
echo "email:" . $reg['email'] . "<br>";
echo "passaword:". $reg['passaword'] . "<br>";
}
echo "<br>";
echo "<hr>";

mysqli_close($mascotisados);
?>
</body>
</html>