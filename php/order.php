<?php
    require_once "dbConnect.php";

    $firstName = $_POST['FirstName'];
    $phoneNumber = $_POST['PhoneNumber'];
    $tourID = $_POST['TourID'];

    $sql = "Insert Into `order` (IDTour, FirstName, PhoneNumber) values ('$tourID', '$firstName', '$phoneNumber')";
    mysqli_query($link, $sql);

    header('Location: ../index.php');
?>                                                               