DROP DATABASE IF EXISTS practice_db;
CREATE DATABASE practice_db;
USE practice_db;

CREATE TABLE specialties (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE doctors (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         experience_years INT NOT NULL CHECK (experience_years >= 0),
                         specialty_id INT NOT NULL,
                         FOREIGN KEY (specialty_id) REFERENCES specialties(id)
);

CREATE TABLE patients (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          age INT NOT NULL
);

CREATE TABLE appointments (
                              id INT AUTO_INCREMENT PRIMARY KEY,
                              patient_id INT NOT NULL,
                              doctor_id INT NOT NULL,
                              slot_time DATETIME NOT NULL,
                              status VARCHAR(20) NOT NULL DEFAULT 'BOOKED',
                              priority_level VARCHAR(20) NOT NULL,
                              FOREIGN KEY (patient_id) REFERENCES patients(id),
                              FOREIGN KEY (doctor_id) REFERENCES doctors(id),
                              UNIQUE (doctor_id, slot_time)
);

INSERT INTO specialties (name) VALUES
                                   ('Cardiology'), ('General Medicine'), ('Dermatology'), ('Orthopedics'), ('Pediatrics');

INSERT INTO doctors (name, experience_years, specialty_id) VALUES
                                                               ('Dr. Priya Raman', 12, 1),
                                                               ('Dr. Arjun Mehta', 8, 2),
                                                               ('Dr. Kavya Nair', 6, 3),
                                                               ('Dr. Suresh Kumar', 15, 4),
                                                               ('Dr. Meena Iyer', 10, 2);

INSERT INTO patients (name, age) VALUES
                                     ('Asha', 25), ('Ravi', 62), ('Divya', 4), ('Karthik', 35), ('Nisha', 48);

INSERT INTO appointments (patient_id, doctor_id, slot_time, status, priority_level) VALUES
                                                                                        (1, 1, '2026-12-01 09:00:00', 'BOOKED', 'URGENT'),
                                                                                        (2, 1, '2026-12-01 09:15:00', 'BOOKED', 'URGENT'),
                                                                                        (3, 2, '2026-12-01 10:00:00', 'BOOKED', 'ROUTINE'),
                                                                                        (4, 2, '2026-12-01 10:15:00', 'BOOKED', 'ROUTINE'),
                                                                                        (5, 3, '2026-12-02 11:00:00', 'CANCELLED', 'ROUTINE'),
                                                                                        (1, 2, '2026-12-03 09:30:00', 'BOOKED', 'ROUTINE');

USE practice_db;

SELECT
    (SELECT COUNT(*) FROM specialties) AS specialties,
    (SELECT COUNT(*) FROM doctors) AS doctors,
    (SELECT COUNT(*) FROM patients) AS patients,
    (SELECT COUNT(*) FROM appointments) AS appointments;

SELECT * FROM doctors;

SELECT * FROM doctors WHERE experience_years > 10;

-- Query 3: doctors with more than 10 years
SELECT * FROM doctors WHERE experience_years > 10;

-- Query 4: general medicine doctors with 10+ years
SELECT * FROM doctors WHERE specialty_id = 2 AND experience_years >= 10;

SELECT * FROM doctors ORDER BY experience_years DESC;

SELECT * FROM doctors ORDER BY experience_years DESC LIMIT 2;

SELECT * FROM doctors WHERE name LIKE 'Dr. A%';


SELECT d.name AS doctor, s.name AS specialty
FROM doctors d
         JOIN specialties s ON d.specialty_id = s.id;

SELECT p.name AS patient, d.name AS doctor, a.slot_time, a.priority_level
FROM appointments a
         JOIN patients p ON a.patient_id = p.id
         JOIN doctors d ON a.doctor_id = d.id
ORDER BY a.slot_time;

SELECT s.name AS specialty, d.name AS doctor
FROM specialties s
         JOIN doctors d ON d.specialty_id = s.id;

SELECT s.name AS specialty, d.name AS doctor
FROM specialties s
         LEFT JOIN doctors d ON d.specialty_id = s.id;

SELECT COUNT(*) FROM appointments;

SELECT doctor_id, COUNT(*) AS total
FROM appointments
GROUP BY doctor_id;

SELECT d.name, COUNT(a.id) AS total
FROM doctors d
         LEFT JOIN appointments a ON a.doctor_id = d.id
GROUP BY d.id, d.name;

SELECT doctor_id, COUNT(*) AS total
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) >= 2;

SELECT priority_level, COUNT(*) AS total FROM appointments GROUP BY priority_level;
SELECT AVG(experience_years) AS average_experience FROM doctors;
SELECT MAX(experience_years), MIN(experience_years) FROM doctors;
UPDATE doctors SET experience_years = 13 WHERE id = 1;
SELECT * FROM doctors;

UPDATE appointments SET status = 'COMPLETED' WHERE id = 1;
SELECT * FROM appointments;

DELETE FROM appointments WHERE id = 5;
SELECT * FROM appointments;

INSERT INTO specialties (name) VALUES ('Cardiology');

INSERT INTO doctors (name, experience_years, specialty_id) VALUES ('Dr. Test', 5, 99);

INSERT INTO doctors (name, experience_years, specialty_id) VALUES ('Dr. Test', -2, 1);

INSERT INTO appointments (patient_id, doctor_id, slot_time, priority_level)
VALUES (4, 1, '2026-12-01 09:00:00', 'ROUTINE');

DELETE FROM specialties WHERE id = 1;

