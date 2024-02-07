import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poloniex_app/shared/widgets/text_field_widget.dart';
import 'package:poloniex_app/trading/domain/market_domain.dart';
import 'package:poloniex_app/trading/domain/providers/trading_provider.dart';
import 'package:poloniex_app/trading/presentation/providers/trading_state_provider.dart';
import 'package:poloniex_app/trading/presentation/ui_extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TradeHighlightScreen extends ConsumerStatefulWidget {
  const TradeHighlightScreen({super.key});

  @override
  ConsumerState<TradeHighlightScreen> createState() =>
      _TradeHighlightScreenState();
}

class _TradeHighlightScreenState extends ConsumerState<TradeHighlightScreen> {

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final tradingState = ref.watch(tradingStateStreamProvider);

    gap(double gap) => SizedBox(height: gap);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trading Highlights',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: RefreshIndicator(onRefresh: () {
           return Future.delayed(const Duration(seconds: 1), () {
              ref.read(webSocketServiceProvider).connect();
           });
        }, child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: tradingState.when(
                  data: (state) => Column(
                        children: [
                          const Text('Enter price to observe stack market',
                              style: TextStyle(color: Colors.purpleAccent)),
                          gap(10),
                          /// price field
                          Row(
                            children: [
                              Expanded(
                                  child: textFieldWidget(
                                      context, 'Price', textEditingController,
                                      inputType: TextInputType.number,
                                      onChangeText: (price) {
                                final double newPrice = double.tryParse(price) ?? 0.0; // Convert text to double
                                ref.read(tradingNotifierProvider.notifier).updatePrice(newPrice);
                              })),
                              const SizedBox(width: 10),
                              state.priceStatus.getIcon()
                            ],
                          ),
                          gap(10),
                          ///stock chart
                          SizedBox(
                              height: 400,
                              child: SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(),
                                  // Chart title
                                  title: const ChartTitle(
                                      text: 'Stock Market Buying Today'),
                                  // Enable legend
                                  legend: const Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  series: <CartesianSeries<Stock, double>>[
                                    LineSeries<Stock, double>(
                                        color: Colors.red,
                                        dataSource: state.stockItems,
                                        xValueMapper: (Stock stock, _) =>
                                            stock.size,
                                        yValueMapper: (Stock stock, _) =>
                                            stock.price,
                                        name: 'Buy',
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true))
                                  ])),
                        ],
                      ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (Object error, StackTrace stackTrace) => const Center(
                        child: Text(
                          'Unable to show stock data please pull to refresh ⬆️ to connect for live updates',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ))),
        )),
        bottomNavigationBar:
         Container(
          height: 40,
          padding: const EdgeInsets.only(bottom: 20),
          child: const Center(child: Text('Made with ❤️ by Bassam Fouad')),
        )
    );
  }
}
