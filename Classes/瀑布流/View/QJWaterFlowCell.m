//
//  QJWaterFlowCell.m
//  UICollectionViewControllerDemo
//
//  Created by 倪庆军 on 16/3/16.
//  Copyright © 2016年 jun. All rights reserved.
//

#import "QJWaterFlowCell.h"
#import "UIImageView+WebCache.h"
#import "QJDataModel.h"

@interface QJWaterFlowCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation QJWaterFlowCell

- (void)setModel:(QJDataModel *)model
{
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"plImage"]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
