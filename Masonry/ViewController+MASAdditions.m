//
//  UIViewController+MASAdditions.m
//  Masonry
//
//  Created by Craig Siemens on 2015-06-23.
//
//

#import "ViewController+MASAdditions.h"

#ifdef MAS_VIEW_CONTROLLER

@implementation MAS_VIEW_CONTROLLER (MASAdditions)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (MASLayoutItemAttribute *)mas_topLayoutGuide {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.topLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}
- (MASLayoutItemAttribute *)mas_topLayoutGuideTop {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.topLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (MASLayoutItemAttribute *)mas_topLayoutGuideBottom {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.topLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

- (MASLayoutItemAttribute *)mas_bottomLayoutGuide {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (MASLayoutItemAttribute *)mas_bottomLayoutGuideTop {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (MASLayoutItemAttribute *)mas_bottomLayoutGuideBottom {
    return [[MASLayoutItemAttribute alloc] initWithItem:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

#pragma clang diagnostic pop

@end

#endif
