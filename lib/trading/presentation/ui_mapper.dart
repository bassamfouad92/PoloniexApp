import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';

class TradingRateMapper {
  static TradingState mapCurrentRateToRateStatus(double updatePrice, TradingState state) {
    if (state.currentBTCRate > updatePrice) {
      return state.copyWith(rateStatus: RateStatus.high, state: TradingConcreteState.loaded);
    } else if (state.currentBTCRate < updatePrice) {
      return state.copyWith(rateStatus: RateStatus.low, state: TradingConcreteState.loaded);
    } else {
      return state.copyWith(rateStatus: RateStatus.high, state: TradingConcreteState.loaded);
    }
  }
}