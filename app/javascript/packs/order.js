// Orders
document.addEventListener('DOMContentLoaded', () => {
  const NUMBER_REGEXP = /^[0-9\b]+$/;

  const getDaysInMonth = () => {
    let current_date = new Date(),
        year = current_date.getFullYear(),
        month = current_date.getMonth();

    return new Date(year, month + 1, 0).getDate();
  }

  const generate_value = (months) => {
    let brand_price = document.getElementById('brand_price').value,
        brand_gram_amount = document.getElementById('brand_gram_amount').value;

    return (getDaysInMonth() * parseInt(months)) * parseInt(brand_price) * parseInt(brand_gram_amount)
  };

  let months = document.getElementById('order_months');

  months.addEventListener('keyup', () => {
    let price = document.getElementById('order_price');

    if(NUMBER_REGEXP.test(months.value) && months.value != 0)
      price.value = generate_value(months.value)
    else
      price.value = generate_value(1);
  });
});
