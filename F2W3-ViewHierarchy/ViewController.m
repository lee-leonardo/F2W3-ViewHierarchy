//
//  ViewController.m
//  F2W3-ViewHierarchy
//
//  Created by Leonardo Lee on 5/18/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIDynamicItemBehavior *behavior;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIPushBehavior *push;

@property (nonatomic, strong) UIView *object;
@property (nonatomic, strong) UILabel *countText;
@property (nonatomic, strong) UIView *object2;
@property (nonatomic, strong) UIView *object3;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
	
	_object = [[BubbleView alloc] initWithFrame:CGRectMake(50, 50, 60, 60)];
	_object2 = [[BubbleView alloc] initWithFrame:CGRectMake(50, 120, 60, 60)];
	_object3 = [[BubbleView alloc] initWithFrame:CGRectMake(200, 200, 60, 60)];
	
	
	_countText = [[UILabel alloc] initWithFrame:CGRectMake(100, 180, 100, 100)];
	_countText.text = @"Hello World!";
	
	[self.view addSubview:_object];
	[self.view addSubview:_countText];
	[self.view addSubview:_object2];
	[self.view addSubview:_object3];
	
	
//	Testing Gravity
//	_gravity = [[UIGravityBehavior alloc] initWithItems:@[_object, _object2, _object3]];
//	[_gravity addItem:_object3];
//	[_animator addBehavior:_gravity];
	
//	Adds collisions.
	_collision = [[UICollisionBehavior alloc]initWithItems:@[_object, _object2, _object3]];
	[_collision addItem:_countText];
	_collision.translatesReferenceBoundsIntoBoundary = YES;
	[_animator addBehavior:_collision];
	
//	Add push behavior.
	_push = [[UIPushBehavior alloc] initWithItems:@[_object, _object2, _object3]
											 mode:UIPushBehaviorModeInstantaneous];
	[_animator addBehavior:_push];
	
//	Add dynamic behavior
	_behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_object, _object2, _object3]];
	_behavior.density = 100.0;
	_behavior.elasticity = 1.0;

	
	
}
#pragma mark - Bubble Related
-(void)createBubbles
{
	
}

-(void)propertiesToObject:(UIView *)UIObject
{
	[self.view addSubview:UIObject];
	[_gravity addItem:UIObject];
	[_collision addItem:UIObject];
	[_push addItem:UIObject];
	[_behavior addItem:UIObject];
}


#pragma mark - Touch management
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	_push.active = NO;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//	for (UITouch *touch in touches) {
//		CGPoint touchPoint = [touch locationInView:_object.superview];
//		_object.center = touchPoint;
//	}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//locationOfTouch:inView:
	for (UITouch *touch in touches) {
		
		CGPoint touchPoint = [touch locationInView:_countText.superview];
		NSLog(@"X: %f, Y: %f", touchPoint.x, touchPoint.y);
		
		CGVector vector = CGVectorMake(touchPoint.x, touchPoint.y);
		NSLog(@"X: %f, Y: %f", vector.dx, vector.dy);
		
		_push.pushDirection = vector;
//		_push.pushDirection = [setTar]
		_push.magnitude = 2;
	}
	
	_push.active = YES;
}





@end
