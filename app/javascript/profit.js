function profit (){
  const priceInput = document.getElementById('item-price')
  const resultCommission = document.getElementById('add-tax-price')
  const resultProfit = document.getElementById('profit')

  if (!priceInput || !resultCommission || !resultProfit) {
    return;
  }

  addEventListener('input', () => {
    const price = parseInt(priceInput.value)
    if (!isNaN(price)){
      const commission = Math.floor(price * 0.1)
      const profit = price - commission
      resultCommission.innerText = commission.toLocaleString()
      resultProfit.innerText = profit.toLocaleString()
    } else {
      resultCommission.innerText = ''
      resultProfit.innerText = ''  
    }
  })

}

window.addEventListener(`turbo:load`, profit )