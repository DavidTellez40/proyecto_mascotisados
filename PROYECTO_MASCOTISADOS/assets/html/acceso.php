<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

        $mascotisados = mysqli_connect("localhost", "root", "",
        "mascotisados") or die("Problemas con la conexión");

        session_start();

        if(isset($_GET['cerrar_sesion'])){
            session_unset();

            session_destroy();

        }

        if (isset($_SESSION['rol'])){
            switch($_SESSION['rol']){

                case 1:
                    header('location:admin.html');

                break;

                case 3:
                    header('location:index.php');
                break;

                default:
            }
        }

        if (isset($_POST['nickname']) && isset($_POST['passaword'])){

            $nickname=$_POST['nickname'];
            $passaword=$_POST['passaword'];

            $db=new Database();
            $query=$db->connect()->prepare('SELECT*FROM usuarios where nickname =:nickname AND passaword = :passaword');
            $query ->execute (['nickname'=>$nickname, 'passaword'=>$passaword]);

            $row=$query->fetch(PDP::FETCH_NUM);
            IF ($row==true){

            }else echo "El usuario o contraseña son incorrectos";

        }


    ?>
</body>
</html>