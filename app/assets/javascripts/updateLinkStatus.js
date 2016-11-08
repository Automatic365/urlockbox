$(document).ready(function(){
  $('.every-link').on('click', '.mark-read', function(){
      var linkId = $(this).parents('tr').data('id');
      var linkParams = {link: {id: linkId,
        read: true}};
      var linkRow = $(this).parents('tr');
        $.ajax({
          type: 'PATCH',
          url: '/api/v1/links/' + linkId,
          data: linkParams,
          success: function(){
            linkRow.find('.read-text').html('true');
            linkRow.find('.mark-read').addClass("mark-unread");
            linkRow.find('.mark-read').removeClass("mark-read");
            linkRow.find('.mark-unread').attr('value', 'Mark as Unread');
            linkRow.children('.url-text').attr('id', 'read-links');

          }
        });
      });

  $('.every-link').on('click', '.mark-unread', function(){
    var linkId = $(this).parents('tr').data('id');
    var linkParams = {link: {id: linkId,
      read: false}};
    var linkRow = $(this).parents('tr');
    $.ajax({
      type: 'PATCH',
      url: '/api/v1/links/' + linkId,
      data: linkParams,
      success: function(){
        linkRow.find('.read-text').html('false');
        linkRow.find('.mark-unread').addClass('mark-read');
        linkRow.find('.mark-unread').removeClass('mark-unread');
        linkRow.find('.mark-read').attr('value', 'Mark as Read');
        linkRow.find('.url-text').attr('id', 'unread-links');

      }
    });
  });

  $('.every-link').on('blur', '.title-text' ,function(){
    var linkId = $(this).parents('tr').data('id');
    var linkParams = { link: {
                        id: linkId,
                        title: $(this).text()
                      }};
    $.ajax({
      type: 'PATCH',
      url: '/api/v1/links/' + linkId,
      data: linkParams
    });
  });
});
