import 'package:donuz_dart_sdk/modules/common/common_module.dart';
import 'package:mocktail/mocktail.dart';

class HttpServiceMock extends Mock implements HttpService {}

class MockStreamedResponse extends Mock implements StreamedResponse {}

class FakeMultipartRequest extends Fake implements MultipartRequest {}
