package com.example.desktop_auth;

import com.example.desktop_auth.Utils.Config;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Duration;

import java.io.IOException;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.atomic.AtomicInteger;

public class CodeGenerator {
    public static String userCodeString = "";
    private final AuthController parentController;
    private static Stage thisStage;

    public CodeGenerator(AuthController parentController) {
        this.parentController = parentController;

        thisStage = new Stage();
        // При закрытии окна с кодом запускается таймер по истечении которого код становится недействителен
        thisStage.setOnCloseRequest(we -> {
            System.out.println("10");
            final int[] timeLiveCodSec = {10};
            Timeline timerOfLiveCode = new Timeline(new KeyFrame(Duration.seconds(1), event -> {
                System.out.println(--timeLiveCodSec[0]);
                if(timeLiveCodSec[0] <= 0) {
                    userCodeString="";
                }
            }));
            timerOfLiveCode.setCycleCount(10);
            timerOfLiveCode.play();
        });

        try {
            // Создание загрузчика окна авторизации
            FXMLLoader fxmlLoader = new FXMLLoader(AuthApplication.class.getResource("code-view.fxml"));
            fxmlLoader.setController(this);
            Scene scene = new Scene(fxmlLoader.load());
            // Задание ограничений размеров, название и иконку она
            thisStage.setMaxHeight(350);
            thisStage.setMaxWidth(600);
            thisStage.setMinHeight(350);
            thisStage.setMinWidth(600);
            thisStage.getIcons().add(new Image(String.valueOf(AuthApplication.class.getResource(Config.appIconPath))));
            thisStage.setTitle(Config.appName);
            thisStage.setScene(scene);
            thisStage.show(); // Отобразить окно на экране
            // Генерация нового кода при запуске окна
            userCodeString = "";
            for(int i = 0; i < 8; i++){
                userCodeString += (char) (new Random().nextInt(74) + 48);
            }
            cod.setText(userCodeString);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    public TextField cod;

    @FXML
    public void initialize() {
        cod.setEditable(false);
    }

}
