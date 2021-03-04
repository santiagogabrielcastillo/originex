import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    minDate: "today"
  });
}

const initFlatpickrBday = () => {
  flatpickr(".datepicker1", {
    altInput: true,
  });
}

export { initFlatpickr };
export { initFlatpickrBday };