<?php

require_once "php/dbConnect.php";

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href="css/main.css">
    <!--<script src="js/vue.js"></script>-->
    <script src="js/app.js" defer></script>
    <title>Юг-Туризм</title>
</head>
<body>
    <div class="container">
        <section class="gallery">
            <div class="frame frame_bg">
                <div class="frame_content" style="width: 100%; background: linear-gradient(0deg, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));">
                    <h1>Туры по югу России</h1>
                </div>
            </div>

            <?php
            $sql = "Select * From `tour` Where `Active` = '1'";
            $queryResult = mysqli_query($link, $sql);
            $i = 0;
            while ($Array = mysqli_fetch_assoc($queryResult)) {
                $tourArray[$i]['ID'] = $Array['ID'];
                $tourArray[$i]['Name'] = $Array['Name'];
                $tourArray[$i]['Cost'] = $Array['Cost'];
                $tourArray[$i]['IDMedia'] = $Array['IDMedia'];
                $i++;
            }
            $quantityTour = $i;


            $sql = "Select * From `description`";
            $queryResult = mysqli_query($link, $sql);
            $i = 0;
            while ($Array = mysqli_fetch_assoc($queryResult)) {
                $descriptionArray[$i]['ID'] = $Array['ID'];
                $descriptionArray[$i]['IDTour'] = $Array['IDTour'];
                $descriptionArray[$i]['IDMedia'] = $Array['IDMedia'];
                $descriptionArray[$i]['HeadDescription'] = $Array['HeadDescription'];
                $descriptionArray[$i]['Description'] = $Array['Description'];
                $i++;
            }
            $quantityDescription = $i;


            $sql = "Select * From `media`";
            $queryResult = mysqli_query($link, $sql);
            $i = 0;
            while($Array = mysqli_fetch_assoc($queryResult)) {
                $mediaArray[$i]['ID'] = $Array['ID'];
                $mediaArray[$i]['MediaType'] = $Array['MediaType'];
                $mediaArray[$i]['FileName'] = $Array['FileName'];
                $i++;
            }
            $quantityMedia = $i;




            for ($i = 0; $i < $quantityTour; $i++) {
                $v = 0;
                while ($v < $quantityMedia) {
                    if ($mediaArray[$v]['MediaType'] == "Video" && $mediaArray[$v]['ID'] == $tourArray[$i]['IDMedia']) { 
                        $fileName = $mediaArray[$v]['FileName'];
                        break;
                    } 
                    $v++;
                }

                echo '
                <div class="frame frame_bg">
                    <div class="frame_content">
                        <h1>'.$tourArray[$i]["Name"].'</h1>
                        <video class="frame-media" src="media/videos/'.$fileName.'.mp4" autoplay loop muted></video>
                    </div>
                </div>
                ';


                $v = 0;
                while ($v < $quantityDescription) {
                    if ($descriptionArray[$v]['IDTour'] == $tourArray[$i]["ID"]) {

                        if (($v+1)%2==1) {$textPos = "frame-text_left"; $imagePos = "frame-media_right";}
                        else {$textPos = "frame-text_right"; $imagePos = "frame-media_left";}

                        echo '
                        <div class="frame">
                            <div class="frame_content">
                                <div class="frame-text '.$textPos.'"><h2>'.$descriptionArray[$v]["HeadDescription"].'</h2><p>'.$descriptionArray[$v]["Description"].'</p></div>
                            </div>
                        </div>
                        ';

                        $g = 0;
                        while ($g < $quantityMedia) {
                            if ($mediaArray[$g]['ID'] == $descriptionArray[$v]['IDMedia']) { 
                               $fileName = $mediaArray[$g]['FileName'];
                               break;
                            }
                            $g++;
                        }


                        echo '
                        <div class="frame frame_bg">
                            <div class="frame_content">
                                <div class="frame-media '.$imagePos.'" style="background-image: url(media/images/'.$fileName.'.jpg);"></div>
                            </div>
                        </div>
                        ';
                    }
                    $v++;
                }

                echo '
                    <div class="frame frame_bg">
                        <div class="frame_content">
                            <div class="frame-text"><h1>'.$tourArray[$i]["Name"].'</h1></br><h1>Стоимость тура - '.$tourArray[$i]['Cost'].' руб</h1>
                            </div>
                        </div>
                    </div>
                ';

            }
            ?>

            <div class="frame frame_bg">
                <div class="frame_content">
                    <div class="frame-form">
                        <h1>Решились на путешествие?)</h1><h2>Оставьте данные и мы не заставим вас долго ждать</h2></br>
                        <form action="php/order.php" method="post">
                            <div style="float: left;">
                                <input name="FirstName" type="text" style="width: 350px; height: 50px; font-size: 20px;" placeholder="Ваше имя"></input></br>
                                <input name="PhoneNumber" type="tel" style="width: 350px; height: 50px; font-size: 20px;" placeholder="Номер телефона"></input></br>
                                <select name="TourID" style="text-align: center; width: 350px; font-size: 20px;">
                                    <option selected="select" value="1">Архыз 9990 руб</option>
                                    <option value="2">Домбай 14990 руб</option>
                                    <option value="3">Дагестан 16490 руб</option>
                                </select>
                            </div>
                            <input class="submit" type="submit"></input>
                        </form>
                    </div>
                </div>
            </div>

        </section>
    </div>

    <img class="sound-button paused" src="media/SoundIcon.gif" alt="Alt">
    <audio class="audio" src="media/music/SuspensionAmbient.mp3" loop></audio>

</body>
</html>
                                                                                                   