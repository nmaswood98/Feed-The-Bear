//
//  FeedTheBearTutorial.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 4/15/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "FeedTheBearTutorial.h"
#import "TitleScene.h"


@interface FeedTheBearTutorial()

@property (nonatomic) BOOL y;


@end

@implementation FeedTheBearTutorial

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]){
        
        
        SKSpriteNode *back;
        if(self.size.height == 568){
            back = [SKSpriteNode spriteNodeWithImageNamed:@"how1"];}
        else{
             back = [SKSpriteNode spriteNodeWithImageNamed:@"how11"];
        }
        back.size = CGSizeMake(size.width, size.height);
       // if (self.size.height > 560) {
            back.position = CGPointMake(size.width/2,size.height/2);
      //  }
       // else{
         //   back.position = CGPointMake(size.width/2,size.height/2 );
       // }
        
        self.y = YES;
        [self addChild:back];
        
        
        
    }
    return self;
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  
    if (self.y) {
        SKSpriteNode *back2;
        if(self.size.height == 568){
            back2 = [SKSpriteNode spriteNodeWithImageNamed:@"How2"];}
        else{
            back2 = [SKSpriteNode spriteNodeWithImageNamed:@"How22"];
        }
    
        back2.size = CGSizeMake(self.size.width,self.size.height);
       // if (self.size.height > 560) {
            back2.position = CGPointMake(self.size.width/2,self.size.height/2);
       // }
       // else{
       //     back2.position = CGPointMake(self.size.width/2,self.size.height/2 );
      //  }
        
        [self addChild:back2];
        self.y = NO;
        
    }
    else{
        TitleScene *scene = [TitleScene sceneWithSize:self.size]; [self.view presentScene:scene];
    
    }





}

@end
