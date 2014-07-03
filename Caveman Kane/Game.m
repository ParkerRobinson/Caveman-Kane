//
//  Game.m
//  Caveman Kane
//
//  Created by Parker Robinson on 5/26/14.
//  Copyright (c) 2014 Rekap Game Studios. All rights reserved.
//


//To do check that thread and make it so the handleLongPress updates so if he goes past the long press it will update and go other way

#import "Game.h"
#import "DZSpineSceneBuilder.h"

static int const TICKS_PER_SECOND = 25;
static int SKIP_TICKS = 1000 / TICKS_PER_SECOND;
static int const MAX_FRAMESKIP = 10;

@implementation Game {
    DZSpineSceneBuilder *_builder;
    
    SpineSkeleton *_playerSkeleton;
    SKNode *_player;
    SKNode *_spineNode;
    double playerYBounds;
    double playerVelX;
    
    SKNode *_backgroundNode;
    SKNode *_foregroundNode;
    SKNode *_hudNode;
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        self.physicsWorld.gravity = CGVectorMake(0.0f, 0.0f);
        _builder = [DZSpineSceneBuilder builder];
        
        _backgroundNode = [self createBackgroundNode];
        [self addChild:_backgroundNode];
        
        _foregroundNode = [SKNode node];
        [self addChild:_foregroundNode];
        playerYBounds = self.size.height/10;
        _player = [self createPlayer];
        [_foregroundNode addChild:_player];

    }
    return self;
}

- (SKNode *) createBackgroundNode
{
    SKNode *backgroundNode = [SKNode node];
    SKSpriteNode *backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"BackgroundTall"];
    backgroundImage.anchorPoint = CGPointMake(0.0f, 0.0f);
    backgroundImage.position = CGPointMake(0, 0);
    [backgroundNode addChild:backgroundImage];
    return backgroundNode;
}

- (SKNode *) createPlayer
{
    _playerSkeleton = [DZSpineSceneBuilder loadSkeletonName:@"Caveman Kane" scale:0.5];
    _player = [SKNode node];
    _player.position = CGPointMake(self.size.width/2, playerYBounds);
    _spineNode = [_builder nodeWithSkeleton:_playerSkeleton animationName:@"Standing" loop:YES];
    [_player addChild:_spineNode];
    
    _player.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:3];
    _player.physicsBody.dynamic = YES;
    _player.physicsBody.allowsRotation = NO;
    _player.physicsBody.restitution = 1.0f;
    _player.physicsBody.friction = 1.0f;
    _player.physicsBody.angularDamping = 0.1f;
    _player.physicsBody.linearDamping = 0.1f;
    //_player.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    return _player;
}

- (void)didMoveToView:(SKView *)view {
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.1;
    [[self view] addGestureRecognizer:lpgr];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint LongTapPoint = [gestureRecognizer locationInView:self.view];
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        playerVelX = 0;
    }
    else if (LongTapPoint.x > _player.position.x)
    {
        playerVelX = 56/TICKS_PER_SECOND;

    }
    else if (LongTapPoint.x < _player.position.x)
    {
        playerVelX = -56/TICKS_PER_SECOND;
    }
    else
    {
        playerVelX = 0;
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)update:(CFTimeInterval)currentTime
{
    
    NSDate *referenceDate = [NSDate date];
    
    double timePassed_ms = [referenceDate timeIntervalSinceNow] * -1000.0;

    NSUInteger next_game_tick = timePassed_ms;
    int loops;
    
    bool game_is_running = true;
    if( game_is_running ) {
        
        loops = 0;
        while([referenceDate timeIntervalSinceNow] * -1000.0 > next_game_tick && loops < MAX_FRAMESKIP) {
            next_game_tick += SKIP_TICKS;
            loops++;
            [self updateGame];
        }
    }
}

-(void)updateGame
{
    [self checkCollisions];
    [self updatePlayer];
    [self updateMonsters];
    [self updateBackground];
    
}

-(void)checkCollisions
{
    
}

-(void)updatePlayer
{
    _player.position = CGPointMake(_player.position.x + playerVelX, playerYBounds);
    if (playerVelX > 0) {
        //set to false
        if([_builder.currentAnimation isEqualToString:@"Walking"] == false)
        {
           [_builder runAnimationName:@"Walking" skeleton:_playerSkeleton loop:YES];
        }
        
    
    }
    else if (playerVelX < 0)
    {
        //set flip true
        if([_builder.currentAnimation isEqualToString:@"Walking"] == false)
        {
            [_builder runAnimationName:@"Walking" skeleton:_playerSkeleton loop:YES];
        }
    }
    else
    {
        if([_builder.currentAnimation isEqualToString:@"Standing"] == false)
        {
            [_builder runAnimationName:@"Standing" skeleton:_playerSkeleton loop:YES];
        }
    }
        
    
}
-(void)updateProjectilies
{
    
}
-(void)updateMonsters
{
    //call to update their projectiles stored in them, if they have none and are dead = delete, if they are dead and have them hide them
}
-(void)updateBackground
{
    
}


@end
