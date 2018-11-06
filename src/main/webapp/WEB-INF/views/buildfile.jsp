<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Build Your Own Customer Images</title>
 <link href="css/main.css" rel="stylesheet">

    <style>
    input[type=text], textarea {
    -webkit-transition: all 0.30s ease-in-out;
    -moz-transition: all 0.30s ease-in-out;
    -ms-transition: all 0.30s ease-in-out;
    -o-transition: all 0.30s ease-in-out;
    outline: none;
    padding: 3px 0px 3px 3px;
    margin: 5px 1px 3px 25px;
    border: 1px solid #ddd;
}
  
input[type=text]:focus, textarea:focus {
    box-shadow: 0 0 5px rgba(81, 203, 238, 1);
    padding: 3px 0px 3px 3px;
    margin: 5px 1px 3px 25px;
    border: 1px solid rgba(81, 203, 238, 1);
}

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
<% if(request.getSession().getAttribute("role").equals("admin")) {%>
<div id="centeredmenu">
    <ul>
        
        <li ><a href="./images" >My Images</a></li>
        <li ><a href="./containers/list" }">My Containers</a></li>
		 <li ><a href="./build" }">Build Customer Images</a></li>      
        <form method="post" action="./searchimages">
        <li> <input type="text" name="keyword" /></li>
        <li > <input type="submit" name="submit" id="submit" value="Search Images"/></li>
       	</form>
        <li style="float:right"><a href="./">Log Out</a></li>
    </ul><br/>
    <h2 align="center">Build Your Own Images!</h2>
</div>

<form method="post" action="./savefile">
			<div>
    <label for="name">Docker File Name</label>
    <input type="text" name="name" id="name" value="" tabindex="1">
		</div>

	<div>
    <label for="textarea">File Context</label>
    <textarea cols="40" rows="8" name="text" id="textarea"></textarea>
</div>
 			<input type="submit" name="submit" id="save" value="Save this File"/>
</form>
	<div>
	<lable for="name">View Your DockerFile in Database!</lable>
	<c:forEach items="${map.result}" var="file">
	<div>
		<label for="name">Docker File Name</label>
    <input type="text" name="name" id="name" value="${file.name}" tabindex="1" readonly="readonly">
		</div>
	
	<div>
    <label for="textarea">File Context</label>
    <textarea cols="40" rows="8" name="textarea" id="textarea" readonly="readonly"> <c:out value ="${file.text}" /> </textarea>
</div>				
	</c:forEach>
	</div>
	<% } %>
	<%  if(request.getSession().getAttribute("role").equals("user")) { %>
	<label for="name"> You need to be an Administator to use this page</label>
	 <form method="post" action="./setting">
                            
                               
                                <input type="hidden" name="port" id="ipaddr" value="47.90.209.189" />
                                <input type="hidden" name="ipaddr" id="port" value="2375" />
                                <input type="submit" name="submit" id="submit" value="Back to Main Page" />
                          
                        </form>
	<% } %>
</body>
</html>