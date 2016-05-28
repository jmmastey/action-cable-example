App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data));
    ChatPane.scrollDown();
  },
  renderMessage: function(data) {
    return "<p><b>" + data.user + ":</b> " + data.message + "</p>";
  }
});

App.messages = App.cable.subscriptions.create('EmotesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data));
    ChatPane.scrollDown();
  },
  renderMessage: function(data) {
    return "<p> <i>" + data.user + " " + data.message + "</i></p>";
  }
});
