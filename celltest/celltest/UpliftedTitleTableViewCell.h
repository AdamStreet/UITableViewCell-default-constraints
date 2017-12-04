//
//  UpliftedTitleTableViewCell.h
//  celltest
//
//  Created by Adam Szabo on 2017-11-29.
//  Copyright © 2017 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const UpliftedTitleTableViewCellDefaultIdentifier;

@interface UpliftedTitleTableViewCell : UITableViewCell

@property (readonly, nonatomic) UILabel *titleLabel;

@end
