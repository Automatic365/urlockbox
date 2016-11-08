$(document).ready(function(){
  $("body").on('click', '#sort-alphabetically', function(){
    var alphabetized = alphabetize($('.every-link'));
    $(".all-links").html(alphabetized);
    $(".all-links").prepend("tr class='table-row><th><u>Title</u></th><th><u>Link</u></th><th><u>Read?</u></th></tr>");
  });
});

function alphabetize(links) {
  return links.sort(function (a, b) {
    return $(a).find(".title-text").text() > $(b).find(".title-text").text();
  });
}
