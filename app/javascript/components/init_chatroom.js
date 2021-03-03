const cleanInput = () => {
  const userInput = document.getElementById("user-input");

  if (userInput) {
    userInput.addEventListener('keyup', (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        console.log(userInput)
        userInput.value = "";
      };
    });
  };
};

export { cleanInput };