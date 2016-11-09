$(document).ready(function(){
  $(".filter-read").on("click", function (){
    $(".read-link").hide();
    $(".unread-link").show();
  });

  $(".filter-unread").on("click", function (){
    $(".unread-link").hide();
    $(".read-link").show();
  });

  $(".all").on("click", function (){
    $(".unread-link").show();
    $(".read-link").show();
  });
});
