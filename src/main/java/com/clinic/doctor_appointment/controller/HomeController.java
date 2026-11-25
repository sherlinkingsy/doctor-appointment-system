package com.clinic.doctor_appointment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Doctor Appointment System");
        model.addAttribute("message", "Book appointments based on how urgent your symptoms are.");
        return "home";
    }
}
