//
//  MASViewAttributeSpec.m
//  Masonry
//
//  Created by Craig Siemens on 2013-10-09.
//  Copyright 2013 Jonas Budelmann. All rights reserved.
//

#import "MASLayoutItemAttribute.h"

SpecBegin(MASViewAttributeSpec){
    MAS_VIEW *view;
    MASLayoutItemAttribute *viewAttribute;
}

- (void)setUp {
    view = [MAS_VIEW new];
    viewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:view layoutAttribute:NSLayoutAttributeLeft];
}

- (void)testIsEqual {
    //should return YES whe the view and layoutAttribute are the same
    MASLayoutItemAttribute *otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:viewAttribute.view layoutAttribute:viewAttribute.layoutAttribute];
    expect([viewAttribute isEqual:otherViewAttribute]).to.equal(YES);

    //should return NO when the view is different but the layoutAttribute is the same
    MAS_VIEW *otherView = [MAS_VIEW new];
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:otherView layoutAttribute:viewAttribute.layoutAttribute];
    expect([viewAttribute isEqual:otherViewAttribute]).to.equal(NO);


    //should return NO when the view is the same but the layoutAttribute is different
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:viewAttribute.view layoutAttribute:NSLayoutAttributeRight];
    expect([viewAttribute isEqual:otherViewAttribute]).to.equal(NO);

    //should return NO when the view is different and the layoutAttribute is different
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:otherView layoutAttribute:NSLayoutAttributeRight];
    expect([viewAttribute isEqual:otherViewAttribute]).to.equal(NO);

    //should return NO when non view attribute passed", ^{
    expect([viewAttribute isEqual:NSArray.new]).to.equal(NO);
}

- (void)testHashing {
    //should return the same hash when the view and layoutAttribute are the same
    MASLayoutItemAttribute *otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:viewAttribute.view layoutAttribute:viewAttribute.layoutAttribute];
    expect([viewAttribute hash]).to.equal([otherViewAttribute hash]);

    //should return a different hash when the view is different but the layoutAttribute is the same
    MAS_VIEW *otherView = [MAS_VIEW new];
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:otherView layoutAttribute:viewAttribute.layoutAttribute];
    expect([viewAttribute hash]).toNot.equal([otherViewAttribute hash]);

    //should return a different hash when the view is the same but the layoutAttribute is different
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:viewAttribute.view layoutAttribute:NSLayoutAttributeRight];
    expect([viewAttribute hash]).toNot.equal([otherViewAttribute hash]);

    //should return a different hash when the view is different and the layoutAttribute is different
    otherViewAttribute = [[MASLayoutItemAttribute alloc] initWithItem:otherView layoutAttribute:NSLayoutAttributeRight];
    expect([viewAttribute hash]).toNot.equal([otherViewAttribute hash]);
}

SpecEnd
