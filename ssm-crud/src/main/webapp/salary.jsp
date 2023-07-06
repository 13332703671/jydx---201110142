
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <title>薪资管理模块</title>
</head>
<body>

<!-- 用于员工新增的模态框 -->
<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog" aria-labelledby="addEmpModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改员工薪资</h4>
            </div>
            <%-- 表单部分 --%>
            <div class="modal-body">
                <form id="add_emp_form" action="#" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_email_input" class="col-sm-2 control-label">工资发放时间</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="email" class="form-control has-feedback" id="add_emp_email_input"
                                   placeholder="oneice@foxmail.com"
                                   name="email">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误消息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">底薪</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">奖金</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">打款卡号</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">实际发放工资</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <%-- 保存和关闭按钮 --%>
            <div class="modal-footer">
                <button id="add_emp_close_btn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="add_emp_save_btn" type="button" class="btn btn-primary">更新</button>
                <%-- 默认禁用 --%>
            </div>
        </div>
    </div>
</div>


<%-- 新增/删除行 --%>
<div class="row">
    <%-- 移到最右边 --%>
    <div class="col-md-2 col-md-offset-10">
        <button class="btn btn-success" id="add_emp_btn"><span class="glyphicon glyphicon-plus"></span> 新增</button>
        <button class="btn btn-danger" id="delete_all_check">
            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
        </button>
    </div>
</div>

<%-- 定义一个栅格布局 --%>
<div class="container">
    <%-- 标题行 --%>
    <div class="row">
        <%-- 占满整行(每行最多12列) --%>
        <div class="col-md-12"><h1>员工薪资管理</h1></div>
    </div>

    <%-- 输入框组, 用于条件查询 --%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form id="search_form" action="#">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button id="type_btn" type="button" class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">姓名 <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a name="byEmpName" href="javaScript:;">姓名</a></li>
                        </ul>
                    </div>
                    <input type="hidden" name="type" value="byEmpName">
                    <input name="keyword" type="text" class="form-control" placeholder="Search for...">

                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </div>

<%-- 表格行 --%>
<div class="row">
    <%-- 占满整行 --%>
    <div class="col-md-12">
        <table id="emp_table" class="table table-bordered table-striped table-hover">
            <caption style="display: none;">Employee List</caption>
            <thead>
            <tr>
                <th id="check"><input id="check_all" type="checkbox"></th>
                <th id="id">编号</th>
                <th id="name">姓名</th>
                <th id="gender">工资发放时间</th>
                <th id="email">底薪</th>
                <th id="department">奖金</th>
                <th id="operation">打款卡号</th>
                <th id="haha">实际发放工资</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>




<%-- 导航条信息 --%>
<div class="row">
    <%-- 导航条的分页信息 --%>
    <div class="col-md-6" id="page_info_area">
    </div>
    <%-- 导航条的页码显示 --%>
    <div class="col-md-6" id="page_navigate_area">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:choose>
                    <%-- 首页+上一页 --%>
                    <c:when test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?page=1&rows=${pageInfo.pageSize}">首页</a>
                        </li>
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.prePage}&rows=${pageInfo.pageSize}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled">
                            <span aria-hidden="true">首页</span>
                        </li>
                        <li class="disabled">
                            <span aria-hidden="true">&laquo;</span>
                        </li>
                    </c:otherwise>
                </c:choose>

                <%-- 页码展示 --%>
                <c:forEach var="navigatepageNum" items="${pageInfo.navigatepageNums}">
                    <c:choose>
                        <c:when test="${pageInfo.pageNum!=navigatepageNum}">
                            <li>
                                <a href="${APP_PATH}/emps?page=${navigatepageNum}&rows=${pageInfo.pageSize}">
                                        ${navigatepageNum}
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="active">
                                <span>${navigatepageNum} <span class="sr-only">(current)</span></span>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 下一页+末页 --%>
                <c:choose>
                    <c:when test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.nextPage}&rows=${pageInfo.pageSize}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="${APP_PATH}/emps?page=${pageInfo.pages}&rows=${pageInfo.pageSize}">末页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled">
                              <span>
                                <span aria-hidden="true">&raquo;</span>
                              </span>
                        </li>
                        <li class="disabled">
                              <span>
                                <span aria-hidden="true">末页</span>
                              </span>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



<%-- 分页查询 --%>
<script type="text/javascript">
    var pageNum = 1; //当前页码
    var rows = 10; //每页记录数
    var pages = 0; //总页数
    var total = 0; //总记录数
    var queryUrl = "${APP_PATH}/empsSalary" //用于查询的url

    //页面一加载好就请求一次分页数据
    $(function () {
        toPage(1, rows)
    })

    //发送Ajax请求, 请求分页数据
    function toPage(pageNum, rows) { //页码, 记录数
        $.ajax({
            type: "GET",
            url: queryUrl,
            data: {"page": pageNum, "rows": rows},
            dataType: "json",
            success: function (result) {
                //构建员工列表
                buildEmpsTable(result.dataMap.pageInfo.list)
                //构建分页基本信息
                buildPageInfo(result.dataMap.pageInfo)
                //构建导航条
                buildPageNavigate(result.dataMap.pageInfo)
            }
        })
    }

    //构建员工表格
    function buildEmpsTable(list) {
        //清空原表格数据
        $("#emp_table tbody").empty()
        //获取每个员工信息, 追加到表格中显示
        $.each(list, function () {
            var empTr = $("<tr></tr>")
            var empCbTd = $('<td><input class="check_item" type="checkbox"></td>')
            var empIdTd = $("<td></td>").append(this.id)
            var empNameTd = $("<td></td>").append(this.name)
            var genderTd = $("<td></td>").append(this.time)
            var emailTd = $("<td></td>").append(this.salary)
            var jiangjin = $("<td></td>").append(this.bonus)
            var koukuan = $("<td></td>").append(this.cardNumber)
            var jiehexianjin = $("<td></td>").append(this.finalSalary)

            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-edit")).append(" 编辑").attr("id", this.id)
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-trash")).append(" 删除").attr("id", this.id)
            var operatorTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
            empTr.append(empCbTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(jiangjin).append(koukuan).append(jiehexianjin)
                .appendTo("#emp_table tbody")
        })
    }

    //构建分页的基本信息
    function buildPageInfo(pageInfo) {
        $("#page_info_area").empty() //清空原信息
        pageNum = pageInfo.pageNum
        rows = pageInfo.pageSize
        pages = pageInfo.pages
        total = pageInfo.total
        $("#page_info_area").append(`当前第\${pageNum}页, 共\${pages}页, 共\${total}条记录`)
    }

    //构建导航条
    function buildPageNavigate(pageInfo) { //分页信息
        $("#page_navigate_area").empty() //清空原导航条

        var ul = $("<ul></ul>").addClass("pagination")
        //首页和上一页
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"))
        var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&laquo;"))
        //没有上一页时禁用掉按钮
        if (!pageInfo.hasPreviousPage) {
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        }
        //绑定单击事件
        clickToPage(firstPageLi, 1, pageInfo.pageSize)
        clickToPage(prePageLi, pageInfo.prePage, pageInfo.pageSize)
        ul.append(firstPageLi).append(prePageLi)

        //遍历中间页码
        $.each(pageInfo.navigatepageNums, function () {
            var pageNumLi = $("<li></li>").append($("<a></a>").attr("href", "#").append(this))
            //高亮当前页的页码
            if (pageInfo.pageNum == this) {
                pageNumLi.addClass("active")
            }
            //绑定单击事件
            clickToPage(pageNumLi, this, pageInfo.pageSize)
            ul.append(pageNumLi)
        })
        //下一页和末页
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&raquo;"))
        var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"))
        //绑定单击事件
        clickToPage(nextPageLi, pageInfo.nextPage, pageInfo.pageSize)
        clickToPage(lastPageLi, pageInfo.pages, pageInfo.pageSize)
        //没有下一页时禁用掉按钮
        if (!pageInfo.hasNextPage) {
            nextPageLi.addClass("disabled")
            lastPageLi.addClass("disabled")
        }
        ul.append(nextPageLi).append(lastPageLi)
        //创建导航条, 显示到页面上
        var nav = $("<nav></nav>").append(ul)
        $("#page_navigate_area").append(nav)
    }

    //为导航条页码绑定单击事件
    function clickToPage(obj, page, rows) { //按钮对象, 页码, 页大小
        $(obj).click(function () {
            if (!$(this).hasClass("disabled") && !$(this).hasClass("active")) {
                toPage(page, rows)
            }
            return false
        })
    }

</script>

<%-- 新增员工 --%>
<script type="text/javascript">

    //点击"新增"按钮, 弹出"新增"模态框
    $("#add_emp_btn").click(function () {
        resetForm("#add_emp_form")//重置表单(内容+样式)
        getDepts("#add_emp_dept_select") //查询所有部门信息显示在模态框上
        $("#add_emp_modal").modal() //展示模态框
    })

    //重置表单(内容+样式)
    function resetForm(selector) { //表单选择器
        //重置表单内容
        $(selector)[0].reset()
        //重置表单样式
        $(selector).find("*").removeClass("has-error has-success")
        $(selector).find(".glyphicon").removeClass("glyphicon-remove glyphicon-ok")
        $(selector).find(".help-block").text("")
    }

    //点击"关闭"按钮, 清空下拉列表的部门信息
    $("#add_emp_close_btn").click(function () {
        $("#add_emp_dept_select").empty()
    })

    //查询所有部门信息, 显示在selector所指定的下拉列表中
    function getDepts(selector) {
        $(selector).empty()
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/getSalaryList",
            dataType: "json",
            success: function (result) {
                $.each(result.dataMap.depts, function () {
                    var option = $("<option></option>").attr("value", this.deptId).append(this.deptName)
                    $(selector).append(option)
                })
            }
        })
    }


</script>
</body>
</html>

