import 'package:flutter_test/flutter_test.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'package:poloniex_app/trading/presentation/ui_mapper.dart';

void main() {
  group('TradingUiMapper', () {
    test('mapPriceToArrowType returns correct ArrowType', () {
      // Define initial state
      const initialPrice = 100.0;
      const initialState = TradingState(currentBTCRate: initialPrice);

      // Define update prices
      const lowerPrice = 90.0;
      const higherPrice = 110.0;

      // Test when updatePrice is lower
      final lowerPriceState = TradingRateMapper.mapCurrentRateToRateStatus(lowerPrice, initialState);
      expect(lowerPriceState.rateStatus, RateStatus.high);

      // Test when updatePrice is higher
      final higherPriceState = TradingRateMapper.mapCurrentRateToRateStatus(higherPrice, initialState);
      expect(higherPriceState.rateStatus, RateStatus.low);

      // Test when updatePrice is equal
      final equalPriceState = TradingRateMapper.mapCurrentRateToRateStatus(initialPrice, initialState);
      expect(equalPriceState.rateStatus, RateStatus.high);
    });
  });
}