enum Side { buy, sell }

class BTC {
  double price;
  double size;
  Side side;

  BTC(this.price, this.size, this.side);
}

class MarketDomain {

  List<BTC> items;
  DateTime currentData;

  MarketDomain(this.items, this.currentData);

}
