<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        学生信息管理平台
    </title>
    <link href="../../Style/StudentStyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css"/>
    <link href="../../Style/ks.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/mine.css" type="text/css" rel="stylesheet">
    <script src="../../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../../Script/Common.js" type="text/javascript"></script>
    <script src="../../Script/Data.js" type="text/javascript"></script>
    <script>
        function del() {
            confirm("确定删除？");
        }
    </script>

</head>
<body>


<div class="div_head" style="width: 100%;text-align:center;">
		<span>
            <span style="float:left">当前位置是：权限管理-》人员管理</span>
            <span style="float:right;margin-right: 8px;font-weight: bold">
          
            <a style="text-decoration: none;" href="javascript:alert('操作成功！');">【批量删除】</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a style="text-decoration: none;" href="/power/user/getRoleList">【新增人员】</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		</span>
</div>
    <div class="morebt">
</div>

<div class="cztable" style="width: 100%;">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr style="height: 25px;" align="center">

            <th width="8%">
                <input type="checkbox"/>
            </th>
            <th scope="col" width="15%">
                序号
            </th>
            <th scope="col" width="15%">
                账号
            </th>
            <th scope="col" width="15%">
                姓名
            </th>
            <th scope="col" width="15%">
                角色
            </th>

            <th scope="col">
                操作
            </th>
        </tr>

        <c:forEach items="${pi.dataList}" var="u" varStatus="sta">
            <tr align="center">
                <th><input type="checkbox"/></th>
                <td>
                        ${sta.count}
                </td>
                <td>
                        ${u.loginName}
                </td>
                <td>
                    <a href="info.jsp">${u.realName}</a>
                </td>
                <td>
                        ${u.role.roleName}
                </td>
                <td>
                    <a href="/power/user/users?method=findById&uid=${u.userId}">修改</a>
                    <a href="javascript:void(0)" onclick="del();return false" class="tablelink">删除</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <div class='MainStyle'>
        <div class=''>
            <a href='/power/user/users?method=select' target='_self'>首页</a>
        </div>
        <div class=''><a href='/power/user/users?method=select&index=${pi.pageIndex-1<=1?1:pi.pageIndex-1}'
                         target='_self'>上一页</a></div>

        <c:forEach begin="1" end="${pi.totalPages}" var="indexa">
            <div class=${pi.pageIndex==indexa?'NowItemStyle':''}><a
                    href='/power/user/users?method=select&index=${indexa}' target='_self'>${indexa}</a></div>
        </c:forEach>
        <div class=''><a
                href='/power/user/users?method=select&index=${pi.pageIndex+1>=pi.totalPages?pi.totalPages:pi.pageIndex+1}'
                target='_self'>下一页</a></div>
        <div class=''><a href='/power/user/users?method=select&index=${pi.totalPages}' target='_self'>尾页</a></div>
        <div class=''>总共<b>${pi.total}</b>条数据</div>
        <div class=''>每页<b>${pi.pageSize}</b>条数据</div>
        <div class=''><b>${pi.pageIndex}</b> / <b>${pi.totalPages}</b></div>
        <div class='SearchStyle'>
            <input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/>
        </div>
        <div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div>
    </div>
</div>
</div>


</div>
</body>
</html>