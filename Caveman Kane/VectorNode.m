//
//  VectorNode.m
//  Caveman Kane
//
//  Created by Parker Robinson on 7/3/14.
//  Copyright (c) 2014 Rekap Game Studios. All rights reserved.
//

#import "VectorNode.h"
#import "DZSpineSceneBuilder.h"

@implementation VectorNode
{
    NSString* currentAnimation;
    int health; int lives;
    double velX, velY, xBounds, yBounds;
    SKNode *_spineNode;
}

@synthesize _vectorSkeleton, _spineNode;

-(id)initWithSkeleton:(NSString *)skeletonName withScale:(int)scale withBuilder:(DZSpineSceneBuilder *)_builder withAnimation:(NSString *)animationName
{
    self = [super init];
    if (self) {
        health = 100;
        lives = 1;
        currentAnimation = animationName;
        _vectorSkeleton = [DZSpineSceneBuilder loadSkeletonName:skeletonName scale:scale];
        _spineNode = [_builder nodeWithSkeleton:_vectorSkeleton animationName:animationName loop:YES];
        [self addChild:_spineNode];
    }
    return self;
}

-(void)runAnimationName:(NSString *)animationName withBuilder:(DZSpineSceneBuilder *)_builder
{
    currentAnimation = animationName;
    [_builder runAnimationName:animationName skeleton:_vectorSkeleton loop:YES];
}

- (int) getHealth;
{
    return health;
}
- (void) setHealth:(int)_health;
{
    self.health = _health;
}
- (void) incHealth:(int)_health;
{
    self.health =+ _health;
}
- (int) getLives;
{
    return lives;
}
- (void) setLives:(int)_lives;
{
    self.lives = _lives;
}
- (void) incLives:(int)_lives;
{
    self.health =+ _lives;
}
- (int) getVelX;
{
    return velX;
}
- (void) setVelX:(int)_velX;
{
    self.velX = _velX;
}
- (void) incVelX:(int)_velX;
{
    self.velX =+ _velX;
}
- (int) getVelY;
{
    return velY;
}
- (void) setVelY:(int)_velY;
{
    self.velY = _velY;
}
- (void) incVelY:(int)_velY;
{
    self.velY =+ _velY;
}
- (int) getXBounds;
{
    return xBounds;
}
- (void) setXBounds:(int)_xBounds;
{
    self.xBounds = _xBounds;
}
- (int) getYBounds;
{
    return yBounds;
}
- (void) setYBounds:(int)_yBounds;
{
    self.yBounds = _yBounds;
}
- (NSString *) getCurrentAnimation;
{
    return currentAnimation;
}
@end
