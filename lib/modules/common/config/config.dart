abstract class BaseConfig {
  late String? appId = '';
  late String donuzToken = "";
  String donuzApi = "https://app.donuz.co/api/";
  String donuzApiV1 = 'https://donuz.co/api/v1/';
}

class DonuzConfig implements BaseConfig {
  DonuzConfig({this.appId, required this.donuzToken});
  @override
  String? appId;

  @override
  String donuzToken;

  @override
  String donuzApi = "https://app.donuz.co/api/";

  @override
  String donuzApiV1 = "https://donuz.co/api/v1/";
}
