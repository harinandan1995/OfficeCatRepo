//
//  ServerCall.h
//  Officecat
//
//  Created by Harinandan Teja on 9/26/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCall : NSObject

+ (void)jsonRequestWithBaseURL:(NSString *)baseURL function:(NSString *)function parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, BOOL success))completion;

@end
