import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    enableTime: true,
    dateFormat: "d-m-Y H:i",
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