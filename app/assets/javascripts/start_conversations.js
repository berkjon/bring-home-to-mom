var ready = function () {
 
    // open up chatbox for date 1
    chatBox.chatWith(1)
 
    // Listen on keypress' in our chat textarea and call the chatInputKey in chat.js for inspection
    $(document).on('keydown', '.chatboxtextarea', function (event) {
        var id = $(this).data('cid');
        chatBox.checkInputKey(event, $(this), id);
    });
 
 
}
 
$(document).ready(ready);
$(document).on("page:load", ready);