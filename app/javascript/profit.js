function profit (){
  const priceInput = document.getElementById('item-price')
  const resultCommission = document.getElementById('add-tax-price')
  const resultProfit = document.getElementById('profit')

  if (!priceInput || !resultCommission || !resultProfit) {
    return;
  }

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value)
    if (!isNaN(price)){
      const commission = Math.floor(price * 0.1)
      const profit = price - commission
      resultCommission.innerText = commission.toLocaleString()
      resultProfit.innerText = profit.toLocaleString()
    } else {
      resultCommission.innerText = '0'
      resultProfit.innerText = '0'  
    }
  })

}

 window.addEventListener(`turbo:load`, profit )
 window.addEventListener(`keyup`, profit )