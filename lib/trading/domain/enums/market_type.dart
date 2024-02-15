enum BTCTopicType {
  level2Depth5,
  ticker,
}

extension BTCTopicLink on BTCTopicType {
  String link(String btc) {
    switch (this) {
      case BTCTopicType.level2Depth5:
        return '/contractMarket/$name:$btc';
      default:
        return '/contractMarket/$name:$btc';
    }
  }
}