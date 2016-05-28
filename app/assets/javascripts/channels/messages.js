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

App.emotes = App.cable.subscriptions.create('EmotesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data));
    ChatPane.scrollDown();
  },
  renderMessage: function(data) {
    return "<p> <i>" + data.user + " " + data.message + "</i></p>";
  }
});

App.list = App.cable.subscriptions.create('ListChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data.channels));
    ChatPane.scrollDown();
  },
  renderMessage: function(channels) {
    message = "<p>Available channels: "
    channels.forEach(function(channel) {
      message += " <a href='"+channel[1]+"'>"+channel[0]+"</a>, ";
    });
    message += "</p>";

    return message
  }
});
