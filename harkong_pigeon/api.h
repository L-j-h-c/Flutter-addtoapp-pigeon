// Autogenerated from Pigeon (v14.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class MessageData;

@interface MessageData : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithName:(NSString *)name
    description:(NSString *)description;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * description;
@end

/// The codec used by ExampleHostApi.
NSObject<FlutterMessageCodec> *ExampleHostApiGetCodec(void);

@protocol ExampleHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSString *)getTokenWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)addNumber:(NSInteger)a toNumber:(NSInteger)b error:(FlutterError *_Nullable *_Nonnull)error;
- (void)sendMessageToNativeMessage:(MessageData *)message completion:(void (^)(NSNumber *_Nullable, FlutterError *_Nullable))completion;
@end

extern void SetUpExampleHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ExampleHostApi> *_Nullable api);

/// The codec used by MessageFlutterApi.
NSObject<FlutterMessageCodec> *MessageFlutterApiGetCodec(void);

@interface MessageFlutterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)useMethodInFlutterA:(NSInteger)a b:(NSInteger)b completion:(void (^)(NSNumber *_Nullable, FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
