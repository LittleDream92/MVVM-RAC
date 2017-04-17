//
//  NMFHomeCollectionView.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/4/17.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NMFHomeViewModel;
@interface NMFHomeCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *headArray;

@property (nonatomic, strong) NSMutableArray *dataArray;


//viewModel
@property (nonatomic, strong) NMFHomeViewModel *viewModel;

@end
