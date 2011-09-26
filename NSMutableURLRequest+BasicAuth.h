//
//  NSMutableURLRequest+BasicAuth.h
//  BTURLRequestTest
//
//  Created by Thaddeus Ternes on 9/26/11.
//  Copyright 2011 Bluetoo Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (BTBasicAuth)

- (void)setUsername:(NSString *)username password:(NSString *)password;

@end
