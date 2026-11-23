abstract class BaseConfig {
  final String? appId;
  String donuzToken;
  BaseConfig(this.appId, this.donuzToken);
  final String donuzApi = "https://app.donuz.co/api/";
  final String integrationServer = "https://integration.donuz.co";
}

class DonuzConfig extends BaseConfig {
  DonuzConfig({required String appId, required String donuzToken})
      : super(appId, donuzToken);
}
