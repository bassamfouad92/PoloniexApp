import 'package:poloniex_app/shared/base/base_response.dart';
import 'package:poloniex_app/trading/data/order_book.dart';
import 'package:poloniex_app/trading/domain/market_domain.dart';

import '../data/ticker.dart';

class ResponseMapper {

  static dynamic mapToDataModel(BaseResponse response) {
    final subject = response.subject as String;
    switch (subject) {
      case 'ticker':
        return Ticker.fromJson(response.data);
      case 'level2':
        return OrderBook.fromJson(response.data);
      default:
        throw Exception('Unknown response subject');
    }
  }
}

class DomainMapper {
  static MarketDomain mapToMarketDomain(OrderBook orderBook) {
    final availableBTCs = orderBook.bids.map((bid) => BTC(bid[0], bid[1], Side.buy)).toList();
    return MarketDomain(availableBTCs, DateTime.fromMillisecondsSinceEpoch(orderBook.timestamp));
  }
}