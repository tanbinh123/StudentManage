package com.murphy.service.impl;

import com.murphy.bean.Student;
import com.murphy.dao.StudentDao;
import com.murphy.dao.impl.StudentDaoImpl;
import com.murphy.service.StudentService;

import java.util.List;

/**
 * @author murphy
 */
public class StudentServiceImpl implements StudentService {

    private StudentDao studentDao = new StudentDaoImpl();

    @Override
    public List<Student> getStudents(String name,String stuNo,int sex,int pageIndex,int pageSize) {
        return studentDao.getStudents(name, stuNo, sex, pageIndex, pageSize);
    }

    @Override
    public int total(String name, String stuNo, int sex) {
        return studentDao.total(name, stuNo, sex);
    }
}
