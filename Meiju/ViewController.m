//
//  ViewController.m
//  Meiju
//
//  Created by Qivay on 2017/8/31.
//  Copyright © 2017年 Qivay. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MJRefresh.h"
typedef NS_ENUM(NSInteger, worker){
    QVTeacher = 0,
    QVDriver,
    QVCoder
};


typedef NS_OPTIONS(NSUInteger, QVUIViewAutoresizing) {
    QVUIViewAutoresizingNone                 = 0,
    QVUIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    QVUIViewAutoresizingFlexibleWidth        = 1 << 1,
    QVUIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    QVUIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    QVUIViewAutoresizingFlexibleHeight       = 1 << 4,
    QVUIViewAutoresizingFlexibleBottomMargin = 1 << 5
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *view;
}
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    worker someWork = QVCoder;
    QVUIViewAutoresizing QVauto = (QVUIViewAutoresizingFlexibleLeftMargin | QVUIViewAutoresizingFlexibleRightMargin);
    
    
    NSLog(@"--------%lu",(unsigned long)QVauto);
    switch (someWork) {
        case 0:{
            NSLog(@"i am a teacher");
            break;
        }
        case 1:{
            NSLog(@"i am a driver");
        }
        case 2:{
            NSLog(@"i am a Coder");
        }
 
        
    }
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    
    

    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"-------下拉了");
        [_tableView.mj_header endRefreshing];
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"-------上拉了");
        [_tableView.mj_footer endRefreshing];

    }];
    

    
    
    
}
- (void)footerRefereshing
{
    
}
- (void)headerRefereshing
{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellaal"];
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellaal"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    NSLog(@"%@======%@",cell.textLabel.text,cell.detailTextLabel.text);
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
