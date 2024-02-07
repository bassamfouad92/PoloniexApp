import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:poloniex_app/shared/base/base_response.dart';
import 'package:poloniex_app/trading/domain/trading_repository.dart';

class FakeTradingRepository implements TradingRepository {

  String fixturePath;

  FakeTradingRepository({this.fixturePath = 'fixtures/ticker_response.json'});

  @override
  Stream<BaseResponse> getMarketUpdates(List<String> channels) async* {
    // Load JSON data from file
    final jsonString = await File(fixturePath).readAsString();
    final jsonData = jsonDecode(jsonString);

    // Convert JSON data to BaseResponse objects
    for (final item in jsonData) {
      yield BaseResponse.fromJson(item);
    }
  }
}