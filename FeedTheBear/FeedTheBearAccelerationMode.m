//
//  FeedTheBearAccelerationMode.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 4/14/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "FeedTheBearAccelerationMode.h"
@interface FeedTheBearAccelerationMode()

@property (nonatomic) SKSpriteNode *heart1;
@property (nonatomic) SKSpriteNode *heart2;
@property (nonatomic) SKAction *levelUp ;

@end

@implementation FeedTheBearAccelerationMode

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]){
        self.difficulty = 4;
        self.limitOfMisses = 2;
        [self addHearts:size];
        [self startWithDifficulty:self.difficulty];
        
        self.levelUp = [SKAction playSoundFileNamed:@"LevelUp.wav" waitForCompletion:NO];
        
        
        
        
    }
    return self;
}

- (void)scorePlusPLus {
    [super scorePlusPLus];
    [self setHighScoreOnLevel:3];
    
    switch (self.score) {
        case 15:
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:5];
            self.difficulty = 5;
            break;
        case 30:
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:6];
            self.difficulty = 6;
            break;
            
        default:
            break;
    }
    
    
    
    
}
-(void)addHearts: (CGSize)size{
    
    
    
    
    
    int yPos = self.size.height - 15;
    int xpos = self.size.width/18 ;
    
    self.heart1 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
    self.heart2 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];

    
    
    
    self.heart1.position = CGPointMake(xpos * 1, yPos);
    self.heart2.position = CGPointMake(xpos * 2, yPos);
   
    
    
    self.heart1.size = CGSizeMake(self.heart1.size.width/8, self.heart1.size.height/8);
    self.heart2.size = CGSizeMake(self.heart2.size.width/8, self.heart2.size.height/8);
 
    
    
    
    [self addChild:self.heart1];
    [self addChild:self.heart2];
 
    
    
    
    
    
    
}

-(void)bearMiss{
    [super bearMiss];
    
    switch (self.misses) {
        case 1:
            [self.heart2 removeFromParent];
            break;
        case 2:
            [self.heart1 removeFromParent];
            break;
       
            
        default:
            break;
    }
    
    
    
}


@end
