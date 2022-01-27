import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.user.nickname}:  ${data.content.text} :  ${data.date}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('cmt-f');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
