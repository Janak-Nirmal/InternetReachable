//
//  InternetRechable.m
//  InternetRechableExample
//
//  Created by Jennis on 05/28/13.
//  Copyright 2013 Jennis. All rights reserved.
//  See the file License.txt for copying permission.
//

#import "InternetRechable.h"

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
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    _noInternetView = [[UIView alloc] initWithFrame:mainWindow.frame];
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
