import 'api.dart';

class FlutterAPIImpl implements MessageFlutterApi {
  @override
  int useMethodInFlutter(int a, int b) {
    return a * b;
  }
}
