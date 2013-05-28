//
//  ClsInternetChecking.m
//  iPhoneBasicStructure
//
//  Created by _MyCompanyName_ on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InternetRechable.h"
#import "AppDelegate.h"

@implementation InternetRechable

-(id)init
{
    [self setupNotification];
    [self setupLayout];
	return self;
}

-(void)setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkForInternetAvailability:) name:kReachabilityChangedNotification object:nil];
	_internetReachable = [Reachability reachabilityForInternetConnection];
	[_internetReachable startNotifier];
    
    _hostReachable = [Reachability reachabilityWithHostname:@"www.google.com"];
	[_hostReachable startNotifier];
}

-(void)setupLayout
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

    _noInternetView = [[UIView alloc] initWithFrame:appDelegate.window.frame];
    _noInternetView.backgroundColor = [UIColor clearColor];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:_noInternetView.frame];
    [bgView setImage:[UIImage imageNamed:@"bg_no_internet@2x.png"]];
    [_noInternetView addSubview:bgView];
    
    UIImage *noInternetImage = [UIImage imageNamed:@"no_internet@2x.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:noInternetImage];
    [imgView setFrame:CGRectMake(0, 0, noInternetImage.size.width/2, noInternetImage.size.height/2)];
    [imgView setCenter:_noInternetView.center];
    [_noInternetView addSubview:imgView];
}


- (void)checkForInternetAvailability:(NSNotification *)notice
{
	NetworkStatus internetStatus = [_internetReachable currentReachabilityStatus];
	switch (internetStatus)
	{
		case NotReachable:
		{
			NSLog(@"The internet is down.");
			_isInternetActive = NO;
			break;
		}
		case ReachableViaWiFi:
		{
			NSLog(@"The internet is working via WIFI.");
			_isInternetActive = YES;
			break;
		}
		case ReachableViaWWAN:
		{
			NSLog(@"The internet is working via WWAN.");
			_isInternetActive = YES;
			break;
		}
	}
	
	if(_isInternetActive)
		[self removeNoInternetView];
	else
		[self addNoInternetView];
}

-(void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

-(void)removeNoInternetView
{
    [_noInternetView removeFromSuperview];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.window.userInteractionEnabled = YES;
}

-(void)addNoInternetView
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.window.userInteractionEnabled = NO;
    [appDelegate.window addSubview:_noInternetView];
}

@end
