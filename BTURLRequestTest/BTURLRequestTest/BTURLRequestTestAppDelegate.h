//
//  BTURLRequestTestAppDelegate.h
//  BTURLRequestTest
//
//  Created by Thaddeus Ternes on 9/26/11.
//  Copyright 2011 Bluetoo Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BTURLRequestTestViewController;

@interface BTURLRequestTestAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BTURLRequestTestViewController *viewController;

@end
