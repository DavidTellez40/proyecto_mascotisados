<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles_pag_registro.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
    <header>
        <nav>
            <a href="index.html">Inicio</a>
            <a href="acceso.html">Acceso</a>
            <a href="productos.html">Productos</a>
            <a href="contacto.html">Contacto</a>

        </nav>
        <section>
            <h1 id="header" class="textos-header">MASCOTISADOS</h1>
            <h2 style="font-size: 40px;" class="textos-header">Mas que solo productos, familia.</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;">
            <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                <path d="M0.00,49.99 C150.00,150.00 349.21,-49.99 500.00,49.99 L500.00,150.00 L0.00,150.00 Z"
                    style="stroke: none; fill: hsl(0, 0%, 100%);">
                </path>
            </svg>
        </div>
        <br><br><br><br>
        <?php

        $mascotisados = mysqli_connect("localhost", "root", "",
        "mascotisados") or
        die("Problemas con la conexión");


        mysqli_query($mascotisados, "insert into productos( id_categoria, nombre, unidad_de_medida, precio_unitario_venta, descripcion_gneral, stock) values
        ('$_REQUEST[id_categoria]','$_REQUEST[nombre]','$_REQUEST[unidad_de_medida]','$_REQUEST[precio_unitario_venta]','$_REQUEST[descripcion_gneral]','$_REQUEST[stock]')")
        or die("Problemas en el select" . mysqli_error($mascotisados));
        

        mysqli_close($mascotisados);
        echo  '<script type="text/javascript">
        alert("El producto fue ingresado con exito ");
        window.location.href="agregar_producto.html";
        </script>';

        
    ?>
        <div class="rounded-md shadow">
            <a href="admi.html"
                class="flex w-full items-center justify-center rounded-md border border-transparent bg-violet-700 px-8 py-3 text-base font-medium text-white hover:bg-violet-700 md:py-4 md:px-10 md:text-lg">Volver</a>
        </div>


</body>

</html>