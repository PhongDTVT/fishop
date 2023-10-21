<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.CartUser"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FilterProductDAO"%>
<%@page import="model.FilterProduct"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("carts");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
List<CartUser> cUsers = new ArrayList<>();
cUsers = (List<CartUser>)session.getAttribute("cUsers");
request.setAttribute("cUsers", cUsers);

UserDAO uDAO = new UserDAO();
String username = (String) session.getAttribute("username");
User user = uDAO.getByUserName((String)session.getAttribute("username"));
int u_id = 0;
if(user != null){
	u_id = user.getId();
}
%>
<!DOCTYPE html>
<html>
<head>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<title>Sneaker</title>

	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">

	.icon-hover-primary:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover-primary:hover i {
  color: #3b71ca !important;
}
.icon-hover-danger:hover {
  border-color: #dc4c64 !important;
  background-color: white !important;
}

.icon-hover-danger:hover i {
  color: #dc4c64 !important;
}
.product-quantity{
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}
.product-name {
  flex-grow: 1;
}

button {
  padding: 5px 10px;
  cursor: pointer;
}
	
</style>


</head>
<body>
<%


%>

	<jsp:include page="../../views/layout/header.jsp"></jsp:include>
<div class="" style="height: 12rem;"></div>
	   <section class="bg-light py-5" style="top:  10rem;">
  <div class="container">
    <div class="row">
      <div class="col-xl-8 col-lg-8 mb-4">
        <div class="card mb-4 border shadow-0">
          <div class="p-4 d-flex justify-content-between">
            <div class="">
              <h5>Have an account?</h5>
              <p class="mb-0 text-wrap ">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            </div>
            <div class="d-flex align-items-center justify-content-center flex-column flex-md-row">
              <a href="#" class="btn btn-outline-primary me-0 me-md-2 mb-2 mb-md-0 w-100">Register</a>
              <a href="#" class="btn btn-primary shadow-0 text-nowrap w-100">Sign in</a>
            </div>
          </div>
        </div>

        <!-- Checkout -->
         <c:if test="<%=username == null %>">
        <form action="/FiShop/order-client" method="post">
        
        <div class="card shadow-0 border">
          <div class="p-4">
            <h5 class="card-title mb-3">Guest checkout</h5>
            <div class="row">
            
            <%if(session.getAttribute("username") == null){ %>
              <div class="col-6 mb-3">
                <p class="mb-0">First name</p>
                <div class="form-outline">
                  <input type="text"  name="firstname" placeholder="Type here"  class="form-control" />
                </div>
              </div>


              <div class="col-6">
                <p class="mb-0">Last name</p>
                <div class="form-outline">
                  <input type="text"  placeholder="Type here" name="lastname" class="form-control" />
                </div>
              </div>
              <%} %>
<%if(session.getAttribute("username") != null){ %>
				
				<div class="col-6">
                <p class="mb-0">FullName</p>
                <div class="form-outline">
                  <input type="text"  placeholder="FullName" value="${user.fullName }" name="fullname" class="form-control" />
                </div>
              </div>

<%} %>
              <div class="col-6 mb-3">
                <p class="mb-0">Phone</p>
                <div class="form-outline">
                  <input type="tel"  value="${user.phoneNumber }" required name="phone" value="+98 " class="form-control" />
                </div>
              </div>

              <div class="col-6 mb-3">
                <p class="mb-0">Email</p>
                <div class="form-outline">
                  <input type="email"  value="${user.email }" required name="email" placeholder="example@gmail.com" class="form-control" />
                </div>
              </div>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
              <label class="form-check-label" for="flexCheckDefault">Keep me up to date on news</label>
            </div>

            <hr class="my-4" />


            <div class="row">
              <div class="col-sm-4 mb-3">
                <p class="mb-0">Tỉnh</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="tinh" placeholder="Type here" class="form-control" value="${ui.tinh }" />
                </div>
              </div>
			<div class="col-sm-4 mb-3">
                <p class="mb-0">Huyện</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="huyen" placeholder="Type here" value="${ui.huyen }" class="form-control" />
                </div>
              </div>
              <div class="col-sm-4 mb-3">
                <p class="mb-0">Xã</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="xa" placeholder="Type here" value="${ui.xa }" class="form-control" />
                </div>
              </div>
               <div class="col-sm-4 mb-3">
                <p class="mb-0">Nhà</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="sonha" placeholder="Ghi rõ số nhà" value="${ui.sonha }" class="form-control" />
                </div>
              </div>
      
            </div>

            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
              <label class="form-check-label" for="flexCheckDefault1">Save this address</label>
            </div>

            <div class="mb-3">
              <p class="mb-0">Message to seller</p>
              <div class="form-outline">
                <textarea class="form-control" name="note" id="textAreaExample1" rows="2"></textarea>
              </div>
            </div>
<input type="hidden" value="${u_id }" name="user_Id">
<c:if test="<%=username == null %>">
<%int a = 0; %>
			<c:forEach items="${requestScope.cart_list }" var="cl">
          <div class="d-flex align-items-center mb-4">
            <div class="me-3 position-relative">
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-secondary">
                1
              </span>
              <img src="${cl.pImg }" style="height: 96px; width: 96x;" class="img-sm rounded border" />
            </div>
            <div class="">
              <a href="#" class="nav-link">
                ${cl.pName } <br />
                Darkblue color
              </a>
              <div class="price text-muted">Total: ${cl.price }</div>
              <div class="price text-muted quantity"></div>
             
              <div class="price text-muted size"></div>
              
             
              <input type="hidden" value="" name="size(<%=a %>)" class="size-hidden">
              
              <input type="hidden" value="" name="quantity(<%=a %>)" class="quantity-hidden">
            </div>
          </div>
          <%a++; %>
</c:forEach>
</c:if>

<c:if test="<%=username != null %>">
<%int a = 0; %>
			<c:forEach items="${requestScope.cUsers }" var="cU">
          <div class="d-flex align-items-center mb-4">
            <div class="me-3 position-relative">
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-secondary">
                1
              </span>
              <img src="${cU.pImg }" style="height: 96px; width: 96x;" class="img-sm rounded border" />
            </div>
            <div class="">
              <a href="#" class="nav-link">
                ${cU.pName } <br />
                Darkblue color
              </a>
              <div class="price text-muted">Total: ${cU.price }</div>
              <div class="price text-muted quantity"></div>
             
              <div class="price text-muted size"></div>
              
             
              <input type="hidden" value="" name="size(<%=a %>)" class="size-hidden">
              
              <input type="hidden" value="" name="quantity(<%=a %>)" class="quantity-hidden">
            </div>
          </div>
          <%a++; %>
</c:forEach>
</c:if>



            <div class="float-end">
              <button class="btn btn-light border">Cancel</button>
             
              <button type="submit"   class="btn btn-success shadow-0 border thanhtoan">ThanhToan</button>
              
             
            </div>
          </div>
        </div>
        </form>
        
        
        
        </c:if>
        <c:if test="<%=username != null %>">
        <form action="/FiShop/order-user" method="post">
        
        <div class="card shadow-0 border">
          <div class="p-4">
            <h5 class="card-title mb-3">Guest checkout</h5>
            <div class="row">

				
				<div class="col-6">
                <p class="mb-0">FullName</p>
                <div class="form-outline">
                  <input type="text"  placeholder="FullName" value="${user.fullName }" name="fullname" class="form-control" />
                </div>
              </div>


              <div class="col-6 mb-3">
                <p class="mb-0">Phone</p>
                <div class="form-outline">
                  <input type="tel"  value="${user.phoneNumber }" required name="phone" value="+98 " class="form-control" />
                </div>
              </div>

              <div class="col-6 mb-3">
                <p class="mb-0">Email</p>
                <div class="form-outline">
                  <input type="email"  value="${user.email }" required name="email" placeholder="example@gmail.com" class="form-control" />
                </div>
              </div>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
              <label class="form-check-label" for="flexCheckDefault">Keep me up to date on news</label>
            </div>

            <hr class="my-4" />


            <div class="row">
              <div class="col-sm-4 mb-3">
                <p class="mb-0">Tỉnh</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="tinh" placeholder="Type here" class="form-control" value="${ui.tinh }" />
                </div>
              </div>
			<div class="col-sm-4 mb-3">
                <p class="mb-0">Huyện</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="huyen" placeholder="Type here" value="${ui.huyen }" class="form-control" />
                </div>
              </div>
              <div class="col-sm-4 mb-3">
                <p class="mb-0">Xã</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="xa" placeholder="Type here" value="${ui.xa }" class="form-control" />
                </div>
              </div>
               <div class="col-sm-4 mb-3">
                <p class="mb-0">Nhà</p>
                <div class="form-outline">
                  <input type="text" id="typeText" required name="sonha" placeholder="Ghi rõ số nhà" value="${ui.sonha }" class="form-control" />
                </div>
              </div>
      
            </div>

            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
              <label class="form-check-label" for="flexCheckDefault1">Save this address</label>
            </div>

            <div class="mb-3">
              <p class="mb-0">Message to seller</p>
              <div class="form-outline">
                <textarea class="form-control" name="note" id="textAreaExample1" rows="2"></textarea>
              </div>
            </div>
<input type="hidden" value="<%=u_id %>" name="user_Id">
<c:if test="<%=username == null %>">
<%int a = 0; %>
			<c:forEach items="${requestScope.cart_list }" var="cl">
          <div class="d-flex align-items-center mb-4">
            <div class="me-3 position-relative">
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-secondary">
                1
              </span>
              <img src="${cl.pImg }" style="height: 96px; width: 96x;" class="img-sm rounded border" />
            </div>
            <div class="">
              <a href="#" class="nav-link">
                ${cl.pName } <br />
                Darkblue color
              </a>
              <div class="price text-muted">Total: ${cl.price }</div>
              <div class="price text-muted quantity"></div>
             
              <div class="price text-muted size"></div>
              
             
              <input type="hidden" value="" name="size(<%=a %>)" class="size-hidden">
              
              <input type="hidden" value="" name="quantity(<%=a %>)" class="quantity-hidden">
            </div>
          </div>
          <%a++; %>
</c:forEach>
</c:if>

<c:if test="<%=username != null %>">
<%int a = 0; %>
			<c:forEach items="${requestScope.cUsers }" var="cU">
          <div class="d-flex align-items-center mb-4">
            <div class="me-3 position-relative">
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-secondary">
                1
              </span>
              <img src="${cU.pImg }" style="height: 96px; width: 96x;" class="img-sm rounded border" />
            </div>
            <div class="">
              <a href="#" class="nav-link">
                ${cU.pName } <br />
                Darkblue color
              </a>
              <div class="price text-muted">Total: ${cU.price }</div>
              <div class="price text-muted quantity"></div>
             
              <div class="price text-muted size"></div>
              
             
              <input type="hidden" value="" name="size(<%=a %>)" class="size-hidden">
              
              <input type="hidden" value="" name="quantity(<%=a %>)" class="quantity-hidden">
            </div>
          </div>
          <%a++; %>
</c:forEach>
</c:if>



            <div class="float-end">
              <button class="btn btn-light border">Cancel</button>
             
              <button type="submit"   class="btn btn-success shadow-0 border thanhtoan">ThanhToan</button>
             
             
            </div>
          </div>
        </div>
        </form>
        </c:if>
        <!-- Checkout -->
      </div>
      <div class="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
        <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
          
          
          <div class="d-flex justify-content-between">
            <p class="mb-2">Discount:</p>
            <p class="mb-2 text-danger"></p>
          </div>
          
          <hr />
          <div class="d-flex justify-content-between">
            <p class="mb-2"></p>
            <p class="mb-2 fw-bold totalPrice">$149.90</p>
          </div>

          <div class="input-group mt-3 mb-4">
            <input type="text" class="form-control border" name="" placeholder="Promo code" />
            <button class="btn btn-light text-primary border">Apply</button>
          </div>

          <hr />
        
			
          
         
        </div>
      </div>
      
    </div>
  </div>
</section>
    <!-- Shop End -->
	
	
	
	
	
	
	
	<jsp:include page="../../views/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>

	    <a href="#" class="btn btn-primary back-to-top" style="width:1rem;"><i class="fa fa-angle-double-up"></i></a>

	

	<script type="text/javascript">
	const imageContainers = document.querySelectorAll('.banner-container');

	
	imageContainers.forEach(container => {
	  const a = parseInt(container.getAttribute('data-id'));
	  switch (a) {
	    case 2:
	      container.style.backgroundImage = 'url("../../views/client/assets/sneakerbanner.png")';
	      break;
	    case 3:
	      container.style.backgroundImage = 'url("../../views/client/assets/clothingbanner.png")';
	      break;
	    case 4:
		      container.style.backgroundImage = 'url("../../views/client/assets/clothingbanner.png")';
		      break;
	    case 5:
		      container.style.backgroundImage = 'url("../../views/client/assets/clothingbanner.png")';
		      break;
	    default:
	  
	      break;
	  }
	});
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		  $('.increase-quantity').click(function() {
		    var quantityElement = $(this).prev('.quantity');
		    var priceElement = $(this).siblings('.price');
		    var currentQuantity = parseInt(quantityElement.text());
		    var price = parseFloat(priceElement.text());

		    quantityElement.text(currentQuantity + 1);
		    priceElement.text((currentQuantity + 1) * price);
		  });

		  $('.decrease-quantity').click(function() {
		    var quantityElement = $(this).next('.quantity');
		    var priceElement = $(this).siblings('.price');
		    var currentQuantity = parseInt(quantityElement.text());
		    var price = parseFloat(priceElement.text());

		    if (currentQuantity > 1) {
		      quantityElement.text(currentQuantity - 1);
		      priceElement.text((currentQuantity - 1) * price);
		    }
		  });
		});
	</script>
	<script type="text/javascript">
		const q = document.querySelectorAll(".quantity");
		const qh = document.querySelectorAll(".quantity-hidden");
		const size = document.querySelectorAll(".size-hidden");
	
		
		const p = document.querySelector(".totalPrice");
		const sendata = document.querySelector(".thanhtoan");
		const sizeL = document.querySelectorAll(".size");
		
		for(let i = 0;i < q.length; i++){
			q[i].textContent = "Quantity: " + sessionStorage.getItem("d["+i+"]");
			qh[i].value = parseInt(sessionStorage.getItem("d["+i+"]"));
			if(size.length > 0){
			size[i].value = sessionStorage.getItem("size["+i+"]");
			}
			
			
			if(sizeL.length > 0){
			sizeL[i].textContent = "Size: "+sessionStorage.getItem("size["+i+"]");
			}
			
			
			
		}
			p.textContent = "Total: " + sessionStorage.getItem("d");
			
			
			
		
			
	</script>




	
</body>
</html>