package com.murphy.dao;

import com.murphy.bean.Role;
import com.murphy.bean.Student;

import java.util.List;

/**
 * @author murphy
 */
public interface RoleDao {
    /**
     * 查询角色列表
     * @return list
     */
    public List<Role> getLists();

    /**
     * 查询所有角色的列表
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public List<Role> getRoleList(int pageIndex, int pageSize);

    /**
     * 查询总条数
     * @return
     */
    public int total();
}