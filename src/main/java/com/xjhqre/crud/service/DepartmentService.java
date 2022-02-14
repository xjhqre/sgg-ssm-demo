package com.xjhqre.crud.service;

import com.xjhqre.crud.dao.DepartmentMapper;
import com.xjhqre.crud.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/11 17:19
 */
@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> quireAllDepartments() {
        return departmentMapper.selectByExample(null);
    }
}
