const price = () => {
  const priceInput = document.getElementById("item-price");
  const taxOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const priceValue = parseInt(priceInput.value, 10);
    if (!isNaN(priceValue) && priceValue >= 300 && priceValue <= 9999999) {
      const fee = Math.floor(priceValue * 0.1);
      const profit = priceValue - fee;
      taxOutput.textContent = fee;
      profitOutput.textContent = profit;
    } else {
      taxOutput.textContent = "---";
      profitOutput.textContent = "---";
    }
  });
};

// turbo:load と turbo:render 両方に対応させる
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);