module main.ui {
    requires javafx.controls;
    requires javafx.fxml;
    requires spring.cloud.openfeign.core;
    requires spring.web;


    opens main.ui to javafx.fxml;
    exports main.ui;
}