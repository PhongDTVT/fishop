<%@page import="model.Product"%>
<%@page import="dao.FilterProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SizeSp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<SizeSp> sizes = new ArrayList<>();
FilterProductDAO fproDAO = new FilterProductDAO();

sizes = fproDAO.getAllSize();
request.setAttribute("sizes", sizes);
Product product =  (Product)request.getAttribute("pro");
int cId = product.getCategoryID();

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../views/client/bootstrap-5.3.0/css/bootstrap.css">
    
    <link rel="stylesheet" href="../../views/client/assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
	.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
  color: #3b71ca !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}
.product-detail{
 margin-top: 6rem;
 }
 span,p,h2,h3,h4,h5,i,dt,dd,option,i,li,th,td{
 font-size: 1.6rem;}
 
 .product-small-img img{
    height: 90px;
    margin: 10px 0;
    cursor: pointer;
    display: block;
    opacity: 0.6;
}
.product-small-img{
    float: left;
}
.product-small-img img:hover{
    opacity: 1;
}

.img-container img{
    height: 500px;
    width:500px;
    
}
.img-container{
    float: left;
	position: relative;
 	

}

.imgZoom{
	position: absolute;
    left: 0;
    top: 0;
    
    --zoom-x: 50%;
    --zoom-y: 50%;
    transform: scale(1.5);
    pointer-events: none;
    clip-path: circle(
    100px at var(--zoom-x) var(--zoom-y)
    );
    opacity: 0;
  	
    }
  
 
</style>

</head>
<body>
	<jsp:include page="../../views/layout/header.jsp"></jsp:include>
	<!-- main start -->
	<section class="py-5 product-detail " >
  <div class="container ">
    <div class="row gx-5">
      <aside class="col-lg-6 " style="margin-top:10rem;display: block;">
      <c:forEach items="${requestScope.proImgs }" var="p" varStatus="loop">
   
      
        <div class="border rounded-4 mb-3 d-flex justify-content-center img-container " style="margin-left: -6rem;margin-right: 6rem"  >
          <c:if test="${loop.index == 0 }">
            <img id="imageBox1" style="max-width: 100%; max-height: 100vh; margin: auto;transition: transform 0.3s;" class="rounded-4 fit" src="${p.sanphamImg }" />
        	
        	<img id="imageBox2" style="max-width: 100%; max-height: 100vh; margin: auto;transition: transform 0.3s;" class="rounded-4 fit imgZoom" src="${p.sanphamImg }" />
      
     </c:if>
        </div>
    
   
        <div class="d-flex justify-content-center mb-3 product-small-img" style="margin-top:1rem;display: flex;flex-direction: column; ">
       
          <img width="60" height="60" class="rounded-2" src="${p.sanphamImg }" onclick="myFunction(this)" >
			
          
        </div>
      
      
        </c:forEach>
        <!-- thumbs-wrap.// -->
        <!-- gallery-wrap .end// -->
      </aside>
      
      
      
     
      <main class="col-lg-6">
        <div class="ps-lg-3">
        
          <h4 class="title text-white" style="margin-top: 3rem;">
            ${pro.pName } <br />
            ${pro.pMa }
          </h4>
          <div class="d-flex flex-row my-3">
            <div class="text-warning mb-1 me-2">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
              <span class="ms-1">
                4.5
              </span>
            </div>
            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1" style="color: white;"></i>154 orders</span>
            <span class="text-success ms-2">In stock</span>
          </div>

          <div class="mb-3">
            <span class="h5" style="color: white;font-size:3rem;">${pro.price }VND</span> <br>
            <span class="h5" style="color: white;font-size:3rem;">Sale: ${pro.discount }%</span>
            
          </div>

          <p style="color: white;">
            ${pro.pDesc }
          </p>

          <div class="row">
            <dt class="col-3" style="color: white;">Type:</dt>
            <dd class="col-9" style="color: white;">Regular</dd>

            <dt class="col-3" style="color: white;">Color</dt>
            <dd class="col-9" style="color: white;">Brown</dd>

            <dt class="col-3" style="color: white;">Material</dt>
            <dd class="col-9" style="color: white;">Cotton, Jeans</dd>

            <dt class="col-3" style="color: white;">Brand</dt>
            <dd class="col-9" style="color: white;">Nike</dd>
          </div>

          <hr />

          <div class="row mb-4">
            <div class="col-md-4 col-6">
              <label class="mb-2">Size</label>
              <%if(cId == 3){ %>
              <div class="btn-group" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-secondary ">S</button>
  					<button type="button" class="btn btn-secondary ">M</button>
 					<button type="button" class="btn btn-secondary ">XL</button>
			</div>
			<%} %>
			<%if(cId == 2){ %>
              <div class="btn-group" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-secondary ">35</button>
  					<button type="button" class="btn btn-secondary ">36</button>
 					<button type="button" class="btn btn-secondary ">37</button>
 					<button type="button" class="btn btn-secondary ">38</button>
  					<button type="button" class="btn btn-secondary ">39</button>
  					</div>
  					<div class="btn-group" role="group" aria-label="Basic example">
 					<button type="button" class="btn btn-secondary ">40</button>
 					<button type="button" class="btn btn-secondary ">41</button>
  					<button type="button" class="btn btn-secondary ">42</button>
 					<button type="button" class="btn btn-secondary ">43</button>
 					<button type="button" class="btn btn-secondary ">44</button>
			</div>
			<%} %>
			<% if(cId == 4){ %>
				<div class="btn-group" role="group" aria-label="Basic example">
  					<button type="button" class="btn btn-secondary ">60*18</button>
  					<button type="button" class="btn btn-secondary ">40*12</button>
 					
			</div>
			<%} %>
            </div>
            <!-- col.// -->
            
          </div>
          <a href="#" class="btn btn-warning shadow-0"> Mua ngay </a>
          <a href="addCart?id=${product.pId }" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng </a>
          <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i class="me-1 fa fa-heart fa-lg"></i> Đánh Giá </a>
          
        </div>
      </main>
    
    </div>
  </div>
</section>
<!-- content -->

<section class="bg-light border-top py-4 product-detail">
  <div class="container">
    <div class="row gx-4">
      <div class="col-lg-8 mb-4">
        <div class="border rounded-2 px-3 py-2 bg-white">
          <!-- Pills navs -->
          <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
            <li class="nav-item d-flex" role="presentation">
              <a class="nav-link d-flex align-items-center justify-content-center w-100 active" id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab" aria-controls="ex1-pills-1" aria-selected="true">Mô tả sản phẩm</a>
            </li>
            <li class="nav-item d-flex" role="presentation">
              <a class="nav-link d-flex align-items-center justify-content-center w-100" id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2" role="tab" aria-controls="ex1-pills-2" aria-selected="false">Hướng dẫn bảo quản</a>
            </li>
            <li class="nav-item d-flex" role="presentation">
              <a class="nav-link d-flex align-items-center justify-content-center w-100" id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3" role="tab" aria-controls="ex1-pills-3" aria-selected="false">Hướng dẫn chọn size</a>
            </li>
            
          </ul>
          <!-- Pills navs -->

          <!-- Pills content -->
          <div class="tab-content" id="ex1-content">
            <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel" aria-labelledby="ex1-tab-1">
              <p>
                With supporting text below as a natural lead-in to additional content. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur.
              </p>
              <div class="row mb-2">
                <div class="col-12 col-md-6">
                  <ul class="list-unstyled mb-0">
                    <li><i class="fas fa-check text-success me-2"></i>Some great feature name here</li>
                    <li><i class="fas fa-check text-success me-2"></i>Lorem ipsum dolor sit amet, consectetur</li>
                    <li><i class="fas fa-check text-success me-2"></i>Duis aute irure dolor in reprehenderit</li>
                    <li><i class="fas fa-check text-success me-2"></i>Optical heart sensor</li>
                  </ul>
                </div>
                <div class="col-12 col-md-6 mb-0">
                  <ul class="list-unstyled">
                    <li><i class="fas fa-check text-success me-2"></i>Easy fast and ver good</li>
                    <li><i class="fas fa-check text-success me-2"></i>Some great feature name here</li>
                    <li><i class="fas fa-check text-success me-2"></i>Modern style and design</li>
                  </ul>
                </div>
              </div>
              <table class="table border mt-3 mb-2">
                <tr>
                  <th class="py-2">Display:</th>
                  <td class="py-2">13.3-inch LED-backlit display with IPS</td>
                </tr>
                <tr>
                  <th class="py-2">Processor capacity:</th>
                  <td class="py-2">2.3GHz dual-core Intel Core i5</td>
                </tr>
                <tr>
                  <th class="py-2">Camera quality:</th>
                  <td class="py-2">720p FaceTime HD camera</td>
                </tr>
                <tr>
                  <th class="py-2">Memory</th>
                  <td class="py-2">8 GB RAM or 16 GB RAM</td>
                </tr>
                <tr>
                  <th class="py-2">Graphics</th>
                  <td class="py-2">Intel Iris Plus Graphics 640</td>
                </tr>
              </table>
            </div>
            <div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel" aria-labelledby="ex1-tab-2">
              Tab content or sample information now <br />
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
              aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
              officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
              nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
            </div>
            <div class="tab-pane fade mb-2" id="ex1-pills-3" role="tabpanel" aria-labelledby="ex1-tab-3">
              Another tab content or sample information now <br />
              Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
              commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
              mollit anim id est laborum.
            </div>
            <div class="tab-pane fade mb-2" id="ex1-pills-4" role="tabpanel" aria-labelledby="ex1-tab-4">
              Some other tab content or sample information now <br />
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
              aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
              officia deserunt mollit anim id est laborum.
            </div>
          </div>
          <!-- Pills content -->
        </div>
      </div>
      <div class="col-lg-4">
        <div class="px-0 border rounded-2 shadow-0">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Similar items</h5>
              <div class="d-flex mb-3">
                <a href="#" class="me-3">
                  <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/8.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                </a>
                <div class="info">
                  <a href="#" class="nav-link mb-1">
                    Rucksack Backpack Large <br />
                    Line Mounts
                  </a>
                  <strong class="text-dark"> $38.90</strong>
                </div>
              </div>

              <div class="d-flex mb-3">
                <a href="#" class="me-3">
                  <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                </a>
                <div class="info">
                  <a href="#" class="nav-link mb-1">
                    Summer New Men's Denim <br />
                    Jeans Shorts
                  </a>
                  <strong class="text-dark"> $29.50</strong>
                </div>
              </div>

              <div class="d-flex mb-3">
                <a href="#" class="me-3">
                  <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                </a>
                <div class="info">
                  <a href="#" class="nav-link mb-1"> T-shirts with multiple colors, for men and lady </a>
                  <strong class="text-dark"> $120.00</strong>
                </div>
              </div>

              <div class="d-flex">
                <a href="#" class="me-3">
                  <img src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp" style="min-width: 96px; height: 96px;" class="img-md img-thumbnail" />
                </a>
                <div class="info">
                  <a href="#" class="nav-link mb-1"> Blazer Suit Dress Jacket for Men, Blue color </a>
                  <strong class="text-dark"> $339.90</strong>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	
	
	<script type="text/javascript">

		function myFunction(small){
        var fullImg1 = document.getElementById('imageBox1');
        var fullImg2 = document.getElementById('imageBox2');
        fullImg1.src = small.src;
        fullImg2.src = small.src;
		}
		
	
	</script>
	<script type="text/javascript">
	const zoom = document.querySelector('.img-container');
	const imgZoom = document.querySelector('.imgZoom');

	zoom.addEventListener('mousemove', function(event){
	    imgZoom.style.opacity = 1;
	    const positionPx = event.x - zoom.getBoundingClientRect().left;
	    const positionX = ((positionPx ) / zoom.offsetWidth) * 100;

	    const positionPy = event.y - zoom.getBoundingClientRect().top;
	    const positionY = ((positionPy) / zoom.offsetHeight) * 100;

	    imgZoom.style.setProperty('--zoom-x', positionX + '%');
	    imgZoom.style.setProperty('--zoom-y', positionY + '%');

	    const transformX = -(positionX - 50) / 3.5;
	    const transformY = - (positionY - 50) / 3.5;
	    imgZoom.style.transform = `scale(1.5) translateX(${transformX}%) translateY(${transformY}%)`;

	});
	zoom.addEventListener('mouseout', ()=>{
	    imgZoom.style.opacity = 0;
	});
	</script>
	<!-- main end -->
	<jsp:include page="../../views/layout/footer.jsp"></jsp:include>
	
</body>
</html>