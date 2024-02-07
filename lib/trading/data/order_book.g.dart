// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBook _$OrderBookFromJson(Map<String, dynamic> json) => OrderBook(
      asks: (json['asks'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      bids: (json['bids'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$OrderBookToJson(OrderBook instance) => <String, dynamic>{
      'asks': instance.asks,
      'bids': instance.bids,
      'timestamp': instance.timestamp,
    };
