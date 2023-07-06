package pers.oneice.ssm.crud.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pers.oneice.ssm.crud.pojo.Employee;
import pers.oneice.ssm.crud.pojo.ErrorCodeEnum;
import pers.oneice.ssm.crud.pojo.Msg;
import pers.oneice.ssm.crud.service.EmployeeService;

import javax.validation.Valid;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 处理员工CRUD请求
 * @author OneIce
 * @since 2021/3/21 17:18
 */
@Controller
public class EmployeeController {
    private EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    /**
     * 分页查询员工数据
     * @param page 页码
     * @param rows 记录数
     * @return 转发至PAGE_LIST页面进行展示
     */
    @GetMapping("/emps_tmp")
    public String getEmps(@RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "rows", defaultValue = "10") int rows,
                          Model model) {
        PageInfo<Employee> pageInfo = employeeService.getEmps(page, rows, null, null);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
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
    @GetMapping("/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "rows", defaultValue = "10") int rows,
                               @RequestParam(value = "type", required = false) String type,
                               @RequestParam(value = "keyword", required = false) String keyword) {
        PageInfo<Employee> pageInfo = employeeService.getEmps(page, rows, type, keyword);
        Msg msg = Msg.success();
        msg.add("pageInfo", pageInfo);
        return msg;
    }


    /** 保存员工 */
    @PostMapping("/emps")
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Msg msg = new Msg(ErrorCodeEnum.REQUEST_PARAM_ERROR);
            for (FieldError fieldError : result.getFieldErrors()) {
                msg.add(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return msg;
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /** 检查员工姓名是否可用 */
    @GetMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName) {
        String regex = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,8}$)";
        if (Pattern.matches(regex, empName)) {
            return employeeService.checkEmpName(empName) ? Msg.success() : new Msg(ErrorCodeEnum.USERNAME_EXIST);
        } else {
            return new Msg(ErrorCodeEnum.USERNAME_FORMAT_ERROR);
        }
    }

    /** 根据员工id查询员工 */
    @GetMapping(value = "/emps/{id}")
    @ResponseBody
    public Msg getEmp(@PathVariable("id") int id) {
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp", employee);
    }

    /**
     * 更新员工
     * 路径变量写成{empId}可以保证数据绑定器能正确将{empId}注入到Employee入参的empId属性中
     */
    @PutMapping(value = "/emps/{empId}")
    @ResponseBody
    public Msg updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 根据员工id删除员工, 支持批量删除
     * 单个删除: /emps/id1
     * 批量删除: /emps/id1-id2-id3...
     */
    @DeleteMapping(value = "/emps/{empIds}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable("empIds") List<Integer> ids) {
        if (ids.size() == 1) { //单个删除
            employeeService.deleteEmp(ids.get(0));
        } else { //批量删除
            employeeService.deleteBatch(ids);
        }
        return Msg.success();
    }

}
