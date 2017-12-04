//
//  UpliftedTitleTableViewCell.m
//  celltest
//
//  Created by Adam Szabo on 2017-11-29.
//  Copyright © 2017 Adam Szabo. All rights reserved.
//

#import "UpliftedTitleTableViewCell.h"

NSString * const UpliftedTitleTableViewCellDefaultIdentifier = @"UpliftedTitleTableViewCell";

@interface UpliftedTitleTableViewCell ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) BOOL hasContraintsSetUp;

@property (nonatomic) NSMutableArray<NSLayoutConstraint *> *customContraints;

@end


@implementation UpliftedTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.titleLabel = self.textLabel;
        // uncomment this section for using custom (self-provided) UILabel
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self.contentView removeConstraints:self.customContraints];
    [self.customContraints removeAllObjects];
    
    NSDictionary * const subviews = @{@"titleLabel" : self.titleLabel};
    [self.customContraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|"
                                                                                       options:kNilOptions
                                                                                       metrics:nil
                                                                                         views:subviews]];
    [self.customContraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]-(50)-|"
                                                                                       options:kNilOptions
                                                                                       metrics:nil
                                                                                         views:subviews]];
    [self.contentView addConstraints:self.customContraints];
}

- (NSMutableArray<NSLayoutConstraint *> *)customContraints {
    if (!_customContraints) {
        _customContraints = [[NSMutableArray alloc] init];
    }
    
    return _customContraints;
}

@end
