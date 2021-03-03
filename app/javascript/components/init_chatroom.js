const cleanInput = () => {
  const userInput = document.getElementById("user-input");
  const messagesDiv = document.getElementById("messages");

  if (userInput) {
    window.onload = () => {
      messagesDiv.scrollTo(0, document.getElementById("messages").scrollHeight + 5);
    };
    userInput.addEventListener('keyup', (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        userInput.value = "";
        messagesDiv.scrollTo(0, document.getElementById("messages").scrollHeight + 5);
      };
    });
  };
};

const cleanInputForExport = () => {
  setTimeout(cleanInput(), 500);
};

export { cleanInputForExport };