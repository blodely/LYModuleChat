//
//	FACConversationViewController.m
//	LYModuleChat
//
//	Created by Luo Yu on 2021-12-20.
//	Copyright (c) 2021 Luo Yu <indie.luo@gmail.com>
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

#import "FACConversationViewController.h"
#import <LYModuleChat/LYModuleChat.h>
#import <IMSDK_Plus/IMSDK_Plus.h>
#import "FACConversationCell.h"


@interface FACConversationViewController () <UITableViewDataSource> {
	
	uint64_t nextSeq;
	uint64_t pageCount;
	uint64_t isFinished;
}
@end

@implementation FACConversationViewController

// MARK: - ACTION
// MARK: - INIT

- (void)initial {
	[super initial];
	
	nextSeq = 0;
	pageCount = 100;
	isFinished = NO;
	
	dsConvs = [NSMutableArray arrayWithCapacity:10];
}

// MARK: - VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	{
		// MARK: CONVERSATION TABLE VIEW
		UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.separatorStyle = UITableViewCellSeparatorStyleNone;
		[self.view addSubview:view];
		tbConv = view;
		
		[tbConv registerClass:[FACBaseTableCell class] forCellReuseIdentifier:FACBaseTableCellIdentifier];
		[tbConv registerClass:[FACConversationCell class] forCellReuseIdentifier:FACConversationCellIdentifier];
		tbConv.dataSource = self;
		
		[view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
		[view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
	}
}
// MARK: - METHOD
// MARK: PRIVATE METHOD

- (void)updateConversations:(NSArray<V2TIMConversation *> *)data {
	for (NSInteger i = 0; i < [data count]; i++) {
		V2TIMConversation *one = data[i];
		BOOL isExit = NO;
		for (int j = 0; j < [dsConvs count]; j++) {
			V2TIMConversation *item = dsConvs[j];
			if ([item.conversationID isEqualToString:one.conversationID]) {
				[dsConvs replaceObjectAtIndex:j withObject:one];
				isExit = YES;
				break;
			}
		}
		if (!isExit) {
			[dsConvs addObject:one];
		}
	}
	
	
}

// MARK: NETWORKING

- (void)requestConversations {
	[[V2TIMManager sharedInstance] getConversationList:nextSeq count:pageCount succ:^(NSArray<V2TIMConversation *> *list, uint64_t innerNextSeq, BOOL innerIsFinished) {
		self->nextSeq = innerNextSeq;
		self->isFinished = innerIsFinished;
		[self updateConversations:list];
	} fail:^(int code, NSString *desc) {
		self->isFinished = YES;
		NSLog(@"Module Chat Error:\n%@ %@", @(code), desc);
	}];
}

// MARK: PROPERTY
// MARK: BLOCK
// MARK: - DELEGATE
// MARK: UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [dsConvs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	{
		FACConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:FACConversationCellIdentifier forIndexPath:idp];
		return cell;
	}
	
	return [tableView dequeueReusableCellWithIdentifier:FACBaseTableCellIdentifier forIndexPath:idp];
}

// MARK: - NOTIFICATION
// MARK:

@end
