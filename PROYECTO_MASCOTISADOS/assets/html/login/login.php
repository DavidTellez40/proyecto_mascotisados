<?php
$email=$_POST['email'];
$passaword=$_POST['passaword'];
session_start();
$_SESSION['email']=$email;

$mascotisados = mysqli_connect("localhost", "root", "", "mascotisados") or
die("Problemas con la conexión");

$consulta="SELECT funadmin usuarios where email='$email' and passaword='$passaword'";
$resultado=mysqli_query($mascotisados,$consulta);



if($resultado=true){ //administrador
    header("location:../admin/admi.php");

}
else{
    ?>
    <?php
    include("cliente.php");
    ?>
    <h1 class="bad">ERROR EN LA AUTENTIFICACION</h1>
    <?php
}
mysqli_free_result($resultado);
mysqli_close($mascotisados);
