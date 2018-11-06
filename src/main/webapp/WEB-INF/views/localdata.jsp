<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Data From Local DataBase</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/main.css" rel="stylesheet">
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


</head>

<body>
<div id="centeredmenu">
    <ul>
        
        <li ><a href="./images" >My Images</a></li>
        <li ><a href="./containers/list" }">My Containers</a></li>
		 <li ><a href="./build" }">Deal with DockerFile</a></li>    
		   
        <form method="post" action="./searchimages">
        <li> <input type="text" name="keyword" /></li>
        <li > <input type="submit" name="submit" id="submit" value="Search Images"/></li>
       	</form>
        <li style="float:right"><a href="./">Logout</a></li>
    </ul><br/>
    <h2 align="center">Search From Your Local DataBase</h2>
</div>

		 <form action="./searchdb" method="post">
            <h3>KeyWord :</h3>
            <input type="text" name="keyword" /><br/>
            <input type="date" name="date"/><br/>
            
            <label><h3>Type:</h3> </label>
            <div class="select-wrapper">
            	<select name="type">
            		<option value="byname">By name</option>
            		<option value="bytime">By Created Time(After)</option>
            	</select>
            </div><br/>
            
            <label><h3>Item:</h3> </label>
            <div class="select-wrapper">
            	<select name="item">
            		<option value="image">Search For images</option>
            		<option value="container">Search For Containers</option>
            	</select>
            </div>
            
            <br/><br/>
            <input type="submit" value="Submit">
        </form>
	


</body>
</html>