package pers.oneice.ssm.crud.dao;

import pers.oneice.ssm.crud.pojo.Employee;
import pers.oneice.ssm.crud.pojo.EmployeeExample;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.util.List;

/**
 * @author OneIce
 * @Description
 * @since 2021/3/21 17:18
 */
@Resource
public interface EmployeeMapperExt extends EmployeeMapper {

    /** 查询满足example条件的员工, 包括所属部门信息 */
    List<Employee> queryByExampleWithDept(EmployeeExample example);

    /** 根据员工id查询员工, 包括所属部门信息 */
    Employee queryByIdWithDept(int empId);
}
