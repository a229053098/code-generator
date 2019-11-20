<?xml version="1.0" encoding="utf-8"?>
<template>
    <name>viewList</name>
    <filePath>src/main/webapp/WEB-INF/page/${className}</filePath>
    <fileName>${className}-list.jsp</fileName>
    <content><![CDATA[
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@include file="/jspf/fn.jspf" %>

        <!DOCTYPE HTML>
        <html>

        <head>

            <%@include file="/jspf/list-meta.jspf" %>

            <title>${genScheme.name}</title>

        </head>

        <body>
        <nav class="breadcrumb">
            <i class="Hui-iconfont">&#xe67f;</i> 首页
            <span class="c-gray en">&gt;</span>  系统配置
            <span class="c-gray en">&gt;</span>  ${genScheme.name}
            <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
               href="javascript:location.replace(location.href);" title="刷新">
                <i class="Hui-iconfont">&#xe68f;</i></a>
        </nav>
        <div class="page-container">

            <!-- 条件筛选 -->
            <div class="search-container bg-F9">
                <form id="bsSearchForm" action="#" method="post" class="form form-horizontal" onsubmit="javacript:return false;">
                    <div class="cl">
                    <#list table.columnList as c>
                        <#if c.isQuery?? && c.isQuery == "1">
                            <#if c.showType == "select">
                                <div class="col-lg-3 col-md-4 col-sm-6 mt-10 mb-10">
                                    <label class="form-label col-sm-5 text-r">${c.comments}：</label>
                                    <div class="formControls col-sm-7">
                                        <select name="QUERY-${c.simpleJavaField}-s-eq" class="input-text">
                                            <option value="">---请选择---</option>
                                            <c:forEach items="${"$"}{dict:getByType('${c.dictType}')}" var="item">
                                                <option value="${"$"}{item.code}">${"$"}{item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            <#elseif c.javaType == "java.util.Date">
                                <label class="form-label col-xs-3 col-sm-3">${c.comments}：</label>
                                <div class="formControls col-xs-3 col-sm-3">
                                    <input type="text" value="<fmt:formatDate value="${"$"}{vo.${c.javaField}}" pattern="yyyy/MM/dd"></fmt:formatDate>" name="QUERY-create_date-s-ge" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                    class="input-text Wdate" style="width:205px;" readonly>至
                                    <input type="text" value="<fmt:formatDate value="${"$"}{vo.${c.javaField}}" pattern="yyyy/MM/dd"></fmt:formatDate>" name="QUERY-create_date-s-le" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                    class="input-text Wdate" style="width:205px;" readonly>
                                </div>
                            <#elseif c.showType != "pictureselect">
                                <div class="col-lg-3 col-md-4 col-sm-6 mt-10 mb-10">
                                    <label class="form-label col-sm-5 text-r">${c.comments}：</label>
                                    <div class="formControls col-sm-7">
                                        <input type="text" class="input-text radius size-S" value="" placeholder="" name="QUERY-${c.name}-s-<#if c.queryType == "=">eq<#elseif c.queryType == "like">lk<#elseif c.queryType == "!=">ne<#elseif c.queryType == "&gt;">gt<#elseif c.queryType == "&gt;=">ge<#elseif c.queryType == "&lt;">lt<#elseif c.queryType == "&lt;=">le<#elseif c.queryType == "in">in<#elseif c.queryType == "is">is<#elseif c.queryType == "notLike">nlk</#if>">
                                    </div>
                                </div>
                            </#if>
                        </#if>
                    </#list>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-10 mb-10">
                            <div class=" col-sm-12">
                                <a class="btn btn-primary radius ml-15" id="bsSearch"><i class="Hui-iconfont">&#xe665;</i> 搜索
                                </a>
                                <a class="btn btn-primary radius ml-15" id="bsReset"><i class="Hui-iconfont">&#xe66c;</i> 重置
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 条件筛选结束 -->

            <!-- 工具栏 -->
            <div class="cl pd-5 bg-F9 bk-gray mt-10 pd-10">
        <span class="l">
            <my:p code="${className}_del">
                <button onclick="delAll()" class="btn btn-danger  radius size-S ml-10">
                    <i class="Hui-iconfont"> &#xe6e2;</i> 批量删除
                </button>
            </my:p>

            <my:p code="${className}_edit">
                <button onclick="add()" class="btn btn-success radius size-S ml-10">
                    <i class="Hui-iconfont">&#xe600;</i> 添加
                </button>
            </my:p>

        <#if excel == "1">
            <span class="${className}_excel">
                <button onclick="exportExcel()" class="btn btn-success radius size-S ml-10">
                    导出
                </button>
            </span>
        </#if>

        </span>
            </div>

            <!-- 表格 -->
            <!--index是直接调用属性的，render调用的属性需要有方法-->
            <div class="mt-10">
                <table id="bsGrid" class="bs-grid">
                    <tr>
                        <th w_index="id" w_check="true" width="1%;"></th>
                    <#list table.columnList as c>
                        <#if c.name != "id" && c.isList == "1">
                            <#if c.showType == "pictureselect" || c.javaType == "java.util.Date">
                                <th w_render="${c.javaField}" w_sort="${c.name}" w_align="center" width="10%;">${c.comments}</th>
                            <#else>
                                <th w_index="${c.javaField}" w_sort="${c.name}" w_align="center" width="10%;">${c.comments}</th>
                            </#if>
                        </#if>
                    </#list>
                        <th w_render="toolbar" w_align="center" width="8%;">操作</th>
                    </tr>
                </table>
            </div>
        </div>

        <%@include file="/jspf/list-footer.jspf" %>
        <%--时间控件--%>
        <script type="text/javascript" src="${"$"}{ctx}/plugins/lib/My97DatePicker/WdatePicker.js"></script>

        <script type="text/javascript">
            function toolbar(row) {
                var id = row.id;
                var html = "";

            <my:p code="${className}_edit">
                html += '<a title="编辑" href="javascript:;" onclick="add(' + id + ')" ><i class="Hui-iconfont">&#xe6df;</i>编辑</a>'
                        </my:p>

                <my:p code="${className}_del">
                html += '<a title="删除" href="javascript:;" onclick="del(' + id + ')" class="ml-15"><i class="Hui-iconfont">&#xe6e2;</i>删除</a>';
            </my:p>

                return html;
            }
            <#list table.columnList as c>
                <#if c.showType == "select" || c.showType == "radiobox" || c.showType == "checkbox" ||>
                /** 显示对应中文类型 **/
                var ${c.javaField}Object = ${dict:getJSONByType("${c.dictType}")};
                function ${c.javaField}(row) {
                    if(${c.javaField}Object[row.${c.javaField}]){
                        return ${c.javaField}Object[${c.javaField}];
                    }else{
                        return "";
                    }
                }
                </#if>
            </#list>


            <#list table.columnList as c>
                <#if c.javaType == "java.util.Date">
                /** 显示时间格式 **/
                function ${c.javaField}(row) {
                    if (${c.javaField} != null){
                    return new Date(row["${c.javaField}"]).format(<#if c.isEdit == "1">'yyyy-MM-dd'<#else>'yyyy-MM-dd hh:mm:ss'</#if>);
                    } else {
                        return "";
                    }
                }
                </#if>
            </#list>

            <#if excel == "1">
            function exportExcel() {
                var params = $('#bsSearchForm').serialize();
                location.href = "${"$"}{basePath}/b/${className}/${className}Ex?" + params;
            }
            </#if>

            <#list table.columnList as c>
                <#if c.showType == "pictureselect">
                /** 图片显示 **/
                function ${c.javaField}(row) {
                    var ${c.javaField} = row.${c.javaField};
                    if(${c.javaField}){
                        var ${c.javaField}Url = "${"$"}{staticAddressUrl}"+row.${c.javaField};
                        return "<img width='50' height='50' src="+${c.javaField}Url+" />";
                    }else{
                        return "";
                    }
                }
                </#if>
            </#list>

            /** 获取列表数据 **/
            var gridObj;
            $(function () {
                gridObj = BSGrid.init('bsGrid', {
                    url: '${"$"}{ctx}/b/${className}/list',
                    otherParames: $('#bsSearchForm').serializeArray(),
                });

            });

            /** 跳转编辑框 **/
            function add(id) {
                var url = "${"$"}{ctx}/b/${className}/editUI?id=";
                if (id) {
                    url += id;
                }
                layer_show("编辑", url, 800, 650);
            }

            /** 删除 **/
            function del(id) {
                xxl.confirm("确认要删除吗？", function (index) {
                    $.get('${"$"}{ctx}/b/${className}/del?id=' + id, function (result) {
                        if (result == "success") {
                            xxl.sucRef();
                        }
                    })
                });
            }

            /** 批量删除 **/
            function delAll() {
                var ids = BSGrid.getCheckedRowsId(gridObj);
                if (!ids) {
                    xxl.message("请至少选中一行 !", 2);
                    return;
                }
                xxl.confirm("确定要删除选中项吗?", function () {
                    $.get("${"$"}{ctx}/b/${className}/delAll?ids=" + ids, function (result) {
                        if (result == "success") {
                            xxl.sucRef();
                        }
                    })
                });
            }

        </script>
        </body>

        </html>]]>
    </content>
</template>