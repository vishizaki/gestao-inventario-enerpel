const buttons = document.querySelectorAll('.modal-form');

buttons.forEach(element => {
  element.addEventListener('submit', (event) => {
    // event.preventDefault();
    console.log(event.target.childNodes[6])
    let quantity = event.target.childNodes[4].value;
    let product_name = event.target.childNodes[6].value.split('Registrar venda ')[1]
    confirm(`Tem certeza que deseja registrar a venda de ${quantity}: ${product_name}?`)
  });
  
});

