//
//  QJPhotoLineCell.m
//  UICollectionViewControllerDemo
//
//  Created by 倪庆军 on 16/3/16.
//  Copyright © 2016年 jun. All rights reserved.
//

#import "QJPhotoLineCell.h"

@interface QJPhotoLineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;

@end

@implementation QJPhotoLineCell

- (void)awakeFromNib {
    self.iamgeView.layer.borderWidth = 3;
    self.iamgeView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.iamgeView.layer.cornerRadius = 3;
    self.iamgeView.clipsToBounds = YES;
}

- (void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.iamgeView.image = [UIImage imageNamed:image];
}
@end
