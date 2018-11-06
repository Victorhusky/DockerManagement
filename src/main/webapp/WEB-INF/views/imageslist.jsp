<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<c:set var="active" value="images" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Images List</title>
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
		<td><b> Image Name And Tag </b></td>
		<td> <b>Created Time</b></td>
		<td> <b>Size </b></td>
		<td> <b>Images Id </b></td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="image">
		 <tr>
		 <td><c:forEach var="tag" items="${image.repoTags}">${tag}&nbsp;</c:forEach></td>
		 <td><script type="text/javascript">datefmt(${image.virtualSize });</script></td>
		 <td><script type="text/javascript">datasizefmt(${image.virtualSize });</script></td>
		 <td> <c:out value ="${image.id}" /><td>
		 
		 </tr><tr><td>
							<button class="btn btn-info btn-xs image_info"
								data="${image.repoTags[0]}">INFO</button></td><td>
							<button class="btn btn-default btn-xs image_addc"
								data="${image.repoTags[0]}">RunContainer</button></td><td>
							<button class="btn btn-danger btn-xs image_delete"
								data="${image.repoTags[0]}" onclick="del()">Delete</button></td><td>
								<button class="btn btn-danger btn-xs image_push"
								data="${image.repoTags[0]}">Push</button></td>
								<td><button class="btn btn-info btn-xs image_tag" data="${image.id}">Rename</button></td>
		 </tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
		 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"></div>
	
<script type="text/javascript">
	
$(function(){
	$('.image_info').click(function() {
		$.post("${base}/images/name/json", {
			name : $(this).attr('data')
		}, function(data) {
			$('#myModal').html(data).modal({
				backdrop : true,
				show : true
			});
		});
	});
	
	$('.image_push').click(function() {
	    console.log("what the fuck");
			alert("You are Pushing a image to DockerHub")
		$.post("${base}/images/push", {
			name : $(this).attr('data')
		});
	});
	
	$('.image_delete').click(function() {
	    console.log("what the fuck");
			alert("You are delete a image, Are you sure?")
		$.post("${base}/images/delete", {
			name : $(this).attr('data')
		});
	});
	
	
	$('.image_addc').click(function() {
		$.post("${base}/images/addc", {
			name : $(this).attr('data'),
			rurl : 'containers/list'
		}, function(data) {
			$('#myModal').html(data).modal({
				backdrop : true,
				show : true
			});
		});
	});
	
	
	
	$(".image_tag").click(function(){
		$.post("${base}/images/imgtag", {
			id : $(this).attr('data')
		}, function(data){
			$('#myModal').html(data).modal({
				backdrop : true,
				show : true
			});
		});
	});
	
}
);
</script>

</body>
</html>