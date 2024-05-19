function commission() {
  const price_1 = document.getElementById('gear-price-1');
  const price_2 = document.getElementById('gear-price-2');
  const price_3 = document.getElementById('gear-price-3');
  if (price_1) {
    price_1.addEventListener('input', () => {
      if (!isNaN(price_1.value)) {
        let priceValue_1 = parseFloat(price_1.value);
        let taxValue_1 = Math.floor(priceValue_1 * 0.1);
        let profitValue_1 = priceValue_1 - taxValue_1;
        document.getElementById('add-tax-price-1').innerHTML = taxValue_1;
        document.getElementById('profit-1').innerHTML = profitValue_1;
      }
    });
  }
  if (price_2) {
    price_2.addEventListener('input', () => {
      if (!isNaN(price_2.value)) {
        let priceValue_2 = parseFloat(price_2.value);
        let taxValue_2 = Math.floor(priceValue_2 * 0.1);
        let profitValue_2 = priceValue_2 - taxValue_2;
        document.getElementById('add-tax-price-2').innerHTML = taxValue_2;
        document.getElementById('profit-2').innerHTML = profitValue_2;
      }
    });
  }
  if (price_3) {
    price_3.addEventListener('input', () => {
      if (!isNaN(price_3.value)) {
        let priceValue_3 = parseFloat(price_3.value);
        let taxValue_3 = Math.floor(priceValue_3 * 0.1);
        let profitValue_3 = priceValue_3 - taxValue_3;
        document.getElementById('add-tax-price-3').innerHTML = taxValue_3;
        document.getElementById('profit-3').innerHTML = profitValue_3;
      }
    });
  }
}

window.addEventListener("turbo:load", commission);
window.addEventListener("turbo:render", commission);
