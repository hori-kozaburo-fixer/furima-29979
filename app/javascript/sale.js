function sale () {
  const Price = document.getElementById("item-price");
  const Tax = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  Price.addEventListener("keyup", (e) => {
    console.log(Profit)
    const PriceValue = Price.value;
    const Fee = Math.floor(PriceValue/10);
    const SaleProfit = Math.floor(PriceValue*9/10);
    Tax.innerHTML = `${Fee}`;
    Profit.innerHTML = `${SaleProfit}`;
  });
};

setInterval(sale,1000);