import 'package:pigeon/pigeon.dart';

class MessageData {
  MessageData({required this.name, required this.description});
  String name;
  String description;
}

@HostApi()
abstract class ExampleHostApi {
  String getToken();

  // These annotations create more idiomatic naming of methods in Objc and Swift.
  @ObjCSelector('addNumber:toNumber:')
  @SwiftFunction('add(_:to:)')
  int add(int a, int b);

  @async
  bool sendMessageToNative(MessageData message);
}
// #enddocregion host-definitions

// #docregion flutter-definitions
@FlutterApi()
abstract class MessageFlutterApi {
  int useMethodInFlutter(int a, int b);
}