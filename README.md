NSMutableURLRequest+BasicAuth
=============================
A simple category for NSMutableURLRequest that adds simple Basic Auth support. Specifying the authentication header in the initial HTTP request avoids multiple requests, which means the NSURLConnection `connection: didReceiveAuthenticationChallenge:` delegate method can be used simply for authentication failures and not initial authentication.

Adding To Your Project
----------------------
* Add NSMutableURLRequest+BasicAuth .h/.m to your project
* Specify the authentication details on your request: `[request setUsername:@"rawruser" password:@"rawrpassword"];`

Example
-------

    NSURL *url = [NSURL URLWithString:@"http://url/to/something"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Add our Basic Auth header
    [request setUsername:@"rawruser" password:@"rawrpassword"];
    
    // Begin the async request
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];


