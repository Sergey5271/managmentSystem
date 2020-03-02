package app.service;

import app.entity.Student;

import java.util.List;

public interface StudentService {

    List<Student> getStudents();

    void saveStudent(Student student);

    Student getStudent(int id);

    void deleteStudent(int id);
}
