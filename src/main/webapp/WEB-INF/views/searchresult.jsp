<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/main.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>

        #centeredmenu ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        #centeredmenu li {
            float: left;
        }

        #centeredmenu li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        /*鼠标移动到选项上修改背景颜色 */
        #centeredmenu  li a:hover {
            background-color: #111;
        }
        #centeredmenu  li input {
        	background-color: #f0f8ff;
        }
         #centeredmenu  li h2 {
        	background-color: #f0f8ff;
        }

        td.width1{
            width:200px;
        }
        td.width2{
            width:800px;
        }
    </style>
</head>
<body>
		<div id="centeredmenu">
    <ul>
        
        <li ><a href="./images" >My Images</a></li>
        <li ><a href="./containers.list" }">My Containers</a></li>
        <li ><a href="./sl" }">Search Local DB</a></li>   
		 <li ><a href="./build" }">Build Customer Images</a></li>      
        <form method="post" action="./searchimages">
        <li> <input type="text" name="keyword" /></li>
        <li > <input type="submit" name="submit" id="submit" value="Search Images"/></li>
       	</form>
        <li style="float:right"><a href="./userlogin">Log Out</a></li>
    </ul><br/>
    <h2 align="center">Here are Your Search Result</h2>
</div>
		
		<div class="table-wrapper">
		There are ${map.size} search results!
		<table><thead><tr>
		<td> Name </td>
		<td>Start_Count</td>
		<td>Description</td>
		<td> Pull </td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${map.result}" var="image">
		<tr>
		 <td> <c:out value="${image.name}"/></td>
		 <td> <c:out value="${image.starCount}"/></td>
		 <td> <c:out value="${image.description}"/></td>
		 <td> <a href="./pull?imagename=${image.name}&imagedes=${image.description}">Pull</a></td>
		 </tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
</body>
</html>