abstract class TradingRepository {
  Stream getMarketUpdates(List<String> channels);
}