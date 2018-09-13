//
//  MASLayoutConstraint.h
//  Masonry
//
//  Created by Jonas Budelmann on 3/08/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "MASUtilities.h"

@protocol MASLayoutConstraintItem;

/**
 *	When you are debugging or printing the constraints attached to a view this subclass
 *  makes it easier to identify which constraints have been created via Masonry
 */
@interface MASLayoutConstraint : NSLayoutConstraint

/**
 *	a key to associate with this constraint
 */
@property (nonatomic, strong) id mas_key;


/**
 *    Finds the closest common superview between items
 *
 *    @return   returns nil if common superview could not be found
 */
+ (MAS_VIEW *)mas_closestCommonSuperviewBetween:(id<MASLayoutConstraintItem>)item1 and:(id<MASLayoutConstraintItem>)item2;

@end
