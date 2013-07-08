//
//  InternetReachable.m
//  InternetReachableExample
//
//  Created by Jennis on 05/28/13.
//  Copyright 2013 Jennis. All rights reserved.
//  See the file License.txt for copying permission.
//

#import "InternetReachable.h"

@implementation InternetReachable

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
    _noInternetView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _noInternetView.backgroundColor = [UIColor clearColor];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:_noInternetView.frame];
    [bgView setImage:[UIImage imageNamed:@"bg_no_internet.png"]];
    [_noInternetView addSubview:bgView];
    
    UIImage *noInternetImage = [UIImage imageNamed:@"no_internet.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:noInternetImage];
    [_noInternetView addSubview:imgView];
    [imgView setCenter:_noInternetView.center];
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
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    mainWindow.userInteractionEnabled = YES;
}

-(void)addNoInternetView
{
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    mainWindow.userInteractionEnabled = NO;
    [mainWindow addSubview:_noInternetView];
}

@end
