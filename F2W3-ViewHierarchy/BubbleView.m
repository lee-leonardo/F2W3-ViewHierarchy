//
//  BubbleView.m
//  F2W3-ViewHierarchy
//
//  Created by Leonardo Lee on 5/18/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "BubbleView.h"
#import "UIColor+ColorChange.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
	UIColor *color = [UIColor randomColor];
		
    if (self) {
		self.backgroundColor = color;
		self.layer.borderWidth = 2.f;
		self.layer.borderColor = color.CGColor;
		self.layer.cornerRadius = self.frame.size.width / 2.0;
		
    }
    return self;
}

//#pragma mark -
//-(id)init
//{
////	self = [super initWithFrame:CGRectMake(100, 100, (), ())]; //Needs the width and height of the view.
//	self.backgroundColor = [UIColor lightGrayColor];
//	self.layer.borderWidth = 1.f;
//	self.layer.cornerRadius = self.frame.size.width / 2.0;
//	
//	
//	int bubbles = arc4random_uniform(3);
//	for (int i; i < bubbles; i++) {
//		
//		
////		[BubbleView initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, CGFloat width, <#CGFloat height#>)];
//		
//	}
//	
//	return self;
//}


@end
