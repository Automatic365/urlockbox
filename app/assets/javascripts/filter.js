
$(document).ready(function(){
  $(".filter-read").on("click", function (){
    $(".read_link").hide();
    $(".unread_link").show();
  });
  $(".filter-unread").on("click", function (){
    $(".unread_link").hide();
    $(".read_link").show();
  });

  $(".all").on("click", function (){
    $(".unread_link").show();
    $(".read_link").show();
  });
});
