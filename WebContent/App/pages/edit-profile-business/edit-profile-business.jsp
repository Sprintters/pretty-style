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
		
		<title>Pretty Style - Editar perfil</title>
		
		<link rel="stylesheet" href="../../lib/bootstrap/4.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="../../lib/sweetalert/sweetalert.css">
		
		<link rel="stylesheet" href="../../styles/index.css">
		<link rel="stylesheet" href="../../styles/header.css">
		<link rel="stylesheet" href="../../styles/footer.css">
		<link rel="stylesheet" href="../../styles/responsive.css">
		
		<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<c:import url="../../components/header.jsp" />
		<div id="main-content" class="container">
			<div class="edit-profile-container">
				<div class="container">
					<div class="col-md-12 header">
						<div class="row content">
							<div class="title">
								<label>Editar Conta</label>
							</div>
							<div class="line">
								<hr />
							</div>
						</div>
					</div>
					<div class="jumbotron main">
						<div class="navigation">
			  				<label class="active">Minha conta</label>
			  				<hr style="width: 20px;" />
			  				<label class="" onclick="window.location.href='/PrettyStyle/controller.do?path=address&command=ListAddress'">Meus endereços</label>
			  				<hr style="width: 20px;" />
			  				<label class="" onclick="window.location.href='/PrettyStyle/controller.do?path=address&command=NavigateToCreateAddress'">Cadastrar endereço</label>
			  			</div>
						<div class="col-md-12 content">
							<form action="/PrettyStyle/controller.do?path=profile&command=UpdateProfile&json=true" method="POST" name="update-profile">
								<div class="row">
									<div class="col-md-6 username-area">
										<label for="username">Username<span
											style="color: #ff0000; margin-left: 5px;">*</span></label> <input
											class="form-control" id="username" name="username"
											placeholder="Como você gostaria de ser chamado?" value="${user.username}"/>
									</div>
									<div class="col-md-6 email-area">
										<label for="email">E-mail<span
											style="color: #ff0000; margin-left: 5px;">*</span></label> <input
											class="form-control" id="email" name="email"
											placeholder="Ex: seuemail@email.com.br" value="${user.email}"/>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 name-area">
										<label for="fantasyName">Nome fantasia<span style="color: #ff0000; margin-left: 5px;">*</span></label>
					  					<input class="form-control" id="fantasyName" name="fantasyName" placeholder="Informe o nome fantasia"  value="${user.getProvider().getFantasyName()}" />
									</div>
									<div class="col-md-6 email-confirmation-area">
										<label for="email-confirmation">Confirmação de e-mail<span
											style="color: #ff0000; margin-left: 5px;">*</span></label> <input
											class="form-control" id="email-confirmation" name="email-confirmation"
											placeholder="Ex: seuemail@email.com.br" value="${user.emailConfirmation}"/>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 surname-area">
										<label for="socialReason">Sua razão social<span style="color: #ff0000; margin-left: 5px;">*</span></label>
					  					<input class="form-control" id="socialReason" name="socialReason" placeholder="Digite sua razão social" value="${user.getProvider().getSocialReason()}" />
									</div>
									<div class="col-md-6 password-area">
										<label for="password">Senha</label>
										<input
											class="form-control"
											id="password"
											name="password"
											type=password
											placeholder="Digite sua senha"
										/>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 cnpj-area">
					  					<label for="cnpj">CNPJ<span style="color: #ff0000; margin-left: 5px;">*</span></label>
					  					<input class="form-control" id="cnpj" name="cnpj" placeholder="Ex: 12.345.678./1234-85" value="${user.getProvider().getCnpj()}" />
					  				</div>
					  				<div class="col-md-6 contact-area">
					  					<label for="contact">Contato<span style="color: #ff0000; margin-left: 5px;">*</span></label>
					  					<input class="form-control" id="contact" name="contact" placeholder="Ex: contato@email.com.br" value="${user.getProvider().getContact()}" />
					  				</div>
								</div>
								<div class="row">
									<div class="col-md-6 telephone-area">
										<label for="telephone">Telefone Fixo<span style="color: #AAA; margin-left: 5px;">(Opcional)</span>
										</label>
										<input
											class="form-control"
											id="telephone"
											name="telephone"
											placeholder="Ex: (11) 2022-9944"
											value="${user.phoneNumbers[0].ddd}${user.phoneNumbers[0].number}"
										/>
									</div>
									<div class="col-md-6 cellphone-area">
										<label for="cellphone">
											Celular<span style="color: #ff0000; margin-left: 5px;">*</span>
										</label>
										<input
											class="form-control"
											id="cellphone"
											name="cellphone"
											placeholder="Ex: (11) 9 99885-9944"
											value="${user.phoneNumbers[1].ddd}${user.phoneNumbers[1].number}"
										/>
									</div>
								</div>
								<div class="row button-area">
									<button type="submit">SALVAR</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../../components/footer.jsp" />
		
		<script src="../../lib/jquery/1.9.1/jquery-1.9.1.min.js"></script>
		<script src="../../lib/jquery-validation/jquery.validate.min.js"></script>
		<script src="../../lib/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="../../lib/mask/jquery.mask.js"></script>
		
		<script src="script.js"></script>
	</body>
</html>
