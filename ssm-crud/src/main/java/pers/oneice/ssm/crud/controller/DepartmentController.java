package pers.oneice.ssm.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.oneice.ssm.crud.pojo.Department;
import pers.oneice.ssm.crud.pojo.Msg;
import pers.oneice.ssm.crud.service.DepartmentService;

import java.util.List;

/**
 * 处理和部门相关的请求
 * @author OneIce
 * @since 2021/3/25 15:40
 */
@Controller
public class DepartmentController {
    private DepartmentService departmentService;

    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    /** 查询部门列表 */
    @GetMapping("/depts")
    @ResponseBody
    public Msg getDepts() {
        List<Department> depts = departmentService.getDepts();
        Msg msg = Msg.success();
        msg.add("depts", depts);
        return msg;
    }
}
