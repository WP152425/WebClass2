<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="/WebClass/css/home.css">
    <title>Hyeok's blog</title>
    
    <script src="../js/menu_mouse.js"></script>
    
  </head>
  <body>
  <!-- 메뉴바  -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home.html">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link" href="bucketList.html">Bucket List<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link" href="video.html">Funny Video</a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link" href="music.html">Music</a>
      </li>
    </ul>
    <%-- 세션이 없는 경우 --%>
    <%
    	UserVO user = (UserVO)session.getAttribute("user");
    	if (user==null){
    %>
    <form class="form-inline my-2 my-lg-0" id="loginform" action="/WebClass/bloglogin" method="post">
      <input class="form-control mr-sm-2" type="email" placeholder="Id" aria-label="Id" name = "id" id = "id" value = "<%=request.getParameter("id") == null ? "" : request.getParameter("id") %>" required>
      <input class="form-control mr-sm-2" type="password" placeholder="Password" aria-label="Password" name = "pwd" id = "password" required>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
      <button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='join.html'">Sign up</button>
    </form>
    <%
    	} else {
    %>
    <%-- 세션이 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%= user.getName() %>님
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      	<form action="/WebClass/bloglogout" method="post">
	      	<button type="submit" class="dropdown-item">Sign out</button>
	      	</form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>
	<%
    	}
	%>
  </div>
</nav>

<%@ include file="modal.jsp" %>

<div class="container">
	<h1>Hello, It's Hyeok's blog!</h1>
	<h3>Vision</h3>
	<p>I want to go to the England for university.</p>
	<p>And I will choose Business and Management, Computer Sicence with my major.</p>
	<div class="row">
  	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/susexuniversity.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">University Of Sussex</h4>
   			<p class="card-text"></p>
   			<a href="http://www.sussex.ac.uk/" class="btn btn-primary" target="_blank">Homepage</a>
  		</div>
	</div>
	</div>
	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/coventry.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">University Of Coventry</h4>
   			<p class="card-text"></p>
   			<a href="http://www.coventry.ac.uk/" class="btn btn-primary" target="_blank">Homepage</a>
  		</div>
	</div>
	</div>
	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/leeds.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">University Of Leeds</h4>
   			<p class="card-text"></p>
   			<a href="http://www.leeds.ac.uk/" class="btn btn-primary" target="_blank">Homepage</a>
  		</div>
	</div>
	</div>
	</div>
	<br>
	
	<h3>Hobby</h3>
	<p id="hobby"></p>
	<div class="row">
  	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/soccer.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">Soccer</h4>
   			<p class="card-text"></p>
   			
  		</div>
	</div>
	</div>
	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/abouttime.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">Movie</h4>
   			<p class="card-text"></p>
   			
  		</div>
	</div>
	</div>
	<div class="col-sm-4">
	<div class="card" >
  		<img class="card-img-top" src="/WebClass/image/lol.jpg" alt="Card image cap">
  		<div class="card-body">
    		<h4 class="card-title">Game</h4>
   			<p class="card-text"></p>
   			
  		</div>
	</div>
	</div>
	</div>
	
</div>

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    
    <script>
	<%-- 로그인이 실패한 경우 처리 추가 --%>
	<% if ("error".equals(request.getAttribute("msg"))){ %>
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('Invalid username or password');
		myModal.modal();
	<% } %>
	</script>
  
  </body>
</html>