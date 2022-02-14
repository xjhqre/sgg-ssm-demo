package com.xjhqre.crud;

/**
 * @Author: xjhqre
 * @DateTime: 2022/2/10 14:06
 */

import com.github.pagehelper.PageInfo;
import com.xjhqre.crud.pojo.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring测试模块提供的测试请求功能，测试curd请求的正确性
 * Spring4测试的时候，需要servlet3.0的支持
 *
 * @author lfy
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // 表示测试的 ApplicationContext 应该是WebApplicationContext
@ContextConfiguration(locations = {"classpath:applicationContext.xml",
        "/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
    // 传入SpringMVC的ioc
    @Autowired
    WebApplicationContext context;
    // 虚拟MVC请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMokcMvc() {
        // 初始化mockMvc
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        // 模拟发送get请求， 传入参数名和参数的值，拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
        // 请求成功以后，请求域中会有pageInfo；我们可以取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i : nums) {
            System.out.print(" "+i);
        }
        System.out.println();
        //获取员工数据
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.println("ID："+employee.getEmpId()+"==>Name:"+employee.getEmpName());
        }
    }
}
