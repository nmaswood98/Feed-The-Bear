//
//  EndScene.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/31/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "EndScene.h"
#import "TitleScene.h"

@implementation EndScene


-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
       // self.backgroundColor = [SKColor darkGrayColor];
        SKSpriteNode *back;
        if (size.height == 568) {
            
        
            back = [SKSpriteNode spriteNodeWithImageNamed:@"BackGround"];}
        else{
           back = [SKSpriteNode spriteNodeWithImageNamed:@"BackGround1"];
            back.size = CGSizeMake(size.width, size.height);
        }
        // SKTexture *backs = [SKTexture textureWithImageNamed:@"help23"];
       // if(self.size.height > 560){
            back.position = CGPointMake(size.width/2,size.height/2);
       // }
       // else{
        //    back.position = CGPointMake(size.width/2,size.height/2 + 44);
            
       // }
        [self addChild:back];

        
        SKLabelNode *TitleLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        SKLabelNode *ScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        SKLabelNode *PLayAgainLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        SKLabelNode *NormalHighScore = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        SKLabelNode *BlitzHighScore = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        SKLabelNode *AccelHighScore = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];

        SKAction *playSound = [SKAction playSoundFileNamed:@"Game Quest Wrong.wav" waitForCompletion:NO];
        
        
        
        
        
    
        NSString *Swcore = [NSString stringWithFormat:@"Score: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"last_score"]];
        
        
            
        
            
            
        
        
        NormalHighScore.text = [NSString stringWithFormat:@"Normal Mode HighScore: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Normal_Mode_High_score"]];
        BlitzHighScore.text = [NSString stringWithFormat:@"Blitz HighScore: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Blitz_Mode_High_score"]];
        AccelHighScore.text = [NSString stringWithFormat:@"Acceleration Mode High Score: %li",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"Accel_Mode_High_score"]];
        
        TitleLabel.text = @"Game Over";
        ScoreLabel.text = Swcore;
        TitleLabel.color = [SKColor whiteColor];
        ScoreLabel.color = [SKColor whiteColor];
        PLayAgainLabel.color = [SKColor whiteColor];
        TitleLabel.fontSize = 50;
        ScoreLabel.fontSize = 40;
        PLayAgainLabel.fontSize = 50;
        
        NormalHighScore.fontSize = 20;
        BlitzHighScore.fontSize = 20;
        AccelHighScore.fontSize = 20;
        
        
        PLayAgainLabel.text = @"Play Again";
        
        NormalHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +155 );
        BlitzHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 + 205);
        AccelHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +105 );
        
        if(size.height == 568){
            NormalHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +155 );
            BlitzHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 + 205);
            AccelHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +105 );
        TitleLabel.position = CGPointMake(size.width/2, size.height - 130);
        ScoreLabel.position = CGPointMake(size.width/2 , size.height -170);
            PLayAgainLabel.position = CGPointMake(size.width/2, size.height - 500);}
        else{
            NormalHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +135 );
            BlitzHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 + 185);
            AccelHighScore.position = CGPointMake(self.size.width/2, self.size.height/4 +85 );
            TitleLabel.position = CGPointMake(size.width/2, size.height - 80);
            ScoreLabel.position = CGPointMake(size.width/2 , size.height -120);
            PLayAgainLabel.position = CGPointMake(size.width/2, size.height - 400);
        
        
        }
            PLayAgainLabel.name = @"button";
        
        [self addChild:NormalHighScore];
        [self addChild:BlitzHighScore];
        [self addChild:AccelHighScore];
        [self runAction:playSound];
        [self addChild:TitleLabel];
        [self addChild:ScoreLabel];
        [self addChild:PLayAgainLabel];
    }
    
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button"]) {
        
        TitleScene *scene = [TitleScene sceneWithSize:self.size];
        [self.view presentScene:scene];
    
    }
    
    
}



@end
