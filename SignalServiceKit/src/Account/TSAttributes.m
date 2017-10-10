//
//  Copyright (c) 2017 Open Whisper Systems. All rights reserved.
//

#import "TSAttributes.h"
#import "TSAccountManager.h"

@implementation TSAttributes

+ (NSDictionary *)attributesFromStorageWithVoiceSupport {
    return [self attributesWithSignalingKey:[TSAccountManager signalingKey]
                            serverAuthToken:[TSAccountManager serverAuthToken]];
}

+ (NSDictionary *)attributesWithSignalingKey:(NSString *)signalingKey
                             serverAuthToken:(NSString *)authToken
{
    return @{
        @"signalingKey" : signalingKey,
        @"AuthKey" : authToken,
        @"voice" : @(YES), // all Signal-iOS clients support voice
        @"video" : @(YES), // all Signal-iOS clients support WebRTC-based voice and video calls.
        @"registrationId" : [NSString stringWithFormat:@"%i", [TSAccountManager getOrGenerateRegistrationId]]
    };
}

@end
