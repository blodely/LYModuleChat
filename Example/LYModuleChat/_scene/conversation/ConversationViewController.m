//
//	ConversationViewController.m
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

#import "ConversationViewController.h"
#import "PreHeader.h"


@interface ConversationViewController () /*<UITableViewDelegate, UITableViewDataSource>*/ {
	__weak UITableView *tbConv;
}
@end

@implementation ConversationViewController

// MARK: - ACTION
// MARK: - INIT
// MARK: - VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		self.navigationItem.title = @"Conversations";
	}
	
	/*
	{
		UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		[self.view addSubview:view];
		tbConv = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
		
		[view registerClass:[FACBaseTableCell class] forCellReuseIdentifier:FACBaseTableCellIdentifier];
		
		view.delegate = self;
	}
	*/
}

// MARK: - METHOD
// MARK: PRIVATE METHOD
// MARK: NETWORKING

- (void)requestConversations {
}

// MARK: PROPERTY
// MARK: BLOCK
// MARK: - DELEGATE
// MARK: UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

// MARK: UITableViewDataSource

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
//	
//	return [tableView dequeueReusableCellWithIdentifier:FACBaseTableCellIdentifier forIndexPath:idp];
//}

// MARK: - NOTIFICATION
// MARK:

@end
