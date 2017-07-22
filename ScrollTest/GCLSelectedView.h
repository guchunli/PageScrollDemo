//
//  GCLSelectedView.h
//  ScrollTest
//
//  Created by cheyifu on 2017/7/22.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+GCLFrameExtension.h"
#define Home_Seleted_Item_W 60
#define DefaultMargin       10

typedef NS_ENUM(NSUInteger, HomeType) {
    HomeTypeHot, // 热门
    HomeTypeNew, // 最新
    HomeTypeCare // 关注
};


@interface GCLSelectedView : UIView

/** 选中了 */
@property(nonatomic, copy)void (^selectedBlock)(HomeType type);
/** 下划线 */
@property (nonatomic, weak, readonly)UIView *underLine;
/** 设置滑动选中的按钮 */
@property(nonatomic, assign) HomeType selectedType;

@end
