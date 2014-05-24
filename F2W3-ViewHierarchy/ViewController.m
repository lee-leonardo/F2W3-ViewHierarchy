//
//  ViewController.m
//  F2W3-ViewHierarchy
//
//  Created by Leonardo Lee on 5/18/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIView *object;
@property (nonatomic, strong) UILabel *countText;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
	
	_object = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 44, 44)];
	_object.backgroundColor = [UIColor cyanColor];
	_object.layer.borderColor = [UIColor blueColor].CGColor;
	_object.layer.borderWidth = 2.f;
	_object.layer.cornerRadius = _object.frame.size.width / 2.0;
	
	_countText = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 40, 20)];
	_countText.text = @"Hello World!";
	
	
	[self.view addSubview:_object];
	[self.view addSubview:_countText];
	
	
//	Testing Gravity
	_gravity = [[UIGravityBehavior alloc] initWithItems:@[_object]];
	[_animator addBehavior:_gravity];
	
//	Adds collisions.
	_collision = [[UICollisionBehavior alloc]initWithItems:@[_object]];
	_collision.translatesReferenceBoundsIntoBoundary = YES;
	[_animator addBehavior:_collision];
	
}

#pragma mark - Touch management
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	for (UITouch *touch in touches) {
		CGPoint touchPoint = [touch locationInView:_object.superview];
		_object.center = touchPoint;
	}

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

#pragma mark - BubbleView
- (IBAction)populate:(id)sender {
	
}

#pragma mark - Counter
-(void)updateCount {
	
}


@end
