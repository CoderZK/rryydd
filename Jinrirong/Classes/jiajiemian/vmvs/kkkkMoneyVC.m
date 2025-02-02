//
//  kkkkMoneyVC.m
//  Jinrirong
//
//  Created by zk on 2019/5/8.
//  Copyright © 2019 ahxb. All rights reserved.
//

#import "kkkkMoneyVC.h"
#import "XBJinRRPersonalCustomerListViewController.h"
#import "XBJinRRMyPurseViewController.h"
#import "kkkkMoneyTwoVC.h"
#import "XBJinRRLoginViewController.h"
#import "XBJinRRBaseNavigationViewController.h"
@interface kkkkMoneyVC ()
{
    NSInteger nowIndex;
}
@end


@implementation kkkkMoneyVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *token = [UDefault getObject:TOKEN];
    if (token == nil || [token isEqualToString:@""]) {
        XBJinRRLoginViewController *vc = [[XBJinRRLoginViewController alloc] init];
        XBJinRRBaseNavigationViewController *nav = [[XBJinRRBaseNavigationViewController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
        return;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    nowIndex = 0;
    self.navigationItem.title = @"推广";
    [self initTabbar];
    
}


//设置可滑动的选块
- (void )initTabbar{
    self.interceptRightSlideGuetureInFirstPage = YES;
    
    self.tabBar.itemTitleColor = [UIColor lightGrayColor];
    self.tabBar.itemTitleSelectedColor = MainColor;
    self.tabBar.itemTitleFont = FONT(17);
    self.tabBar.itemTitleSelectedFont = FONT(17);
    
    self.tabBar.itemFontChangeFollowContentScroll = YES;
    
    self.tabBar.indicatorScrollFollowContent = YES;
    self.tabBar.indicatorColor = MainColor;
    [self.tabBar setIndicatorInsets:UIEdgeInsetsMake(43, 10, 0, 1) tapSwitchAnimated:NO];
    self.loadViewOfChildContollerWhileAppear = YES;
    [self setContentScrollEnabled:NO tapSwitchAnimated:NO];
    
    [self setTabBarFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, 44) contentViewFrame:CGRectMake(0, NAV_HEIGHT+44, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_HEIGHT-44-TAB_HEIGHT)];
    
    
    [self initViewControllers];
    
}


-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    
    WS(bself);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        bself.tabBar.selectedItemIndex = self->_selectedIndex;
        self->nowIndex = self->_selectedIndex;
    });
}



-(void)didSelectViewControllerAtIndex:(NSUInteger)index{
    
    if (nowIndex==0) {
        return;
    }
    if (index==0) {
        self.tabBarController.selectedIndex = 2;
        [self.navigationController popViewControllerAnimated:NO];
    }
}
//设置子控制器
- (void)initViewControllers {
    NSMutableArray * vcArray = [[NSMutableArray alloc]init];
    
    
//    UIViewController *controller0 = [[UIViewController alloc] init];
//    controller0.yp_tabItemTitle = @"佣金产品";
//    [vcArray addObject:controller0];
    
//    XBJinRRPersonalCustomerListViewController *controller1 = [[XBJinRRPersonalCustomerListViewController alloc] init];
//    controller1.yp_tabItemTitle = @"客户列表";
//    [vcArray addObject:controller1];
    
    kkkkMoneyTwoVC*controller2 = [[kkkkMoneyTwoVC alloc] init];
    controller2.yp_tabItemTitle = @"我的钱包";
    [vcArray addObject:controller2];
    
    
    
    
    self.viewControllers = [NSMutableArray arrayWithArray:vcArray];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

