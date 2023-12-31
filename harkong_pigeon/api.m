// Autogenerated from Pigeon (v14.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "api.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static FlutterError *createConnectionError(NSString *channelName) {
  return [FlutterError errorWithCode:@"channel-error" message:[NSString stringWithFormat:@"%@/%@/%@", @"Unable to establish connection on channel: '", channelName, @"'."] details:@""];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface MessageData ()
+ (MessageData *)fromList:(NSArray *)list;
+ (nullable MessageData *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation MessageData
+ (instancetype)makeWithName:(NSString *)name
    description:(NSString *)description {
  MessageData* pigeonResult = [[MessageData alloc] init];
  pigeonResult.name = name;
  pigeonResult.description = description;
  return pigeonResult;
}
+ (MessageData *)fromList:(NSArray *)list {
  MessageData *pigeonResult = [[MessageData alloc] init];
  pigeonResult.name = GetNullableObjectAtIndex(list, 0);
  pigeonResult.description = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable MessageData *)nullableFromList:(NSArray *)list {
  return (list) ? [MessageData fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.name ?: [NSNull null],
    self.description ?: [NSNull null],
  ];
}
@end

@interface ExampleHostApiCodecReader : FlutterStandardReader
@end
@implementation ExampleHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [MessageData fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface ExampleHostApiCodecWriter : FlutterStandardWriter
@end
@implementation ExampleHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[MessageData class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface ExampleHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation ExampleHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[ExampleHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[ExampleHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *ExampleHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    ExampleHostApiCodecReaderWriter *readerWriter = [[ExampleHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpExampleHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ExampleHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.harkong_pigeon.ExampleHostApi.getToken"
        binaryMessenger:binaryMessenger
        codec:ExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getTokenWithError:)], @"ExampleHostApi api (%@) doesn't respond to @selector(getTokenWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api getTokenWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.harkong_pigeon.ExampleHostApi.add"
        binaryMessenger:binaryMessenger
        codec:ExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(addNumber:toNumber:error:)], @"ExampleHostApi api (%@) doesn't respond to @selector(addNumber:toNumber:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSInteger arg_a = [GetNullableObjectAtIndex(args, 0) integerValue];
        NSInteger arg_b = [GetNullableObjectAtIndex(args, 1) integerValue];
        FlutterError *error;
        NSNumber *output = [api addNumber:arg_a toNumber:arg_b error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.harkong_pigeon.ExampleHostApi.sendMessageToNative"
        binaryMessenger:binaryMessenger
        codec:ExampleHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(sendMessageToNativeMessage:completion:)], @"ExampleHostApi api (%@) doesn't respond to @selector(sendMessageToNativeMessage:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        MessageData *arg_message = GetNullableObjectAtIndex(args, 0);
        [api sendMessageToNativeMessage:arg_message completion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
NSObject<FlutterMessageCodec> *MessageFlutterApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  sSharedObject = [FlutterStandardMessageCodec sharedInstance];
  return sSharedObject;
}

@interface MessageFlutterApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation MessageFlutterApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)useMethodInFlutterA:(NSInteger)arg_a b:(NSInteger)arg_b completion:(void (^)(NSNumber *_Nullable, FlutterError *_Nullable))completion {
  NSString *channelName = @"dev.flutter.pigeon.harkong_pigeon.MessageFlutterApi.useMethodInFlutter";
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:channelName
      binaryMessenger:self.binaryMessenger
      codec:MessageFlutterApiGetCodec()];
  [channel sendMessage:@[@(arg_a), @(arg_b)] reply:^(NSArray<id> *reply) {
    if (reply != nil) {
      if (reply.count > 1) {
        completion(nil, [FlutterError errorWithCode:reply[0] message:reply[1] details:reply[2]]);
      } else {
        NSNumber *output = reply[0] == [NSNull null] ? nil : reply[0];
        completion(output, nil);
      }
    } else {
      completion(nil, createConnectionError(channelName));
    } 
  }];
}
@end

