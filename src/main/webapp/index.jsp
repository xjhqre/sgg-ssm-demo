<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%-- 添加员工模态框 --%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <%-- 表单 --%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input name="empName" type="text" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_add_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input name="empEmail" type="text" class="form-control" id="empEmail_add_input"
                                   placeholder="empEmail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empGender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_add_input2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptId</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="deptId_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveEmpBtn">保存</button>
            </div>
        </div>
    </div>
</div>

<%-- 修改员工模态框 --%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="updateModalLabel">修改员工</h4>
            </div>
            <div class="modal-body">
                <%-- 表单 --%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input name="empName" type="text" class="form-control" id="empName_update_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_add_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input name="empEmail" type="text" class="form-control" id="empEmail_update_input"
                                   placeholder="empEmail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empGender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_update_input2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptId</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="deptId_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateEmpBtn">更新</button>
            </div>
        </div>
    </div>
</div>

<%-- 搭建显示页面 --%>
<div class="container">
    <%-- 标题 --%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%-- 按钮 --%>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-primary" id="emp_add_modal_btn">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>添加
            </button>
            <button class="btn btn-danger" id="delete_all_emp_btn">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <%-- 显示表格数据 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%-- 通过函数加载数据 --%>
                </tbody>
            </table>
        </div>
    </div>
    <%-- 显示分页信息 --%>
    <div class="row">
        <%--分页条信息--%>
        <div class="col-md-6 col-md-offset-3 text-center" id="page_info_area"></div>
    </div>
    <div class="row">
        <%--分页文字信息 --%>
        <div class="col-md-6 col-md-offset-3 text-center" id="page_nav_area"></div>
    </div>

</div>
<script type="text/javascript">
    /* ================================================ 全局变量 ================================================ */

    var totalRecord; // 用于跳转到末页
    var currentPage // 用于完成请求后刷新页面

    /* ================================================ 函数 ================================================ */
    // 初始化页面时需要调用的函数
    $(function () {
        // 去首页
        to_page(1);
    });

    // 页面跳转函数
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                // 1.解析员工数据
                build_emps_table(result);
                // 2. 解析并显示分页信息
                build_page_info(result);
                // 3. 解析显示分页条码
                build_page_nav(result);
            }
        });
    }

    // 解析表格数据函数
    function build_emps_table(result) {
        // 清空表格信息
        $("#emps_table tbody").empty()
        // 获取员工列表
        var emps = result.extend.pageInfo.list;
        // 遍历员工列表，构建表格
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName)
            var genderTd = $("<td></td>").append(item.empGender == "M" ? "男" : "女")
            var emailTd = $("<td></td>").append(item.empEmail)
            var deptNameTd = $("<td></td>").append(item.department.deptName)

            // 注入按钮数据
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            // 添加自定义属性，用于修改员工时传递id值
            editBtn.attr("empId_for_edit", item.empId)
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    // 解析显示分页信息函数
    function build_page_info(result) {
        // 清空原来的分页信息
        $("#page_info_area").empty()
        $("#page_info_area").append("当前页：" +
            result.extend.pageInfo.pageNum + "，总页数：" +
            result.extend.pageInfo.pages + "，总记录数：" +
            result.extend.pageInfo.total)
        totalRecord = result.extend.pageInfo.total
        currentPage = result.extend.pageInfo.pageNum
    }

    // 解析显示分页条函数
    function build_page_nav(result) {
        // 清空原来的分页码
        $("#page_nav_area").empty();
        // 构建元素
        var ul = $("<ul></ul>").addClass("pagination")
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        // 添加首页、末页、上一页、下一页禁用 和跳转功能
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        } else {
            firstPageLi.click(function () {
                to_page(1)
            })
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        // 添加首页和前一页
        ul.append(firstPageLi).append(prePageLi)
        // 构建条码
        $.each(result.extend.pageInfo.navigatepageNums, function (index, num) {
            var numLi = $("<li></li>").append($("<a></a>").append(num).attr("href", "#"));
            // 设置当前页码高亮显示
            if (result.extend.pageInfo.pageNum == num) {
                numLi.addClass("active")
            }
            // 添加按钮跳转事件
            numLi.click(function () {
                to_page(num)
            })
            ul.append(numLi)
        });
        // 添加末页和后一页
        ul.append(nextPageLi).append(lastPageLi)

        var navEle = $("<nav></nav>").append(ul)
        navEle.appendTo("#page_nav_area");
    }

    // 查询所有部门信息请求函数
    function getDepts(ele) {
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                console.log(result)
                $.each(result.extend.depts, function () {
                    var optionElement = $("<option></option>").append(this.deptName).attr("value", this.deptId)
                    optionElement.appendTo(ele)
                })
            }
        })
    }

    // 添加员工表单数据校验信息显示函数
    function validate_add_from_information_show(ele, status, msg) {
        // 清楚当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("")
        if("success" == status){
            $(ele).parent().addClass("has-success")
            $(ele).next("span").text(msg)
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error")
            $(ele).next("span").text(msg)
        }
    }

    // 重置添加员工表单数据和样式
    function reset_form(ele) {
        // 清空表单数据
        $(ele + " form")[0].reset()
        // 清空表单样式
        $(ele + " form").find("*").removeClass("has-success has-error")
        $(ele + " form").find(".help-block").text("")
        // 清空下拉列表
        $(ele + " select").empty()
    }

    // 根据id查询员工信息函数
    function getEmpById(id) {
        $.ajax({
            url:"${APP_PATH}/emp/" + id,
            type:"GET",
            success:function (result) {
                var empData = result.extend.emp;
                console.log(result)
                $("#empName_update_input").val(empData.empName);
                $("#empEmail_update_input").val(empData.empEmail);
                $("#empUpdateModal input[name=empGender]").val(empData.empGender);
                $("#empUpdateModal select").val(empData.deptId);
            }
        })
    }

    // 校验用户名函数
    function verifyUsername(ele) {
        var empName = $(ele).val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/ // 允许英文和中文
        if(!regName.test(empName)){
            validate_add_from_information_show(ele, "error", "员工名称格式不正确")
            return false
        } else {
            validate_add_from_information_show(ele, "success", "")
            return true
        }
    }

    // 校验邮箱格式函数
    function checkMailbox(ele) {
        var empEmail = $(ele).val()
        var regEmail = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/
        if(!regEmail.test(empEmail)){
            validate_add_from_information_show(ele, "error", "邮箱格式不正确")
            return false
        }
        var isTheEmailAddressCorrect = false
        // 发送Ajax请求判断邮箱是否重复
        $.ajax({
            url:"${APP_PATH}/checkEmail",
            data:"empEmail=" + empEmail,
            type:"GET",  // get请求不检验中文,如果发送对象中含中文则用POST
            async:false, // 设置Ajax为同步
            success:function (result) {
                console.log(result)
                if(result.code === 100 && regEmail.test(empEmail)) {
                    validate_add_from_information_show(ele, "success", "")
                    isTheEmailAddressCorrect = true
                } else if (result.code === 200) {
                    validate_add_from_information_show(ele, "error", "邮箱已存在")
                    isTheEmailAddressCorrect = false
                }
            }
        })
        return isTheEmailAddressCorrect;
    }

    /* ============================================== 按钮绑定事件区 ============================================== */
    // 添加员工按钮事件
    $("#emp_add_modal_btn").click(function () {
        // 表单重置数据
        reset_form("#empAddModal")
        // 发送Ajax请求， 查出部门信息，显示在下拉列表中
        getDepts("#deptId_add_select")
        $("#empAddModal").modal({
            backdrop: "static"
        })
    })

    // 模态框保存按钮点击事件
    $("#saveEmpBtn").click(function () {
        // 校验表单数据
        if (!verifyUsername("#empName_add_input") || !checkMailbox("#empEmail_add_input")) {
            return false
        }
        // 发送保存请求
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                console.log(result)
                if(result.code === 100) {
                    // 员工保存成功
                    // 1. 关闭模态框
                    $("#empAddModal").modal('hide')
                    // 2. 跳转到最后一页显示
                    to_page(totalRecord)
                } else {
                    // 显示失败信息
                    if(undefined !== result.extend.errorFields.empEmail){
                        validate_add_from_information_show("#empEmail_add_input", "error", "邮箱格式不正确")
                    }
                    if(undefined !== result.extend.errorFields.empName){
                        validate_add_from_information_show("#empName_add_input", "error", "员工名称格式不正确")
                    }
                }
            }
        })
    })

    // 为修改员工按钮添加事件
    // 因为是先绑定事件后在生成的按钮，所以不能用click
    // 早先版本的jQuery可以使用live方法
    // 这里使用 on 方法绑定
    $(document).on("click", ".edit_btn", function () {
        // 1. 查询部门信息显示
        getDepts("#deptId_update_select")
        // 2. 回显员工信息
        getEmpById($(this).attr("empId_for_edit"))
        // 3. 传递id給更新按钮
        $("#updateEmpBtn").attr("empId_for_edit", $(this).attr("empId_for_edit"))
        // 4. 跳出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        })
    })

    // 绑定更新按钮单击事件
    $("#updateEmpBtn").click(function () {
        // 1. 校验表单数据
        if (!verifyUsername("#empName_update_input") || !checkMailbox("#empEmail_update_input")) {
            return false
        }
        // 2. 发送更新的Ajax请求
        $.ajax({
            url:"${APP_PATH}/emp/" + $(this).attr("empId_for_edit"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                console.log(result)
                if(result.code === 100) {
                    // 员工更新成功
                    // 1. 关闭模态框
                    $("#empUpdateModal").modal('hide')
                    // 2. 刷新页面
                    to_page(currentPage)
                } else {
                    // 显示失败信息
                    if(undefined !== result.extend.errorFields.empEmail){
                        validate_add_from_information_show("#empEmail_update_input", "error", "邮箱格式不正确")
                    }
                    if(undefined !== result.extend.errorFields.empName){
                        validate_add_from_information_show("#empName_update_input", "error", "员工名称格式不正确")
                    }
                }
            }
        })
    })

    // 单个删除按钮事件
    $(document).on("click", ".del_btn", function (){
        var empName = $(this).parents("tr").find("td:eq(2)").text()
        var empId = $(this).parents("tr").find("td:eq(1)").text()
        if(confirm("确认删除【" + empName + "】吗？")) {
            // 确认则发送Ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/" + empId,
                type:"DELETE",
                success:function (result) {
                    console.log(result)
                    // 刷新页面
                    to_page(currentPage)
                }
            })
        }
    })

    // 全选按钮绑定事件
    $("#check_all").click(function () {
        // attr获取checked属性时undefined
        // dom原生的属性需要用prop获取，attr获取自定义的属性
        $(".check_item").prop("checked", $(this).prop("checked"))
    })

    // 选项按钮绑定事件，当所有按钮被选中时，同时选中全选按钮
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length === $(".check_item").length
        $("#check_all").prop("checked", flag)
    })

    // 删除全部选中员工按钮事件
    $("#delete_all_emp_btn").click(function () {
        var empIds = ""
        $.each($(".check_item:checked"), function () {
            empIds += $(this).parents("tr").find("td:eq(1)").text() + "-"
        })
        // 删除最后一个 "-"
        empIds.substring(0, empIds.length-1)
        if(confirm("确认删除所有员工吗？")) {
            $.ajax({
                url:"${APP_PATH}/emp/" + empIds,
                type:"DELETE",
                success:function (result) {
                    console.log(result)
                    to_page(currentPage)
                    // 重置全选按钮为未选中状态
                    $("#check_all").prop("checked", false)
                }
            })
        }
    })

</script>
</body>
</html>