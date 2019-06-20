//
//  CustomViewCell.m
//  customLayout
//
//  Created by Анастасия Рябова on 02/06/2019.
//  Copyright © 2019 Анастасия Рябова. All rights reserved.
//

#import "CustomViewCell.h"

@interface CustomViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionViewCell *cell;
@property (nonatomic,strong) UICollectionViewCell *anotherCell;

@end

@implementation CustomViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor whiteColor];

        [self.contentView addSubview:_titleLabel];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    

}

- (void)preapeForReuse
{
    [super prepareForReuse];
    
    self.titleLabel = nil;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-BookOblique" size: 30.f];
}


@end
