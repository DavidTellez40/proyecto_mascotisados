<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conexion registro usuarios</title>
</head>
<body>

    <?php

        $mascotisados = mysqli_connect("localhost","root", "", "mascotisados") or die("Problemas con la conexión");


        mysqli_query($mascotisados, "insert into usuarios(codigo_rol,primer_nombre,apellido_paterno, apellido_materno, nickname, email,passaword) values
        ('$_REQUEST[codigo_rol]','$_REQUEST[primer_nombre]','$_REQUEST[apellido_paterno]','$_REQUEST[apellido_materno]','$_REQUEST[nickname]','$_REQUEST[email]','$_REQUEST[passaword]')")
        or die("Problemas en el select" . mysqli_error($mascotisados));
        mysqli_close($mascotisados);
        echo "El usuario fue ingresado con exito ";
    ?>

    
</body>
</html>
