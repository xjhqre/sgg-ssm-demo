package com.xjhqre.crud.service;

import com.xjhqre.crud.dao.EmployeeMapper;
import com.xjhqre.crud.pojo.Employee;
import com.xjhqre.crud.pojo.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/10 13:20
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return 员工信息
     */
    public List<Employee> queryAllEmployees() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 添加员工信息
     * @param employee 员工对象
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检查邮箱是否重复
     * @param empEmail 页面传来的邮箱
     * @return 返回该邮箱是否可用
     */
    public boolean checkForDuplicateEmails(String empEmail) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpEmailEqualTo(empEmail);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * 根据id查询员工
     * @param id 页面传来的id
     * @return 员工对象
     */
    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据id更新员工数据
     * @param employee 页面传来的员工数据
     */
    public void updateEmpById(Employee employee) {
        employeeMapper.updateByPrimaryKey(employee);
    }

    /**
     * 根据id删除员工
     * @param id 页面传入的id
     */
    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    /**
     * 删除对应列表里id的员工
     * @param idList id列表
     */
    public void deleteBatch(List<Integer> idList) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(idList);
        employeeMapper.deleteByExample(employeeExample);
    }
}
