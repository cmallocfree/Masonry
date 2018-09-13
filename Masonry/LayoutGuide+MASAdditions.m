//
//  LayoutGuide+MASAdditions.m
//  Masonry iOS
//
//  Created by liupeng on 2018/9/9.
//  Copyright © 2018年 Jonas Budelmann. All rights reserved.
//

#import "LayoutGuide+MASAdditions.h"
#import <objc/runtime.h>

@implementation MAS_LAYOUT_GUIDE (MASAdditions)

- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithItem:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithItem:self];
    constraintMaker.updateExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithItem:self];
    constraintMaker.removeExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

#pragma mark - NSLayoutAttribute properties

- (MASLayoutItemAttribute *)mas_left {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeLeft];
}

- (MASLayoutItemAttribute *)mas_top {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeTop];
}

- (MASLayoutItemAttribute *)mas_right {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeRight];
}

- (MASLayoutItemAttribute *)mas_bottom {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeBottom];
}

- (MASLayoutItemAttribute *)mas_leading {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeLeading];
}

- (MASLayoutItemAttribute *)mas_trailing {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeTrailing];
}

- (MASLayoutItemAttribute *)mas_width {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeWidth];
}

- (MASLayoutItemAttribute *)mas_height {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeHeight];
}

- (MASLayoutItemAttribute *)mas_centerX {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (MASLayoutItemAttribute *)mas_centerY {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeCenterY];
}

- (MASLayoutItemAttribute *)mas_baseline {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeBaseline];
}

- (MASLayoutItemAttribute *(^)(NSLayoutAttribute))mas_attribute
{
    return ^(NSLayoutAttribute attr) {
        return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:attr];
    };
}

- (MASLayoutItemAttribute *)mas_firstBaseline {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeFirstBaseline];
}
- (MASLayoutItemAttribute *)mas_lastBaseline {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeLastBaseline];
}

#pragma mark - associated properties

- (id)mas_key {
    return objc_getAssociatedObject(self, @selector(mas_key));
}

- (void)setMas_key:(id)key {
    objc_setAssociatedObject(self, @selector(mas_key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
