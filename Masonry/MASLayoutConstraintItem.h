//
//  MASLayoutConstraitItem.h
//  Masonry
//
//  Created by liupeng on 2018/9/9.
//  Copyright © 2018年 Jonas Budelmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASLayoutItemAttribute.h"

@class MASConstraintMaker;

@protocol MASLayoutConstraintItem <NSObject>

@property (nonatomic, readonly) NSMutableSet *mas_installedConstraints;

/**
 *    following properties return a new MASViewAttribute with current item and appropriate NSLayoutAttribute
 */
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_left;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_top;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_right;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_bottom;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_leading;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_trailing;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_width;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_height;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_centerX;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_centerY;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_baseline;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *(^mas_attribute)(NSLayoutAttribute attr);

@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_firstBaseline;
@property (nonatomic, strong, readonly) MASLayoutItemAttribute *mas_lastBaseline;


/**
 *    a key to associate with this item
 */
@property (nonatomic, strong) id mas_key;

/**
 *  Creates a MASConstraintMaker with the callee item.
 *  Any constraints defined are added to the item or the appropriate owningview/superview once the block has finished executing
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the item.
 *
 *  @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee item.
 *  Any constraints defined are added to the item or the appropriate owningview/superview once the block has finished executing.
 *  If an existing constraint exists then it will be updated instead.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the item.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_updateConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with the callee item.
 *  Any constraints defined are added to the item or the appropriate owningview/superview once the block has finished executing.
 *  All constraints previously installed for the view will be removed.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to the item.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_remakeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *make))block;


@end
