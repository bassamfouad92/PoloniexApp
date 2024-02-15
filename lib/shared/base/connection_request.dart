import 'dart:convert';

import 'package:poloniex_app/configs/app_configs.dart';
import 'package:poloniex_app/shared/base/protocol_type.dart';

import '../../trading/data/trading_request_models.dart';

abstract class ConnectionRequest {
  Map<String, dynamic> getRequestParams();
}

class CryptoMarketConnectionRequest extends ConnectionRequest {

  final request = MarketConnectionRequest(
    code: "200000",
    data: MarketData(
      instanceServers: [
        InstanceServer(
          pingInterval: 50000,
          endpoint: AppConfigs.socketBaseUrl,
          protocol: ProtocolType.websocket.name,
          encrypt: true,
          pingTimeout: 10000,
        ),
      ],
      token: AppConfigs.connectionToken
    ),
  );

  @override
  Map<String, dynamic> getRequestParams() {
    return request.toJson();
  }

}