//
//  ViewController.m
//  customLayout
//
//  Created by Анастасия Рябова on 02/06/2019.
//  Copyright © 2019 Анастасия Рябова. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CustomViewCell *firstCell;
@property (nonatomic, strong) CustomViewCell *secondCell;
@property (nonatomic, strong) CustomViewCell *thirdCell;
@property (nonatomic, strong) CustomViewCell *fourCell;
@property (nonatomic, strong) CustomViewCell *fiveCell;
@property (nonatomic, strong) CustomViewCell *sixCell;
@property (nonatomic, copy) NSArray<NSLayoutConstraint *> *constraints;

@end

@implementation ViewController

int i = 0;
const float cellTopAnchor = 20.f;
const float cellBetweenAnchor = 20.f;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLayout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.firstCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.firstCell];
    self.secondCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.secondCell];
    self.thirdCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.thirdCell];
    self.fourCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.fourCell];
    self.fiveCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.fiveCell];
    self.sixCell = [[CustomViewCell alloc]init];
    [self.view addSubview:self.sixCell];
    
    
    [self.collectionView registerClass:[CustomViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class])];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.firstCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.fourCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.fiveCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.sixCell.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.constraints =
    @[
      [self.collectionView.heightAnchor constraintEqualToConstant:CGRectGetHeight(self.view.bounds)],
      [self.collectionView.widthAnchor constraintEqualToConstant:CGRectGetWidth(self.view.bounds)],
      
      [self.firstCell.heightAnchor constraintEqualToConstant:200.f],
      [self.firstCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      [self.firstCell.leadingAnchor constraintEqualToAnchor:self.secondCell.trailingAnchor constant:cellBetweenAnchor],
    
      
      [self.secondCell.heightAnchor constraintEqualToConstant:420.f],
      [self.secondCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      
      [self.thirdCell.heightAnchor constraintEqualToConstant:200.f],
      [self.thirdCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      [self.thirdCell.leadingAnchor constraintEqualToAnchor:self.secondCell.trailingAnchor constant:cellBetweenAnchor],
      [self.thirdCell.topAnchor constraintEqualToAnchor:self.firstCell.bottomAnchor constant:cellTopAnchor],
      
      [self.fourCell.heightAnchor constraintEqualToConstant:200.f],
      [self.fourCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      [self.fourCell.topAnchor constraintEqualToAnchor:self.secondCell.bottomAnchor constant:cellTopAnchor],
      
      [self.fiveCell.heightAnchor constraintEqualToConstant:200.f],
      [self.fiveCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      [self.fiveCell.topAnchor constraintEqualToAnchor:self.fourCell.bottomAnchor constant:cellTopAnchor],
      
      [self.sixCell.heightAnchor constraintEqualToConstant:420.f],
      [self.sixCell.widthAnchor constraintEqualToConstant:(CGRectGetWidth(self.view.bounds)/2)-cellBetweenAnchor/2],
      [self.sixCell.topAnchor constraintEqualToAnchor:self.thirdCell.bottomAnchor constant:cellTopAnchor],
      [self.sixCell.leadingAnchor constraintEqualToAnchor:self.fourCell.trailingAnchor constant:cellBetweenAnchor],
      ];
    
    [NSLayoutConstraint activateConstraints:self.constraints];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    i++;
    
    
    // сначала идет вторая ячейка, потом первая, потом третья
    if (i == 2)
    {
        self.firstCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.firstCell = initCell(self.firstCell);
        return self.firstCell;
        
    }
    else if (i == 1)
    {
        self.secondCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.secondCell = initCell(self.secondCell);
        return self.secondCell;
    }
    else if (i == 3)
    {
        self.thirdCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.thirdCell = initCell(self.thirdCell);
        return self.thirdCell;
    }
    else if (i == 4)
    {
        self.fourCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.fourCell = initCell(self.fourCell);
        return self.fourCell;
        
    }
    else if (i == 5)
    {
        self.fiveCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.fiveCell = initCell(self.fiveCell);
        return self.fiveCell;
    }
    else if (i == 6)
    {
        self.sixCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
        self.sixCell = initCell(self.sixCell);
        return self.sixCell;
    }
    return 0;
}

CustomViewCell* initCell(CustomViewCell* cell)
{
    cell.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:196.0/255.0 alpha:1];
    return cell;
}


@end
