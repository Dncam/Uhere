/**
 * Author : Daniel Maciel de Araujo
 * Project: Uhere
 */

$("#marca").on('change',function(){
	updateCombobox($("#l_getmodelos").val(),"#id_modelo",this.value);
});

$("#estado").on('change',function(){
	updateCombobox($("#l_getcidades").val(),"#cidade",this.value);
});

$(".btn.btn-primary.navbar-btn.logincadastro").click(function(event){
	var vModalContent = createDivModal('login','');	
	$.ajax({
		type : 'GET',
		url : $('#l_openModal').attr("value"),
		success : function(data) {
			vModalContent.append(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        console.log("error " + textStatus);
	        console.log("incoming Text " + jqXHR.responseText);
	    }
	});
});


$("#btnPesquisaSimples").click(function(event){
	$("#formPesquisaSimples").submit();
	return false;
});


$(".form-horizontal").submit(function(event){
	if($(this).attr('id').indexOf("modal") != -1){
		event.preventDefault();
		var vModalContent = $('.modal-content')
		vModalContent.empty();
		$.ajax({
			scriptCharset: "ISO-8859-1" , 
			contentType: "application/x-www-form-urlencoded; charset=ISO-8859-1",
			type : 'POST',
			url : $(this).attr("action"),
			data:$(this).serialize(),
			success : function(data) {
				vModalContent.append(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        console.log("error " + textStatus);
		        console.log("incoming Text " + jqXHR.responseText);
		    }
		});
	}
});

$(".bt-pesq-avanca").on('click',function(){
	var vModalContent = createDivModal('pesquisa-avancada','modal-pesq-avan');
	$.ajax({
		type : 'POST',
		url : $(this).attr("href"),
		contentType : 'application/json',
		success : function(data) {
			vModalContent.append(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        console.log("error " + textStatus);
	        console.log("incoming Text " + jqXHR.responseText);
	    }
	});
});
// alterar
$(".bt-pesq-avanca").on('click',function(){
	var vModalContent = createDivModal('pesquisa-avancada','modal-pesq-avan');
	$.ajax({
		type : 'POST',
		url : $(this).attr("href"),
		contentType : 'application/json',
		success : function(data) {
			vModalContent.append(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
	        console.log("error " + textStatus);
	        console.log("incoming Text " + jqXHR.responseText);
	    }
	});
});


function createDivModal(vIdName,vClass){
	$('#'+vIdName).remove();
	var vModalFade = $('<div>',{
		class: 'modal fade',
		tabtabindex: '-1',
		role:'dialog',
		id:vIdName
	});
	var vModalDialog = $('<div>',{
		class:'modal-dialog '+ vClass,
		role:'document'
	});
	var vModalContent = $('<div>',{
		class:'modal-content'
	});
	vModalFade.append(vModalDialog);
	vModalDialog.append(vModalContent);
	$('BODY').append(vModalFade);
	return vModalContent;
}


function updateCombobox(link,children,filter)
{
	$.getJSON({
		 url: link + '/' + filter,
		 success: function(data) {
				var firstOption = $(children).removeAttr('selected').find('option:first');
				$(children).empty();
				$(children).append(firstOption);
				for (index = 0; index < data.length; ++index) {
					$(children).append($('<option>', {
				        value: data[index].chave,
				        text : data[index].descricao.toLowerCase().replace(/\b\w/g, function(l){ return l.toUpperCase() })
					}));
				}
			}
	 }).fail(function( jqXHR, textStatus, errorThrown ) {
		 console.log("error " + textStatus);
	     console.log("incoming Text " + jqXHR.responseText);
		
	});	
}

$(".image-upload input[type=file]").on('change',function(event){
    var input = this;
	if (input.files && input.files[0]) {
		carregarImagem(input);
	}
});


$('.numericField').on('keypress',function(event){
	if(isNaN(String.fromCharCode(event.which)))
		if(event.which != 44)
			event.preventDefault();
});

function carregarImagem(input){
    var reader = new FileReader();
    reader.onload = function (e) {
        var id = $(input).attr('id');
        id = id.substring(id.length -1 , id.length);
    	$('#img'+id).attr('src', e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
}


