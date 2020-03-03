package app.excel;

import app.entity.Student;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class ExcelBuilder extends AbstractXlsView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=\"students.xls\"");
        List<Student> studentList = (List<Student>) map.get("studentList");
        Sheet sheet = workbook.createSheet("Student Data");
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Student name");
        header.createCell(1).setCellValue("Student surname");
        header.createCell(2).setCellValue("Student age");
        header.createCell(3).setCellValue("Student date of birthday");
        header.createCell(4).setCellValue("Student faculty");

        int rowNum = 1;
        for (Student student : studentList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(student.getFirstName());
            row.createCell(1).setCellValue(student.getLastName());
            row.createCell(2).setCellValue(student.getAge());
            row.createCell(3).setCellValue(student.getDateOfBirthday());
            row.createCell(4).setCellValue(student.getFaculty());
        }
    }
}
