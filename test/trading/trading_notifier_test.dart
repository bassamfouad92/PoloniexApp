import 'package:flutter_test/flutter_test.dart';
import 'package:poloniex_app/trading/domain/subscribe_to_stock_usecase.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_notifier.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'repository/trading_fake_repository.dart';

void main() {
  group('TradingNotifier', () {
    late TradingNotifier notifier;

    setUp(() {
      notifier = TradingNotifier(SubscribeToStockMarketUseCase(FakeTradingRepository()));
    });

    test('updatePrice_updatesStateCorrectly', () {
      const newPrice = 90.0;
      const initialState = TradingState(stockPrice: 100.0);
      notifier.state = initialState;
      notifier.updatePrice(newPrice);
      expect(notifier.state.priceStatus, ArrowType.green);
    });
  });
}
