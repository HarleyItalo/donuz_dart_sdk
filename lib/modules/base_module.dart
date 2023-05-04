// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';

abstract class BaseModule {
  late GetIt instance;
  BaseModule({
    required this.instance,
  }) {
    injectModule();
    getInstance();
  }
  void injectModule();
  void getInstance();
}
