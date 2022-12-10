<html>
<html>
<head>
    <title>Conexion registro usuarios</title>
</head>
<body>

    <?php

        $mascotisados = mysqli_connect("localhost", "root", "",
        "mascotisados") or
        die("Problemas con la conexión");

        
        mysqli_query($mascotisados, "insert into usuarios(codigo_rol,primer_nombre,apellido_paterno, apellido_materno, email, passaword,nickname) values
        ('$_REQUEST[codigo_rol]','$_REQUEST[primer_nombre]','$_REQUEST[apellido_paterno]','$_REQUEST[apellido_materno]','$_REQUEST[email]','$_REQUEST[passaword]','$_REQUEST[nickname]')")
        or die("Problemas en el select" . mysqli_error($mascotisados));
        mysqli_close($mascotisados);
        echo  '<script type="text/javascript">
        alert(" El usuario fue ingresado con exito ");
        window.location.href="index.html";
        </script>';"";
    ?>

    
</body>
</html>
