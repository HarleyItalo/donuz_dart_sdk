abstract class BaseConfig {
  late String? appId = '';
  late String donuzToken = "";
  String donuzApi = "https://app.donuz.co/api/";
}

class DonuzConfig implements BaseConfig {
  DonuzConfig({this.appId, required this.donuzToken});
  @override
  String? appId;

  @override
  String donuzToken;

  @override
  String donuzApi = "https://app.donuz.co/api/";
}
