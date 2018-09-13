//
//  UIView+MASAdditions.h
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASLayoutItemAttribute.h"
#import "MASLayoutConstraintItem.h"

/**
 *	Provides constraint maker block
 *  and convenience methods for creating MASViewAttribute which are item + NSLayoutAttribute pairs
 */
@interface MAS_VIEW (MASAdditions) <MASLayoutConstraintItem>

#if TARGET_OS_IPHONE || TARGET_OS_TV

@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_leftMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_rightMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_topMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_bottomMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_leadingMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_trailingMargin;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_centerXWithinMargins;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_centerYWithinMargins;

@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuide NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideLeading NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideTrailing NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideLeft NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideRight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideTop NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideBottom NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideWidth NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideHeight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideCenterX NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_safeAreaLayoutGuideCenterY NS_AVAILABLE_IOS(11.0);

#endif

@end
