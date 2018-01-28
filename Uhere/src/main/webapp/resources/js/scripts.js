$(function() {
  $(window).on("scroll", function() {
    if($(window).scrollTop() > 200) {
      $(".navbar").addClass("escuro");
    } else {
      $(".navbar").removeClass("escuro");
    }
  });
});

// Filtro MOBILE
$( ".ico-filtro" ).click(function() {
  $( ".filtro" ).toggleClass( "aparece" );
});

// Filtro CHECK
$('#id_location').on('hidden.bs.collapse', function () {
  $("#icon-check").addClass("mostra-check");
});

// SCROLAGEM
var $doc = $('html, body');
$('.ancora').click(function() {
    $doc.animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 1000);
    return false;
});

//ACONTECE ALGO COM A ROLAGEM

var text_area_1 = $('.text_area_1');
var passo_img_1 = $('.passo_img_1');

var text_area_2 = $('.text_area_2');
var passo_img_2 = $('.passo_img_2');

var text_area_3 = $('.text_area_3');
var passo_img_3 = $('.passo_img_3');

var seta_cima = $('.seta-para-topo');

$(window).scroll(function () {
    if ($(this).scrollTop() >= $('#como-funciona').position().top - 250) { text_area_1.addClass("anima-left");}
    if ($(this).scrollTop() >= $('#como-funciona').position().top - 250) { passo_img_1.addClass("anima-right");}

    if ($(this).scrollTop() >= $('#como-funciona-2').position().top - 250) { text_area_2.addClass("anima-left");}
    if ($(this).scrollTop() >= $('#como-funciona-2').position().top - 250) { passo_img_2.addClass("anima-right");}

    if ($(this).scrollTop() >= $('#como-funciona-3').position().top - 250) { text_area_3.addClass("anima-left");}
    if ($(this).scrollTop() >= $('#como-funciona-3').position().top - 250) { passo_img_3.addClass("anima-right");}

    if ($(this).scrollTop() > 500) { seta_cima.addClass("show");}
  }
);


// MUDA IMAGEM COM O HOVER
$('.ofertante-linha').hover(function(){
    $('#preview').css({'background':'url('+ $(this).attr('target') +')'});
},function(){
    $('#preview').css({'background':''});
});

