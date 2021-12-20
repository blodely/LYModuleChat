//
//	LYAppDelegate.m
//	LYModuleChat
//
//  Created by Luo Yu on 2021-12-17.
//	Copyright (c) 2021 Luo Yu <indie.luo@gmail.com>. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "LYAppDelegate.h"
#import "PreHeader.h"

#import "ConversationViewController.h"
#import "ChatViewController.h"


@interface LYAppDelegate () {
	__strong UITabBarController *tabs;
}
@end

@implementation LYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
	
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	tabs = [[UITabBarController alloc] init];
	
	{
		UINavigationController *convnav = [ConversationViewController nav];
//		convnav.tabBarItem.title = @"Conversation";
		convnav.tabBarItem.image = [UIImage imageNamed:@"tab-ico-chat-nor"];
		
		tabs.viewControllers = @[convnav,];
	}
	
	_window.rootViewController = tabs;
	[_window makeKeyAndVisible];
	
    return YES;
}

@end
