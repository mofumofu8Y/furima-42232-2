// Turbo（Turbo Drive）がページ読み込み完了時に発火するイベント
document.addEventListener("turbo:load", () => {
  // 「販売価格」入力欄を取得
  const priceInput = document.getElementById("item-price");       // 手順2: 販売価格を入力するフィールド
  const taxOutput = document.getElementById("add-tax-price");     // 手順2: 手数料（10%）を表示する場所
  const profitOutput = document.getElementById("profit");         // 手順2: 利益（価格 - 手数料）を表示する場所

  console.log("イベント発火");  // デバッグ用：イベントが発火しているか確認するためのログ

  // priceInputが取得できなかった場合（＝存在しないページなど）、処理を中断
  if (!priceInput) return;

  // 価格入力欄に入力があったときにイベントが発火
  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value, 10);  // 入力された文字列を整数に変換（10進数）

    // 入力値が数値で、かつ300〜9,999,999の範囲内であれば手数料と利益を計算
    if (!isNaN(price) && price >= 300 && price <= 9999999) {
      const fee = Math.floor(price * 0.1); // 手数料を10%として計算（小数点切り捨て）
      const profit = price - fee;          // 利益 = 価格 - 手数料

      // 計算結果を画面に反映
      taxOutput.textContent = fee;
      profitOutput.textContent = profit;
    } else {
      // 入力が不正な場合は、手数料・利益欄を「---」にしてリセット
      taxOutput.textContent = "---";
      profitOutput.textContent = "---";
    }
  });
});