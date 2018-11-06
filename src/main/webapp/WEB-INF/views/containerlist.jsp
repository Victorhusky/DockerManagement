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
        
        <li ><a href="../images" >My Images</a></li>
        <li ><a href="../containers/list" }">My Containers</a></li>
        <li ><a href="../sl" }">Search Local DB</a></li>   
		 <li ><a href="../build" }">Build Customer Images</a></li>      
        <form method="post" action="../searchimages">
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
						<th class="hidden-xs">CreateTime</th>
						<th>Status</th>
						<th><span class="glyphicon glyphicon-cog"></span>&nbsp;Opertaion&nbsp;&nbsp;
							<!-- button class="btn btn-info btn-xs container-import" >ImportImage</button--></th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="container">
					<tr>
						<td><c:forEach var="name" items="${container.names}">
						  ${name }&nbsp;
						</c:forEach></td>
						<td>${container.image }</td>
						<td><script type="text/javascript">datefmt(${container.created });</script></td>
						<td>${container.status }</td>
						<td><button class="btn btn-info btn-xs container-info"
								role="button" data="${container.id}">INFO</button>
							<button class="btn btn-danger btn-xs container-stop"
								role="button" data="${container.id}">Stop</button>
							<button class="btn btn-default btn-xs container-restart"
								role="button" data="${container.id}">Restart</button>
							<button class="btn btn-danger btn-xs container-kill"
								role="button" data="${container.id}">Kill</button>
							<button class="btn btn-warning btn-xs container-pause"
								role="button" data="${container.id}">Pause</button>
							<button class="btn btn-info btn-xs container-resume"
								role="button" data="${container.id}">Unpause</button>
							<button class="btn btn-danger btn-xs container-delete"
								role="button" data="${container.id}">Delete</button>
							<button class="btn btn-default btn-xs container-commit"
								role="button" data="${container.id }">Commit</button>
							<button class="btn btn-default btn-xs container-log"
								role="button" data="${container.id }">LOG</button>
							<!-- button class="btn btn-default btn-xs container-export"
								role="button" data="${container.id }">Export</button--></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
$(function() {
	$('.container-stop').click(function() {
			alert("You are Stopping a Container from running!")
		$.post("${base}/containers/stop", {
			name : $(this).attr('data')
		});
	});
	
	$('.container-restart').click(function() {
		alert("You are restart a Container !")
	$.post("${base}/containers/restart", {
		name : $(this).attr('data')
	});
});
	$('.container-kill').click(function() {
		alert("You are kill a Container !")
	$.post("${base}/containers/kill", {
		name : $(this).attr('data')
	});
});
	$('.container-pause').click(function() {
		alert("You are pause a Container !")
	$.post("${base}/containers/pause", {
		name : $(this).attr('data')
	});
});
	$('.container-resume').click(function() {
		alert("You are resume a Container !")
	$.post("${base}/containers/unpause", {
		name : $(this).attr('data')
	});
});
	$('.container-delete').click(function() {
		alert("You are delete a Container !")
	$.post("${base}/containers/delete", {
		name : $(this).attr('data')
	});
});
	$('.container-commit').click(function() {
		alert("You are commit a Container !")
	$.post("${base}/containers/commit", {
		name : $(this).attr('data')
	});
});
	
	$(".container-info").click(function() {
		var containerId = $(this).attr("data");
		$.get("${base}/containers/" + containerId + "/info", function(data) {
			$("#myModal").html(data).modal({
				backdrop : true,
				show : true
			});
		});
	});
	
	$(".container-log").click(function(){
		var containerId = $(this).attr("data");
		$.get("${base}/containers/" + containerId + "/log", function(data){
			$("#myModal").html(data).modal({
				backdrop: true,
				show: true
			});
		});
	});
	
});

</script>
</body>
</html>