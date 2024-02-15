import 'package:flutter_test/flutter_test.dart';
import 'package:poloniex_app/trading/domain/subscribe_to_market_usecase.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_notifier.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';
import 'repository/trading_fake_repository.dart';

void main() {
  group('TradingNotifier', () {
    late TradingNotifier notifier;

    setUp(() {
      notifier = TradingNotifier(SubscribeToMarketUseCase(FakeTradingRepository()));
    });

    test('updatePrice_updatesStateCorrectly', () {
      const newPrice = 90.0;
      const initialState = TradingState(currentBTCRate: 100.0);
      notifier.state = initialState;
      notifier.updatePrice(newPrice);
      expect(notifier.state.rateStatus, RateStatus.high);
    });
  });
}
