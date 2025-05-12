document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");       // 手順2
  const taxOutput = document.getElementById("add-tax-price");     // 手順2
  const profitOutput = document.getElementById("profit");         // 手順2
  console.log("イベント発火");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value, 10);  // ←★ ここ！
  
    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1);
      const profit = price - fee;
      taxOutput.textContent = fee;
      profitOutput.textContent = profit;
    } else {
      taxOutput.textContent = "---";
      profitOutput.textContent = "---";
    }
  });
});