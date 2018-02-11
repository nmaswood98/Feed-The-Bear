//
//  FeedTheBearMainScene.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/29/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "FeedTheBearMainScene.h"
#import "EndScene.h"



@interface FeedTheBearMainScene ()
    







@property (nonatomic) SKSpriteNode *button1;
@property (nonatomic) SKSpriteNode *button2;
@property (nonatomic) SKSpriteNode *button3;
@property (nonatomic) SKSpriteNode *button4;
@property (nonatomic) SKSpriteNode *button5;
@property (nonatomic) SKSpriteNode *button;
@property (nonatomic) NSMutableDictionary *laneVars;

@property (nonatomic) SKSpriteNode *secondButton;
@property (nonatomic) SKLabelNode *Title;
@property (nonatomic) SKNode *node;
@property (nonatomic) SKNode *foodNode;
@property (nonatomic) NSString *scoreString;
@property (nonatomic) CGPoint bearloc;
@property (nonatomic) CGPoint foodloc;
@property (nonatomic) SKAction *bearGrab;

@property (nonatomic) SKAction *missFish;
@property (nonatomic)  SKAction *setYes;
@property (nonatomic) SKAction *setNo;
@property (nonatomic) SKAction *hitSound;



@property (nonatomic) BOOL goingDownLane1;
@property (nonatomic) BOOL goingDownLane2;
@property (nonatomic) BOOL goingDownLane3;
@property (nonatomic) BOOL goingDownLane4;
@property (nonatomic) BOOL goingDownLane5;




@property (nonatomic) int l;
@property (nonatomic) int l2;
@property (nonatomic) int l3;
@property (nonatomic) int lane;
@property (nonatomic) int lane2;
@property (nonatomic) int lane3;

@end

@implementation FeedTheBearMainScene
static const uint32_t bearCategory1 = 0x1;
static const uint32_t foodCategory = 0x1 << 1;
static const uint32_t nodeCategory = 0x1 << 2;
static const uint32_t buttonCategory = 0x1 <<3;
static const uint32_t foodShadow = 0x1 <<4;
static const uint32_t bearCategory2 = 0x1 <<5;
static const uint32_t bearCategory3 = 0x1 <<6;
static const uint32_t bearCategory4 = 0x1 <<7;
static const uint32_t bearCategory5 = 0x1 <<8;
static const uint32_t buttonCategory1 = 0x1 <<9;
static const uint32_t buttonCategory2 = 0x1 <<10;
static const uint32_t buttonCategory3 = 0x1 <<11;
static const uint32_t buttonCategory4 = 0x1 <<12;
static const uint32_t buttonCategory5 = 0x1 <<13;
int speed = 2;




-(void)setGoingDownLaneOnNumber: (int)x{
   
    SKAction *wait   = [SKAction waitForDuration:.2];
    
    

    switch (x) {
        case 1:
        {
            self.setYes = [SKAction runBlock:^(void){self.goingDownLane1 = YES;}];
            self.setNo = [SKAction runBlock:^(void){self.goingDownLane1 = NO;}];
        }
            break;
            
        case 2:
        {
            self.setYes = [SKAction runBlock:^(void){self.goingDownLane2 = YES;}];
            self.setNo = [SKAction runBlock:^(void){self.goingDownLane2 = NO;}];
        }
            break;
        case 3:
        {
            self.setYes = [SKAction runBlock:^(void){self.goingDownLane3 = YES;}];
            self.setNo = [SKAction runBlock:^(void){self.goingDownLane3 = NO;}];
        }
            break;
        case 4:
        {
            self.setYes = [SKAction runBlock:^(void){self.goingDownLane4 = YES;}];
            self.setNo = [SKAction runBlock:^(void){self.goingDownLane4 = NO;}];
        }
            break;
        case 5:
        {
            self.setYes = [SKAction runBlock:^(void){self.goingDownLane5 = YES;}];
            self.setNo = [SKAction runBlock:^(void){self.goingDownLane5 = NO;}];
        }
            break;
            
        default:
            break;
    }
    SKAction *seg2   = [SKAction sequence:@[self.setYes,wait,self.setNo]];
    

    [self runAction:seg2];


}




-(void)pauseEverything: (int)x{


    SKAction *wait = [SKAction waitForDuration:1.5];
    
    
    
    
    
    
    SKAction *change= [SKAction runBlock:^(void){
    
        
        
     
        switch (x) {
            case 1:
                [self.bear1 runAction:self.missFish];
                break;
            case 2:
                [self.bear2 runAction:self.missFish];
                break;
            case 3:
                [self.bear3 runAction:self.missFish];
                break;
            case 4:
                [self.bear4 runAction:self.missFish];
                break;
            case 5:
                [self.bear5 runAction:self.missFish];
                break;
            default:
                break;
        }
        
        
      
        
    
        
    
    }];
    
    
    SKAction *pause = [SKAction runBlock:^(void){
        
        [self removeChildrenInArray:@[self.foodDown,self.foodDown]];
       [self removeActionForKey:@"fishUp"];
        [self removeActionForKey:@"fish1"];
       [self removeActionForKey:@"fish2"];
        [self removeActionForKey:@"fish3"];
    
    }];
    
    
    
    SKAction *run = [SKAction runBlock:^(void){
        
        
        [self startWithDifficulty:self.difficulty];
        
    
    }];

    
    
   
    SKAction *runs = [SKAction sequence:@[pause,wait,run]];
    SKAction *aGroup = [SKAction group:@[self.hitSound,change,runs]];
    
    
    [self runAction:aGroup];

}



-(void)addInvisbleButtons:(CGSize)size{

    self. button1 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(64, 90)];
    self. button2 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(64, 90)];
    self. button3 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(64, 90)];
    self. button4 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(64, 90)];
    self. button5 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(64, 90)];
    
    self. button1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 90)];
    self. button2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 90)];
    self. button3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 90)];
    self. button4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 90)];
    self. button5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 90)];
    
    self. button1.physicsBody.categoryBitMask = buttonCategory1;
    self. button1.physicsBody.collisionBitMask = buttonCategory1;
    self. button2.physicsBody.categoryBitMask = buttonCategory2;
    self. button2.physicsBody.collisionBitMask = buttonCategory2;
    self. button3.physicsBody.categoryBitMask = buttonCategory3;
    self. button3.physicsBody.collisionBitMask = buttonCategory3;
    self. button4.physicsBody.categoryBitMask = buttonCategory4;
    self. button4.physicsBody.collisionBitMask = buttonCategory4;
    self. button5.physicsBody.categoryBitMask = buttonCategory5;
    self. button5.physicsBody.collisionBitMask = buttonCategory5;
    
    self. button1.name = @"button1";
    self. button2.name = @"button2";
    self. button3.name = @"button3";
    self. button4.name = @"button4";
    self. button5.name = @"button5";
    
    self. button1.physicsBody.dynamic = NO;
    self. button2.physicsBody.dynamic = NO;
    self. button3.physicsBody.dynamic = NO;
    self. button4.physicsBody.dynamic = NO;
    self. button5.physicsBody.dynamic = NO;

    
    
    int xPos = size.width/6;
     int yPos = 140;
    
    
    self.button1.position = CGPointMake(xPos , yPos);
    self.button2.position = CGPointMake(xPos * 2, yPos);
    self.button3.position = CGPointMake(xPos * 3, yPos);
    self.button4.position = CGPointMake(xPos * 4, yPos);
    self.button5.position = CGPointMake(xPos * 5, yPos);
    
    
    [self addChild:self.button1];
    [self addChild:self.button2];
    [self addChild:self.button3];
    [self addChild:self.button4];
    [self addChild:self.button5];




}




-(void)addbears:(CGSize)size{
    
        //animateing the bears when a fish is cought
        SKTexture *startingPosition = [SKTexture textureWithImageNamed:@"PIXEL_BEAR1"];
        SKTexture *armsHalfWay = [SKTexture textureWithImageNamed:@"PIXEL_BEAR2"];
    SKTexture *notcatch = [SKTexture textureWithImageNamed:@"PIXEL_BEAR3"];
        SKTexture *coughtFish = [SKTexture textureWithImageNamed:@"PIXEL_BEAR4"];
        SKTexture *armsWithFishComeingDown = [SKTexture textureWithImageNamed:@"PIXEL_BEAR5"];
        SKTexture *fishInMouth = [SKTexture textureWithImageNamed:@"PIXEL_BEAR6"];
        NSArray *animate = @[coughtFish,armsWithFishComeingDown,fishInMouth,armsHalfWay,startingPosition];
        self.bearGrab = [SKAction animateWithTextures:animate timePerFrame:.1];
        self.bearGrabFail = [SKAction animateWithTextures:@[notcatch,armsHalfWay,startingPosition] timePerFrame:.1];
        //setting all the bears to the main bear picture
        self.bear1 = [SKSpriteNode spriteNodeWithImageNamed:@"PIXEL_BEAR1"];
        self.bear2 = [SKSpriteNode spriteNodeWithImageNamed:@"PIXEL_BEAR1"];
        self.bear3 = [SKSpriteNode spriteNodeWithImageNamed:@"PIXEL_BEAR1"];
        self.bear4 = [SKSpriteNode spriteNodeWithImageNamed:@"PIXEL_BEAR1"];
        self.bear5 = [SKSpriteNode spriteNodeWithImageNamed:@"PIXEL_BEAR1"];
        //setting the size of all the bears
        self.bear1.size = CGSizeMake(self.bear1.size.width/8, self.bear1.size.height/8);
        self.bear2.size = CGSizeMake(self.bear2.size.width/8, self.bear2.size.height/8);
        self.bear3.size = CGSizeMake(self.bear3.size.width/8, self.bear3.size.height/8);
        self.bear4.size = CGSizeMake(self.bear4.size.width/8, self.bear4.size.height/8);
        self.bear5.size = CGSizeMake(self.bear5.size.width/8, self.bear5.size.height/8);
        //adding a physicsbody to all the bears
        self.bear1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.bear1.frame.size];
        self.bear2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.bear2.frame.size];
        self.bear3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.bear3.frame.size];
        self.bear4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.bear4.frame.size];
        self.bear5.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.bear5.frame.size];
        //assigning categories and some properties to the bears
        self.bear1.physicsBody.dynamic = NO;
        self.bear1.name = @"bear";
        self.bear1.physicsBody.categoryBitMask = bearCategory1;
        self.bear1.physicsBody.collisionBitMask = bearCategory1;
        self.bear1.physicsBody.contactTestBitMask = foodCategory;
        self.bear2.physicsBody.dynamic = NO;
        self.bear2.name = @"bear";
        self.bear2.physicsBody.categoryBitMask = bearCategory2;
        self.bear2.physicsBody.collisionBitMask = bearCategory2;
        self.bear2.physicsBody.contactTestBitMask = foodCategory;
        self.bear3.physicsBody.dynamic = NO;
        self.bear3.name = @"bear";
        self.bear3.physicsBody.categoryBitMask = bearCategory3;
        self.bear3.physicsBody.collisionBitMask = bearCategory3;
        self.bear3.physicsBody.contactTestBitMask = foodCategory;
        self.bear4.physicsBody.dynamic = NO;
        self.bear4.name = @"bear";
        self.bear4.physicsBody.categoryBitMask = bearCategory4;
        self.bear4.physicsBody.collisionBitMask = bearCategory4;
        self.bear4.physicsBody.contactTestBitMask = foodCategory;
        self.bear5.physicsBody.dynamic = NO;
        self.bear5.name = @"bear";
        self.bear5.physicsBody.categoryBitMask = bearCategory5;
        self.bear5.physicsBody.collisionBitMask = bearCategory5;
        self.bear5.physicsBody.contactTestBitMask = foodCategory;
        //setting the position of the bears
        int xPos = size.width/6;
        int yPos = 140;
        self.bear1.position = CGPointMake(xPos, yPos);
        self.bear2.position = CGPointMake(xPos * 2, yPos);
        self.bear3.position = CGPointMake(xPos * 3, yPos);
        self.bear4.position = CGPointMake(xPos * 4, yPos);
        self.bear5.position = CGPointMake(xPos * 5, yPos);
        //adding all the bears to the view
        [self addChild:self.bear1];
        [self addChild:self.bear2];
        [self addChild:self.bear3];
        [self addChild:self.bear4];
        [self addChild:self.bear5];
    
        
    
}



        




-(void)addfood:(CGSize)size andLane:(int)n andPicture: (NSString *)imageName lane1:(BOOL)ll lane2:(BOOL)lll lane3:(BOOL)llll{
    SKSpriteNode *food = [SKSpriteNode spriteNodeWithImageNamed:imageName];
    
    food.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:13.500000];
    
    food.size = CGSizeMake(food.size.width/15,food.size.height/15);
    food.physicsBody.restitution = 1;
    food.physicsBody.linearDamping = 0;
    food.physicsBody.categoryBitMask = foodShadow;
    food.physicsBody.collisionBitMask = foodShadow;
  
    
    
    int xPos;
    int yPos;
    
    
    
    
    
    
    switch (n) {
        case 0:
            
            xPos = size.width/6;
            yPos = 190;
            food.position = CGPointMake(xPos, yPos);
           
            if (lll) {
               // self.lane2 = arc4random_uniform(5);
                [self setL2:1];
            } 
            else if (ll){
              //  self.lane = arc4random_uniform(5);
                [self setL:1];
            }
            else if (llll){
                //self.lane3 = arc4random_uniform(5);
                [self setL3:1];
            }
            
            
            break;
            
        case 1:
            
            xPos = size.width/6 * 2;
            yPos = 190;
            food.position = CGPointMake(xPos, yPos);
            
            if (lll) {
                //self.lane2 = arc4random_uniform(5);
                [self setL2:2];
            }
            else if (ll){
               // self.lane = arc4random_uniform(5);
                [self setL:2];
            }
            else if (llll){
                //self.lane3 = arc4random_uniform(5);
                [self setL3:2];
            }
            break;
        case 2:
            
            xPos = size.width/6 * 3;
            yPos = 190;
            food.position = CGPointMake(xPos, yPos);
           
            
            if (lll) {
               // self.lane2 = arc4random_uniform(5);
                [self setL2:3];
            }
            else if (ll){
               // self.lane = arc4random_uniform(5);
                [self setL:3];
            }
            else if (llll){
               // self.lane3 = arc4random_uniform(5);
                [self setL3:3];
            }
            break;
        case 3:
            
            xPos = size.width/6 * 4;
            yPos = 190;
            food.position = CGPointMake(xPos, yPos);
            
            if (lll) {
               // self.lane2 = arc4random_uniform(5);
                [self setL2:4];
            }
            else if (ll){
               // self.lane = arc4random_uniform(5);
                [self setL:4];
            }
            else if (llll){
                //self.lane3 = arc4random_uniform(5);
                [self setL3:4];
            }
            break;
        case 4:
            
            xPos = size.width/6 * 5;
            yPos = 190;
            food.position = CGPointMake(xPos, yPos);
           
            
            if (lll) {
               // self.lane2 = arc4random_uniform(5);
                [self setL2:5];
            }
            else if (ll){
               // self.lane = arc4random_uniform(5);
                [self setL:5];
            }
            else if (llll){
                //self.lane3 = arc4random_uniform(5);
                [self setL3:5];
            }
            break;
            
            
            
        default:
            break;
    }
    
    [self addChild:food];
    
    CGVector push = CGVectorMake(0, 11);
    [food.physicsBody applyImpulse:push];





}

-(void)foodComeingDown:(CGSize)size onLaneNumber:(int)laneNumber{
    //adds the food comeing down to the bears
    self.foodDown = [SKSpriteNode spriteNodeWithImageNamed:@"fish"];
    self.foodDown.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.foodDown.size.width/8, self.foodDown.size.height/8)];
    self.foodDown.size = CGSizeMake(self.foodDown.size.width/8, self.foodDown.size.height/8);
    self.foodDown.physicsBody.restitution = 1;
    self.foodDown.physicsBody.linearDamping = 0;
    self.foodDown.physicsBody.categoryBitMask = foodCategory;
    self.foodDown.physicsBody.collisionBitMask = foodCategory;
    self.foodDown.physicsBody.contactTestBitMask = bearCategory1 | bearCategory2 | bearCategory3 | bearCategory4 | bearCategory5;
    int xPos;
    int yPos;
    
    
    switch (laneNumber) {
        case 1:
            xPos = size.width/6;
            yPos = size.height;
            self.foodDown.position = CGPointMake(xPos, yPos);
            break;
        case 2:
            xPos = size.width/6 * 2;
            yPos = size.height;
            self.foodDown.position = CGPointMake(xPos, yPos);
            break;
        case 3:
            xPos = size.width/6 * 3;
            yPos = size.height;
            self.foodDown.position = CGPointMake(xPos, yPos);
            break;
        case 4:
            xPos = size.width/6 * 4;
            yPos = size.height;
            self.foodDown.position = CGPointMake(xPos, yPos);
            break;
        case 5:
            xPos = size.width/6 * 5;
            yPos = size.height;
            self.foodDown.position = CGPointMake(xPos, yPos);
            break;
            
        default:
            break;
    }
    

    
    
    [self addChild:self.foodDown];
       CGVector push = CGVectorMake(0,-13);
    [self.foodDown.physicsBody applyImpulse:push];
    

}



- (void)scorePlusPLus {
    
    self.score++;
    self.scoreString = [NSString stringWithFormat:@"%i",self.score];
    self.Title.text = self.scoreString;
   
   
    //checks if the score is higher than the highscore if it is then it set the highscore as the current score
   
}

- (void)bearMiss {
    
    
    self.misses++;
    if (self.misses >= self.limitOfMisses) {
        [[NSUserDefaults standardUserDefaults] setInteger:self.score forKey:@"last_score"];
        EndScene *end = [EndScene sceneWithSize:self.size];
        [self.view presentScene:end];
        
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
   
    SKPhysicsBody *food;
    
   
    
    
    
        
        SKTexture *bearHIt = [SKTexture textureWithImageNamed:@"PIXEL_BEAR7"];
        SKTexture *regBear = [SKTexture textureWithImageNamed:@"PIXEL_BEAR1"];
        NSArray *missAnimate = @[bearHIt,regBear];
        self.missFish = [SKAction animateWithTextures:missAnimate timePerFrame:1.5];
    
    
   
    
    
    
    SKLabelNode *scoreLabel= [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    NSString *scorestiring = [NSString stringWithFormat:@"%i",self.score +1];
    
    scoreLabel.fontColor = [SKColor blueColor];
    scoreLabel.fontSize = 10;
    scoreLabel.position = CGPointMake(320/2, 480-10);
    scoreLabel.text =scorestiring ;

    switch (contact.bodyB.categoryBitMask) {
        case foodCategory:
            food= contact.bodyB;
            [food.node removeFromParent];
            //checks if hit is true which is made true for .1 seconds when user taps underneath a bear
            //it then increases the score by 1
            
            break;
            
        case buttonCategory:
            
            
            break;
            
        case nodeCategory:
            
            break;
            
        default:
            
        
            break;
    }
    
    switch (contact.bodyA.categoryBitMask) {
        case bearCategory1:
        
            if(self.goingDownLane1){
            [self.bear1 runAction:self.bearGrab];
                [self scorePlusPLus];
            }
            else{
                [self bearMiss];
                [self pauseEverything:1];
               
            
                
            }
        
            break;
            
        case buttonCategory:
            
            
            break;
            
        case nodeCategory:
            
            
            break;
            
        case bearCategory2:
            if(self.goingDownLane2){
            [self.bear2 runAction:self.bearGrab];
                [self scorePlusPLus];
            }
            else{
                [self bearMiss];
                [self pauseEverything:2];
             
            }
            break;
            
        case bearCategory5:
            if(self.goingDownLane5){
            [self.bear5 runAction:self.bearGrab];
                [self scorePlusPLus];
            }
            else{
                [self bearMiss];
                [self pauseEverything:5];
             
            }
            break;
        case bearCategory4:
            if(self.goingDownLane4){
            [self.bear4 runAction:self.bearGrab];
                [self scorePlusPLus];
            }
            else{
                [self bearMiss];
                [self pauseEverything:4];
        
            }
            break;
            
        case bearCategory3:
            if(self.goingDownLane3){
            [self.bear3 runAction:self.bearGrab];
                [self scorePlusPLus];
            }
            else{
                [self bearMiss];
                [self pauseEverything:3];
            
            }
            break;
            
        default:
            
        
            break;
    }

    [self addChild:scoreLabel];
    [scoreLabel removeFromParent];
    

}

-(void)setHighScoreOnLevel:(int)level{

     self.HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"high_score"];
   // NSInteger currentScore = self.score;
    switch (level) {
        case 1:{
            self.HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Normal_Mode_High_score"];
            
            if (self.score > self.HigherScore) {
                
                [[NSUserDefaults standardUserDefaults] setInteger:self.score forKey:@"Normal_Mode_High_score"];
                
            }
            
            
            break;}
        case 2:{
            self.HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Blitz_Mode_High_score"];
            
            if (self.score > self.HigherScore) {
                
                [[NSUserDefaults standardUserDefaults] setInteger:self.score forKey:@"Blitz_Mode_High_score"];
                
            }
            
            
            break;}
        case 3:{
            self.HigherScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"Accel_Mode_High_score"];
            
            if (self.score > self.HigherScore) {
                
                [[NSUserDefaults standardUserDefaults] setInteger:self.score forKey:@"Accel_Mode_High_score"];
                
            }
            
            
            break;}
            
        default:
            break;
    }
    
    


}



- (void)startWithDifficulty:(int)difficulty {
   
    
    //SKAction *wait2 = [SKAction waitForDuration:];
    SKAction *wait2;
    SKAction *wait;
  
    
    SKAction *foodGoingUp = [SKAction runBlock:^(void){self.lane = arc4random_uniform(5);[self addfood:self.size andLane:self.lane andPicture:@"SALMON44" lane1:YES lane2:NO lane3:NO];}];
    SKAction *foodGoingUp2 = [SKAction runBlock:^(void){
        self.lane2 = arc4random_uniform(5);
        
        if(self.lane2 == self.lane){
            if(self.lane2-1 < 1){
                self.lane2++;
            }
            else{
                self.lane2--;
            }};
        
        [self addfood:self.size andLane:self.lane2 andPicture:@"SALMON44" lane1:NO lane2:YES lane3:NO];
    }];
    SKAction *foodGoingUp3 = [SKAction runBlock:^(void){self.lane3 = arc4random_uniform(5);
        if(self.lane3 == self.lane2){
        if(self.lane3-1 < 1){
            self.lane3++;
        }
        else{
            self.lane3--;
        }};
[self addfood:self.size andLane:self.lane3 andPicture:@"SALMON44" lane1:NO lane2:NO lane3:YES];}];
    
    SKAction *foodGoingDown = [SKAction runBlock:^(void){[self foodComeingDown:self.size onLaneNumber:self.l];}];
    SKAction *foodGoingDown2 = [SKAction runBlock:^(void){[self foodComeingDown:self.size onLaneNumber:self.l2];}];
    SKAction *foodGoingDown3 = [SKAction runBlock:^(void){[self foodComeingDown:self.size onLaneNumber:self.l3];}];
    

    
    SKAction *gro;
    
    switch (difficulty) {
        case 1:{
            wait = [SKAction waitForDuration:2];
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown]];
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            
             gro = [SKAction sequence:@[run1]];
            break;}
        case 2:{
            wait = [SKAction waitForDuration:1 ];
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown,wait]];
            SKAction *seq2 = [SKAction sequence:@[foodGoingUp2,wait,foodGoingDown2,wait]];
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *repeat2 = [SKAction repeatActionForever:seq2];
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            SKAction *run2 = [SKAction runBlock:^(void){[self runAction:repeat2 withKey:@"fish2"];}];


            gro = [SKAction sequence:@[run1,wait,run2]];
            break;}
        case 3:{
            wait2 = [SKAction waitForDuration:1.5];
            wait = [SKAction waitForDuration:1 ];
       

            
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown,wait]];
            SKAction *seq2 = [SKAction sequence:@[foodGoingUp2,wait,foodGoingDown2,wait]];
            SKAction *seq3 = [SKAction sequence:@[foodGoingUp3,wait,foodGoingDown3,wait]];
            
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *repeat2 = [SKAction repeatActionForever:seq2];
            SKAction *repeat3 = [SKAction repeatActionForever:seq3];
            
            
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            SKAction *run2 = [SKAction runBlock:^(void){[self runAction:repeat2 withKey:@"fish2"];}];
            SKAction *run3 = [SKAction runBlock:^(void){[self runAction:repeat3 withKey:@"fish3"];}];
            
            
        gro = [SKAction sequence:@[run1,wait,run3,wait2,run2]];
            
        
            break;}
        case 4:{
            wait2 = [SKAction waitForDuration:1.5];
            wait = [SKAction waitForDuration:1 ];
            SKAction *wait3 = [SKAction waitForDuration:.7];
            
            
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown,wait]];
            SKAction *seq2 = [SKAction sequence:@[foodGoingUp2,wait,foodGoingDown2,wait]];
            SKAction *seq3 = [SKAction sequence:@[foodGoingUp3,wait,foodGoingDown3,wait3]];
            
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *repeat2 = [SKAction repeatActionForever:seq2];
            SKAction *repeat3 = [SKAction repeatActionForever:seq3];
            
            
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            SKAction *run2 = [SKAction runBlock:^(void){[self runAction:repeat2 withKey:@"fish2"];}];
            SKAction *run3 = [SKAction runBlock:^(void){[self runAction:repeat3 withKey:@"fish3"];}];
            
            
            gro = [SKAction sequence:@[run1,wait,run3,wait2,run2]];

            
            break;}
            
            
        case 5:{
            wait2 = [SKAction waitForDuration:1.5];
            wait = [SKAction waitForDuration:1 ];
            SKAction *wait3 = [SKAction waitForDuration:.7];
            
            
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown,wait]];
            SKAction *seq2 = [SKAction sequence:@[foodGoingUp2,wait,foodGoingDown2,wait3]];
            SKAction *seq3 = [SKAction sequence:@[foodGoingUp3,wait,foodGoingDown3,wait3]];
            
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *repeat2 = [SKAction repeatActionForever:seq2];
            SKAction *repeat3 = [SKAction repeatActionForever:seq3];
            
            
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            SKAction *run2 = [SKAction runBlock:^(void){[self runAction:repeat2 withKey:@"fish2"];}];
            SKAction *run3 = [SKAction runBlock:^(void){[self runAction:repeat3 withKey:@"fish3"];}];
            
            
            gro = [SKAction sequence:@[run1,wait,run3,wait2,run2]];
            
            
            
        break;}
            
        case 6:{
            wait2 = [SKAction waitForDuration:1.5];
            wait = [SKAction waitForDuration:1 ];
            
            
            SKAction *seq = [SKAction sequence:@[foodGoingUp,wait,foodGoingDown]];
            SKAction *seq2 = [SKAction sequence:@[foodGoingUp2,wait,foodGoingDown2]];
            SKAction *seq3 = [SKAction sequence:@[foodGoingUp3,wait,foodGoingDown3]];
            
            SKAction *repeat = [SKAction repeatActionForever:seq];
            SKAction *repeat2 = [SKAction repeatActionForever:seq2];
            SKAction *repeat3 = [SKAction repeatActionForever:seq3];
            
            
            SKAction *run1 = [SKAction runBlock:^(void){[self runAction:repeat withKey:@"fish1"];}];
            SKAction *run2 = [SKAction runBlock:^(void){[self runAction:repeat2 withKey:@"fish2"];}];
            SKAction *run3 = [SKAction runBlock:^(void){[self runAction:repeat3 withKey:@"fish3"];}];
            
            
            gro = [SKAction sequence:@[run1,wait,run3,wait2,run2]];
            
            
            break;}
            
        default:
            break;
    }
    
    
    
    
    [self runAction: gro withKey:@"fishUp"];
    
    
    
}

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]){
        
        self.hitSound = [SKAction playSoundFileNamed:@"hud.caf" waitForCompletion:NO];
        self.backgroundColor = [SKColor whiteColor];
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
      //  SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"BackGround"];
        SKSpriteNode *back;
        if (size.height == 568) {
            
            
            back = [SKSpriteNode spriteNodeWithImageNamed:@"BackGround"];}
        else{
            
            back = [SKSpriteNode spriteNodeWithImageNamed:@"BackGround1"];
            back.size = CGSizeMake(size.width, size.height);
        }

       // SKTexture *backs = [SKTexture textureWithImageNamed:@"help23"];
      //  if(self.size.height > 560){
            back.position = CGPointMake(size.width/2,size.height/2 );
      //  }
      //  else{
        //    back.position = CGPointMake(size.width/2,size.height/2 + 44);
        
        //}
        
        self.Title = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        self.Title.position = CGPointMake(size.width/2, size.height/2);
        self.Title.text = @"0";
        self.Title.fontSize = 50;
        self.Title.fontColor = [SKColor blackColor];
        
        [self addChild:back];
        //[self addChild:backsss];

     //inits someVars
        self.lane = arc4random_uniform(5);
        self.lane2 = arc4random_uniform(5);
        self.lane3 = arc4random_uniform(5);
        
       
        [self addChild:self.Title];
        //[self startWithDifficulty:self.difficulty];
        [self addbears:size];
        [self addInvisbleButtons:size];
        
        
        
        
        
        }
    return self;
}

-(instancetype)initWithSKScene :(CGSize)size{
    id hey = [super initWithSize:size];

    return hey;
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    
    self.node =[self nodeAtPoint:location];
    
  
    
    
  
   
    
    
    if ([self.node.name isEqualToString:@"button1"]) {
        [self.bear1 runAction:self.bearGrabFail];
        [self setGoingDownLaneOnNumber:1];
    }
    else if ([self.node.name isEqualToString:@"button2"]){
        [self.bear2 runAction:self.bearGrabFail];
    [self setGoingDownLaneOnNumber:2];
    }
    else if ([self.node.name isEqualToString:@"button3"]){
        [self.bear3 runAction:self.bearGrabFail];
    [self setGoingDownLaneOnNumber:3];
    }
    else if ([self.node.name isEqualToString:@"button4"]){
        [self.bear4 runAction:self.bearGrabFail];
    [self setGoingDownLaneOnNumber:4];
    }
    else if ([self.node.name isEqualToString:@"button5"]){
        [self.bear5 runAction:self.bearGrabFail];
    [self setGoingDownLaneOnNumber:5];
    }
    
}

-(void)increaseDifficultyTo:(int)x{
    SKTexture *text = [SKTexture textureWithImageNamed:@"PIXEL_BEAR1"];
    SKTexture *text3 = [SKTexture textureWithImageNamed:@"PIXEL_BEAR3"];
    NSArray *animate = @[text3];
    self.nextRound = [SKAction animateWithTextures:animate timePerFrame:2];
    SKAction *reg = [SKAction animateWithTextures:@[text] timePerFrame:.1];
    SKAction *bearsAni = [SKAction runBlock:^(void){
        [self.bear1 runAction:self.nextRound];
        [self.bear2 runAction:self.nextRound];
        [self.bear3 runAction:self.nextRound];
        [self.bear4 runAction:self.nextRound];
        [self.bear5 runAction:self.nextRound];
        
        
    }];
    
    SKAction *bearsReg = [SKAction runBlock:^(void){
        [self.bear1 runAction:reg];
        [self.bear2 runAction:reg];
        [self.bear3 runAction:reg];
        [self.bear4 runAction:reg];
        [self.bear5 runAction:reg];
        
        
    }];
    [self removeChildrenInArray:@[self.foodDown,self.foodDown]];
    [self removeActionForKey:@"fishUp"];
    [self removeActionForKey:@"fish1"];
    [self removeActionForKey:@"fish2"];
    [self removeActionForKey:@"fish3"];
    
    SKAction *wait = [SKAction waitForDuration:3];
    SKAction *change = [SKAction runBlock:^(void){[self startWithDifficulty:x];}];
    SKAction *rep = [SKAction sequence:@[bearsAni,wait,bearsReg,change]];
    
    
    [self runAction:rep];
    
}

    






@end
