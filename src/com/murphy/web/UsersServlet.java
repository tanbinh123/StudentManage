package com.murphy.web;

import com.murphy.bean.Users;
import com.murphy.service.UsersService;
import com.murphy.service.impl.UsersServiceImpl;
import com.murphy.util.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author murphy
 */

@WebServlet("/power/user/users")
public class UsersServlet extends HttpServlet {

    private UsersService usersService = new UsersServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if ("select".equals(method)){
            select(req,resp);
        }
    }

    /**
     * 查询分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 接收参数 - 分页参数 + 模糊查询参数
        String index = req.getParameter("index");
        int pageIndex = ( index == null || index.length() == 0)? 1 : Integer.parseInt(index);
        // 2. 调取 service 方法 - 1.查询数据列表的方法 / 2. 查询总条数的方法
        PageUtil pageUtil = new PageUtil();
        List<Users> usersList = usersService.getUsersList(pageIndex, pageUtil.getPageSize());
        int total = usersService.total();
        pageUtil.setTotal(total);
        pageUtil.setPageIndex(pageIndex);
        pageUtil.setDataList(usersList);

        // 3. 存值跳页面
        req.setAttribute("pi",pageUtil);
        req.getRequestDispatcher("list.jsp").forward(req,resp);
    }

}