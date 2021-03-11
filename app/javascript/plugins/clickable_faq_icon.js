const questionAnsweredAppears = () => {
  const icons = document.querySelectorAll(".faq-icon");
  if (icons) {
    const questions = document.querySelectorAll(".question");
    const questionsAnswered = document.querySelectorAll(".question-answered");

    icons.forEach((icon, index) => {
      icon.addEventListener("click", () => {
        if (questionsAnswered[index].style.display === "block") {
          questionsAnswered[index].style.display = "none";
          questions[index].style.color = "rgb(122, 122, 122)";
        } else {
          questionsAnswered[index].style.display = "block";
          questions[index].style.color = "black";
        }
      })
    });
  };
};

export { questionAnsweredAppears };