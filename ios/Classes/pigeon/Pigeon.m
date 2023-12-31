// Autogenerated from Pigeon (v1.0.19), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
      @"code" : (error.code ? error.code : [NSNull null]),
      @"message" : (error.message ? error.message : [NSNull null]),
      @"details" : (error.details ? error.details : [NSNull null]),
    };
  }
  return @{
    @"result" : (result ? result : [NSNull null]),
    @"error" : errorDict,
  };
}
static id GetNullableObject(NSDictionary *dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface FLTNeLiveConfig ()
+ (FLTNeLiveConfig *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTNEAutoRetryConfig ()
+ (FLTNEAutoRetryConfig *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTNeLiveConfig
+ (instancetype)makeWithIsCloseTimeOutProtect:(nullable NSNumber *)isCloseTimeOutProtect
                       refreshPreLoadDuration:(nullable NSNumber *)refreshPreLoadDuration
                                  thirdUserId:(nullable NSString *)thirdUserId {
  FLTNeLiveConfig *pigeonResult = [[FLTNeLiveConfig alloc] init];
  pigeonResult.isCloseTimeOutProtect = isCloseTimeOutProtect;
  pigeonResult.refreshPreLoadDuration = refreshPreLoadDuration;
  pigeonResult.thirdUserId = thirdUserId;
  return pigeonResult;
}
+ (FLTNeLiveConfig *)fromMap:(NSDictionary *)dict {
  FLTNeLiveConfig *pigeonResult = [[FLTNeLiveConfig alloc] init];
  pigeonResult.isCloseTimeOutProtect = GetNullableObject(dict, @"isCloseTimeOutProtect");
  pigeonResult.refreshPreLoadDuration = GetNullableObject(dict, @"refreshPreLoadDuration");
  pigeonResult.thirdUserId = GetNullableObject(dict, @"thirdUserId");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary
      dictionaryWithObjectsAndKeys:(self.isCloseTimeOutProtect ? self.isCloseTimeOutProtect
                                                               : [NSNull null]),
                                   @"isCloseTimeOutProtect",
                                   (self.refreshPreLoadDuration ? self.refreshPreLoadDuration
                                                                : [NSNull null]),
                                   @"refreshPreLoadDuration",
                                   (self.thirdUserId ? self.thirdUserId : [NSNull null]),
                                   @"thirdUserId", nil];
}
@end

@implementation FLTNEAutoRetryConfig
+ (instancetype)makeWithCount:(nullable NSNumber *)count
                 delayDefault:(nullable NSNumber *)delayDefault
                   delayArray:(nullable NSArray<NSNumber *> *)delayArray {
  FLTNEAutoRetryConfig *pigeonResult = [[FLTNEAutoRetryConfig alloc] init];
  pigeonResult.count = count;
  pigeonResult.delayDefault = delayDefault;
  pigeonResult.delayArray = delayArray;
  return pigeonResult;
}
+ (FLTNEAutoRetryConfig *)fromMap:(NSDictionary *)dict {
  FLTNEAutoRetryConfig *pigeonResult = [[FLTNEAutoRetryConfig alloc] init];
  pigeonResult.count = GetNullableObject(dict, @"count");
  pigeonResult.delayDefault = GetNullableObject(dict, @"delayDefault");
  pigeonResult.delayArray = GetNullableObject(dict, @"delayArray");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return [NSDictionary
      dictionaryWithObjectsAndKeys:(self.count ? self.count : [NSNull null]), @"count",
                                   (self.delayDefault ? self.delayDefault : [NSNull null]),
                                   @"delayDefault",
                                   (self.delayArray ? self.delayArray : [NSNull null]),
                                   @"delayArray", nil];
}
@end

@interface FLTNeLivePlayerApiCodecReader : FlutterStandardReader
@end
@implementation FLTNeLivePlayerApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [FLTNEAutoRetryConfig fromMap:[self readValue]];

    case 129:
      return [FLTNeLiveConfig fromMap:[self readValue]];

    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FLTNeLivePlayerApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTNeLivePlayerApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FLTNEAutoRetryConfig class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else if ([value isKindOfClass:[FLTNeLiveConfig class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FLTNeLivePlayerApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTNeLivePlayerApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTNeLivePlayerApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTNeLivePlayerApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTNeLivePlayerApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    FLTNeLivePlayerApiCodecReaderWriter *readerWriter =
        [[FLTNeLivePlayerApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FLTNeLivePlayerApiSetup(id<FlutterBinaryMessenger> binaryMessenger,
                             NSObject<FLTNeLivePlayerApi> *api) {
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.initAndroid"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(initAndroidConfig:error:)],
          @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(initAndroidConfig:error:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTNeLiveConfig *arg_config = args[0];
        FlutterError *error;
        [api initAndroidConfig:arg_config error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.create"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(createWithError:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(createWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api createWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.release"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(releasePlayerId:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(releasePlayerId:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FlutterError *error;
        [api releasePlayerId:arg_playerId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setShouldAutoplay"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setShouldAutoplayPlayerId:isAutoplay:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setShouldAutoplayPlayerId:isAutoplay:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_isAutoplay = args[1];
        FlutterError *error;
        [api setShouldAutoplayPlayerId:arg_playerId isAutoplay:arg_isAutoplay error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setPlayUrl"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPlayUrlPlayerId:path:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setPlayUrlPlayerId:path:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSString *arg_path = args[1];
        FlutterError *error;
        NSNumber *output = [api setPlayUrlPlayerId:arg_playerId path:arg_path error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.prepareAsync"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(prepareAsyncPlayerId:error:)],
          @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(prepareAsyncPlayerId:error:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FlutterError *error;
        [api prepareAsyncPlayerId:arg_playerId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.start"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startPlayerId:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(startPlayerId:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FlutterError *error;
        [api startPlayerId:arg_playerId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.stop"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopPlayerId:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(stopPlayerId:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FlutterError *error;
        [api stopPlayerId:arg_playerId error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.getCurrentPosition"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getCurrentPositionPlayerId:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(getCurrentPositionPlayerId:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FlutterError *error;
        NSNumber *output = [api getCurrentPositionPlayerId:arg_playerId error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.switchContentUrl"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(switchContentUrlPlayerId:url:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(switchContentUrlPlayerId:url:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSString *arg_url = args[1];
        FlutterError *error;
        [api switchContentUrlPlayerId:arg_playerId url:arg_url error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.getVersion"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getVersionWithError:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(getVersionWithError:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSString *output = [api getVersionWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.addPreloadUrls"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(addPreloadUrlsUrls:error:)],
          @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(addPreloadUrlsUrls:error:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSArray<NSString *> *arg_urls = args[0];
        FlutterError *error;
        [api addPreloadUrlsUrls:arg_urls error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.removePreloadUrls"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(removePreloadUrlsUrls:error:)],
          @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(removePreloadUrlsUrls:error:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSArray<NSString *> *arg_urls = args[0];
        FlutterError *error;
        [api removePreloadUrlsUrls:arg_urls error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.queryPreloadUrls"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(queryPreloadUrlsWithError:)],
          @"FLTNeLivePlayerApi api (%@) doesn't respond to @selector(queryPreloadUrlsWithError:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSDictionary<NSString *, NSNumber *> *output = [api queryPreloadUrlsWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setBufferStrategy"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setBufferStrategyPlayerId:bufferStrategy:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setBufferStrategyPlayerId:bufferStrategy:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_bufferStrategy = args[1];
        FlutterError *error;
        [api setBufferStrategyPlayerId:arg_playerId bufferStrategy:arg_bufferStrategy error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setHardwareDecoder"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setHardwareDecoderPlayerId:isOpen:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setHardwareDecoderPlayerId:isOpen:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_isOpen = args[1];
        FlutterError *error;
        [api setHardwareDecoderPlayerId:arg_playerId isOpen:arg_isOpen error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setPlaybackTimeout"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPlaybackTimeoutPlayerId:timeout:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setPlaybackTimeoutPlayerId:timeout:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_timeout = args[1];
        FlutterError *error;
        [api setPlaybackTimeoutPlayerId:arg_playerId timeout:arg_timeout error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setAutoRetryConfig"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setAutoRetryConfigPlayerId:config:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setAutoRetryConfigPlayerId:config:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        FLTNEAutoRetryConfig *arg_config = args[1];
        FlutterError *error;
        [api setAutoRetryConfigPlayerId:arg_playerId config:arg_config error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setMute"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setMutePlayerId:isMute:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setMutePlayerId:isMute:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_isMute = args[1];
        FlutterError *error;
        [api setMutePlayerId:arg_playerId isMute:arg_isMute error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setVolume"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setVolumePlayerId:volume:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setVolumePlayerId:volume:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_playerId = args[0];
        NSNumber *arg_volume = args[1];
        FlutterError *error;
        [api setVolumePlayerId:arg_playerId volume:arg_volume error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerApi.setPreloadResultValidityIos"
               binaryMessenger:binaryMessenger
                         codec:FLTNeLivePlayerApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPreloadResultValidityIosValidity:error:)],
                @"FLTNeLivePlayerApi api (%@) doesn't respond to "
                @"@selector(setPreloadResultValidityIosValidity:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_validity = args[0];
        FlutterError *error;
        [api setPreloadResultValidityIosValidity:arg_validity error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FLTNeLivePlayerListenerApiCodecReader : FlutterStandardReader
@end
@implementation FLTNeLivePlayerListenerApiCodecReader
@end

@interface FLTNeLivePlayerListenerApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTNeLivePlayerListenerApiCodecWriter
@end

@interface FLTNeLivePlayerListenerApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTNeLivePlayerListenerApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTNeLivePlayerListenerApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTNeLivePlayerListenerApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTNeLivePlayerListenerApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    FLTNeLivePlayerListenerApiCodecReaderWriter *readerWriter =
        [[FLTNeLivePlayerListenerApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

@interface FLTNeLivePlayerListenerApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation FLTNeLivePlayerListenerApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)onPreparedPlayerId:(NSString *)arg_playerId
                completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onPrepared"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onCompletionPlayerId:(NSString *)arg_playerId
                  completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onCompletion"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onErrorPlayerId:(NSString *)arg_playerId
                   what:(NSNumber *)arg_what
                  extra:(NSNumber *)arg_extra
             completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onError"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId, arg_what, arg_extra ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onVideoSizeChangedPlayerId:(NSString *)arg_playerId
                             width:(NSNumber *)arg_width
                            height:(NSNumber *)arg_height
                        completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onVideoSizeChanged"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId, arg_width, arg_height ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onReleasedPlayerId:(NSString *)arg_playerId
                completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onReleased"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onFirstVideoDisplayPlayerId:(NSString *)arg_playerId
                         completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onFirstVideoDisplay"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onFirstAudioDisplayPlayerId:(NSString *)arg_playerId
                         completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onFirstAudioDisplay"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
- (void)onLoadStateChangePlayerId:(NSString *)arg_playerId
                            state:(NSNumber *)arg_state
                            extra:(NSNumber *)arg_extra
                       completion:(void (^)(NSError *_Nullable))completion {
  FlutterBasicMessageChannel *channel = [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NeLivePlayerListenerApi.onLoadStateChange"
             binaryMessenger:self.binaryMessenger
                       codec:FLTNeLivePlayerListenerApiGetCodec()];
  [channel sendMessage:@[ arg_playerId, arg_state, arg_extra ]
                 reply:^(id reply) {
                   completion(nil);
                 }];
}
@end
