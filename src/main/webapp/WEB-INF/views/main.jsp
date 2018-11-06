<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Main Menu</title>
    <meta charset="utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
		 <li ><a href="./sl" }">Search Local DB</a></li>  
		 <li ><a href="./build" }">Deal with DockerFile</a></li>        
        <form method="post" action="./searchimages">
        <li> <input type="text" name="keyword" /></li>
        <li > <input type="submit" name="submit" id="submit" value="Search Images"/></li>
       	</form>
        <li style="float:right"><a href="./">Log Out</a></li>
    </ul><br/>
    <h2 align="center">Docker Host Information</h2>
</div>






<div class="table-wrapper">
												<table>
													<thead>
														<tr>
															<b><th>Host Server Info</th></b>
															<b><th>Value</th></b>
															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>Images Number</td>
															<td>${map.info.images}</td>
															
														</tr>
														<tr>
															<td>Containers Number</td>
															<td>${map.info.containers }</td>
															
														</tr>
														<tr>
															<td>Debug Mode</td>
															<td>${map.info.containers }</td>
															
														</tr>
														<tr>
															<td> Driver</td>
															<td>${map.info.driver }</td>
															
														</tr>
														<tr>
															<td> Excecute Driver</td>
															<td>${map.info.executionDriver }</td>
															
														</tr>
														<tr>
															<td> Index Server</td>
															<td>${map.info.indexServerAddress }</td>
															
														</tr>
														<tr>
															<td> Initialization Path</td>
															<td>${map.info.initPath }</td>
															
															</tr>
															</tbody>
															</table>
															<p></p><p></p>
															
															<table>
													<thead>
														<tr>
															<b><th>Version Info</th></b>
															<b><th>Value</th></b>
															
														</tr>
													</thead>
														
														<tr>
															<td> Kernel Version</td>
															<td>${map.info.kernelVersion }</td>
														</tr>
														<tr>
															<td> API Version</td>
															<td>${map.version.apiVersion }</td>
														</tr>
														<tr>
															<td> Platform</td>
															<td>${map.version.arch }</td>
														</tr>
														<tr>
															<td> Git Commit</td>
															<td>${map.version.gitCommit }</td>
														</tr>
																												<tr>
															<td> Go Version</td>
															<td>${map.version.goVersion }</td>
														</tr>
																												<tr>
															<td> Operation System</td>
															<td>${map.version.operatingSystem }</td>
														</tr>
														<tr>
															<td> Docker Version</td>
															<td>${map.version.version }</td>
														</tr>
													</tbody>
													
												</table>
											</div>
											<button id="button" ><a href="./pdf" }">Export to PDF</a> </button>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>



</body>
</html>