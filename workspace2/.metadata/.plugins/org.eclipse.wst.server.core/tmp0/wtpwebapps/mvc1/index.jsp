<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.kosa.mvc1.index.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>
<%
List<IndexDTO> list1 = (List<IndexDTO>)request.getAttribute("list1");
%>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
					<%for (int i = 0; i < list1.size(); i++) { %>
					<li data-target="#myCarousel" data-slide-to="<%=i%>"
					<%if(i==0){ %> class="active"<%} %>></li>
					<%} %>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
    <%for(int i=0; i<list1.size(); i++){
    	String activeClass="";
    	IndexDTO dto = list1.get(i);
    	if(i==0)
    		activeClass="item active";
    	else
    		activeClass="item";
    	
		String url=request.getContextPath()+"/upload/gallery/"+dto.getImage();
		String link = request.getContextPath()+"/gallery.do?cmd=view&seq="+dto.getSeq();
    	
    	%>
      <div class="<%=activeClass%>">
      <a href="<%=link %>">
      <img src="<%=url %>" alt="image" style="width:100%;">
      </a>
      </div>
      <%} %>
      </div>
 <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

	    <%
	    List<IndexDTO2> list2 = (List<IndexDTO2>)request.getAttribute("list2");
	    
	    for(int i=0; i<list2.size(); i++){ 
	    
			IndexDTO2 dto2 = list2.get(i);
			System.out.println(dto2.getTitle());
			%>
			<%if(i%3==0){ %>
		  <div class="row">				
			<%}%>
			 
		    <div class="col-sm-4">
		    	<h3><%=dto2.getTitle() %></h3>
				<p><%=dto2.getM_name() %></p>
	       </div>
	<%if (i%3==2 || i==list2.size()-1){%>
	</div>
			<%} // if문%>
	    <%} // for문%>
  
  </div>
</body>
</html>
<script>
$(()=>{
	$("#btnHome").click(()=>{
		location.href="<%=request.getContextPath()%>/gallery.do";
	});
})

	/* function goLogout(){
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=member_logout";
		xhttp.onload=function(){
			console.log(this.responseText);
			let data=JSON.parse(this.responseText);
			alert("로그아웃되었습니다.");
			location.href="/mvc1/index.jsp";
		}
		S
		xhttp.open("GET", url, true);
		xhttp.send();
	} */
</script>