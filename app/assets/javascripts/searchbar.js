$(document).ready(function(){
  $("#search-bar").on("keyup", function (){

    var currentSearch = this.value.toLowerCase();
    $('.link').each(function (_index, link) {
      $link = $(link);
      if ( $link.children(".title-text").text().toLowerCase().indexOf(currentSearch) !== -1 ) {
        $link.show();
      } else if ( $link.children(".url-text").text().toLowerCase().indexOf(currentSearch) !== -1 ){
        $link.show();
      }
      else {
        $link.hide();
      }
    });
  });

});
