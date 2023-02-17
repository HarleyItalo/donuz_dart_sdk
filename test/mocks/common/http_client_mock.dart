import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements http.Client {}
