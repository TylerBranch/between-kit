//
//  UICollectionView+I3CollectionTest.m
//  BetweenKit
//
//  Created by Stephen Fortune on 17/11/2014.
//  Copyright (c) 2014 stephen fortune. All rights reserved.
//

#import <BetweenKit/UICollectionView+I3Collection.h>


SpecBegin(UICollectionViewI3Collection)


    describe(@"I3Collection interface", ^{
        
        
        it(@"should return a UICollectionView (itself) for the collectionView", ^{
            
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
            expect([collectionView collectionView]).to.equal(collectionView);
            
        });
        
        it(@"should return on of its UICollectionViewCells for a valid point within it", ^{
            
            id collectionView = OCMPartialMock([[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 10, 10) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]]);
            
            CGPoint point = CGPointMake(5, 5);
            NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:0];
            UICollectionViewCell *cell = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
            OCMStub([collectionView indexPathForItemAtPoint:point]).andReturn(index);
            OCMStub([collectionView cellForItemAtIndexPath:index]).andReturn(cell);
            
            UIView *item = [collectionView itemAtPoint:point];
            
            expect(item).to.equal(cell);
            
        });
        
    });

SpecEnd