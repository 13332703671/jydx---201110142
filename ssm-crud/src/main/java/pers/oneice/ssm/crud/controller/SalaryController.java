package pers.oneice.ssm.crud.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.oneice.ssm.crud.pojo.Employee;
import pers.oneice.ssm.crud.pojo.ErrorCodeEnum;
import pers.oneice.ssm.crud.pojo.Msg;
import pers.oneice.ssm.crud.pojo.Salary;
import pers.oneice.ssm.crud.service.SalaryService;


import javax.validation.Valid;
import java.util.List;

@Controller
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    public SalaryController(SalaryService salaryService){
        this.salaryService = salaryService;
    }

    @GetMapping("/getSalaryList")
    @ResponseBody
    public Msg getSalaryList(){
        List<Salary> salaryList = salaryService.getAllList();
        System.out.println(salaryList);
        Msg msg = Msg.success();
        msg.add("SalaryList", salaryList);
        return msg;
    }



    /**
     * 分页查询员工信息, 返回Json数据
     * @param page    页码
     * @param rows    记录数
     * @param type    查询条件, 可以为null
     * @param keyword 搜索词, 可以为null
     * @return 分页数据(包含查询到的员工数据), 由MappingJackson2CborHttpMessageConverter解析成Json字符串
     */
    @ResponseBody
    @GetMapping("/empsSalary")
    public Msg getEmpsWithJson(@RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "rows", defaultValue = "10") int rows,
                               @RequestParam(value = "type", required = false) String type,
                               @RequestParam(value = "keyword", required = false) String keyword) {
        PageInfo<Salary> pageInfo = salaryService.getEmps(page, rows, type, keyword);
        Msg msg = Msg.success();
        msg.add("pageInfo", pageInfo);
        return msg;
    }


}
