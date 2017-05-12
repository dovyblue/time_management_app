function addToList(input) {
  // if (input.classList.value === "icon default-bg circle") {
  //   input.classList.value = "icon small default-bg circle";
  // } else if (input.classList.value === "icon small default-bg circle") {
  //   input.classList.value = "icon default-bg circle";
  // } else if (input.classList.value === "icon dark-bg circle") {
  //   input.classList.value = "icon small dark-bg circle";
  // } else {
  //   input.classList.value = "icon dark-bg circle";
  // }
  if (input.style['color'] === 'red') {
    input.style['color'] = 'white' ;
  } else {
    input.style['color'] = 'red';
    console.log(input);
  }
}