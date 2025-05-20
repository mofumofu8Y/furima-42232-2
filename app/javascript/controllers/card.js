const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵

  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById("charge-form");
  if (!form) return; // フォームがないページでは実行しない

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;
        const tokenObj = `<input type="hidden" name="order_form[token]" value="${token}">`;
        form.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number-form").remove();
        document.getElementById("expiry-form").remove();
        document.getElementById("cvc-form").remove();

        form.submit();
      }
    });
  });
};

// turboがページを読み込んだ・再描画したときにpay関数を実行
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);