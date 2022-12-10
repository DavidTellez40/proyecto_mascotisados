

<?php
$email=$_POST['email'];
$passaword=$_POST['passaword'];


session_start();
$_SESSION['email']=$email;

$mascotisados = mysqli_connect("localhost", "root", "", "mascotisados") or
die("Problemas con la conexión");

$consulta=mysqli_query($mascotisados, "select  funadmin
from usuarios where email='$email' and passaword='$passaword'") or die("Error en la autentificaciòn" . mysqli_error($mascotisados));






if(($con = mysqli_fetch_array($consulta))==true && ($cons =mysqli_fetch_array($consulta,2))==0)
{ //administrador

    header("location:index_log.html");
  

}
elseif(($con = mysqli_fetch_array($consulta))==true && ($cons =mysqli_fetch_array($consulta,2))==1)
   {
   
    header("location:../cliente.php");
   
   
 }
 elseif(($con = mysqli_fetch_array($consulta))==false)
   {
   
    echo  '<script type="text/javascript">
        alert("Usuario y/o contraseña incorrecta");
        window.location.href="login.html";
        </script>';"";
   }

 
    

mysqli_free_result($resultado);
mysqli_close($mascotisados);


