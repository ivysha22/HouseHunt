   // remove the message after 5 seconds
   setTimeout(function() {
    const messageDiv = document.getElementById('success-message');
    if (messageDiv) {
        messageDiv.style.display = 'none';
    }
}, 5000); // 5000 milliseconds = 5 seconds