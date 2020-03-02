package app.dao;

import app.entity.Student;

import java.util.List;

public interface StudentDAO {
    List<Student> getStudents();

    void saveStudent(Student student);

    Student getStudent(int id);

    void deleteStudent(int id);
}
