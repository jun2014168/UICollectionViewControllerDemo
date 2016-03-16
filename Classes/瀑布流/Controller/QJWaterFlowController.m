//
//  QJWaterFlowController.m
//  UICollectionViewControllerDemo
//
//  Created by 倪庆军 on 16/3/16.
//  Copyright © 2016年 jun. All rights reserved.
//

#import "QJWaterFlowController.h"
#import "QJWaterFlowCell.h"
#import "QJDataModel.h"
#import "MJExtension.h"
#import "QJWaterFlowLayout.h"

@interface QJWaterFlowController ()<UICollectionViewDataSource, UICollectionViewDelegate,QJWaterFlowLayoutDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation QJWaterFlowController

static NSString *const ID = @"reusableCell";

#pragma mark - 私有方法，懒加载
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 加载数据
    NSArray *dataArray = [QJDataModel objectArrayWithFilename:@"data.plist"];
    [self.datas addObjectsFromArray:dataArray];
    
    QJWaterFlowLayout *layout = [[QJWaterFlowLayout alloc] init];
    layout.delegate = self;
    // 可以根据需要修改一下属性，不写默认各间距为10 列数为3列
    // layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    // layout.columnMargin = 5;
    // layout.rowMargin = 5;
    // layout.columnsCount = 3;
    
    
    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"QJWaterFlowCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    
    
}


#pragma mark - <QJWaterFlowLayoutDelegate>
- (CGFloat)waterflowLayout:(QJWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    QJDataModel *model = self.datas[indexPath.item];
    return model.h / model.w * width;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QJWaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.model = self.datas[indexPath.item];
    return cell;
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
