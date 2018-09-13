//
//  MASViewAttribute.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASLayoutItemAttribute.h"
#import "MASLayoutConstraintItem.h"

@implementation MASLayoutItemAttribute

- (id)initWithItem:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    if ([item isKindOfClass:MAS_LAYOUT_GUIDE.class]) {
        return [self initWithView:[(MAS_LAYOUT_GUIDE *)item owningView] item:item layoutAttribute:layoutAttribute];
    } else if ([item isKindOfClass:MAS_VIEW.class]) {
        return [self initWithView:(MAS_VIEW *)item item:(MAS_VIEW *)item layoutAttribute:layoutAttribute];
    } else { // 比如item为nil
        return [self initWithView:nil item:nil layoutAttribute:layoutAttribute];
    }
}

- (id)initWithView:(MAS_VIEW *)view item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [super init];
    if (!self) return nil;
    
    _view = view;
    _item = item;
    _layoutAttribute = layoutAttribute;
    
    return self;
}

- (BOOL)isSizeAttribute {
    return self.layoutAttribute == NSLayoutAttributeWidth
        || self.layoutAttribute == NSLayoutAttributeHeight;
}

- (BOOL)isEqual:(MASLayoutItemAttribute *)viewAttribute {
    if ([viewAttribute isKindOfClass:self.class]) {
        return self.view == viewAttribute.view
            && self.layoutAttribute == viewAttribute.layoutAttribute;
    }
    return [super isEqual:viewAttribute];
}

- (NSUInteger)hash {
    return MAS_NSUINTROTATE([self.view hash], MAS_NSUINT_BIT / 2) ^ self.layoutAttribute;
}

@end
