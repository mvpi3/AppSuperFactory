//
//  ViewController.m
//  AppFactory
//
//  Created by alan on 2017/9/26.
//  Copyright © 2017年 alan. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+AFRefresh.h"
#import "AFBaseTableCell.h"
#import "AFBaseTableView.h"
#import "UIActivityViewController+AFExtension.h"
#import "FeedbackHelper.h"
#import "ToastMessage.h"
#import "ImagePickerHelper.h"
#import "AFCountryPickerViewController.h"
#import "LibsHeader.h"

#import "RMessageHelper.h"
#import "FeedbackHelper.h"
#import "AnyPromise+AFExtension.h"

#import "LogMacros.h"
#import "TTTAttributedLabel+AFExtension.h"
#import "AFGhostButton.h"

#import "LightBoxWrapper.h"
#import "NotificationNumberView.h"

#import "ImagePickerHelper.h"
#import "AFButtonsView.h"


@interface ViewController () <UITableViewDelegate,UITableViewDataSource,AFBaseTableViewDelegate>

@property (nonatomic,strong) AFBaseTableView *tableView;

@end

@implementation ViewController

-(void)test
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *task =
    [manager GET:@"http://soundcloud.com/oembed?url=http%3A//soundcloud.com/forss/flickermood&format=json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [task cancel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Page 1";
    
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                        target:self
                                                                                        action:@selector(test)];
    
    
    self.tableView = [[AFBaseTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView setAllDelegateTo:self];
    [self.tableView registerClass:[AFBaseTableCell class] forCellReuseIdentifier:@"123"];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView addRefreshingHeaderWithTarget:self action:@selector(test) color:[UIColor redColor]];
    [self.tableView addLoadMoreFooterWithTarget:self action:@selector(test) color:[UIColor blueColor]];

    [self.tableView setSpinnerColor:[UIColor redColor]];
    [self.tableView.refreshHeader setSpinnerColor:[UIColor redColor]];


    [self.tableView reloadData];
    
    NotificationNumberView *no  = [NotificationNumberView view];
    no.circleRadius = 10;
    no.number = 9;
    no.left = 100;
    no.top = 90;
    [self.view  addSubview:no];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView endHeaderRefreshing];
    [self.tableView endFooterRefreshing];
    self.tableView.refreshFooter.hidden = YES;
//    id cell = [tableView cellForRowAtIndexPath:indexPath];
    
//    ToastShow(INT2STR(indexPath.row));
    
//    [[ImagePickerHelper sharedInstance] showImagePickerOnViewController:self onButton:nil success:^(UIImage *image) {
//        DLog(@"ss");
//    } cancel:^{
//        DLog(@"cc");
//    }];
    
//    [RMessageHelper showOkay:@"123"];
//
//    UIButton *btn1 = [AFButtonsView createGhostButtonWithColor:[UIColor redColor] title:@"1" font:[UIFont systemFontOfSize:16] target:nil action:nil];
//    UIButton *btn2 = [AFButtonsView createButtonWithFillledColor:[UIColor blueColor] title:@"2" font:[UIFont systemFontOfSize:8] target:nil action:nil];
//
//   AFButtonsView *btnView = [AFButtonsView viewWithButtons:@[btn1,btn2]];
//    btnView.backgroundColor = [UIColor yellowColor];
//    btnView.top = 200;
//    btnView.left = 100;
//    btnView.width = 300;
//    [self.view addSubview:btnView];
    
//
//    AFCountryPickerViewController *vc = [[AFCountryPickerViewController alloc] init];
//    [vc setCellTextColor:[UIColor grayColor]];
//    [vc setSelectTintColor:[UIColor yellowColor]];
//    [self pushViewController:vc];
    
    
//    CTFeedbackViewController *vc = [FeedbackHelper showFeedbackWithAdditionalContent:@"hihihi" topics:@[@"12",@"34"] eMail:@"@123" onVC:self doneBlock:^(CTFeedbackViewController *vc) {
//        ToastShow(@"OKOKKOOK");
//    }];
//
//    vc.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor redColor];
//
//    LightboxShowFrom(view, cell);
    
//    [ImagePickerHelper checkAuthorizationWithMessage:@"try" cacnelText:@"ccc" openText:@"opop" doneBlock:^(BOOL success) {
//        ToastShow(INT2STR(success));
//    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    cell.textLabel.text = INT2STR(arc4random()%999);
//    cell.cellHighLightStyle = CellHighLightStyleNone;
    
    return cell;
}


@end
