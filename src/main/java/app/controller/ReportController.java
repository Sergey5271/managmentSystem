package app.controller;

import app.entity.Student;
import app.excel.ExcelBuilder;
import app.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {

    private StudentService studentService;

    @Autowired
    public ReportController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping
    public ModelAndView getExcel() {
        List<Student> studentList = studentService.getStudents();
        return new ModelAndView(new ExcelBuilder(), "studentList", studentList);
    }
}
