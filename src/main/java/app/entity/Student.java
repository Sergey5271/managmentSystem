package app.entity;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "students")
public class Student extends AbstractEntity {

    @Column(name = "first_name")
    @Size(min = 1, max = 20, message =
            "About Me must be between 1 and 50 characters")
    @NotNull
    private String firstName;

    @Column(name = "last_name")
    @Size(min = 1, max = 20, message =
            "About Me must be between 1 and 50 characters")
    @NotNull
    private String lastName;

    @Column(name = "age")
    @Min(value = 1, message = "Age should not be less than 18")
    @Max(value = 150, message = "Age should not be greater than 150")
    @NotNull
    private Integer age;

    @Column(name = "date_of_birthday")
    @NotNull
    private String dateOfBirthday;

    @Column(name = "faculty")
    @NotNull
    @Size(min = 1, max = 20)
    private String faculty;

    public Student() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getDateOfBirthday() {
        return dateOfBirthday;
    }

    public void setDateOfBirthday(String dateOfBirthday) {
        this.dateOfBirthday = dateOfBirthday;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Student)) {
            return false;
        }
        Student that = (Student) o;
        return new EqualsBuilder()
                .appendSuper(super.equals(o))
                .append(getFirstName(), that.getFirstName())
                .append(getLastName(), that.getLastName())
                .append(getAge(), that.getAge())
                .append(getDateOfBirthday(), that.getDateOfBirthday())
                .append(getFaculty(), that.getFaculty())
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37)
                .appendSuper(super.hashCode())
                .append(getFirstName())
                .append(getLastName())
                .append(getAge())
                .append(getDateOfBirthday())
                .append(getFaculty())
                .toHashCode();
    }
}
