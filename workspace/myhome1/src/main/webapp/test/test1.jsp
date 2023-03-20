<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Self-introduction</title>
 <style>
        div {
				padding:20px;
			}
            #contents {
				width: 490px;
				float: left;
				margin-bottom: 20px;
			}
        #left-sidebar{
            width : 200;
            float : left;
            margin-bottom : 20px;
            margin-right : 20px;
        }
        .dt{
            font-size : 2em;
            font-family: "Times New Roman", Times, serif;
        }
        .dd{
            font-family: "Times New Roman", Times, serif;
        }
        h1{
            font-size : 3em;
            font-family: "Times New Roman", Times, serif;
            text-align: center;
        }
        .objective {
            font-family: "Times New Roman", Times, serif;
            font-size : 2em;
        }
        a {
            font-family: "Times New Roman", Times, serif;
            text-decoration : none;
            color : black;
        }
    </style>
</head>
<body>
	<h1>Kim bom</h1>
    <hr>
    <div id = "left-sidebar">
        <dt class="dt">Objective : </dt>
        <dl>
            <dd class="dd">Nevermore Company</dd>
            <dd class="dd">Back-end Programmer</dd>
        </dl>
        <dt class="dt">Education : </dt>
        <dl>
            <dd class="dd">Hankuk University</dd>
            <dd class="dd">College of Fashion Design</dd>
        </dl>
        <dt class="dt">Love : </dt>
        <dl>
            <dd class="dd"><a href="https://www.youtube.com/watch?v=Qx8bJb4oQzE">Post Malone</a></dd>
            <dd class="dd"><a href="https://www.instagram.com/alexandermcqueen/">Alexander McQueen</a></dd>
            <dd class="dd"><a href="https://hozier.com/">Hozier</a></dd>
            <dd class="dd"><a href="https://www.youtube.com/watch?v=M2cckDmNLMI">米津玄師</a></dd>
            <dd class="dd"><a href="https://www.brendonburton.com/">Brendon Burton</a></dd>
        </dl>
        <dt class="objective">Contact :</dt>
        <dl>
            <dd class="dd">Seoul, South Korea</dd>
            <dd class="dd">bomkim0203@gmail.com <a href="bomkim0203@gmail.com">
                <img src="<%=request.getContextPath()%>/images/482138.png"/>
              </a></dd>
            <dd class="dd">010. 5059. 8901</dd>
            <dd class="dd"><a href="https://github.com/bk3210">github</a></dd>
        </dl>
    </div>
    <div id="contents">
        <img src="<%=request.getContextPath()%>/images/WesternGothic-15.jpg"/>
    </div>
</body>
</html>