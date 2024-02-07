import 'package:json_annotation/json_annotation.dart';
part 'ticker.g.dart';

@JsonSerializable()
class Ticker {
  double price;

  Ticker(this.price);

  factory Ticker.fromJson(Map<String, dynamic> json) =>
      _$TickerFromJson(json);
  Map<String, dynamic> toJson() => _$TickerToJson(this);
}