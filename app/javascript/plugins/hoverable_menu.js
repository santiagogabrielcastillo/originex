const dropdownMenuAppears = () => {
  const avatar = document.getElementById("navbarDropdown");
  if (avatar) {
    const dropdown_menu = document.querySelector(".dropdown-menu");
    const dropdown_section = document.getElementById("dropdown-section");

    avatar.addEventListener("mouseover", (event) => {
      dropdown_menu.style.display = "block";
    });

    dropdown_section.addEventListener("mouseleave", (event) => {
      dropdown_menu.style.display = "none";
    });
  };
}

export { dropdownMenuAppears };