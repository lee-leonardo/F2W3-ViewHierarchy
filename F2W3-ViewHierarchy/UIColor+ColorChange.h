//
//  UIColor+ColorChange.h
//  F2W1-MVC
//
//  Created by Leonardo Lee on 5/14/14.
//  Copyright (c) 2014 Leonardo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorChange)
+(UIColor *) randomColor;
-(UIColor *)lightenColor:(UIColor *)color;

@end
