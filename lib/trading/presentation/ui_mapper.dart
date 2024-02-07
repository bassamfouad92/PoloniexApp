import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';

class TradingUiMapper {
  static TradingState mapPriceToArrowType(double updatePrice, TradingState state) {
    if (state.stockPrice > updatePrice) {
      return state.copyWith(priceStatus: ArrowType.green, state: TradingConcreteState.loaded);
    } else if (state.stockPrice < updatePrice) {
      return state.copyWith(priceStatus: ArrowType.red, state: TradingConcreteState.loaded);
    } else {
      return state.copyWith(priceStatus: ArrowType.green, state: TradingConcreteState.loaded);
    }
  }
}