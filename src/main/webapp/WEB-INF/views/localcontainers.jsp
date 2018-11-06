<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Container List</title>
 <link href="css/main.css" rel="stylesheet">
 <link href="css/bootstrap.css" rel="sytlesheet" >
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
    <script  type="text/javascript">
        window.onload=function(){
            $('#map').css('display','block');
            $('#info').css('display','none');
            $('#photo').css('display','none');
        }
    </script>

<script type="text/javascript">
  function datefmt(tm) {
	  var dt = new Date(parseInt(tm) * 1000).toLocaleString();
	  dt = dt.substr(0, dt.length - 3) ;
	  document.write(dt);
  }
</script>
</head>
<body>
<div id="centeredmenu">
    <ul>
        
        <li ><a href="./images" >My Images</a></li>
        <li ><a href="./containers/list" }">My Containers</a></li>
        <li ><a href="./sl" }">Search Local DB</a></li>   
		 <li ><a href="./build" }">Deal with DockerFile</a></li>       
        <form method="post" action="./searchimages">
        <li> <input type="text" name="keyword" /></li>
        <li > <input type="submit" name="submit" id="submit" value="Search Images"/></li>
       	</form>
        <li style="float:right"><a href="./">Log Out</a></li>
    </ul><br/>
    <h2 align="center">Container List</h2>
</div>



<div class="container">
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading"></div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ContainerName</th>
						<th>Image</th>
						<th>CreateTime</th>
						<th>Id</th>
						<th>Port</th>
						<th><span class="glyphicon glyphicon-cog"></span>&nbsp;Opertaion&nbsp;&nbsp;
							<!-- button class="btn btn-info btn-xs container-import" >ImportImage</button--></th>
					</tr>
				</thead>
				<c:forEach items="${result}" var="container">
					<tr>
						<td>${container.name} }</td>
						<td>${container.fromImage }</td>
						<td>${container.createdTime}</td>
						<td>${container.id }</td>
						<td>${container.ports }</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>