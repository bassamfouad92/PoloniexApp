enum Side { buy, sell }

class Stock {
  double price;
  double size;
  Side side;

  Stock(this.price, this.size, this.side);
}

class MarketDomain {

  List<Stock> stocks;
  DateTime currentData;

  MarketDomain(this.stocks, this.currentData);

}
