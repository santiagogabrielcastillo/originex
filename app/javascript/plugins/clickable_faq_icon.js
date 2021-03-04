const questionAnsweredAppears = () => {
  const icons = document.querySelectorAll(".faq-icon");
  if (icons) {
    const questions = document.querySelectorAll(".question");
    const questionsAnswered = document.querySelectorAll(".question-answered");

    icons.forEach((icon) => {
      icon.addEventListener("click", () => {
        questionsAnswered.forEach((questionAnswered) => {
          questionAnswered.style.display = "block";
        })
        questions.forEach((question) => {
          question.style.color = "black";
        })
        
        icon.addEventListener("click", () => {
          questionsAnswered.forEach((questionAnswered) => {
            questionAnswered.style.display = "none";
          })
          questions.forEach((question) => {
            question.style.color = "rgb(122, 122, 122)";
          })
        });
      })
    });
  };
};

export { questionAnsweredAppears };