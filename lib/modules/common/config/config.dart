abstract class BaseConfig {
  final String? appId;
  final String donuzToken;
  BaseConfig(this.appId, this.donuzToken);
  final String donuzApi = "https://app.donuz.co/api/";
  final String donuzApiV1 = 'https://donuz.co/api/v1/';
  final String couponServer = "https://integration.donuz.co/";
}

class DonuzConfig extends BaseConfig {
  DonuzConfig({required appId, required donuzToken}) : super(appId, donuzToken);
}
