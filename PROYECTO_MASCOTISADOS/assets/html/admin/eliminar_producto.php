<html>

<head>
    <title>Problema</title>
</head>

<body>
    <?php
$mascotisados = mysqli_connect("localhost", "root", "",
"mascotisados") or
die("Problemas con la conexión");
$registros = mysqli_query($mascotisados, "select nombre
from productos
where nombre='$_REQUEST[nombre]'") or
die("Problemas en el select:" .
mysqli_error($mascotisados));
if ($reg = mysqli_fetch_array($registros)) {
mysqli_query($mascotisados, "delete from productos
where nombre='$_REQUEST[nombre]'") or
die("Problemas en el select:" .
mysqli_error($mascotisados));
echo  '<script type="text/javascript">
alert(" Se efectuó el borrado del producto seleccionado.");
window.location.href="eliminar_producto.html";
</script>';"";
} else {

echo  '<script type="text/javascript">
alert("No existe el producto buscado.");
window.location.href="eliminar_producto.html";
</script>';"";        

}
mysqli_close($mascotisados);

echo  '<script type="text/javascript">
alert(" Se efectuó el borrado del producto seleccionado.");
window.location.href="eliminar_producto.html";
</script>';"";
?>
</body>

</html>