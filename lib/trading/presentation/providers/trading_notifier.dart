import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poloniex_app/trading/data/ticker.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'package:poloniex_app/trading/presentation/ui_mapper.dart';

import '../../../shared/base/base_usecase.dart';
import '../../domain/market_domain.dart';

class TradingNotifier extends StateNotifier<TradingState> {

  final UseCase marketUseCase;
  double _inputPrice = 0.0;
  TradingNotifier(this.marketUseCase) : super(const TradingState.loading());

  void updatePrice(double newPrice) {
    _inputPrice = newPrice;
    state = state.copyWith(priceStatus: TradingUiMapper.mapPriceToArrowType(newPrice, state).priceStatus);
  }

  connectToStockMarket() {
    final levelTopic = {
      "id": 1545910660740,
      "type": "subscribe",
      "topic": "/contractMarket/level2Depth5:BTCUSDTPERP",
      "response": true
    };
    final tickerTopic = {
      "id": 1545910660740,
      "type": "subscribe",
      "topic": "/contractMarket/ticker:BTCUSDTPERP",
      "response": true
    };
      marketUseCase.execute([
        levelTopic,
        tickerTopic
      ]).listen((event) {
        if(event is MarketDomain) {
          state = state.copyWith(stockItems: event.stocks);
        } else if(event is Ticker){
          state = state.copyWith(price: event.price, priceStatus: TradingUiMapper.mapPriceToArrowType(_inputPrice, state).priceStatus);
        }
      }).onError((ex) {
         state = state.copyWith(state: TradingConcreteState.failure);
      });
    }
}