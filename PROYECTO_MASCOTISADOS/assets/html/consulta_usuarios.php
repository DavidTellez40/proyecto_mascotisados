<html>
<head>
<title>Problema</title>
</head>
<body>
<?php
$mascotisados = mysqli_connect("localhost", "root", "",
"mascotisados") or
die("Problemas con la conexión");
$registros = mysqli_query($mascotisados, "select id_usuario, codigo_rol, primer_nombre, apellido_paterno, apellido_materno, email, passaword,nickname
from usuarios") or
die("Problemas en el select:" . mysqli_error($mascotisados));
while ($reg = mysqli_fetch_array($registros)) {
echo "<br>";
echo "<hr>";
echo "id_usuario:" . $reg['id_usuario'] . "<br>";
echo "primer_nombre:" . $reg['primer_nombre'] . "<br>";
echo "apellido_paterno:" . $reg['apellido_paterno'] . "<br>";
echo "apellido_materno:". $reg['apellido_materno'] . "<br>";
echo "email:" . $reg['email'] . "<br>";
echo "passaword:" . $reg['passaword'] . "<br>";
echo "nickname:" . $reg['nickname'] . "<br>";

}
echo "<br>";
echo "<hr>";

mysqli_close($mascotisados);
?>


<div class="rounded-md shadow">
    <a href="stock.html" class="flex w-full items-center justify-center rounded-md border border-transparent bg-violet-700 px-8 py-3 text-base font-medium text-white hover:bg-violet-700 md:py-4 md:px-10 md:text-lg">Volver</a>
</div>

</body>
</html>