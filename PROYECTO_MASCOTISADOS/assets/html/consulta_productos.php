<html>
<head>
<title>Problema</title>
</head>
<body>
<?php
$mascotisados = mysqli_connect("localhost", "root", "",
"mascotisados") or
die("Problemas con la conexión");
$registros = mysqli_query($mascotisados, "select id_categoria, nombre, unidad_de_medida, precio_unitario_venta, descripcion_gneral, stock
from productos") or
die("Problemas en el select:" . mysqli_error($mascotisados));
while ($reg = mysqli_fetch_array($registros)) {
echo "<br>";
echo "<hr>";
echo "id_categoria:" . $reg['id_categoria'] . "<br>";
echo "nombre:" . $reg['nombre'] . "<br>";
echo "unidad_de_medida:" . $reg['unidad_de_medida'] . "<br>";
echo "precio_unitario_venta:". $reg['precio_unitario_venta'] . "<br>";
echo "descripcion_gneral:" . $reg['descripcion_gneral'] . "<br>";
echo "stock:" . $reg['stock'] . "<br>";

}
echo "<br>";
echo "<hr>";

mysqli_close($mascotisados);
?>


<div class="rounded-md shadow">
    <a href="admi.html" class="flex w-full items-center justify-center rounded-md border border-transparent bg-violet-700 px-8 py-3 text-base font-medium text-white hover:bg-violet-700 md:py-4 md:px-10 md:text-lg">Volver</a>
</div>

</body>
</html>