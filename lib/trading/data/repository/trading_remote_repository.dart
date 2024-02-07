import 'dart:convert';

import 'package:poloniex_app/shared/base/base_response.dart';

import '../../../shared/network/socket/web_socket_service.dart';
import '../../domain/trading_repository.dart';

class TradingRemoteRepository implements TradingRepository {

  final WebSocketService webSocketService;

  TradingRemoteRepository(this.webSocketService);

  @override
  Stream<BaseResponse> getMarketUpdates(List<String> channels) async* {
    channels.forEach((channel) {
      webSocketService.sendMessage(channel);
    });
    final result = webSocketService.stream.map((value) => BaseResponse.fromJson(jsonDecode(value)));
    yield* result;
  }
}