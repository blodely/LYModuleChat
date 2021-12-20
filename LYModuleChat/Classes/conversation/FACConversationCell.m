//
//	FACConversationCell.m
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

#import "FACConversationCell.h"


NSString *const FACConversationCellIdentifier = @"FACConversationCellIdentifier";

@implementation FACConversationCell

- (void)initial {
	[super initial];
	
	{
		// MARK: AVATAR
		UIImageView *view = [[UIImageView alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.clipsToBounds = YES;
		view.contentMode = UIViewContentModeScaleAspectFill;
		[self addSubview:view];
		_ivAvatar = view;
		
		[view.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:self.topAnchor constant:FAC_PADDING].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:FAC_PADDING].active = YES;
		[view.widthAnchor constraintEqualToConstant:FAC_CTL_SMALL].active = YES;
		[view.heightAnchor constraintEqualToAnchor:view.widthAnchor].active = YES;
	}
	
	{
		// MARK: NAME LABEL
		UILabel *view = [[UILabel alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.font = [UIFont systemFontOfSize:UIFont.systemFontSize];
		view.textColor = [UIColor darkTextColor];
		[self addSubview:view];
		_lblName = view;
		
		[view.leadingAnchor constraintEqualToAnchor:_ivAvatar.trailingAnchor constant:FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:_ivAvatar.topAnchor].active = YES;
	}
	
	{
		// MARK: LAST MESSAGE LABEL
		UILabel *view = [[UILabel alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.font = [UIFont systemFontOfSize:UIFont.smallSystemFontSize];
		view.textColor = [UIColor grayColor];
		[self addSubview:view];
		_lblMessage = view;
		
		[view.leadingAnchor constraintEqualToAnchor:_lblName.leadingAnchor].active = YES;
		[view.bottomAnchor constraintEqualToAnchor:_ivAvatar.bottomAnchor].active = YES;
	}
	
	{
		// MARK: TIMESTAMP
		UILabel *view = [[UILabel alloc] init];
		view.translatesAutoresizingMaskIntoConstraints = NO;
		view.font = [UIFont systemFontOfSize:UIFont.smallSystemFontSize];
		[self addSubview:view];
		_lblTimestamp = view;
		
		[view.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-FAC_PADDING].active = YES;
		[view.topAnchor constraintEqualToAnchor:_lblName.topAnchor].active = YES;
	}
}

@end
