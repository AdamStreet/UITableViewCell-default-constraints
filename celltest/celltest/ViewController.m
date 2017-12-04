//
//  ViewController.m
//  celltest
//
//  Created by Adam Szabo on 2017-11-29.
//  Copyright © 2017 Adam Szabo. All rights reserved.
//

#import "ViewController.h"
#import "UpliftedTitleTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<NSString *> *titles;

@end


@implementation ViewController

#pragma mark - Initialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.titles = @[@"1", @"2", @"3"];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.titles = @[@"1", @"2", @"3"];
    }
    return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[UpliftedTitleTableViewCell class] forCellReuseIdentifier:UpliftedTitleTableViewCellDefaultIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Public methods
#pragma mark Accessors
#pragma mark Overrides
#pragma mark - Notification handlers
#pragma mark - KVO handler
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UpliftedTitleTableViewCell *cell = nil;
    if (indexPath.row % 2 != 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                               forIndexPath:indexPath];
        cell.textLabel.text = self.titles[indexPath.row];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier: UpliftedTitleTableViewCellDefaultIdentifier
                                               forIndexPath:indexPath];
        cell.titleLabel.text = self.titles[indexPath.row];
    }
    
    return cell;
}

#pragma mark - <UITableViewDelegate>


@end
