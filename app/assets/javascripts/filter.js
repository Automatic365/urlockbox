$( document ).ready(function() {
  $(".read").on("click", function (){
    $('td').each(function(){
      var read = $(this).val();
      if (read === 'false') {
        $(this).hide();
      }
    });
  });
});
