<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="dao.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.CartUser"%>
<%@page import="model.UserInform"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your account</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../views/client/bootstrap-5.3.0/css/bootstrap.css">
    
    <link rel="stylesheet" href="../../views/client/assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
.container-profile{
	padding-top:10rem;
}
	.widget-author {
  margin-bottom: 58px;
}
.author-card {
  position: relative;
  padding-bottom: 48px;
  background-color: #fff;
  box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .09);
}
.author-card .author-card-cover {
  position: relative;
  width: 100%;
  height: 100px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.author-card .author-card-cover::after {
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
  opacity: 0.5;
}
.author-card .author-card-cover > .btn {
  position: absolute;
  top: 12px;
  right: 12px;
  padding: 0 10px;
}
.author-card .author-card-profile {
  display: table;
  position: relative;
  margin-top: -22px;
  padding-right: 15px;
  padding-bottom: 16px;
  padding-left: 20px;
  z-index: 5;
}
.author-card .author-card-profile .author-card-avatar, .author-card .author-card-profile .author-card-details {
  display: table-cell;
  vertical-align: middle;
}
.author-card .author-card-profile .author-card-avatar {
  width: 85px;
  border-radius: 50%;
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, .15);
  overflow: hidden;
}
.author-card .author-card-profile .author-card-avatar > img {
  display: block;
  width: 100%;
}
.author-card .author-card-profile .author-card-details {
  padding-top: 20px;
  padding-left: 15px;
}
.author-card .author-card-profile .author-card-name {
  margin-bottom: 2px;
  font-size: 14px;
  font-weight: bold;
}
.author-card .author-card-profile .author-card-position {
  display: block;
  color: #8c8c8c;
  font-size: 12px;
  font-weight: 600;
}
.author-card .author-card-info {
  margin-bottom: 0;
  padding: 0 25px;
  font-size: 13px;
}
.author-card .author-card-social-bar-wrap {
  position: absolute;
  bottom: -18px;
  left: 0;
  width: 100%;
}
.author-card .author-card-social-bar-wrap .author-card-social-bar {
  display: table;
  margin: auto;
  background-color: #fff;
  box-shadow: 0 12px 20px 1px rgba(64, 64, 64, .11);
}
.btn-style-1.btn-white {
    background-color: #fff;
}
.list-group-item i {
    display: inline-block;
    margin-top: -1px;
    margin-right: 8px;
    font-size: 1.2em;
    vertical-align: middle;
}
.mr-1, .mx-1 {
    margin-right: .25rem !important;
}

.list-group-item.active:not(.disabled) {
    border-color: #e7e7e7;
    background: #fff;
    color: #ac32e4;
    cursor: default;
    pointer-events: none;
}
.list-group-flush:last-child .list-group-item:last-child {
    border-bottom: 0;
}

.list-group-flush .list-group-item {
    border-right: 0 !important;
    border-left: 0 !important;
}

.list-group-flush .list-group-item {
    border-right: 0;
    border-left: 0;
    border-radius: 0;
}
.list-group-item.active {
    z-index: 2;
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}
.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: .25rem;
    border-bottom-left-radius: .25rem;
}
a.list-group-item, .list-group-item-action {
    color: #404040;
    font-weight: 600;
}
.list-group-item {
    padding-top: 2rem;
    padding-bottom: 2rem;
    -webkit-transition: all .3s;
    transition: all .3s;
    border: 1px solid #e7e7e7 !important;
    border-radius: 0 !important;
    color: #404040;
    font-size: 15px;
    font-weight: 600;
    letter-spacing: .08em;
    text-transform: uppercase;
    text-decoration: none;
    margin: 1.5rem;
}
.list-group-item {
    position: relative;
    display: block;
    padding: 2rem;

    background-color: #fff;
    border: 1px solid rgba(0,0,0,0.125);
}
.list-group-item.active:not(.disabled)::before {
    background-color: #ac32e4;
}

.list-group-item::before {
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: 3px;
    height: 100%;
    background-color: transparent;
    content: '';
}
</style>
</head>
<body>
<%
	List<User> users = new ArrayList<>();
	UserDAO uDAO = new UserDAO();
	users = uDAO.getAll();
	String username = (String) session.getAttribute("username");
	User user = uDAO.getByUserName((String)session.getAttribute("username"));
	int uId = 0;
	if(user != null){
	 uId = user.getId();
	}
	UserInform ui = uDAO.getByIdInform(uId);
	request.setAttribute("users", users);
	request.setAttribute("ui", ui);
	List<OrderDetail> ods = new ArrayList<>();
	OrderDetailDAO oDDAO = new OrderDetailDAO();
	ods = oDDAO.getAllByUserId(uId);
	request.setAttribute("ods", ods);
	int[] arr = new int[ods.size()];
	
	
	for(int i = 0;i < ods.size();i++){
		arr[i] = ods.get(i).getoId();
	}
	
%>
	<jsp:include page="../../views/layout/header.jsp"></jsp:include>
	<!-- main start -->
	<div class="container container-profile mt-5">
    <div class="row">
        <div class="col-lg-4 pb-5">
            <!-- Account Sidebar-->
            <div class="author-card pb-3">
                <div class="author-card-cover" style="background-image: url(https://bootdey.com/img/Content/flores-amarillas-wallpaper.jpeg);"><a class="btn btn-style-1 btn-white btn-sm" href="#" data-toggle="tooltip" title="" data-original-title="You currently have 290 Reward points to spend"><i class="fa fa-award text-md"></i>&nbsp;290 points</a></div>
                <div class="author-card-profile">
                    <div class="author-card-avatar"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Daniel Adams">
                    </div>
              
                    <div class="author-card-details">
                    	
                        <h5 class="author-card-name text-lg"><%=session.getAttribute("username") %></h5><span class="author-card-position">Joined February 06, 2017</span>
                    </div>
               
                </div>
            </div>
            <div class="wizard">
                <nav class="list-group list-group-flush">
                    <a class="list-group-item " href="#">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><i class="fe-icon-shopping-bag mr-1 text-muted"></i>
                                <div class="d-inline-block font-weight-medium text-uppercase">Orders List</div>
                            </div><span class="badge badge-secondary">6</span>
                        </div>
                    </a>
                    <a class="list-group-item  profile-setting" href="#" ><i class="fe-icon-user text-muted"></i>Profile Settings</a>
                    <a class="list-group-item address-user" href=""><i class="fe-icon-map-pin text-muted"></i>Địa chỉ nhận hàng</a>
                    
                    <a class="list-group-item order-list" href="#" >
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <div class="d-inline-block font-weight-medium text-uppercase">Lịch sử mua hàng </div>
                            </div>
                        </div>
                        </a>
                        <a href="/FiShop/logout-client">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><i class="fe-icon-tag mr-1 text-muted"></i>
                                <div class="d-inline-block font-weight-medium text-uppercase">Đăng Xuất</div>
                            </div>
                        </div>
                    </a>
                </nav>
            </div>
        </div>
        <!-- Profile Settings-->
        
        <div class="col-lg-8 pb-5">
        <div id="profile-setting">
        	<c:forEach items="${requestScope.users }" var="u">
        	<c:if test="${u.userName eq username }">
            <form class="row"  >
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">FullName</p>
                        <label for="account-fn">FullName</label>
                        <input class="form-control" type="text" id="account-fn" placeholder="FullName" value="${u.fullName }"  required="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">UserName</p>
                        <label for="account-ln">UserName</label>
                        <input class="form-control" type="text" id="account-ln" value="${u.userName }" required="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Email</p>
                        <label for="account-email">E-mail Address</label>
                        <input class="form-control" type="email" id="account-email" value="${u.email }" disabled="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">PhoneNumber</p>
                        <label for="account-phone">Phone Number</label>
                        <input class="form-control" type="text" id="account-phone" value="${u.phoneNumber }" required="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;"> New Password</p>
                        <label for="account-pass" >New Password</label>
                        <input class="form-control" type="password" id="account-pass">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Confirm Password</p>
                        <label for="account-confirm-pass">Confirm Password</label>
                        <input class="form-control" type="password" id="account-confirm-pass">
                    </div>
                </div>
                <div class="col-12">
                    <hr class="mt-2 mb-3">
                    <div class="d-flex flex-wrap justify-content-between align-items-center">
                        <div class="custom-control custom-checkbox d-block">
                            <input class="custom-control-input" type="checkbox" id="subscribe_me" checked="">
                            <label class="custom-control-label" for="subscribe_me">Subscribe me to Newsletter</label>
                        </div>
                        <button  class="btn btn-style-1 btn-primary" style="color: white;" type="button" data-toast="" data-toast-position="topRight" data-toast-type="success" data-toast-icon="fe-icon-check-circle" data-toast-title="Success!" data-toast-message="Your profile updated successfuly.">Update Profile</button>
                    </div>
                </div>
            </form>
            </c:if>
            </c:forEach>
            </div>
            
            <form action="/FiShop/userInform?uId=<%=uId %>" class="row" id="address-user" style="display:none;" method="post">
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Thành Phố</p>
                       
                        <input class="form-control" type="text" value="${ui.tinh }" name="tinh" placeholder="Thành Phố"   required="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Huyện</p>
                       
                        <input class="form-control" value="${ui.huyen }" type="text" name="huyen" placeholder="Huyen"  required="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Xã</p>
                        
                        <input class="form-control" value="${ui.xa }"  type="text" name="xa" placeholder="xa" > 
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    	<p style="color:white;">Dia chi nhan</p>
                       
                        <input class="form-control" value="${ui.sonha }" type="text" placeholder="Địa chỉ nhà"  name="sonha" required="">
                    </div>
                </div>
  
                
                <input type="submit" value="Submit" class="btn btn-style-1 btn-primary" style="color: white;">
            </form>
            
            <div class="container " id="order-list" style="display:none;">
<div class="card">
<div class="card-body">
<div class="row">

							<c:forEach items="${requestScope.ods }" var="cU">
           
        <div class="col-xl-12">
            
                    <div class="row align-items-center">
                        <div class="table-responsive px-3">
                            <table class="table" >
                                <tbody>
                                    <tr>
                                        <td style="width:100px;">
                                            <div class="avatar-lg me-4">
                                                <img src="${cU.pImg }" style="width:80px;height:100px;" class="img-fluid rounded" alt="">
                                            </div>
                                        </td>

                                      

                                        <td style="width:100px;">
                                            <ul class="list-unstyled ps-0 mb-0">
                                                <li><p class="text-muted mb-1 text-truncate"><i class="mdi mdi-circle-medium align-middle text-primary me-1"></i> ${cU.pName } </p></li>
                                         
                                            </ul>
                                        </td>

                                      

                                        <td style="width:100px;">
                                            <h3 class="mb-0 font-size-20"><del class="font-size-16 fw-normal">$500</del></h3>
                                        </td>
                                        <td style="width:100px;">
                                            <h3 class="mb-0 font-size-20"><del class="font-size-16 fw-normal">${cU.quantity }</del></h3>
                                        </td>
                                        <td style="width:100px;">
                                            <h3 class="mb-0 font-size-20"><del class="font-size-16 fw-normal">${cU.size }</del></h3>
                                        </td>

                                        <td>
                                            <button type="button" class="btn btn-primary waves-effect waves-light"> Add</button>
                                        </td>

                                       
                                    </tr>
                                     </tbody>
                            </table>
                        </div>
                    </div>
                </div>
           
   
          
</c:forEach>
				 </div>
    </div>
    </div>
    </div>		
           
            
        </div>
        
        
        
     
        
        
        
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".address-user").click(function(e) {
		 e.preventDefault();
	    $("#profile-setting").hide();
	    
	    
	    $("#address-user").show();
	    $("#order-list").hide();
	  });
	
	$(".profile-setting").click(function(e) {
		 e.preventDefault();
	    $("#address-user").hide();
	    
	    $("#order-list").hide();
	    $("#profile-setting").show();
	    
	  });
	$(".order-list").click(function(e) {
		 e.preventDefault();
	    $("#address-user").hide();
	    $("#profile-setting").hide();
	    
	   
	    $("#order-list").show();
	  });
	
});
</script>

	<!-- main end -->
	
	<jsp:include page="../../views/layout/footer.jsp"></jsp:include>
	
	
</body>
</html>