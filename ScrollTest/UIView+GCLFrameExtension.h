//
//  UIView+GCLFrameExtension.h
//  ScrollTest
//
//  Created by cheyifu on 2017/7/22.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GCLFrameExtension)

/** X */
@property (nonatomic, assign) CGFloat x;

/** Y */
@property (nonatomic, assign) CGFloat y;

/** Width */
@property (nonatomic, assign) CGFloat width;

/** Height */
@property (nonatomic, assign) CGFloat height;

/** size */
@property (nonatomic, assign) CGSize size;

/** centerX */
@property (nonatomic, assign) CGFloat centerX;

/** centerY */
@property (nonatomic, assign) CGFloat centerY;

/** tag */
@property (nonatomic, copy) NSString *tagStr;

- (BOOL)isShowingOnKeyWindow;

@end
