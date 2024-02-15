import 'package:flutter/material.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';

extension PriceArrowTypeUi on RateStatus {
  Icon getIcon() => this == RateStatus.high ? const Icon(Icons.arrow_upward, color: Colors.green) : const Icon(Icons.arrow_downward, color: Colors.red);
}