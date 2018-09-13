//
//  MASViewAttribute.h
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASUtilities.h"

@protocol MASLayoutConstraintItem;

/**
 *  An immutable tuple which stores the item and the related NSLayoutAttribute.
 *  Describes part of either the left or right hand side of a constraint equation
 */
@interface MASLayoutItemAttribute : NSObject

/**
 *  The view which owns the item.
 */
@property (nonatomic, weak, readonly) MAS_VIEW *view;

/**
 *  The item which the reciever relates to. Can be a view or a layoutguide.
 */
@property (nonatomic, weak, readonly) id item; // should conform to MASLayoutConstraintItem

/**
 *  The attribute which the reciever relates to
 */
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;


/**
 *  The designated initializer.
 */
- (instancetype)initWithItem:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute;



/**
 *	Determine whether the layoutAttribute is a size attribute
 *
 *	@return	YES if layoutAttribute is equal to NSLayoutAttributeWidth or NSLayoutAttributeHeight
 */
- (BOOL)isSizeAttribute;

@end
