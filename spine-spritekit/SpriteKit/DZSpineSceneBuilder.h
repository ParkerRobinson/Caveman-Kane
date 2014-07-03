//
//  DZSpineSceneBuilder.h
//  PZTool
//
//  Created by Simon Kim on 13. 10. 13..
//  Copyright (c) 2013년 DZPub.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "SpineSkeleton.h"

@interface DZSpineSceneBuilder : NSObject
@property (nonatomic) BOOL debug;
@property (nonatomic, readonly) NSString *currentAnimation;

- (SKNode *) nodeWithSkeleton:(SpineSkeleton *) skeleton animationName:(NSString *) animationName loop:(BOOL)loop;
- (SKNode *) nodeWithSkeleton:(SpineSkeleton *) skeleton animationNames:(NSArray *) animations loop:(BOOL)loop;
- (SKNode *) nodeWithSkeleton:(SpineSkeleton *) skeleton animations:(NSArray *) animations loop:(BOOL)loop;
- (void) setTextureName:(NSString *) textureName rect:(CGRect) rect forAttachmentName:(NSString *) attachmentName;
- (void)runAnimationName:(NSString *)animationName skeleton:(SpineSkeleton *)skeleton loop:(BOOL)loop;
+ (id) builder;
+ (SpineSkeleton *) loadSkeletonName:(NSString *) name scale:(CGFloat) scale;

@end
