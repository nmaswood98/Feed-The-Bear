//
//  FeedTheBearBlitzMode.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 4/13/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "FeedTheBearBlitzMode.h"
@interface FeedTheBearBlitzMode()

@property (nonatomic) SKSpriteNode *heart1;
@property (nonatomic) SKSpriteNode *heart2;
@property (nonatomic) SKSpriteNode *heart3;

@property (nonatomic) SKAction *levelUp ;


@end

@implementation FeedTheBearBlitzMode

-(instancetype)initWithSize:(CGSize)size{
    if (self =  [super initWithSize:size]){
        
        self.difficulty = 3;
        self.limitOfMisses = 3;
        [self addHearts:size];
        [self startWithDifficulty:self.difficulty];
        
        self.levelUp = [SKAction playSoundFileNamed:@"LevelUp.wav" waitForCompletion:NO];
        
        
        
        
    }
    return self;
}

- (void)scorePlusPLus {
    [super scorePlusPLus];
    [self setHighScoreOnLevel:2];
    
    switch (self.score) {
        case 20:
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:4];
            self.difficulty = 4;
            break;
        case 40:
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:5];
            self.difficulty = 5;
            break;
        case 60:
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
    self.heart3 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
    
    
    
    self.heart1.position = CGPointMake(xpos * 1, yPos);
    self.heart2.position = CGPointMake(xpos * 2, yPos);
    self.heart3.position = CGPointMake(xpos * 3, yPos);
    
    
    self.heart1.size = CGSizeMake(self.heart1.size.width/8, self.heart1.size.height/8);
    self.heart2.size = CGSizeMake(self.heart2.size.width/8, self.heart2.size.height/8);
    self.heart3.size = CGSizeMake(self.heart3.size.width/8, self.heart3.size.height/8);
    
    
    
    [self addChild:self.heart1];
    [self addChild:self.heart2];
    [self addChild:self.heart3];
    
    
    
    
    
    
}


-(void)bearMiss{
    [super bearMiss];
    
    switch (self.misses) {
        case 1:
            [self.heart3 removeFromParent];
            break;
        case 2:
            [self.heart2 removeFromParent];
            break;
        case 3:
            [self.heart1 removeFromParent];
            break;
       
        default:
            break;
    }
    
    
    
}






@end
