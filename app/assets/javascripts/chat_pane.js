ChatPane = {
  scrollDown: function() {
    var scrollTo = $('#chat-pane')[0].scrollHeight
    $('#chat-pane').animate({scrollTop: scrollTo}, "fast")
  },
}
