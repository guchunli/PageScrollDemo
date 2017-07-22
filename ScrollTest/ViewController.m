//
//  ViewController.m
//  ScrollTest
//
//  Created by cheyifu on 2017/7/22.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "ViewController.h"
#import "GCLSelectedView.h"
#import "HotViewController.h"
#import "NewViewController.h"
#import "CareViewController.h"
#import "UIView+GCLFrameExtension.h"
// 屏幕宽/高
#define ALinScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ALinScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
/** 顶部选择视图 */
@property(nonatomic, assign) GCLSelectedView *selectedView;
/** UIScrollView */
@property(nonatomic, weak) UIScrollView *scrollView;
/** 最热 */
@property(nonatomic, weak) HotViewController *hotVc;
/** 最新 */
@property(nonatomic, weak) NewViewController *starVc;
/** 关注 */
@property(nonatomic, weak) CareViewController *careVc;

@end

@implementation ViewController

- (void)loadView
{
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.contentSize = CGSizeMake(ALinScreenWidth * 3, 0);
    view.backgroundColor = [UIColor whiteColor];
    // 去掉滚动条
    view.showsVerticalScrollIndicator = NO;
    view.showsHorizontalScrollIndicator = NO;
    // 设置分页
    view.pagingEnabled = YES;
    // 设置代理
    view.delegate = self;
    // 去掉弹簧效果
    view.bounces = NO;
    
    CGFloat height = ALinScreenHeight;
    
    // 添加子视图
    HotViewController *hot = [[HotViewController alloc] init];
    hot.view.frame = [UIScreen mainScreen].bounds;
    hot.view.height = height;
    [self addChildViewController:hot];
    [view addSubview:hot.view];
    _hotVc = hot;
    
    NewViewController *newStar = [[NewViewController alloc] init];
    newStar.view.frame = [UIScreen mainScreen].bounds;
    newStar.view.x = ALinScreenWidth;
    newStar.view.height = height;
    [self addChildViewController:newStar];
    [view addSubview:newStar.view];
    _starVc = newStar;
    
    CareViewController *care = [[CareViewController alloc]init];
    care.view.frame = [UIScreen mainScreen].bounds;
    care.view.x = ALinScreenWidth * 2;
    care.view.height = height;
    [self addChildViewController:care];
    [view addSubview:care.view];
    _careVc = care;
    
    self.view = view;
    self.scrollView = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_selectedView) {
        [self setupTopMenu];
    }
}

- (void)setupTopMenu
{
    // 设置顶部选择视图
    GCLSelectedView *selectedView = [[GCLSelectedView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    selectedView.x = 45;
    selectedView.width = ALinScreenWidth - 45 * 2;
    [selectedView setSelectedBlock:^(HomeType type) {
        [self.scrollView setContentOffset:CGPointMake(type * ALinScreenWidth, 0) animated:YES];
    }];
    [self.navigationController.navigationBar addSubview:selectedView];
    _selectedView = selectedView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat page = scrollView.contentOffset.x / ALinScreenWidth;
    CGFloat offsetX = scrollView.contentOffset.x / ALinScreenWidth * (self.selectedView.width * 0.5 - Home_Seleted_Item_W * 0.5 - 15);
    self.selectedView.underLine.x = 15 + offsetX;
    if (page == 1 ) {
        self.selectedView.underLine.x = offsetX + 10;
    }else if (page > 1){
        self.selectedView.underLine.x = offsetX + 5;
    }
    self.selectedView.selectedType = (int)(page + 0.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
