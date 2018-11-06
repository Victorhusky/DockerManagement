<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Docker Host Setting</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/main.css" rel="stylesheet">
    <style>
        .hidden{visibility: hidden;}
    </style>
     <script  type="text/javascript">
        window.onload=function(){
            $('#map').css('display','block');
            $('#info').css('display','none');
            $('#photo').css('display','block');

        }
            checkname = function(){
                var name=document.getElementById("name");
                alert("Please enter User Name!");
                document.getElementById("a1").innerHTML("HHHHH");
                $('#a1').html('hhhhhh');
                if(name.value==""){
                    alert("Please enter User Name!");
                    document.getElementById("a1").innerHTML("HHHHH");
                    $('#a1').html('hhhhhh');
                }
            }
        
        
    </script>
    
</head>
<body>


<div id="photo" class="divided">
    <section class="wrapper style1 align-center"> 
        <div class="inner">
          	<h2><b> Please  Enter  Your  Docker Host Machine Ip Address</b></h2>
							 <div class="content">
							 
           					 <form method="post" action="./setting">
                            <div class="field half first">
                                <label for="name">Ip Address </label>
                                <input type="text" name="port" id="ipaddr" value="47.90.209.189" />
                                <div id="a1"></div>
                            </div>
                           
                            <div class="field half first">
                                <label for="name"> Search</label>
                                <input type="text" name="ipaddr" id="port" value="2375" />
                                <label id ="a2"></label>
                            </div>
                            <ul class="actions">
                                <li></li>
                                <li><input type="submit" name="submit" id="submit" value="Login" /></li>
                            </ul>
                        </form>
</div>
        </div>

        <!-- Gallery -->
        <div class="gallery style2 medium lightbox onscroll-fade-in">
           
           <article>
                <a href="css/1.jpg" class="image">
                    <img src="css/1.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
             <article>
                <a href="css/2.jpg" class="image">
                    <img src="css/2.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
             <article>
                <a href="css/3.jpg" class="image">
                    <img src="css/3.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
            <article>
                <a href="css/4.jpg" class="image">
                    <img src="css/4.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
             <article>
                <a href="css/5.jpg" class="image">
                    <img src="css/5.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
             <article>
                <a href="css/6.jpg" class="image">
                    <img src="css/6.jpg" alt="" />
                </a>
                <div class="caption">
                    <h3>Docker</h3>
                    <ul class="actions">
                        <li><span class="button small">Details</span></li>
                    </ul>
                </div>
            </article>
        </div>
    </section>
</div>
<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrollex.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

		<!-- Note: Only needed for demo purposes. Delete for production sites. -->
			


</body>
</html>