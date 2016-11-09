$(document).ready(function(){
  $("#search-bar").on("keyup", function (){
    var currentSearch = this.value.toLowerCase();
    $('.all-links').each(function (_index, link) {
      $link = $(link);
      if ($link.find(".title-text").text().toLowerCase().indexOf(currentSearch) !== -1 ){
        $link.show();
      } else if ($link.find(".url-text").text().toLowerCase().indexOf(currentSearch) !== -1 ){
        $link.show();
      }
      else {
        $link.hide();
      }
    });
  });
});
