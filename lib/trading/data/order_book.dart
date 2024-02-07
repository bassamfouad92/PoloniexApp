import 'package:json_annotation/json_annotation.dart';
part 'order_book.g.dart';

@JsonSerializable()
class OrderBook {

  List<List<double>> asks;
  List<List<double>> bids;
  int timestamp;

  OrderBook({required this.asks, required this.bids, required this.timestamp});

  factory OrderBook.fromJson(Map<String, dynamic> json) =>
      _$OrderBookFromJson(json);
  Map<String, dynamic> toJson() => _$OrderBookToJson(this);
}