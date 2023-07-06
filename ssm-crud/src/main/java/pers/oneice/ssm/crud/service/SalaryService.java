package pers.oneice.ssm.crud.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import pers.oneice.ssm.crud.dao.SalaryMapper;
import pers.oneice.ssm.crud.exception.BusinessException;
import pers.oneice.ssm.crud.pojo.Employee;
import pers.oneice.ssm.crud.pojo.EmployeeExample;
import pers.oneice.ssm.crud.pojo.ErrorCodeEnum;
import pers.oneice.ssm.crud.pojo.Salary;

import java.util.List;

@Service
public class SalaryService {
    private SalaryMapper salaryMapper;
    public SalaryService(SalaryMapper salaryMapper){
        this.salaryMapper = salaryMapper;
    }

    public List<Salary> getAllList() {
        return salaryMapper.getAllList();
    }

    public PageInfo<Salary> getEmps(int page, int rows, String type, String keyword) {
        PageHelper.startPage(page, rows);
        EmployeeExample example = new EmployeeExample();
        if (StringUtils.hasLength(type) && StringUtils.hasLength(keyword)) {
            switch (type) {
                case "byEmpName":
                    example.createCriteria().andEmpNameLike("%" + keyword + "%");
                    break;
                case "byEmail":
                    example.createCriteria().andEmailLike("%" + keyword + "%");
                    break;
                case "byId":
                    example.createCriteria().andEmpIdEqualTo(Integer.parseInt(keyword));
                    break;
            }
        }
        List<Salary> emps =salaryMapper.getAllList();
        return new PageInfo<>(emps, 5);
    }
}
