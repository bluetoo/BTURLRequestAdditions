//
//  BTURLRequestTestViewController.m
//  BTURLRequestTest
//
//  Created by Thaddeus Ternes on 9/26/11.
//  Copyright 2011 Bluetoo Ventures. All rights reserved.
//

#import "BTURLRequestTestViewController.h"
#import "NSMutableURLRequest+BasicAuth.h"

@implementation BTURLRequestTestViewController

#pragma mark - Actions
- (IBAction)buttonPressed:(id)sender
{
    NSLog(@"Button pressed... making the request");
    
    NSURL *url = [NSURL URLWithString:@"http://url/to/something"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Add our Basic Auth header
    [request setUsername:@"rawruser" password:@"rawrpassword"];

    // Begin the async request
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

#pragma mark - NSURLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    // If you hit this, either the username/password combination was invalid, or they were not properly attached to the initial request.
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Oops" message:@"Invalid Auth" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] autorelease];
    [alert show];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"%s: HTTP: %i", __PRETTY_FUNCTION__, httpResponse.statusCode);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%s: length=%i", __PRETTY_FUNCTION__, data.length);
    NSString *message = [NSString stringWithUTF8String:[data bytes]];
    NSLog(@"message=%@", message);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, error);
}

@end
