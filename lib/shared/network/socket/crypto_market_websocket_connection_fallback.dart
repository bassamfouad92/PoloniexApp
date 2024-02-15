import 'package:poloniex_app/configs/app_configs.dart';
import 'package:poloniex_app/shared/network/http/network_service.dart';
import 'package:poloniex_app/shared/network/socket/web_socket_service.dart';
import 'package:poloniex_app/shared/utils/shared_preference.dart';

import '../../base/connection_request.dart';

class CryptoMarketWebSocketConnectionFallBack implements WebSocketService {

  final WebSocketService webSocketService;
  final NetworkService networkService;
  final ConnectionRequest connectionRequest;

  static const _TOKEN_KEY = 'token';

  CryptoMarketWebSocketConnectionFallBack(this.webSocketService, this.networkService, this.connectionRequest);

  @override
  void close() {
    webSocketService.close();
  }

  @override
  Future<void> connect({String url = ''}) async {
    if(!webSocketService.isConnected()) {
      await _getTokenFromServer();
    }
    webSocketService.connect(url: '${AppConfigs.socketBaseUrl}?token=${getTokenFromMemory()}&acceptUserMessage=true');
  }

  _getTokenFromServer() async {
    final result = await networkService.post(
        '/bullet-public', data: connectionRequest.getRequestParams());
    await _saveTokenToMemory(result.data['data']['token']);
  }

  @override
  bool isConnected() => webSocketService.isConnected();

  @override
  void sendMessage(message) => webSocketService.sendMessage(message);

  @override
  Stream get stream => webSocketService.stream;

  Future<void> _saveTokenToMemory(String token) async {
    await PreferenceUtils.setString(_TOKEN_KEY, token);
  }

  String getTokenFromMemory() => PreferenceUtils.getString(_TOKEN_KEY);

}