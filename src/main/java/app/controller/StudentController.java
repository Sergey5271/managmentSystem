package app.controller;

import app.entity.Student;
import app.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    private StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/list")
    public String listStudents(Model model) {
        List<Student> students = studentService.getStudents();
        model.addAttribute("students", students);
        return "list-students";
    }

    @RequestMapping(value = {"", "/{page}"}, method = RequestMethod.GET)
    public ModelAndView showUser(@PathVariable(required = false, name = "page") String page, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        PagedListHolder<Student> userList;
        if (page == null) {
            userList = new PagedListHolder<>();
            List<Student> usersList = studentService.getStudents();
            // Setting the source for PagedListHolder
            userList.setSource(usersList);
            userList.setPageSize(2);
            // Setting PagedListHolder instance to session
            request.getSession().setAttribute("userList", userList);
        } else if (page.equals("prev")) {
            // get the user list from session
            userList = (PagedListHolder<Student>) request.getSession().getAttribute("userList");
            // switch to previous page
            userList.previousPage();
        } else if (page.equals("next")) {
            userList = (PagedListHolder<Student>) request.getSession().getAttribute("userList");
            // switch to next page
            userList.nextPage();
        } else {
            int pageNum = Integer.parseInt(page);
            userList = (PagedListHolder<Student>) request.getSession().getAttribute("userList");
            // set the current page number
            // page number starts from zero in PagedListHolder that's why subtracting 1
            userList.setPage(pageNum - 1);
        }
        mv.setViewName("list-students");
        return mv;
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model model) {
        Student student = new Student();
        model.addAttribute("student", student);
        return "student-form";
    }

    @PostMapping("/saveStudent")
    public String saveStudent(@ModelAttribute("student") Student student) {
        studentService.saveStudent(student);
        return "redirect:/student/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("studentId") int id, Model model) {
        Student student = studentService.getStudent(id);
        model.addAttribute("student", student);
        return "student-form";

    }

    @GetMapping("delete")
    public String deleteStudent(@RequestParam("studentId") int id) {
        studentService.deleteStudent(id);
        return "redirect:/student/list";
    }
}
