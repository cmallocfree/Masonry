//
//  NSArray+MASAdditions.h
//
//
//  Created by Daniel Hammond on 11/26/13.
//
//

#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASLayoutItemAttribute.h"

typedef NS_ENUM(NSUInteger, MASAxisType) {
    MASAxisTypeHorizontal,
    MASAxisTypeVertical
};

@interface NSArray (MASAdditions)

/**
 *  Creates a MASConstraintMaker with each item in the callee.
 *  Any constraints defined are added to the item or the appropriate owningview/superview once the block has finished executing on each item
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to each item.
 *
 *  @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void (NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with each item in the callee.
 *  Any constraints defined are added to each item or the appropriate owningview/superview once the block has finished executing on each item.
 *  If an existing constraint exists then it will be updated instead.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to each item.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_updateConstraints:(void (NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  Creates a MASConstraintMaker with each item in the callee.
 *  Any constraints defined are added to each item or the appropriate owningview/superview once the block has finished executing on each item.
 *  All constraints previously installed for the items will be removed.
 *
 *  @param block scope within which you can build up the constraints which you wish to apply to each item.
 *
 *  @return Array of created/updated MASConstraints
 */
- (NSArray *)mas_remakeConstraints:(void (NS_NOESCAPE ^)(MASConstraintMaker *make))block;

/**
 *  distribute with fixed spacing
 *
 *  @param axisType     which axis to distribute items along
 *  @param fixedSpacing the spacing between each item
 *  @param leadSpacing  the spacing before the first item and the container
 *  @param tailSpacing  the spacing after the last item and the container
 */
- (void)mas_distributeItemsAlongAxis:(MASAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;

/**
 *  distribute with fixed item size
 *
 *  @param axisType        which axis to distribute items along
 *  @param fixedItemLength the fixed length of each item
 *  @param leadSpacing     the spacing before the first item and the container
 *  @param tailSpacing     the spacing after the last item and the container
 */
- (void)mas_distributeItemsAlongAxis:(MASAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;

@end
