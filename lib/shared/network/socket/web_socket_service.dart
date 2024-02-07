import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class WebSocketService {
  Stream<dynamic> get stream;
  Future<void> connect({String url = ''});
  void sendMessage(dynamic message);
  bool isConnected();
  void close();
}

class WebSocketServiceImpl implements WebSocketService {

  late StreamController<dynamic> _controller;
  late Stream<dynamic> _stream;
  late WebSocketChannel _channel;
  bool _connected = false;

  WebSocketServiceImpl() {
    _controller = StreamController<dynamic>.broadcast();
    _stream = _controller.stream;
  }

  @override
  Stream<dynamic> get stream => _stream;

  @override
  Future<void> connect({String url = ''}) async {

    _channel = IOWebSocketChannel.connect(url);
    _channel.stream.listen((message) {
      _controller.add(message);
      _connected = true;
    }, onError: (error) {
      _controller.addError(error);
    }, onDone: () {
      _connected = false;
    });
  }

  @override
  void close() {
    _channel.sink.close();
    _connected = false;
  }

  @override
  void sendMessage(message) {
    _channel.sink.add(message);
  }

  @override
  bool isConnected() {
    return _connected;
  }

}
