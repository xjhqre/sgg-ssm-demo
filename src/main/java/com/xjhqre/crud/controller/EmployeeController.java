package com.xjhqre.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xjhqre.crud.pojo.Employee;
import com.xjhqre.crud.pojo.Msg;
import com.xjhqre.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.*;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/10 13:22
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 查询员工数据
     * @return 员工信息
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg queryAllEmployees(@RequestParam(value = "pn", defaultValue = "1")Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Employee> employees = employeeService.queryAllEmployees();
        PageInfo pageInfo = new PageInfo(employees, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 保存员工信息
     * @param employee 页面传来的员工数据
     * @param result 员工数据的校验结果
     * @return 校验信息
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名：" + error.getField());
                System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }


    /**
     * 检查邮箱是否可用
     * @param empEmail 网页传来的邮箱
     * @return json数据
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public Msg checkForDuplicateEmails(@RequestParam("empEmail")String empEmail) {
        boolean b = employeeService.checkForDuplicateEmails(empEmail);
        if(b){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    /**
     * 根据id查询员工信息
     * @param id 页面传入的id
     * @return 员工对象的JSON数据
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id")Integer id) {
        Employee emp = employeeService.getEmpById(id);
        return Msg.success().add("emp", emp);
    }

    /**
     * 根据id更新员工信息
     * @param employee 页面传来的员工数据
     * @param result 校验结果
     * @return 校验信息
     */
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmpById(@Valid Employee employee, BindingResult result) {
        System.out.println("===========员工数据===============：" + employee);
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名：" + error.getField());
                System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.updateEmpById(employee);
            return Msg.success();
        }
    }

    /**
     * 根据id删除对应的员工数据
     * @return 删除是否成功
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("id")String id) {
        String[] ids = id.split("-");
        List<Integer> idList = new ArrayList<>();
        for (String s : ids) {
            idList.add(Integer.valueOf(s));
        }
        if (idList.size() == 1) {
            employeeService.deleteEmpById(idList.get(0));
        } else {
            employeeService.deleteBatch(idList);
        }
        return Msg.success();
    }
}
