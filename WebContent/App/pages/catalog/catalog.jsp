<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="shortcut icon" href="/PrettyStyle/favicon.ico" type="image/x-icon" />
		
		<title>Pretty Style - Catálogo</title>
		
		<link rel="stylesheet" href="../../lib/bootstrap/4.4.1/css/bootstrap.min.css">
		
		<link rel="stylesheet" href="../../styles/index.css">
		<link rel="stylesheet" href="../../styles/header.css">
		<link rel="stylesheet" href="../../styles/footer.css">
		<link rel="stylesheet" href="../../styles/responsive.css">
		
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<c:import url="../../components/header.jsp" />
		<div id="main-content" class="container">
			<div class="catalog-container">
				<div class="container">
					<div class="col-md-12 header">
						<div class="row content">
							<div class="col-md-2 title">
								<label>${filter}</label>
							</div>
							<div class="col-md-10">
								<hr />
							</div>
						</div>
					</div>
					<div class="col-md-12 body">
						<div class="row">
							<div class="col-md-2 body-filters">
								<div class="jumbotron filters">
									<label>Categorias</label>
									<hr />
									<c:forEach var="category" items="${categories}">
										<div class="filters-inputs">
	
											<div class="male-filter">
												<label class="container-check">${category.name} <input
													type="checkbox"> <span class="checkmark"></span>
												</label>
											</div>
										</div>
									</c:forEach>
									<div class="divisor"></div>
									<label>Preço</label>
									<hr />
								</div>
							</div>
							<div class="col-md-10 body-main">
								<div class="jumbotron main">
									<c:if test="${empty products}">
										<div class="empty-cart">
											<strong>Não encontramos nenhum produto nesta categoria.</strong>
										</div>
									</c:if>
									<div class="row">
										<div class="col-md-12">
											<div class="row">
												<c:forEach var="product" items="${products}">
													<div class="col-md-3 col-product">
														<div class="jumbotron product">
															<div id="id-user" class="photo-product" onclick="window.location.href='/PrettyStyle/controller.do?path=productdetails&command=ViewProduct&id_product=${product.id}'">
																<img src="../../assets/img/jbl.png" alt="${product.name}">
															</div>
															<label class="title-product">${product.name}</label>
															<p>${product.description}</p>
															<div class="stars">
																<span class="star yellow-star">&nbsp;</span>
																<span class="star yellow-star">&nbsp;</span>
																<span class="star yellow-star">&nbsp;</span>
																<span class="star yellow-star">&nbsp;</span>
																<span class="star gray-star">&nbsp;</span>
															</div>
															<label class="price-product">
																<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="R$" />
															</label>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="row button-area">
												<button type="button">ANTERIOR</button>
												<div class="pagination active">1</div>
												<div class="pagination">2</div>
												<button type="button">PRÓXIMA</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../../components/footer.jsp" />
	
		<script src="../../lib/jquery/1.9.1/jquery-1.9.1.min.js"></script>
	</body>
</html>
