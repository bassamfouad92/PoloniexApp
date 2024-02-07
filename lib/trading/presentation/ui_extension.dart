import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state.dart';

extension PriceArrowTypeUi on ArrowType {
  Icon getIcon() => this == ArrowType.green ? const Icon(Icons.arrow_upward, color: Colors.green) : const Icon(Icons.arrow_downward, color: Colors.red);
}