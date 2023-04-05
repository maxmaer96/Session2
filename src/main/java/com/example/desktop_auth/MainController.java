package com.example.desktop_auth;

public class MainController {
    public MainController(AuthController authController) {
        System.out.println("FIO:"+AuthController.user.getSecondName()+" "+
                AuthController.user.getFirstName()+" "+
                AuthController.user.getLastName()+"\n" +
                "Role:"+AuthController.user.getRoleName());
    }
}
