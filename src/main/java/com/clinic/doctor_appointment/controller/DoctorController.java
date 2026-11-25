package com.clinic.doctor_appointment.controller;

import com.clinic.doctor_appointment.model.DoctorInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DoctorController {

    @GetMapping("/doctors")
    public String listDoctors(Model model) {
        List<DoctorInfo> doctors = List.of(
                new DoctorInfo("Dr. Priya Raman", "Cardiology", 12),
                new DoctorInfo("Dr. Arjun Mehta", "General Medicine", 8),
                new DoctorInfo("Dr. Kavya Nair", "Dermatology", 6),
                new DoctorInfo("Dr. Suresh Kumar", "Orthopedics", 15)
        );
        model.addAttribute("doctors", doctors);
        return "doctors";
    }
}
