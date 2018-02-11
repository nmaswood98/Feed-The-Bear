//
//  TitleScene.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/29/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "TitleScene.h"
#import "FeedTheBearMainScene.h"
#import "FeedTheBearAccelerationMode.h"
#import "FeedTheBearNormalMode.h"
#import "FeedTheBearBlitzMode.h"
#import "FeedTheBearTutorial.h"


@interface TitleScene ()

@property (nonatomic) SKSpriteNode *NormalButton;
@property (nonatomic) SKSpriteNode *BlitzButton;
@property (nonatomic) SKSpriteNode *AccelButton;
@property (nonatomic) SKSpriteNode *TutorialButton;
@property (nonatomic) SKLabelNode *highScore;


@end    

@implementation TitleScene

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        
        SKLabelNode *lab = [SKLabelNode labelNodeWithFontNamed:@"Trench-Thin"];
        lab.fontSize = 50;
        lab.text = @"Perimeter";
        lab.fontColor = [SKColor blackColor];
        self.backgroundColor = [SKColor whiteColor];
        SKSpriteNode *back;
        if (size.height == 568) {
            
        
            back = [SKSpriteNode spriteNodeWithImageNamed:@"BackWithTitle"];}
        else{
        back = [SKSpriteNode spriteNodeWithImageNamed:@"BackWithTitle1"];
            back.size = CGSizeMake(size.width, size.height);
        }
        back.position = CGPointMake(back.size.width/2, back.size.height/2);
       // back.size = CGSizeMake(size.width/2, size.height/2);
        
        [self addChild:back];
        
   
        
        
        self.NormalButton = [SKSpriteNode spriteNodeWithImageNamed:@"normal"];
        self.NormalButton.name = @"normalButton";
        
        
        self.NormalButton.size = CGSizeMake(self.NormalButton.size.width / 4, self.NormalButton.size.height / 4);
        self.BlitzButton = [SKSpriteNode spriteNodeWithImageNamed:@"Blitz"];
        self.BlitzButton.name = @"blitzButton";
        
        self.BlitzButton.size = CGSizeMake(self.BlitzButton.size.width / 4, self.BlitzButton.size.height / 4);
        self.AccelButton = [SKSpriteNode spriteNodeWithImageNamed:@"Accel"];
        self.AccelButton.name = @"accelerationButton";
        
        self.AccelButton.size = CGSizeMake(self.AccelButton.size.width / 4, self.AccelButton.size.height / 4);
        self.TutorialButton = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial"];
        self.TutorialButton.name = @"tutorialButton";
        
        self.TutorialButton.size = CGSizeMake(self.TutorialButton.size.width / 4, self.TutorialButton.size.height / 4);
        if (size.height == 568) {
            self.NormalButton.position = CGPointMake(size.width /   3.9, 325);
            self.BlitzButton.position = CGPointMake(size.width/1.3, 325);
            self.AccelButton.position = CGPointMake(size.width / 1.3, 245);
            self.TutorialButton.position = CGPointMake(size.width / 3.9, 245);
        }
        else{
            self.NormalButton.position = CGPointMake(size.width /   3.9, 305);
            self.BlitzButton.position = CGPointMake(size.width/1.3, 305);
            self.AccelButton.position = CGPointMake(size.width / 1.3, 225);
            self.TutorialButton.position = CGPointMake(size.width / 3.9, 225);
        }
       
        [self addbears:size];
        [self addInvisbleButtons:size];
        [self addChild:self.NormalButton];
        [self addChild:self.AccelButton];
        [self addChild:self.BlitzButton];
        [self addChild:self.TutorialButton];
        
    }
    
    

    
    
    
    return self;

}


-(void)pressbutton: (NSString *)imageName andimagePressName: (NSString *)imageNamepress{



}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button1"]) {
       
        [self.bear1 runAction:self.bearGrabFail];
        //[self setGoingDownLaneOnNumber:1];
    }
    else if ([node.name isEqualToString:@"button2"]){
        [self.bear2 runAction:self.bearGrabFail];
       // [self setGoingDownLaneOnNumber:2];
    }
    else if ([node.name isEqualToString:@"button3"]){
        [self.bear3 runAction:self.bearGrabFail];
        //[self setGoingDownLaneOnNumber:3];
    }
    else if ([node.name isEqualToString:@"button4"]){
        [self.bear4 runAction:self.bearGrabFail];
        //[self setGoingDownLaneOnNumber:4];
    }
    else if ([node.name isEqualToString:@"button5"]){
        [self.bear5 runAction:self.bearGrabFail];
        //[self setGoingDownLaneOnNumber:5];
    }

    
    SKTexture *normalPress = [SKTexture textureWithImageNamed:@"normalpress"];
    SKTexture *normal = [SKTexture textureWithImageNamed:@"normal"];
    SKTexture *blitz = [SKTexture textureWithImageNamed:@"Blitz"];
    SKTexture *blitzPress = [SKTexture textureWithImageNamed:@"BlitzPress"];
    SKTexture *accel = [SKTexture textureWithImageNamed:@"Accel"];
    SKTexture *accelPress = [SKTexture textureWithImageNamed:@"AccelPress"];
    SKTexture *tutorial = [SKTexture textureWithImageNamed:@"tutorial"];
    SKTexture *tutorialPress = [SKTexture textureWithImageNamed:@"tutorialClick"];
    
    SKAction *normalPlay = [SKAction animateWithTextures:@[normalPress,normal] timePerFrame:.1];
    SKAction *blitzPlay = [SKAction animateWithTextures:@[blitzPress,blitz] timePerFrame:.1];
    SKAction *accelPlay = [SKAction animateWithTextures:@[accelPress,accel] timePerFrame:.1];
    SKAction *tutorialPlay = [SKAction animateWithTextures:@[tutorialPress,tutorial] timePerFrame:.1];
    
    SKAction *wait = [SKAction waitForDuration:.2];
    
    SKAction *runNormal = [SKAction runBlock:^(void){FeedTheBearNormalMode *scene = [FeedTheBearNormalMode sceneWithSize:self.size]; [self.view presentScene:scene];}];
    SKAction *runBlitz = [SKAction runBlock:^(void){FeedTheBearBlitzMode *scene = [FeedTheBearBlitzMode sceneWithSize:self.size]; [self.view presentScene:scene];}];
    SKAction *runAccel = [SKAction runBlock:^(void){FeedTheBearAccelerationMode *scene = [FeedTheBearAccelerationMode sceneWithSize:self.size]; [self.view presentScene:scene];}];
     SKAction *runTutorial = [SKAction runBlock:^(void){FeedTheBearTutorial *scene = [FeedTheBearTutorial sceneWithSize:self.size]; [self.view presentScene:scene];}];

    
    
    SKAction *runNormalAnimation = [SKAction runBlock:^(void){[self.NormalButton runAction:normalPlay];}];
    SKAction *runBlitzAnimation = [SKAction runBlock:^(void){[self.BlitzButton runAction:blitzPlay];}];
    SKAction *runAccelAnimation = [SKAction runBlock:^(void){[self.AccelButton runAction:accelPlay];}];
    SKAction *runTutorialAnimation = [SKAction runBlock:^(void){[self.TutorialButton runAction:tutorialPlay];}];
    
    SKAction *normalMode = [SKAction sequence:@[runNormalAnimation,wait,runNormal]];
    SKAction *blitzMode = [SKAction sequence:@[runBlitzAnimation,wait,runBlitz]];
    SKAction *accelMode = [SKAction sequence:@[runAccelAnimation,wait,runAccel]];
    SKAction *tutorialMode = [SKAction sequence:@[runTutorialAnimation,wait,runTutorial]];
    
    if ([node.name isEqualToString:@"normalButton"]) {
        [self runAction:normalMode];
        }
    else if ([node.name isEqualToString:@"blitzButton"]){
      [self runAction:blitzMode];
    
    }
    else if([node.name isEqualToString:@"accelerationButton"]){
       [self runAction:accelMode];
    }
    else if([node.name isEqualToString:@"tutorialButton"]){
    [self runAction:tutorialMode];
    
    
    }



}

@end
