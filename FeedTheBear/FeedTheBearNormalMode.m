//
//  FeedTheBearNormalMode.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 4/13/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "FeedTheBearNormalMode.h"

@interface FeedTheBearNormalMode ()

@property (nonatomic) SKAction *levelUp ;
@property (nonatomic) SKSpriteNode *heart1;
@property (nonatomic) SKSpriteNode *heart2;
@property (nonatomic) SKSpriteNode *heart3;
@property (nonatomic) SKSpriteNode *heart4;



@end

@implementation FeedTheBearNormalMode

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]){
        self.difficulty = 1;
        self.limitOfMisses = 4;
        SKAction *wait = [SKAction waitForDuration:1];
        SKAction *star = [SKAction runBlock:^(void){[self startWithDifficulty:self.difficulty];}];
        SKAction *seq = [SKAction sequence:@[wait,star]];
        [self runAction:seq];
        [self addHearts:size];
        self.levelUp = [SKAction playSoundFileNamed:@"LevelUp.wav" waitForCompletion:NO];
        
    
    }
    return self;
}

-(void)addHearts: (CGSize)size{
    
    
        
    
        
        int yPos = self.size.height - 15;
    int xpos = self.size.width/18 ;
    
        self.heart1 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
        self.heart2 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
        self.heart3 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
        self.heart4 = [SKSpriteNode spriteNodeWithImageNamed:@"Heart"];
    
    
    self.heart1.position = CGPointMake(xpos * 1, yPos);
    self.heart2.position = CGPointMake(xpos * 2, yPos);
    self.heart3.position = CGPointMake(xpos * 3, yPos);
    self.heart4.position = CGPointMake(xpos * 4, yPos);
    
    self.heart1.size = CGSizeMake(self.heart1.size.width/8, self.heart1.size.height/8);
    self.heart2.size = CGSizeMake(self.heart2.size.width/8, self.heart2.size.height/8);
    self.heart3.size = CGSizeMake(self.heart3.size.width/8, self.heart3.size.height/8);
    self.heart4.size = CGSizeMake(self.heart4.size.width/8, self.heart4.size.height/8);
        
        
    [self addChild:self.heart1];
    [self addChild:self.heart2];
    [self addChild:self.heart3];
    [self addChild:self.heart4];
        
    
    


}


- (void)scorePlusPLus {
    [super scorePlusPLus];
    [self setHighScoreOnLevel:1];
    switch (self.score) {
        case 5:{
            
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:2];
            self.difficulty = 2;
            break;}
            
        case 20:{
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:3];
            self.difficulty = 3;
        
            break;}
        case 30:{
        [self runAction:self.levelUp];
            [self increaseDifficultyTo:4];
            self.difficulty = 4;
        
        
            break;}
        case 45:{
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:5];
            self.difficulty = 5;
            
            break;}
            
        case 65:{
            [self runAction:self.levelUp];
            [self increaseDifficultyTo:6];
            self.difficulty = 6;
            
            break;}
            
        default:
            break;
    }


}


-(void)bearMiss{
    [super bearMiss];
    
    switch (self.misses) {
        case 1:
            [self.heart4 removeFromParent];
            break;
        case 2:
            [self.heart3 removeFromParent];
            break;
        case 3:
            [self.heart2 removeFromParent];
            break;
        case 4:
            [self.heart1 removeFromParent];
            break;
        default:
            break;
    }
    

}



@end
