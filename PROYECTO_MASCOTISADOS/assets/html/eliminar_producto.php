<html>
<head>
</head>
<body>
        <?php
        $mascotisados = mysqli_connect("localhost", "root", "", "mascotisados") or die("Problemas con la conexión");

        $registros = mysqli_query($mascotisados, "select nombre
        from productos where nombre='$_REQUEST[nombre]'") or
        die("Problemas en el select :" . mysqli_error($mascotisados));

        if ($reg = mysqli_fetch_array($registros)){ mysqli_query ($mascotisados , "delete  from productos where nombre='$_REQUEST [nombre]'") or die("Problemas en el select :" .mysqli_error ($mascotisados));

        echo "Se efectuó el borrado del producto con el
        nombre digitado.";
        }else
        echo "No existe un producto con ese
        nombre  intente nuevamente.";
        
        mysqli_close ($mascotisados);
        
        ?>
</body>
</html>