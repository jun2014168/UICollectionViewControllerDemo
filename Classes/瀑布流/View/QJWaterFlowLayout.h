//
//  QJWaterFlowLayout.h
//  UICollectionViewControllerDemo
//
//  Created by 倪庆军 on 16/3/16.
//  Copyright © 2016年 jun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QJWaterFlowLayout;

@protocol QJWaterFlowLayoutDelegate <NSObject>

/** 代理必须传入当前对象的宽高比,以方便里面进行计算 */
- (CGFloat)waterflowLayout:(QJWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;


@end

@interface QJWaterFlowLayout : UICollectionViewLayout

/** 设置距离屏幕上左下右的间距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<QJWaterFlowLayoutDelegate> delegate;

@end
