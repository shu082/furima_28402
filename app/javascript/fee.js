function check (e) {
  if (document.URL.match(/new/)) {
    const itemPrice = document.getElementById('item-price').value
    const tax = `${itemPrice * 0.1}`
    const addTaxPrice = document.getElementById('add-tax-price')
    addTaxPrice.textContent = tax
    const proceeds = `${itemPrice * 0.9}`
    const profitPrice = document.getElementById('profit')
    profitPrice.textContent = proceeds

    e.preventDefault();
  }
}

window.addEventListener('input', check)