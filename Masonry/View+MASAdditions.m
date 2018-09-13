//
//  UIView+MASAdditions.m
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "View+MASAdditions.h"
#import <objc/runtime.h>

@implementation MAS_VIEW (MASAdditions)

- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithItem:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithItem:self];
    constraintMaker.updateExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
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

#if TARGET_OS_IPHONE || TARGET_OS_TV

- (MASLayoutItemAttribute *)mas_leftMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeLeftMargin];
}

- (MASLayoutItemAttribute *)mas_rightMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeRightMargin];
}

- (MASLayoutItemAttribute *)mas_topMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeTopMargin];
}

- (MASLayoutItemAttribute *)mas_bottomMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeBottomMargin];
}

- (MASLayoutItemAttribute *)mas_leadingMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (MASLayoutItemAttribute *)mas_trailingMargin {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (MASLayoutItemAttribute *)mas_centerXWithinMargins {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (MASLayoutItemAttribute *)mas_centerYWithinMargins {
    return [[MASLayoutItemAttribute alloc] initWithItem:self layoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuide {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeNotAnAttribute];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideLeading {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeading];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideTrailing {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTrailing];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideLeft {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeft];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideRight {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeRight];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideTop {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideBottom {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideWidth {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeWidth];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideHeight {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeHeight];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideCenterX {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterX];
}

- (MASLayoutItemAttribute *)mas_safeAreaLayoutGuideCenterY {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterY];
}

#endif

#pragma mark - associated properties

- (id)mas_key {
    return objc_getAssociatedObject(self, @selector(mas_key));
}

- (void)setMas_key:(id)key {
    objc_setAssociatedObject(self, @selector(mas_key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
