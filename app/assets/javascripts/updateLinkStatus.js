$(document).ready(function() {
  $(".all-links").on('click', '.read-link', function(){
    var linkId = $(this).parents('tr').data('id');
    var linkParams = {link: {id: linkId,
      read: true}};
      var linkRow = $(this).parents('tr');
      $.ajax({
        type: 'PATCH',
        url: '/api/v1/links/' + linkId,
        data: linkParams,
        success: function(){
          linkRow.find(".read-link").hide();
          linkRow.find(".url").addClass('strikethrough');
        }
      });
    }
  );

  $(".all-links").on('click', '.unread-link', function(){
    var linkId = $(this).parents('tr').data('id');
    var linkParams = {link: {id: linkId,
      read: false}};
      var linkRow = $(this).parents('tr');
      $.ajax({
        type: 'PATCH',
        url: '/api/v1/links/' + linkId,
        data: linkParams,
        success: function(){
          linkRow.find(".unread-link").hide();
          linkRow.addClass('blue');
        }
      });
    }
  );

});
