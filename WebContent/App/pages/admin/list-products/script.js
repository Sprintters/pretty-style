$(document).ready(function () {
	$('#tbProducts').DataTable({
		"language": {
			"sEmptyTable": "Nenhum registro encontrado",
			"sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
			"sInfoFiltered": "(Filtrados de _MAX_ registros)",
			"sInfoPostFix": "",
			"sInfoThousands": ".",
			"sLengthMenu": "_MENU_ resultados por página",
			"sLoadingRecords": "Carregando...",
			"sProcessing": "Processando...",
			"sZeroRecords": "Nenhum registro encontrado",
			"sSearch": "Pesquisar",
			"oPaginate": {
				"sNext": "Próximo",
				"sPrevious": "Anterior",
				"sFirst": "Primeiro",
				"sLast": "Último"
			},
			"oAria": {
				"sSortAscending": ": Ordenar colunas de forma ascendente",
				"sSortDescending": ": Ordenar colunas de forma descendente"
			},
			"select": {
				"rows": {
				"0": "Nenhuma linha selecionada",
				"1": "Selecionado 1 linha",
				"_": "Selecionado %d linhas"
				}
			}
		}
	});

	/* function format (d) {
		console.log(d);
		return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
			'<tr>'+
				'<td>Full name:</td>'+
				'<td>'+d.name+'</td>'+
			'</tr>'+
			'<tr>'+
				'<td>Extension number:</td>'+
				'<td>'+d.description+'</td>'+
			'</tr>'+
			'<tr>'+
				'<td>Extra info:</td>'+
				'<td>And any further details here (images etc)...</td>'+
			'</tr>'+
		'</table>';
	}

	var data = [
		{name: "JBL Flip 3 Portable", description: "Qualquer coisa", price: 250, idMark: 1, id: 1 },
		{name: "Samsung S9 Plus", description: "Qualquer coisa", price: 4250, idMark: 1, id: 2 },
		{name: "Notebook Dell 15 Gaming", description: "Qualquer coisa", price: 8250, idMark: 1, id: 3 },
		{name: "iPad 10", description: "O novo iPad da Apple", price: 8999.9, idMark: 2, id: 7 },
		{name: "iPhone XR Branco", description: "IPhone XR branco com câmera 12 MP", price: 3999.99, idMark: 0, id: 15 },
		{name: "Fone de ouvido JBL", description: "Fone de ouvido in-Ear sem fio JBL Tune 205 Bluetooth 4.0", price: 156.65, idMark: 1, id: 58 },
		{name: "Relógio SmartWatch", description: "Relógio moderno.", price: 800, idMark: 2, id: 60 },
		{name: "Caixa de som Mondial", description: "Caixa de som 20 watts.", price: 250, idMark: 1, id: 61 },
	];

	var table;
	
	$.ajax({
		url: '/PrettyStyle/controller.do?path=admin&command=ListProducts&id_user=11&json=true',
		method: 'POST',
		success: function (json) {
			table = $('#tbProducts').DataTable({
				"data": json,
				"columns": [
					{
						"className":      'details-control',
						"orderable":      false,
						"data":           null,
						"defaultContent": ''
					},
					{
						"data": "name",
						"render": function (_data, _type, _row) {
							return _data;
						}
					},
					{
						"data": "description",
						"render": function (_data, _type, _row) {
							return _data;
						}
					},
					{
						"data": "price",
						"render": function (_data, _type, _row) {
							return _data;
						}
					},
					{
						"data": "price",
						"render": function (_data, _type, _row) {
							return (
								'<button class="btn btn-sm btn-outline-primary" style="margin-right: 5px;">Editar</button>' +
								'<button id="btn-remove" type="button" class="btn btn-sm btn-outline-danger" onclick="handleDelete(' + _row.id + ');">Excluir</button>'
							);
						}
					}
				],
				"order": [[1, 'asc']]
			});
		}
	})
     
    $('#tbProducts tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
 
        if (row.child.isShown()) {
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    }); */
});

var slideIndex = 1;

function productPhotoSlides(n) {
  showSlides(slideIndex += n);
}

function currentProductPhotoSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("productSlides");
	var dots = document.getElementsByClassName("dot");
	
	if (n > slides.length) {
		slideIndex = 1
	}
	
	if (n < 1) {
		slideIndex = slides.length
	}
	
	for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	}
	
	for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	}
	
	slides[slideIndex-1].style.display = "block";
	dots[slideIndex-1].className += " active";
}

$("#view-product").on('show.bs.modal', function(event) {
	let button = $(event.relatedTarget);
	let productId = button.data('product');
	
	$('#lblProductId').text($('#product-id-hidden-'+productId+'').val());
	$('.lblProductName').text($('#product-name-hidden-'+productId+'').val());
	$('#lblProductDescription').text($('#product-description-hidden-'+productId+'').val());
	$('#lblProductPrice').text($('#product-price-hidden-'+productId+'').val());
	$('#lblProductQuantity').text($('#product-quantity-hidden-'+productId+'').val());
	
	let productPhotosContainersSlides = '';
	let productPhotosConteinersDots = '';
	
	$.each($('.product-photo-hidden-'+productId+''),
		function (index, value) {
			productPhotosContainersSlides +=
				'<div class="productSlides fade-product-photo-slide">'+
					'<div class="numbertext">1 / 3</div>'+
					'<img src="'+$(value).val()+'" alt="" style="width: 100%;">'+
				'</div>';
			
			productPhotosConteinersDots += '<span class="dot" onclick="currentProductPhotoSlide('+(index+1)+')"></span>';
		}
	);
	
	productPhotosContainersSlides +=
		'<a class="prev-product-photo" onclick="productPhotoSlides(-1)">&#10094;</a>'+
		'<a class="next-product-photo" onclick="productPhotoSlides(1)">&#10095;</a>';
	
	$('#dProductPhotos').empty();
	$('#dProductPhotos').append(productPhotosContainersSlides);
	
	$('#dProductPhotosDots').empty();
	$('#dProductPhotosDots').append(productPhotosConteinersDots);
	
	showSlides(slideIndex);
});

function handleDelete(id) {
	var id = parseInt(id);
	
	var title = 'Atenção!';
	var question = 'Deseja realmente excluir este registro?';
	var url = '/PrettyStyle/controller.do?path=admin&command=DeleteProduct&json=true&id=' +id;
	var type = 'warning';
	var method = 'delete';

	AlertaAvisoConfirm(title, question, url, type, method);
};

function handleAdd(form) {
	var formSerialized = $(form).serialize();
	
	$.ajax({
		type: "POST",
		url: "/PrettyStyle/controller.do?path=admin&command=EditProduct",
		data: formSerialized,
		success: function(data){
			if (data.success) {
				AlertaSucesso(data);	
			} else {
				AlertaErro(data);	
			}
		},
		error: function(data){
			AlertaErro(data);
		}
	});
};
