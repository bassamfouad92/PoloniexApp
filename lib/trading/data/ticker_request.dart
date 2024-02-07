class TickerRequest {

  final int id;
  final String type;
  final String topic;
  final bool response;

  TickerRequest({
    required this.id,
    required this.type,
    required this.topic,
    required this.response,
  });

  factory TickerRequest.fromJson(Map<String, dynamic> json) {
    return TickerRequest(
      id: json['id'],
      type: json['type'],
      topic: json['topic'],
      response: json['response'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'topic': topic,
      'response': response,
    };
  }
}