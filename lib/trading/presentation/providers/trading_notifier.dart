import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poloniex_app/trading/data/ticker.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'package:poloniex_app/trading/presentation/ui_mapper.dart';

import '../../../shared/base/base_usecase.dart';
import '../../domain/enums/market_type.dart';
import '../../domain/market_domain.dart';

class TradingNotifier extends StateNotifier<TradingState> {

  final UseCase marketUseCase;
  double _inputPrice = 0.0;
  TradingNotifier(this.marketUseCase) : super(const TradingState.loading());

  void updatePrice(double newPrice) {
    _inputPrice = newPrice;
    state = state.copyWith(rateStatus: TradingRateMapper.mapCurrentRateToRateStatus(newPrice, state).rateStatus);
  }

  connectToCryptoMarket() {
    final levelTopic = createSubscriptionTopic(BTCTopicType.level2Depth5);
    final tickerTopic = createSubscriptionTopic(BTCTopicType.ticker);
      marketUseCase.execute([
        levelTopic,
        tickerTopic
      ]).listen((event) {
        if(event is MarketDomain) {
          state = state.copyWith(items: event.items);
        } else if(event is Ticker){
          state = state.copyWith(currentBTCRate: event.price, rateStatus: TradingRateMapper.mapCurrentRateToRateStatus(_inputPrice, state).rateStatus);
        }
      }).onError((ex) {
         state = state.copyWith(state: TradingConcreteState.failure);
      });
    }

  Map<String, dynamic> createSubscriptionTopic(BTCTopicType type) {
    return {
      "id": 1545910660740,
      "type": "subscribe",
      "topic": type.link('BTCUSDTPERP'),
      "response": true,
    };
  }
}