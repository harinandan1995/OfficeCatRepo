//
//  ServerCall.m
//  Officecat
//
//  Created by Harinandan Teja on 9/26/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "ServerCall.h"
#import <AFNetworking/AFNetworking.h>

@implementation ServerCall

+(void)jsonRequestWithBaseURL:(NSString *)baseURL function:(NSString *)function parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *, BOOL))completion{
    if (baseURL)
     function = [baseURL stringByAppendingString:function];
     
     //NSLog(@"%@ function:%@, parameters:%@", self.class, function, parameters);
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
     [manager POST:function parameters:parameters
           success:^(AFHTTPRequestOperation *operation, id jsonObject)
     {
         //NSLog(@"Success: %@", jsonObject);
         NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
         if (completion) completion(jsonDictionary, YES);
     }
           failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@ AFError: %@", self.class, [error localizedDescription]);
         completion(nil, NO);
     }];
}

@end
