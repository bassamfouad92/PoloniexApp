import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poloniex_app/trading/domain/providers/trading_provider.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_notifier.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';

final tradingNotifierProvider = StateNotifierProvider<TradingNotifier, TradingState>((ref) {
  final stockMarketSubscriptionUseCase = ref.watch(subscribeToMarketUseCaseProvider);
  final tradingNotifier = TradingNotifier(stockMarketSubscriptionUseCase);
  final socketService = ref.watch(webSocketServiceProvider);
  socketService.stream.listen((message) {
    final messageType = jsonDecode(message);
    if (messageType['type'] == 'welcome') {
       tradingNotifier.connectToCryptoMarket();
    }
  });
  return tradingNotifier;
});


final tradingStateStreamProvider = StreamProvider<TradingState>((ref) {
  final notifier = ref.watch(tradingNotifierProvider.notifier);
  return notifier.stream;
});