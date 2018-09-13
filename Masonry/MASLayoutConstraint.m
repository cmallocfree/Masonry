//
//  MASLayoutConstraint.m
//  Masonry
//
//  Created by Jonas Budelmann on 3/08/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "MASLayoutConstraint.h"
#import "MASLayoutConstraintItem.h"

@implementation MASLayoutConstraint


+ (MAS_VIEW *)mas_closestCommonSuperviewBetween:(id<MASLayoutConstraintItem>)item1 and:(id<MASLayoutConstraintItem>)item2 {
    MAS_VIEW *closestCommonSuperview = nil;
    MAS_VIEW *secondViewSuperview = nil;
    if ([item2 isKindOfClass:MAS_VIEW.class]) {
        secondViewSuperview = (MAS_VIEW *)item2;
    } else if([item2 isKindOfClass:MAS_LAYOUT_GUIDE.class]) {
        secondViewSuperview = [(MAS_LAYOUT_GUIDE *)item2 owningView];
    }
    
    while (!closestCommonSuperview && secondViewSuperview) {
        MAS_VIEW *firstViewSuperview = nil;
        if ([item1 isKindOfClass:MAS_VIEW.class]) {
            firstViewSuperview = (MAS_VIEW *)item1;
        } else if([item1 isKindOfClass:MAS_LAYOUT_GUIDE.class]) {
            firstViewSuperview = [(MAS_LAYOUT_GUIDE *)item1 owningView];
        }
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}

@end
