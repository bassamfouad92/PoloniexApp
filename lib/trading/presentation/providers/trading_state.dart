import '../../domain/market_domain.dart';

enum TradingConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

enum ArrowType {
  red,
  green
}

class TradingState {

  final List<Stock> stockItems;
  final double stockPrice;
  final TradingConcreteState state;
  final ArrowType priceStatus;

  const TradingState({
    this.stockItems = const [],
    this.stockPrice = 0.0,
    this.state = TradingConcreteState.initial,
    this.priceStatus = ArrowType.green,
  });


  const TradingState.loading({
    this.stockItems = const [],
    this.stockPrice = 0.0,
    this.state = TradingConcreteState.loading,
    this.priceStatus = ArrowType.green,
  });

  TradingState copyWith({
    List<Stock>? stockItems,
    double? price,
    TradingConcreteState? state,
    String? message,
    bool? isLoading,
    ArrowType? priceStatus,
  }) {
    return TradingState(
      stockItems: stockItems ?? this.stockItems,
      stockPrice: price ?? stockPrice,
      state: state ?? this.state,
      priceStatus: priceStatus ?? this.priceStatus
    );
  }
}