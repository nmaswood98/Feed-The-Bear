//
//  FeedTheBearMainScene.h
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/29/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface FeedTheBearMainScene : SKScene <SKPhysicsContactDelegate>

-(void)foodComeingDown:(CGSize)size onLaneNumber:(int)laneNumber;
//-(void)addFood:(CGSize)size withDifficulty: (int)difficulty andPicture: (NSString *)imageName;
-(void)addbears:(CGSize)size;
-(void)setHighScoreOnLevel:(int)level;
-(void)startWithDifficulty:(int)difficulty;
-(void)addfood:(CGSize)size andLane:(int)n andPicture: (NSString *)imageName lane1:(BOOL)ll lane2:(BOOL)lll lane3:(BOOL)llll;
-(id)initWithSKScene :(CGSize)size;
-(instancetype)initWithSize:(CGSize)size;
-(void)addInvisbleButtons:(CGSize)size;
-(void)scorePlusPLus;
-(void)increaseDifficultyTo:(int)x;
- (void)bearMiss;
//-(void)bearMiss;



@property (nonatomic) SKSpriteNode *foodDown;
@property (nonatomic) int score;
@property (nonatomic) NSInteger HigherScore;
@property (nonatomic) int difficulty;
@property (nonatomic) int limitOfMisses;
@property (nonatomic) SKAction *bearGrabFail;
@property (nonatomic) SKAction *nextRound;
@property (nonatomic) SKSpriteNode *bear1;
@property (nonatomic) SKSpriteNode *bear2;
@property (nonatomic) SKSpriteNode *bear3;
@property (nonatomic) SKSpriteNode *bear4;
@property (nonatomic) SKSpriteNode *bear5;
@property (nonatomic) int misses;

@end
