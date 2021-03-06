<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 这个语句是用来拼装当前网页的相对路径的。 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻</title>
<script src="ckeditor/ckeditor.js"></script>
<script src="ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<style type ="text/css"> 
 
a {font-size:14px;
text-decoration:none;
color:white;
/* font-weight:bold; */
} 
</style>
<style type="text/css">
.div1{
/* float:left; */
margin-left:100px;
Margin-bottom:0px;
}
table td
{
word-break: keep-all;
white-space:nowrap;
}</style>
</head>
<body>
<div class="position">　<a style="font-size:14px;text-decoration:none;color:#FFAA33;" >当前位置：服务指南管理　&gt;&gt;　信息编辑　</a>
<div class="div1">
<form action="serviceGuideServlet?op=update" method="post">
	<table class="right-table" width="60%"  border="0px" cellpadding="0" align="center" cellspacing="0">
		<tr>
			<td><a>标题</a></td>
			<td>
				<input type="hidden" name="id" value="${requestScope.serviceGuide.id }"/>
				<input type="text" name="title" value="${requestScope.serviceGuide.title }"/>
			</td>
		</tr>
		<tr>
			<td><a>发布者</a></td>
			<td><a>${sessionScope.loginUser_testCenter.userName }</a></td>
		</tr>
		<tr>
			<td><a>新闻类型</a></td>
			<td>
				<select name="typeId">
					<c:forEach items="${requestScope.serviceTypeList }" var="serviceType">
						<option value="${serviceType.id }" ${serviceType.id==requestScope.serviceGuide.typeId?"selected='selected'":"" }>${serviceType.typeName }</option>	
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><a>发布时间</a></td>
			<td><input type="text" name="publishTime" onClick="WdatePicker()" class="Wdate" value="${requestScope.serviceGuide.publishTime }"/></td>
		</tr>
		<tr>
		<c:if test="${requestScope.serviceGuide.typeId != '1'}">
			<td>状态</td>
			<c:if test="${requestScope.serviceGuide.pass eq '1'}">
			<td>
				<input type="hidden" name="pass" value="1" />未通过
			</td>
			</c:if>	
			<c:if test="${requestScope.serviceGuide.pass eq '0'}">	
			<td>
				<input type="hidden" name="pass" value="0"/>通过
			</td>
		</c:if>	
		
		</tr>
		</c:if>	
		<tr>
			<td><a>新闻内容</a></td>
			<td>
				<textarea rows="10" cols="20" name="content">${requestScope.serviceGuide.content }</textarea>
				<script type="text/javascript">
			    	var editor =CKEDITOR.replace('content', {
						uiColor: '#14B8C4'
					});
			    	CKFinder.setupCKEditor( editor, 'ckfinder/' ) ;
			    </script>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="修改新闻"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>