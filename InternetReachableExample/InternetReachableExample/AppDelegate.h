//
//  AppDelegate.h
//  InternetReachableExample
//
//  Created by Jennis on 28/05/13.
//
//

#import <UIKit/UIKit.h>
#import "InternetRechable.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) InternetRechable *internetReachable;

@end
