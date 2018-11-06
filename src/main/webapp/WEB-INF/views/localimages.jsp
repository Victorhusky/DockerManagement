<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="active" value="images" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Local Images List</title>
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
  		function datasizefmt(data) {
	var content = data + "";
	var len = content.length;
	if (len > 6) {
		var m = content.substr(0, len - 6);
		var k = content.substr(len - 6, 3);
		document.write(m + "." + k + " MB");
	} else {
		document.write(content + " B");
	}
  }
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
    <h2 align="center">Images List</h2>
</div>
<div class="table-wrapper">
		
		<table><thead><tr>
		<td> Image Name </td>
		<td> Created Time</td>
		<td> Description </td>
		<td> Images Id </td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${result}" var="image">
		 <tr>
		 <td><c:out value ="${image.name}" /></td>
		 <td><c:out value ="${image.createdTime}" /></td>
		 <td><c:out value ="${image.description}" /></td>
		 <td><c:out value ="${image.id}" /><td>
		 </tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
		
		
	

</body>
</html>