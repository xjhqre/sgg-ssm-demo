package com.xjhqre.crud;

import com.xjhqre.crud.dao.DepartmentMapper;
import com.xjhqre.crud.dao.EmployeeMapper;
import com.xjhqre.crud.pojo.Department;
import com.xjhqre.crud.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/9 18:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void test1() {
        System.out.println(departmentMapper);

        // 1. 测试插入部门
        double a=37.2;
        departmentMapper.insertSelective(new Department(null, "技术部"));
        departmentMapper.insertSelective(new Department(null, "开发部"));

        // 2、生成员工数据，测试员工插入
        employeeMapper.insertSelective(new Employee(null, "xjhqre", "M", "xjhqre@126.com", 1));

        // 3、批量插入多个员工；批量，使用可以执行批量操作的sqlSession。
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "M", uid + "@126.com", 1));
        }
    }

    public static void main(String[] args) {
        System.out.println();
        System.out.println(2/3);
    }
}
