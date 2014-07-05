//
//  VectorNode.h
//  Caveman Kane
//
//  Created by Parker Robinson on 7/3/14.
//  Copyright (c) 2014 Rekap Game Studios. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DZSpineSceneBuilder.h"

@interface VectorNode : SKNode

@property SpineSkeleton *_vectorSkeleton;
@property SKNode *_spineNode;


-(id)initWithSkeleton:(NSString *)skeletonName withScale:(int)scale withBuilder:(DZSpineSceneBuilder *)_builder withAnimation:(NSString *)animationName;
-(void)runAnimationName:(NSString *)animationName withBuilder:(DZSpineSceneBuilder *)_builder;
- (int) getHealth;
- (void) setHealth:(int)_health;
- (void) incHealth:(int)_health;
- (int) getLives;
- (void) setLives:(int)_lives;
- (void) incLives:(int)_lives;
- (int) getVelX;
- (void) setVelX:(int)_velX;
- (void) incVelX:(int)_velX;
- (int) getVelY;
- (void) setVelY:(int)_velY;
- (void) incVelY:(int)_velY;
- (int) getXBounds;
- (void) setXBounds:(int)_xBounds;
- (int) getYBounds;
- (void) setYBounds:(int)_yBounds;
- (NSString *) getCurrentAnimation;
@end
