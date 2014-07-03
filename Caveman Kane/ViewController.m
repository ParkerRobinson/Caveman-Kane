//
//  ViewController.m
//  Caveman Kane
//
//  Created by Parker Robinson on 5/26/14.
//  Copyright (c) 2014 Rekap Game Studios. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "DZSpineScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // View with characters, weapons
    SKView * foreGround = (SKView *)self.view;
    foreGround.showsFPS = NO;
    foreGround.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * forgegroundScene = [Game sceneWithSize:foreGround.bounds.size];
    forgegroundScene.scaleMode = SKSceneScaleModeAspectFill;

    [foreGround presentScene:forgegroundScene];
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}





@end
