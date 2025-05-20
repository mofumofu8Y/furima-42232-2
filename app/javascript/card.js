document.addEventListener("DOMContentLoaded", () => {
  console.log("JavaScript loaded!");

  const numberDiv = document.getElementById("number-form");
  if (!numberDiv) {
    console.warn("⚠️ #number-form がDOMに存在していません（まだ読み込まれていない可能性）");
    return;
  }
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;
        const tokenObj = `<input value=${token} name="order_form[token]" type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();

        form.submit();
      }
    });
  });
});