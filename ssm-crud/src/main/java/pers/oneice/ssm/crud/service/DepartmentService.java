package pers.oneice.ssm.crud.service;

import org.springframework.stereotype.Service;
import pers.oneice.ssm.crud.dao.DepartmentMapperExt;
import pers.oneice.ssm.crud.pojo.Department;

import java.util.List;

/**
 * 处理和部门相关的业务逻辑
 * @author OneIce
 * @since 2021/3/25 15:40
 */
@Service
public class DepartmentService {
    private DepartmentMapperExt departmentMapper;

    public DepartmentService(DepartmentMapperExt departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    /** 查询所有部门 */
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
