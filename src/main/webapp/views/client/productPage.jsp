<%@page import="model.CartUser"%>
<%@page import="model.SizeSp"%>
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
<!DOCTYPE html>
<html>
<head>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<title>Sneaker</title>





    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	
	

  <!-- Favicon -->
    <link href="views/client/assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="views/client/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="views/client/assets/css/style1.css" rel="stylesheet">
<style type="text/css">
	span,label{
	color: white;
	}
	h5{
	color: white;
	}
	
	.listPage{
    padding:10px;
    text-align: center;
    list-style: none;
}
.listPage li{
    background-color: #ffffffBD;
    padding:20px;
    display: inline-block;
    margin:0 10px;
    cursor: pointer;
}
.listPage .active{
    background-color: #B192EF;
    color:#fff;
}
	
</style>


</head>
<body>

<%
// danh sách phânn loại theo loại sản phẩm
	int id = Integer.parseInt(request.getParameter("id"));
	List<FilterProduct> fproducts = new ArrayList<>();
	List<SizeSp> sizes = new ArrayList<>();
	FilterProductDAO fproDAO = new FilterProductDAO();
	fproducts = fproDAO.getAllCategoryId(id);
	sizes = fproDAO.getAllSize();
	request.setAttribute("sizes", sizes);
	request.setAttribute("fproducts", fproducts);
	
	//Danh muc san pham
	Category cate = new Category();
	CategoryDAO cDAO = new CategoryDAO();
	cate = cDAO.getById(id);
	String name = cate.getName();
	
	String username = (String)session.getAttribute("username");
	

%>
	<jsp:include page="../../views/layout/header.jsp"></jsp:include>

	 <div class="container-fluid bg-secondary mb-5 banner-container" data-id="<%=id %>" style=" width: 900px;
	 /* Độ rộng của khối div */
    height: 800px; /* Chiều cao của khối div */
   
    background-size: cover; /* Hiển thị ảnh bằng cách tự động điều chỉnh kích thước để phủ đầy khối div */
    background-repeat: no-repeat; /* Không lặp lại ảnh */">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <br>
        <br><br>
            <h1 class="font-weight-semi-bold text-uppercase mb-3" style="font-size:5rem;">FiShop</h1>
            <div class="d-inline-flex">
                <h1><p class="m-0">Store for your life</p></h1>
                
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4" style="color:white;">Filter by price</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="price-all">
                            <label class="custom-control-label" for="price-all">All Price</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-1">
                            <label class="custom-control-label" for="price-1">$0 - $100</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-2">
                            <label class="custom-control-label" for="price-2">$100 - $200</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-3">
                            <label class="custom-control-label" for="price-3">$200 - $300</label>
                           
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-4">
                            <label class="custom-control-label" for="price-4">$300 - $400</label>
                            
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="price-5">
                            <label class="custom-control-label" for="price-5">$400 - $500</label>
                            
                        </div>
                    </form>
                </div>
                <!-- Price End -->
                
                <!-- Color Start -->
 
                <div class="border-bottom mb-4 pb-4">
                
                    <h5 class="font-weight-semi-bold mb-4" style="color:white;">Filter by Brands</h5>

                    <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="brand-all">
                            <label class="custom-control-label" for="brand-all">All</label>
                            
                        </div>
                                        <c:forEach items="${requestScope.fproducts }" var="fpro">
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input"  id="${fpro.loaisanphamId }">
                            <label class="custom-control-label" for="${fpro.loaisanphamId }">${fpro.loaisanphamName }</label>
                            
                        </div>
                         </c:forEach>
                    </form>
                
                </div>
            
                <!-- Color End -->

                <!-- Size Start -->
                <div class="mb-5">
                    <h5 class="font-weight-semi-bold mb-4" style="color:white;">Filter by size</h5>
                    <form>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" checked id="size-all">
                            <label class="custom-control-label" for="size-all">All Size</label>
                           
                        </div>
                        <c:forEach items="${requestScope.sizes }" var="s">
                        <c:choose>
                        <c:when test="<%=id == 2 %>">
                        	<c:if test="${s.categoryId == 2 }">
                        	<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="${s.sizespId }">
                            <label class="custom-control-label" for="${s.sizespId }">${s.size }</label>
                           
                        </div>
                        </c:if>
                        </c:when>
                        <c:when test="<%=id == 3 %>">
                        <c:if test="${ s.categoryId == 3 }">
                        	<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="${s.sizespId }">
                            <label class="custom-control-label" for="${s.sizespId }">${s.size }</label>
                           
                        </div>
                        </c:if>
                        </c:when>
                        <c:when test="<%=id == 4 %>">
                        <c:if test="${s.categoryId == 4 }">
                        	<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="${s.sizespId }">
                            <label class="custom-control-label" for="${s.sizespId }">${s.size }</label>
                           
                        </div>
                        </c:if>
                        </c:when>
                        </c:choose>
                        
                        </c:forEach>
                    </form>
                </div>
                <!-- Size End -->
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3" >
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search by name">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                            </form>
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#">Latest</a>
                                    <a class="dropdown-item" href="#">Popularity</a>
                                    <a class="dropdown-item" href="#">Best Rating</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <c:forEach items="${requestScope.p }" var="product">
                    
                    
                    <div class="product-pag col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img style="width:500px;height:400px;" class="img-fluid w-100" src="${product.pImg }" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${product.pName }</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>${product.price } <strong>VND</strong></h6><h6 class="text-muted ml-2"><del></del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border" style="display:none;'">
                                <a href="productDetail?id=${product.pId }" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1" style="font-size:20px; margin: 0;"></i>View</a>
                                <c:if test="<%= username == null %>">
                                <a href="addCart?id=${product.pId }" class="btn btn-sm text-dark p-0 add-to-cart"><i class="fas fa-shopping-cart text-primary mr-1"></i>Cart</a>
                            	</c:if>
                            	<c:if test="<%= username != null %>">
                                <a href="addCartuser?id=${product.pId }" class="btn btn-sm text-dark p-0 add-to-cart"><i class="fas fa-shopping-cart text-primary mr-1"></i>Cart</a>
                            	</c:if>
                            	
                            </div>
                        </div>
                    </div>
                    
                      
                    </c:forEach>
                    
                    <ul class="listPage" style="color: white;">
                    
                    </ul>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->

	
	
	
	
	
	
	<jsp:include page="../../views/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>

	    <a href="#" class="btn btn-primary back-to-top" style="width:1rem;"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="views/client/assets/lib/easing/easing.min.js"></script>
    <script src="views/client/assets/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="views/client/assets/mail/jqBootstrapValidation.min.js"></script>
    <script src="views/client/assets/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="views/client/assets/js/main.js"></script>
	

	<script type="text/javascript">
	const imageContainers = document.querySelectorAll('.banner-container');

	
	imageContainers.forEach(container => {
	  const a = parseInt(container.getAttribute('data-id'));
	  switch (a) {
	    case 2:
	      container.style.backgroundImage = 'url("views/client/assets/sneakerbanner.png")';
	      break;
	    case 3:
	      container.style.backgroundImage = 'url("views/client/assets/clothingbanner.png")';
	      break;
	    case 4:
		      container.style.backgroundImage = 'url("https://www.everythinghiphop.com/blog/wp-content/pictures/2019/11/SkateboardingImage-main-page.jpg")';
		      break;
	    case 5:
		      container.style.backgroundImage = 'url("views/client/assets/clothingbanner.png")';
		      break;
	    default:
	  
	      break;
	  }
	});
	</script>
<script type="text/javascript">
let thisPage = 1;
let limit = 6;
let list = document.querySelectorAll('.product-pag');

function loadItem(){
    let beginGet = limit * (thisPage - 1);
    let endGet = limit * thisPage - 1;
    list.forEach((item, key)=>{
        if(key >= beginGet && key <= endGet){
            item.style.display = 'block';
        }else{
            item.style.display = 'none';
        }
    })
    listPage();
}
loadItem();
function listPage(){
    let count = Math.ceil(list.length / limit);
    document.querySelector('.listPage').innerHTML = '';

    if(thisPage != 1){
        let prev = document.createElement('li');
        prev.innerText = 'PREV';
        prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
        document.querySelector('.listPage').appendChild(prev);
    }

    for(i = 1; i <= count; i++){
        let newPage = document.createElement('li');
        newPage.innerText = i;
        if(i == thisPage){
            newPage.classList.add('active');
        }
        newPage.setAttribute('onclick', "changePage(" + i + ")");
        document.querySelector('.listPage').appendChild(newPage);
    }

    if(thisPage != count){
        let next = document.createElement('li');
        next.innerText = 'NEXT';
        next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
        document.querySelector('.listPage').appendChild(next);
    }
}
function changePage(i){
    thisPage = i;
    loadItem();
}
</script>
	
	
	
	
	
</body>
</html>