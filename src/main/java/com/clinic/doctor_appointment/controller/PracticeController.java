package com.clinic.doctor_appointment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PracticeController {

    @GetMapping("/practice-form")
    public String showForm() {
        return "practice-form";
    }

    @PostMapping("/practice-result")
    public String handleForm(@RequestParam String name,
                             @RequestParam int age,
                             @RequestParam int severity,
                             Model model) {
        model.addAttribute("name", name);
        model.addAttribute("age", age);
        model.addAttribute("severity", severity);
        return "practice-result";
    }
}