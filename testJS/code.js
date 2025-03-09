// pour crér un element html
function createParagraph() {
  const para = document.createElement('p');
  para.textContent = 'Bienvenue dans un monde merveilleux';
  document.body.appendChild(para);
}
// recup de tous les boutons
const buttons = document.querySelectorAll('button');
const b2 = document.querySelector("#B2");
const b3 = document.querySelector("#B3");
const txt = document.querySelector("id_valeur");
// boucle
for (const button of buttons) {
  button.addEventListener('click', createParagraph);
  b2.addEventListener('mouseup', forMuler);
}
b3.addEventListener('click', forMuler);

function forMuler() {
  alert($txt);
}
