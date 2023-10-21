 <%@page import="model.CartUser"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
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
UserDAO uDAO = new UserDAO();
String username = (String) session.getAttribute("username");
User user = uDAO.getByUserName((String)session.getAttribute("username"));
int uId = 0;
if(user != null){
 uId = user.getId();
}

%>

	<jsp:include page="../../views/layout/header.jsp"></jsp:include>
<div class="" style="height: 7.5rem;"></div>
	   <section class="bg-light my-5" style="top:  10rem;">
  <div class="container">
    <div class="row">
      <!-- cart -->
      <div class="col-lg-9" >
        <div class="card border shadow-0">
          <div class="m-4">
            <h4 class="card-title mb-4">Your shopping cart</h4>
            <c:if test="<%=username == null %>">
            <%int i = 0; %>
            
            <c:forEach items="${requestScope.cart_list }" var="cl">
           
            <div class="row gy-3 mb-4 productCart">
              <div class="col-lg-5">
                <div class="me-lg-5">
                  <div class="d-flex">
                    <img src="${cl.pImg }" class="border rounded me-3" style="width: 96px; height: 96px;" />
                    <div class="">
                      <a href="#" class="nav-link">${cl.pName }</a>
                      <p class="text-muted">${cl.pMa }</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                <div class="form-outline" style="width: 22rem;">
    				<input min="1"  type="number" value=""  id="typeNumber" oninput="quantityPrice(<%=i %>)" class="form-control" />
    				<label class="form-label" for="typeNumber">Số Lượng</label>
				</div>
				
				<c:if test="${cl.categoryID == 3 }">
				<select id="size-clothing" class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="S">S</option>
  					<option value="M">M</option>
  					<option value="XL">XL</option>
              </select>
              </c:if>
              <c:if test="${cl.categoryID == 2 }">
				<select id="size-sneaker"  class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="35">35</option>
  					<option value="36">36</option>
  					<option value="37">37</option>
  					<option value="38">38</option>
  					<option value="39">39</option>
  					<option value="40">40</option>
  					<option value="41">41</option>
  					<option value="42">42</option>
  					<option value="43">43</option>
  					<option value="44">44</option>
              </select>
              </c:if>
              <c:if test="${cl.categoryID == 4 }">
				<select id="size-skate" class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="60*18">60*18</option>
  					<option value="40*12">40*12</option>
  					
              </select>
              </c:if>
              
              
              
                <div class="">
                  <p class="priceFirst" style="font-size:20px;">${cl.price - (cl.discount)*10/100 }VND/1SP</p> <br />
                 
                </div>
                
              </div>
              <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
                <div class="float-md-end" style="display: grid;">
                  <a href="#!" style="font-size: 20px;"><i class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
                  <a href="deleteCart?id=${cl.pId }" class="deleteCart" style="font-size: 20px;"><i class="fa-solid fa-trash"></i></a>
                </div>
              </div>
              
            </div>
<% i++; %>
</c:forEach>

</c:if>
<c:if test="<%=username != null %>">
            <%int i = 0; %>
            
            <c:forEach items="${requestScope.cUsers }" var="cU">
           
            <div class="row gy-3 mb-4 productCart">
              <div class="col-lg-5">
                <div class="me-lg-5">
                  <div class="d-flex">
                    <img src="${cU.pImg }" class="border rounded me-3" style="width: 96px; height: 96px;" />
                    <div class="">
                      <a href="#" class="nav-link">${cU.pName }</a>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                <div class="form-outline" style="width: 22rem;">
    				<input min="1"  type="number" value="${cU.quantityInCart }" id="typeNumber" oninput="quantityPrice(<%=i %>)" class="form-control" />
    				<label class="form-label" for="typeNumber">Số Lượng</label>
				</div>
				
				<c:if test="${cU.categoryID == 3 }">
				<select id="size-clothing" class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="S">S</option>
  					<option value="M">M</option>
  					<option value="XL">XL</option>
              </select>
              </c:if>
              <c:if test="${cU.categoryID == 2 }">
				<select id="size-sneaker"  class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="35">35</option>
  					<option value="36">36</option>
  					<option value="37">37</option>
  					<option value="38">38</option>
  					<option value="39">39</option>
  					<option value="40">40</option>
  					<option value="41">41</option>
  					<option value="42">42</option>
  					<option value="43">43</option>
  					<option value="44">44</option>
              </select>
              </c:if>
              <c:if test="${cU.categoryID == 4 }">
				<select id="size-skate" class="form-select size" aria-label="Default select example" style="width:6rem;height:2.5rem;">
  					<option selected>Size</option>
  					<option value="60*18">60*18</option>
  					<option value="40*12">40*12</option>
  					
              </select>
              </c:if>
				
				
				
				
                <div class="">
                  <p class="priceFirst" style="font-size:20px;">${cU.price - (cU.discount)*10/100 }VND/1SP</p> <br />
                 
                </div>
                
              </div>
              <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
                <div class="float-md-end" style="display: grid;">
                  <a href="#!" style="font-size: 20px;"><i class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
                  <a href="deleteCart?id=${cU.pId }" class="deleteCart" style="font-size: 20px;"><i class="fa-solid fa-trash"></i></a>
                </div>
              </div>
            </div>
<% i++; %>
</c:forEach>

</c:if>
            

            
          </div>

          <div class="border-top pt-4 mx-4 mb-4">
            <p><i class="fas fa-truck text-muted fa-lg"></i> Free Delivery within 1-2 weeks</p>
            <p class="text-muted">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
              aliquip
            </p>
          </div>
        </div>
      </div>
      <!-- cart -->
      <!-- summary -->
      
      <div class="col-lg-3">
        <div class="card mb-3 border shadow-0">
          <div class="card-body">
            <form>
              <div class="form-group">
                <label class="form-label">Have coupon?</label>
                <div class="input-group">
                  <input type="text" class="form-control border" name="" placeholder="Coupon code" />
                  <button class="btn btn-light border">Apply</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="card shadow-0 border">
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <p class="mb-2 ">Total price:</p>
              <p class="mb-2 totalPrice">0</p>
            </div>
            <div class="d-flex justify-content-between">
              <p class="mb-2">Chua tinh voucher giam gia</p>
              
            </div>
            <div class="d-flex justify-content-between">
              <p class="mb-2">Chưa tính giá vận chuyển</p>
             
            </div>
            <hr />
           

            <div class="mt-3">
            <c:if test="<%=uId != 0 %>">
              <a href="/FiShop/check?id=<%=uId %>" class="btn btn-success w-100 shadow-0 mb-2"> Make Purchase </a>
              </c:if>
             <c:if test="<%=uId == 0 %>">
              <a href="/FiShop/check" class="btn btn-success w-100 shadow-0 mb-2"> Make Purchase </a>
              </c:if>
              <a href="/FiShop/index" class="btn btn-light w-100 border mt-2"> Back to shop </a>
            </div>
          </div>
        </div>
      </div>

      <!-- summary -->
    </div>
  </div>

</section>

<!-- cart + summary -->
<section>
  <div class="container my-5">
    <div class="mb-4">
      <h3 style="color:white;">Recommended items</h3>
    </div>

    <div class="row">
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card px-4 border shadow-0 mb-4 mb-lg-0">
          <div class="mask px-2" style="height: 50px;">
            <div class="d-flex justify-content-between">
              <h6><span class="badge bg-danger pt-1 mt-3 ms-2">New</span></h6>
              <a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a>
            </div>
          </div>
          <a href="#" class="">
            <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/7.webp" class="card-img-top rounded-2" />
          </a>
          <div class="card-body d-flex flex-column pt-3 border-top">
            <a href="#" class="nav-link">Gaming Headset with Mic</a>
            <div class="price-wrap mb-2">
              <strong class="">$18.95</strong>
              <del class="">$24.99</del>
            </div>
            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
              <a href="#" class="btn btn-outline-primary w-100">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card px-4 border shadow-0 mb-4 mb-lg-0">
          <div class="mask px-2" style="height: 50px;">
            <a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a>
          </div>
          <a href="#" class="">
            <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/5.webp" class="card-img-top rounded-2" />
          </a>
          <div class="card-body d-flex flex-column pt-3 border-top">
            <a href="#" class="nav-link">Apple Watch Series 1 Sport </a>
            <div class="price-wrap mb-2">
              <strong class="">$120.00</strong>
            </div>
            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
              <a href="#" class="btn btn-outline-primary w-100">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card px-4 border shadow-0">
          <div class="mask px-2" style="height: 50px;">
            <a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a>
          </div>
          <a href="#" class="">
            <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp" class="card-img-top rounded-2" />
          </a>
          <div class="card-body d-flex flex-column pt-3 border-top">
            <a href="#" class="nav-link">Men's Denim Jeans Shorts</a>
            <div class="price-wrap mb-2">
              <strong class="">$80.50</strong>
            </div>
            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
              <a href="#" class="btn btn-outline-primary w-100">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card px-4 border shadow-0">
          <div class="mask px-2" style="height: 50px;">
            <a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a>
          </div>
          <a href="#" class="">
            <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp" class="card-img-top rounded-2" />
          </a>
          <div class="card-body d-flex flex-column pt-3 border-top">
            <a href="#" class="nav-link">Mens T-shirt Cotton Base Layer Slim fit </a>
            <div class="price-wrap mb-2">
              <strong class="">$13.90</strong>
            </div>
            <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
              <a href="#" class="btn btn-outline-primary w-100">Add to cart</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    <!-- Shop End -->

	
	
	<script type="text/javascript">
	
		let c=[];
		const sizeSneaker = document.querySelectorAll("#size-sneaker");
		const size = document.querySelectorAll(".size");
		const sizeSkate = document.querySelectorAll("#size-skate");
		const price = document.querySelectorAll(".priceFirst");
		let k = 0;
		for(let i = 0;i< price.length;i++){
	        function quantityPrice(i){ 
	        
	        	
	            const totalPrice = document.querySelector(".totalPrice");
	            const q = document.querySelectorAll("#typeNumber");
	            const p = document.querySelectorAll(".priceFirst");
	           
	            
	             c[i] = q[i].value*parseInt(p[i].textContent);
	            
	           
	            let sum = c.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
	        
	            totalPrice.textContent = sum.toLocaleString('en-US');
	           
	            sessionStorage.setItem("d["+i+"]", q[i].value);
	            sessionStorage.setItem("d", sum);

	        }
	        if(size.length > 0){
	        size[i].addEventListener("change", function () {
			    let selectedValue = size[i].value;
			    sessionStorage.setItem("size[" + i + "]", selectedValue);
			    
			});}
	       
	        
		}
	
		
		
		
	</script>
	
	
	
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
	
	

	
</body>
</html>