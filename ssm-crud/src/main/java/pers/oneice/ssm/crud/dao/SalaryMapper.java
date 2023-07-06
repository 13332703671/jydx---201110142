package pers.oneice.ssm.crud.dao;

import com.google.protobuf.RpcUtil;
import pers.oneice.ssm.crud.pojo.Employee;
import pers.oneice.ssm.crud.pojo.Salary;
import javax.annotation.Resource;
import java.util.List;

/**
* @author HYB
* @description 针对表【tb_salary】的数据库操作Mapper
* @createDate 2023-07-03 20:45:33
* @Entity pers.pojo.Salary
*/
@Resource
public interface SalaryMapper{
    List<Salary> getAllList();

}




