function sale () {
  const Price = document.getElementById("item-price");
  const Tax = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  Price.addEventListener("keyup", (e) => {
    console.log(Profit)
    const PriceValue = Price.value;
    const FeeFloor = Math.floor(PriceValue/10);
    const FeeRound = Math.round(PriceValue/10);
    const SaleProfit = Math.floor(PriceValue-FeeRound);
    Tax.innerHTML = `${FeeFloor}`;
    Profit.innerHTML = `${SaleProfit}`;
  });
};

setInterval(sale,1000);