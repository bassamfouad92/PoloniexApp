class MarketConnectionRequest {
  final String code;
  final MarketData data;

  MarketConnectionRequest({
    required this.code,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "data": data.toJson(),
    };
  }
}

class MarketData {
  final List<InstanceServer> instanceServers;
  final String token;

  MarketData({
    required this.instanceServers,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      "instanceServers": instanceServers.map((server) => server.toJson()).toList(),
      "token": token,
    };
  }
}

class InstanceServer {
  final int pingInterval;
  final String endpoint;
  final String protocol;
  final bool encrypt;
  final int pingTimeout;

  InstanceServer({
    required this.pingInterval,
    required this.endpoint,
    required this.protocol,
    required this.encrypt,
    required this.pingTimeout,
  });

  Map<String, dynamic> toJson() {
    return {
      "pingInterval": pingInterval,
      "endpoint": endpoint,
      "protocol": protocol,
      "encrypt": encrypt,
      "pingTimeout": pingTimeout,
    };
  }
}