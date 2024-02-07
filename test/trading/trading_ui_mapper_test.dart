import 'package:flutter_test/flutter_test.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'package:poloniex_app/trading/presentation/ui_mapper.dart';

void main() {
  group('TradingUiMapper', () {
    test('mapPriceToArrowType returns correct ArrowType', () {
      // Define initial state
      const initialPrice = 100.0;
      const initialState = TradingState(stockPrice: initialPrice);

      // Define update prices
      const lowerPrice = 90.0;
      const higherPrice = 110.0;

      // Test when updatePrice is lower
      final lowerPriceState = TradingUiMapper.mapPriceToArrowType(lowerPrice, initialState);
      expect(lowerPriceState.priceStatus, ArrowType.green);

      // Test when updatePrice is higher
      final higherPriceState = TradingUiMapper.mapPriceToArrowType(higherPrice, initialState);
      expect(higherPriceState.priceStatus, ArrowType.red);

      // Test when updatePrice is equal
      final equalPriceState = TradingUiMapper.mapPriceToArrowType(initialPrice, initialState);
      expect(equalPriceState.priceStatus, ArrowType.green);
    });
  });
}