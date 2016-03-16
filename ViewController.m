//
//  ViewController.m
//  UICollectionViewControllerDemo
//
//  Created by 倪庆军 on 16/3/16.
//  Copyright © 2016年 jun. All rights reserved.
//

#import "ViewController.h"
#import "QJWaterFlowController.h"
#import "QJPhotoLineController.h"
#import "QJPhotoStackController.h"
#import "QJPhotoCircleController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    
}


#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height - 1, cell.frame.size.width, 1)];
        line.backgroundColor = [UIColor blackColor];
        line.alpha = 0.15f;
        [cell addSubview:line];
    }
    
    cell.textColor = [UIColor orangeColor];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"常见相册效果1（横向滑动放大）";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = @"常见相册效果2（圆形相册）";
        
    }else if (indexPath.row == 2) {
        cell.textLabel.text = @"常见相册效果3（重叠旋转相册）";
        
    }else {
        cell.textLabel.text = @"瀑布流效果";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        QJPhotoLineController *photoLineVC = [[QJPhotoLineController alloc] init];
        [self.navigationController pushViewController:photoLineVC animated:YES];
        
    }else if (indexPath.row == 1) {
        QJPhotoCircleController *photoLineVC = [[QJPhotoCircleController alloc] init];
        [self.navigationController pushViewController:photoLineVC animated:YES];
        
    }else if (indexPath.row == 2) {
        QJPhotoStackController *photoLineVC = [[QJPhotoStackController alloc] init];
        [self.navigationController pushViewController:photoLineVC animated:YES];
        
    }else {
        QJWaterFlowController *waterflowVC = [[QJWaterFlowController alloc] init];
        [self.navigationController pushViewController:waterflowVC animated:YES];
    
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
