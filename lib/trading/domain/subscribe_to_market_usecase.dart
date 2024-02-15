import 'dart:convert';
import 'package:poloniex_app/shared/base/base_usecase.dart';
import 'package:poloniex_app/trading/data/order_book.dart';
import 'package:poloniex_app/trading/data/ticker.dart';
import 'package:poloniex_app/trading/domain/data_model_mapper.dart';
import 'package:poloniex_app/trading/domain/trading_repository.dart';

import '../../shared/base/base_response.dart';

class SubscribeToMarketUseCase extends UseCase<dynamic, List<Map<String, dynamic>>> {

  final TradingRepository tradingRepository;

  SubscribeToMarketUseCase(this.tradingRepository);

  @override
  Stream<dynamic> execute(List<Map<String, dynamic>> params) async* {
    try {
      final List<String> channels = [];
      channels.addAll(params.map((e) => jsonEncode(e)));
      final result =  tradingRepository.getMarketUpdates(channels);
      final domainModel = result.asyncMap((event) async* {
        if (event is BaseResponse && event.subject == null) {
          throw Exception('Invalid ack type');
        }
        final dataModel = ResponseMapper.mapToDataModel(event);
        if(dataModel is Ticker) {
          yield dataModel;
        } else if (dataModel is Stream<OrderBook>) {
          yield* dataModel.map(DomainMapper.mapToMarketDomain);
        } else {
          yield DomainMapper.mapToMarketDomain(dataModel);
        }
      });
      yield* domainModel.asyncExpand((event) => event);
    } catch (ex) {
      rethrow;
    }
  }

}