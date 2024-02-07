import 'dart:convert';

abstract class ConnectionRequest {
  Map<String, dynamic> getRequestParams();
}

class StockConnectionRequest extends ConnectionRequest {

  String jsonString = '''
  {
    "code": "200000",
    "data": {
      "instanceServers": [
        {
          "pingInterval": 50000,
          "endpoint": "wss://futures-apiws.poloniex.com/endpoint",
          "protocol": "websocket",
          "encrypt": true,
          "pingTimeout": 10000
        }
      ],
      "token": "vYNlCtbz4XNJ1QncwWilJnBtmmfe4geLQDUA62kKJsDChc6I4bRDQc73JfIrlFaVYIAE0Gv2--MROnLAgjVsWkcDq_MuG7qV7EktfCEIphiqnlfpQn4Ybg==.IoORVxR2LmKV7_maOR9xOg=="
    }
  }
  ''';

  @override
  Map<String, dynamic> getRequestParams() {
    return jsonDecode(jsonString);
  }

}