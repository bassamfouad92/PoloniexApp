import '../../domain/market_domain.dart';

enum TradingConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

enum RateStatus {
  low,
  high
}

class TradingState {

  final List<BTC> availableBTCs;
  final double currentBTCRate;
  final TradingConcreteState state;
  final RateStatus rateStatus;

  const TradingState({
    this.availableBTCs = const [],
    this.currentBTCRate = 0.0,
    this.state = TradingConcreteState.initial,
    this.rateStatus = RateStatus.high,
  });


  const TradingState.loading({
    this.availableBTCs = const [],
    this.currentBTCRate = 0.0,
    this.state = TradingConcreteState.loading,
    this.rateStatus = RateStatus.high,
  });

  TradingState copyWith({
    List<BTC>? items,
    double? currentBTCRate,
    TradingConcreteState? state,
    String? message,
    bool? isLoading,
    RateStatus? rateStatus,
  }) {
    return TradingState(
      availableBTCs: items ?? availableBTCs,
      currentBTCRate: currentBTCRate ?? this.currentBTCRate,
      state: state ?? this.state,
      rateStatus: rateStatus ?? this.rateStatus
    );
  }
}