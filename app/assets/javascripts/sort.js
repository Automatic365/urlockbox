$(document).ready(function(){
  $("#sort-alphabetically").on('click', function(){
    var alphabetized = alphabetize($('.all-links'));
    $(".every-link").html(alphabetized);
    $(".every-link").prepend("tr class='table-row><th><u>Title</u></th><th><u>Link</u></th><th><u>Read?</u></th></tr>");
  });
});

function alphabetize(links){
  return links.sort(function (a, b){
    return $(a).find(".title-text").text() > $(b).find(".title-text").text();
  });
}
