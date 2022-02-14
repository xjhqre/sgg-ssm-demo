package com.xjhqre.crud.controller;

import com.xjhqre.crud.pojo.Department;
import com.xjhqre.crud.pojo.Msg;
import com.xjhqre.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/11 17:18
 */
@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg quireAllDepartments() {
        List<Department> departments = departmentService.quireAllDepartments();
        return Msg.success().add("depts", departments);
    }
}
