const sendMessage = () => {
  const messageContent = document.getElementById('message_content');
  const submitBtn = document.getElementById('send-message');
  if (messageContent && submitBtn) {
    messageContent.addEventListener('keydown', (event) => {
      if ((event.metaKey || event.ctrlKey) && event.keyCode == 13) {
        submitBtn.click();
      }
    })
  }
}

export { sendMessage };
