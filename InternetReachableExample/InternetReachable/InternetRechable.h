//
//  InternetRechable.h
//  InternetRechableExample
//
//  Created by _MyCompanyName_ on 22/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface InternetRechable : NSObject 

@property (nonatomic,strong) Reachability* internetReachable;
@property (nonatomic,strong) Reachability* hostReachable;
@property (nonatomic,strong) UIView *noInternetView;
@property (nonatomic,assign) BOOL isInternetActive;


@end
