package pers.oneice.ssm.crud.controller;

import com.github.pagehelper.PageInfo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import pers.oneice.ssm.crud.pojo.Employee;

/**
 * @Description
 * @Author OneIce
 * @Date 2021/3/21 18:35
 */
@WebAppConfiguration //在测试类上声明该注解, 就可以使用@Autowired获取Spring MVC的上下文
@SpringJUnitConfig(locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml",
        "file:src/main/webapp/WEB-INF/springmvc.xml"})
class EmployeeControllerTest {

    @Autowired
    WebApplicationContext context; //MVC上下文

    MockMvc mockMvc; //虚拟MVC请求, 获取返回结果

    @BeforeEach
    void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @SuppressWarnings("unchecked")
    @Test
    void getEmps() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").
                param("page", "2").param("rows", "5")).andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println("当前页码: " + pageInfo.getPageNum());
        System.out.println("当前页大小: " + pageInfo.getPageSize());
        System.out.println("总页数: " + pageInfo.getPages());
        System.out.println("总记录数: " + pageInfo.getTotal());
        System.out.print("导航条页码: ");
        for (int navigatePageNum : pageInfo.getNavigatepageNums()) {
            System.out.print(navigatePageNum + " ");
        }
        System.out.println();
        //打印员工数据
        pageInfo.getList().forEach(employee -> System.out.println(employee));
    }
}
