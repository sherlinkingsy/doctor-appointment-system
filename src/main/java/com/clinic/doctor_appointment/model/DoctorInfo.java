package com.clinic.doctor_appointment.model;

public class DoctorInfo {

    private String name;
    private String specialty;
    private int experience;

    public DoctorInfo(String name, String specialty, int experience) {
        this.name = name;
        this.specialty = specialty;
        this.experience = experience;
    }

    public String getName() { return name; }
    public String getSpecialty() { return specialty; }
    public int getExperience() { return experience; }
}
