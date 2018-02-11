//
//  MyScene.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/29/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

static const uint32_t polarityCategory = 0x1;
static const uint32_t touchNodeCategory = 0x1 <<1;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
       
        
        
        
        CGPoint location = CGPointMake(size.width/2, size.height/2);
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"polarity"];
        
        sprite.position = location;
        sprite.size = CGSizeMake(90, 90);
        sprite.name = @"polarityNode";
        
        
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatAction:action count:4]];
        
        [self addChild:sprite];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
   
    if ([node.name isEqualToString:@"polarityNode"]) {
        [self removeAllChildren];
    }
    
   
    }
    //node.physicsBody =
        
   


        
    
        
    
    


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
