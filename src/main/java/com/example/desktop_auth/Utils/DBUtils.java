package com.example.desktop_auth.Utils;

import com.example.desktop_auth.Models.User;
import javafx.scene.control.Alert;

import java.sql.*;

public class DBUtils {
    public static Connection connection;
    public static Statement statement;

    public static void initialize() {
        try {
            connection = DriverManager.getConnection(Config.DBUrl, Config.DBUser, Config.DBPassword);
            statement = connection.createStatement();
        } catch (Exception e) {
            AlertUtils.showAlert("Не удалось подключиться к БД", Alert.AlertType.ERROR);
        }
    }

    public static boolean checkUserNum(String num) {
        try (ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM `sotrudniks` WHERE `Num`='"+num+"'")) {
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static User getUser(String num, String password) {
        User user = null;
        try (ResultSet rs = connection.createStatement().executeQuery("SELECT * FROM `sotrudniks` s, sotrudnikroles r WHERE `Num`='"+num+"' and `Password`='"+password+"' and s.role=r.id")) {
            if (rs.next()) {
                user = new User(
                        rs.getString("Num"),
                        rs.getString("Password"),
                        rs.getString("SecondName"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("name")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}
