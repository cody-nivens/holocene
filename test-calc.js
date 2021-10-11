/*
  JS is used only to set the CSS custom properties used in the base color
  Color changes are calculated in CSS
*/

const root = document.documentElement;
const inputs = [].slice.call(document.querySelectorAll('input'));

inputs.forEach(input => input.addEventListener('change', handleUpdate));
inputs.forEach(input => input.addEventListener('mousemove', handleUpdate));

function handleUpdate(e) {
  if (this.id === 'red') root.style.setProperty('--red', this.value);
  if (this.id === 'green') root.style.setProperty('--green', this.value);
  if (this.id === 'blue') root.style.setProperty('--blue', this.value);
}
