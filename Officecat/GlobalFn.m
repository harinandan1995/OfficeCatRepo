//
//  GlobalFn.m
//  Officecat
//
//  Created by Harinandan Teja on 9/28/14.
//  Copyright (c) 2014 shearwater. All rights reserved.
//

#import "GlobalFn.h"
#import <AFNetworking/AFNetworking.h>

@implementation GlobalFn

+(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


+(void)jsonRequestWithBaseURL:(NSString *)baseURL function:(NSString *)function parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *, BOOL))completion{
    if (baseURL)
        function = [baseURL stringByAppendingString:function];
    
    NSLog(@"%@ function:%@, parameters:%@", self.class, function, parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:function parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id jsonObject)
     {
         NSLog(@"Success: %@", jsonObject);
         NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
         if (completion) completion(jsonDictionary, YES);
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@ AFError: %@", self.class, [error localizedDescription]);
         completion(nil, NO);
     }];
}

+(void)GetRequestWithBaseURL:(NSString *)baseURL function:(NSString *)function parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *, BOOL))completion{
    if (baseURL)
        function = [baseURL stringByAppendingString:function];
    
    NSLog(@"%@ function:%@, parameters:%@", self.class, function, parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:function parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id jsonObject)
     {
         NSLog(@"Success: %@", jsonObject);
         NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
         if (completion) completion(jsonDictionary, YES);
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error is : %@",error);
         NSLog(@"%@ AFError: %@", self.class, [error localizedDescription]);
         completion(nil, NO);
     }];
}

+(UIColor *)getColor:(NSInteger)num{
    switch (num) {
        case 0:
            return  [self colorWithHexString:@"2e3135"]; // Dark Gray
            break;
        case 1:
            return  [self colorWithHexString:@"1b1e21"]; // Darker Gray
            break;
        case 2:
            return  [self colorWithHexString:@"efcc22"]; // Yellow
            break;
        case 3:
            return  [self colorWithHexString:@"fdfcfc"]; // White
            break;
        case 4:
            return  [self colorWithHexString:@"f25e5e"]; // Red
            break;
        case 5:
            return  [self colorWithHexString:@"0b685e"]; // Green
            break;
        case 6:
            return  [self colorWithHexString:@"0b0706"]; // Black
            break;
        case 7:
            return  [self colorWithHexString:@"008080"]; // Black
            break;
        case 8:
            return  [self colorWithHexString:@"ebe2e2"]; // Light White
            break;
        case 9:
            return  [self colorWithHexString:@"313437"]; // Payment background color
            break;
        case 10:
            return  [self colorWithHexString:@"b1b1b1"]; // payment method type text color
            break;
        case 11:
            return  [self colorWithHexString:@"575757"]; // Gray color for payment text
            break;
        case 12:
            return  [self colorWithHexString:@"efc01e"]; // Light yellow for payment
            break;
            
        default:
            break;
    }
    return [UIColor whiteColor];
}

@end
