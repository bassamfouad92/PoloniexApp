import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poloniex_app/shared/base/base_usecase.dart';
import 'package:poloniex_app/shared/base/connection_request.dart';
import 'package:poloniex_app/shared/network/http/dio_network_service.dart';
import 'package:poloniex_app/shared/network/http/network_service.dart';
import 'package:poloniex_app/shared/network/socket/stock_websocket_connection_fallback.dart';
import 'package:poloniex_app/shared/network/socket/web_socket_service.dart';
import 'package:poloniex_app/trading/data/repository/trading_remote_repository.dart';
import 'package:poloniex_app/trading/domain/subscribe_to_stock_usecase.dart';
import 'package:poloniex_app/trading/domain/trading_repository.dart';


final networkServiceProvider = Provider<NetworkService>((ref) {
  return DioNetworkService();
});

final webSocketServiceProvider = Provider<WebSocketService>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final webSocketService = StockWebSocketConnectionFallBack(WebSocketServiceImpl(), networkService, StockConnectionRequest());
        webSocketService.connect('');
  return webSocketService;
});

final tradingRepositoryProvider = Provider<TradingRepository>((ref) {
  final socketService = ref.watch(webSocketServiceProvider);
  final repository = TradingRemoteRepository(socketService);
  return repository;
});

final subscribeToMarketUseCaseProvider = Provider<UseCase>((ref) {
   final tradingRepository = ref.watch(tradingRepositoryProvider);
   return SubscribeToStockMarketUseCase(tradingRepository);
});