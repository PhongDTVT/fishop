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

  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

   <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
 <link rel="stylesheet" href="../../views/client/bootstrap-5.3.0/css/bootstrap.css">
    
    <link rel="stylesheet" href="../../views/client/assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
</head>
<body>
    
 <!-- header start -->
    <jsp:include page="../../views/layout/header.jsp"></jsp:include>


    <!-- header end -->
    <!-- banner start -->
    <div class="parallax-wrapper">
        <div class="main-banners" style="transform: translateY(0px);">
            <div class="banner">
                <a class="box-result js--isOnScreen gtm--pn" href="product?id=2" title="Sneakers shop" >
                    <div class="banner-sneakers exponea--banner"></div>
                    <div class="banner-header-wrapper">
                        <h2 class="banner-header">Sneakers <small>shop <strong style="color: red;">--></strong> <i class="icon-arrow"></i></small></h2>
                    </div>
                </a>
            </div>
            <div class="banner">
                <a class="box-result js--isOnScreen gtm--pn" href="product?id=3" title="Clothing shop" >
                    <div class="banner-clothing exponea--banner"></div>
                    <div class="banner-header-wrapper">
                        <h2 class="banner-header">Clothing <small>shop <strong style="color: red;">--></strong> <i class="icon-arrow"></i></small></h2>
                    </div>
                </a>
            </div>
            <div class="banner">
                <a class="box-result js--isOnScreen gtm--pn" href="product?id=4" title="Skateboard shop" >
                    <div class="banner-skateboard exponea--banner"></div>
                    <div class="banner-header-wrapper">
                        <h2 class="banner-header">Skateboard <small>shop <strong style="color: red;">--></strong> <i class="icon-arrow"></i></small></h2>
                    </div>
                </a>
            </div>
            <div class="banner">
                <a class="box-result js--isOnScreen gtm--pn" href="product?id=5" title="Sales" >
                    <div class="banner-sale exponea--banner"></div>
                    <div class="banner-header-wrapper">
                        <h2 class="banner-header">Sales <small>shop <strong style="color: red;">--></strong> <i class="icon-arrow"></i></small></h2>
                    </div>
                </a>
            </div>
        </div>
        </div>
    
    <!-- banner end -->
    <!-- lifestyle start -->
    <div class="lifestyle">
        <div class="lifestyle-container">
            <h2 class="alert-heading">LIFESTYLE</h2>
            <h3 class="sub-lifestyle" style="position: relative;">A world of inspiration</h3>
            <div class="cta-container"><a href="#">Read FiClub fashion</a></div>
            <div class="modules three">
                <div class="card" style="width: 25rem;">
                    <img class="card-img-top" src="views/client/assets/clothing.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">INSIDE FILIFE</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Read more></a>
                    </div>
                  </div>
                  <div class="card" style="width: 25rem;">
                    <img class="card-img-top" src="views/client/assets/clothing.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">INSIDE FILIFE</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
                  <div class="card" style="width: 25rem;">
                    <img class="card-img-top" src="views/client/assets/clothing.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">INSIDE FILIFE</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
                  <div class="card" style="width: 25rem;">
                    <img class="card-img-top" src="views/client/assets/clothing.jpg" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">INSIDE FILIFE</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                  </div>
            </div>
        </div>
    </div>
    <!-- lifestyle end -->

    <!-- profits start -->
        <div class="profits">
            <div class="container">
                <div class="profits-icon">
                    <span class="material-symbols-outlined">Store</span>
                    <h4 class="profits-header">FiCLub free ship</h4>
                    <p>Freeship đơn hàng từ 500K</p>
                </div>
                <div class="profits-icon">
                    <span class="material-symbols-outlined">local_shipping</span>
                    <h4 class="profits-header">Nhận hàng từ 1-5 ngày</h4>
                    <p>Đơn hàng của bạn sẽ được đóng gói và bàn giao đơn vị vận chuyển đến bạn từ 1-5 ngày</p>
                </div>
                <div class="profits-icon">
                    <span class="material-symbols-outlined">
                        support
                        </span>
                    <h4 class="profits-header">Chính sách khách hàng</h4>
                    <p>Cam kết hỗ trợ đổi size ,hoàn tiền nếu sản phẩm có bất kỳ lỗi gì</p>
                </div>
                <div class="profits-icon">
                    <span class="material-symbols-outlined">
                        currency_exchange
                        </span>
                    <h4 class="profits-header">Kiểm tra hàng</h4>
                    <p>Khách hàng được phép kiểm tra hàng trước khi nhận</p>
                </div>
        </div>
    </div>

        <!-- profits end -->


    <!-- footer start -->
    <jsp:include page="../../views/layout/footer.jsp"></jsp:include>

    <!-- footer end -->
    
    <script src="views/client/assets/script.js"></script> 
    
    
    
    
 
</body>
</html>