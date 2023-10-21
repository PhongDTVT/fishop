<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.CartUserDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.CartUser"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String eror = (String) request.getAttribute("loginError");

	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("carts");
	if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}
	
	
	List<CartUser> cUs = new ArrayList<>();

	UserDAO uDAO = new UserDAO();
	User u = new User();
	u = uDAO.getByUserName((String)session.getAttribute("username"));
	int a = 0;
	CartUserDAO cUDAO = new CartUserDAO();
	
	if(u != null){
	cUs = cUDAO.getAllByUserId(u.getId());}
	request.setAttribute("cUs", cUs);
	if(cUs != null){
		
		a = cUs.size();
	}
	
	
	
	
	String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
    	
    	.wrapper{
    position: fixed;
    top: 15rem;
    left: 45rem;
    width: 400px;
    height: 400px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, 1);
    border-radius: 10px;
    backdrop-filter: blur(20px);
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 0 30px rgba(0, 0, 0, 1);
    overflow: hidden;
    transition: transform .5s ease,height 2s ease;
    transform: scale(0);
    z-index: 99990;
}
.wrapper.active-popup{
    transform: scale(1);
}
.wrapper.active{
    height: 520px;

}
.wrapper .icon-close{
    position: absolute;
    top: 0;
    right: 0;
    width: 35px;
    height: 35px;
    background: #162938;
    font-size: 2em;
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    cursor: pointer;
    
    z-index: 1;
}
.wrapper .form-box{
    width: 100%;
    padding: 40px;
}

.scrollable-form{
max-height: 400px;
	overflow-y: auto;
}
.wrapper .form-box.login{
    /* display: none; */
    transition:  transform .18s ease;
    transform: translateX(0);
}
.wrapper.active .form-box.login{
    transition: none;
    transform: translateX(-400px);
}
.wrapper.active .form-box.register{
	
    transition:  transform .18s ease;
    transform: translateX(0);
}
.wrapper .form-box.register{
    position: absolute;
    transition: none;
    transform: translateX(400px);
}
.wrapper .form-box h2{
    text-align: center;
    font-size: 1em;
    
}
.input-box{
    position: relative;
    width: 100%;
    height: 50px;
    border-bottom: 2px solid #162938;
    margin: 30px 0;
}
.input-box label{
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    font-size: 1em;
    color: #162938;
    font-weight: 500;
    pointer-events: none;
    transition: 0.65s;
}
.input-box input:focus~label,.input-box input:valid~label{
    top: -10px;
}
.input-box input{
    width: 100%;
    height: 100%;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    color: #162938;
    font-weight: 600;
}
.input-box .icon{
    position: absolute;
    right: 8px;
    font-size: 1.2em;
    color: #162938;
    line-height: 57px;
}
.remember-forgot{
    font-size: .9em;
    color: #162938;
    font-weight: 500;
    margin: -15px 0 15px;
    display: flex;
    justify-content: space-between;
}
.remember-forgot label input{
    accent-color: #162938;
    margin-right: 3px;
}
.remember-forgot a{
    color: #162938;
    text-decoration: none;
}
.remember-forgot a:hover{
    text-decoration: underline;
}
.btn{
    width: 50%;
    height: 40px;
    display: block;
    margin: auto;
    border: none;
    outline: none;
    border-radius: 8px;
    background: #162938;
    color: #fff;
    font-size: 1em;
    font-weight: 500;
}
.login-register{
    font-size: .9em;
    color: #162938;
    font-weight: 500;
    text-align: center;
    margin: 25px 0 10px;
}
.login-register p a{
    color: #162938;
    text-decoration: none;
    font-weight: 600;

}
.login-register p a:hover{
    text-decoration: underline;
}
.overplay{
	display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 999999;
}
@media screen and (max-width: 1240px) {
   	.wrapper{
   		top: 15rem;
   		width: 50%;
   		left:50px;
   	}
}
@media screen and (max-width: 829px) {
   	.wrapper{
   		top: 15rem;
   		width: 50%;
   		left:50px;
   	}
}
@media screen and (min-width: 829px) {
   	.wrapper{
  
   		width: 400px;
   		heigh: 400px;

   	}
}
.cart-icon{
	position: relative;
}
.cart-count {
    position: absolute;
    top: -10px;
    right: -10px;
    background-color: red;
    color: white;
    border-radius: 50%;
    padding: 5px 10px;
    font-size: 16px;
}

    </style>
    <link rel="stylesheet" href="views/client/bootstrap-5.3.0/css/bootstrap.css">
    
    <link rel="stylesheet" href="views/client/assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<div class="overplay"></div>
	<header class="header">
        <a href="#" class="logo">
            <img alt="" style="width:100px;height:80px;" src="views/client/assets/logofi.png">
        </a>
       
        <nav class="navbar">
            <a href="product?id=1">Home</a>
            <a href="product?id=2">Sneakers</a>
            <a href="product?id=3">Clothing</a>
            <a href="product?id=4">Skateboard</a>
            <a href="product?id=5">Sales</a>
         

        </nav>

        <div class="icon">
        
        <%if(request.getSession().getAttribute("username") == null){ %>
        	<div class="fas fa-solid fa-user" id="login-btn"></div>
        	<%} else{ %>
        	<div class="fas fa-light fa-address-card" id="profile-btn"></div>
        	<%} %>
        	
            <div class="fas fa-search" id="search-btn"></div>
            <%if(request.getSession().getAttribute("username") == null){ %>
            <div class="fas fa-shopping-cart cart-icon" id="cart-btn">
            	<span id="cart-count" class="cart-count">${cart_list.size() }</span>
            </div>
            <%} else{ %>
            <div class="fas fa-shopping-cart cart-icon" id="cart-btn">
            
            	<span id="cart-count" class="cart-count"> <%=a %></span>
            </div>
            <%} %>
            <div class="fas fa-bars" id="menu-btn"></div>
        </div>
        <div class="search-form">
            <input type="search" id="search-box" placeholder="Search here..">
            <label for="search-box" class="fas fa-search"></label>
        </div>
        <div class="cart-items-container" style="overflow-y: auto;">
        <c:if test="<%=username == null %>">
        <c:forEach items="${requestScope.cart_list }" var="cl">
            <div class="cart-item">
                
                <img src="${cl.pImg }" alt="">
                <div class="content">
                    <h3>${cl.pName }</h3>
                    <div class="price">${cl.price } <strong>VND</strong> <p>${cl.quantity }</p> </div>
                </div>
            </div>
          </c:forEach>
          </c:if>
          <c:if test="<%=username != null %>">
        <c:forEach items="${requestScope.cUs }" var="cU">
            <div class="cart-item">
                
                <img src="${cU.pImg }" alt="">
                <div class="content">
                    <h3>${cU.pName }</h3>
                    <div class="price">${cU.price } <strong>VND</strong> <p>${cU.quantityInCart }</p> </div>
                </div>
            </div>
          </c:forEach>
          </c:if>
          
            <a href="/FiShop/viewCart" class="btn btn-danger" >Check</a>
        </div>
    </header>
    
    <!-- loggin button start -->
    <div class="wrapper">
        <span class="icon-close"><ion-icon name="close-circle-outline"></ion-icon></span>
        <div class="form-box login">
            <h2>Login</h2>
            <form action="/FiShop/login-client" methob="post" novalidate >
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="text" name="username" required>
                    <label for="">Username</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" name="password" required>
                    <label for="">Password</label>
                </div>
                <div class="remember-forgot">
                    <label for=""><input type="checkbox">Remember me</label>
                    <a href="">Forgot password?</a>
                </div>
                <c:if test="<%=eror != null %>">
                <div  class="alert alert-danger" role="alert">
                    <p>Thong tin dang nhap sai</p>
                </div>
                </c:if>
                <c:if test="<%=eror == null %>">
                </c:if>
                
                <button type="submit" class="btn">Login</button>
                <div class="login-register">
                    <p>Dont have an account? <a href="#" class="register-link">Register</a></p>

                </div>
            </form>
        </div>

        <div class="form-box register">
            <h2>Registration</h2>
            <form action="/FiShop/register" class="scrollable-form" method="post">
            	<div class="input-box">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <input type="text" required name="fullname">
                    <label for="">FullName</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <input type="text" required name="username">
                    <label for="">Username</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="email" required name="email">
                    <label for="">Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" required name="password">
                    <label for="">Password</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <input type="text" required name="phone">
                    <label for="">PhoneNumber</label>
                </div>
                 <div class="input-box">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <input type="text" required name="address">
                    <label for="">Address</label>
                </div>
                <div class="remember-forgot">
                    <label for=""><input type="checkbox">I agree to the terms and conditions</label>
                    
                </div>
                <button type="submit" class="btn">Go</button>
                <div class="login-register">
                    <p>Already have an account? <a href="#" class="login-link">Login</a></p>

                </div>
            </form>
        </div>
    </div>
    <!-- loggin button end -->
    
    <script type="text/javascript">
    		const overlay = document.getElementById('overlay');
    		
    	    const wrapper = document.querySelector('.wrapper');
    	    const loginlink = document.querySelector('.login-link');
    	    const registerlink = document.querySelector('.register-link');
    	    const btnPopup = document.querySelector('#login-btn');
    	    const iconClose = document.querySelector('.icon-close');
    	    const profile = document.querySelector('#profile-btn');
    		
    	    
    	    registerlink.addEventListener('click', ()=>{
    	        wrapper.classList.add('active');
    	        disablePage();
    	        
    	    });
    	    loginlink.addEventListener('click', ()=>{
    	        wrapper.classList.remove('active');
    	        enablePage();
    	    });
    	    if(profile){
    	    profile.addEventListener('click', ()=>{
    	        window.location.href = "/FiShop/profile-client";
    	        
    	    });
    	    }
    	    else{
    	    btnPopup.addEventListener('click', ()=>{
    	        wrapper.classList.add('active-popup');
    	        disablePage();
    	    });
    	    }
    	    iconClose.addEventListener('click', ()=>{
    	        wrapper.classList.remove('active-popup');
    	        enablePage();
    	    });
    	    
    	    function disablePage() {
    	        
    	        const buttonsAndLinks = document.querySelectorAll('.icon,button:not(.btn), a:not(.register-link):not(.login-link)');
    	        buttonsAndLinks.forEach(item => {
    	            item.style.pointerEvents = 'none';
    	        });

    	       
    	        document.body.style.overflow = 'hidden';
    	    }
    	    function enablePage() {
    	        
    	        const buttonsAndLinks = document.querySelectorAll('button, a,.icon');
    	        buttonsAndLinks.forEach(item => {
    	            item.style.pointerEvents = 'auto';
    	        });

    	     
    	        document.body.style.overflow = 'auto';
    	    }

    	    
   
    </script>
    <script type="text/javascript">
    
   

    </script>
   
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
     <script src="views/client/assets/script.js"></script>
     

    </body>
</html>
    
