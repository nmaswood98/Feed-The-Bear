//
//  ViewController.m
//  FeedTheBear
//
//  Created by Nabhan maswood on 3/29/14.
//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import "ViewController.h"
#import "TitleScene.h"
#import "EndScene.h"
#import "GADBannerView.h"

@implementation ViewController

#define MY_BANNER_UNIT_ID @"ca-app-pub-8459732361449811/6738658284"


// Method is called when the iAd is loaded.
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    // Creates animation.
    [UIView beginAnimations:nil context:nil];
    
    // Sets the duration of the animation to 1.
    [UIView setAnimationDuration:1];
    
    // Sets the alpha to 1.
    // We do this because we are going to have it set to 0 to start and setting it to 1 will cause the iAd to fade into view.
    [banner setAlpha:1];
    
    //  Performs animation.
    [UIView commitAnimations];
    
}

// Method is called when the iAd fails to load.
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    

    // Creates animation.
    [UIView beginAnimations:nil context:nil];
    
    // Sets the duration of the animation to 1.
    [UIView setAnimationDuration:1];
    
    // Sets the alpha to 0.
    // We do this because we are going to have it set to 1 to start and setting it to 0 will cause the iAd to fade out of view.
    [banner setAlpha:0];
    
    //  Performs animation.
    [UIView commitAnimations];
    
  
     [self.view addSubview:bannerView_];
    [bannerView_ loadRequest:[GADRequest request]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [TitleScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
   
    
    CGPoint origin = CGPointMake(0.0,
                                 self.view.frame.size.height  -
                                 CGSizeFromGADAdSize(kGADAdSizeBanner).height);
    
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner
                                                 origin:origin];
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    
    bannerView_.rootViewController = self;
    
    CGRect adFrame = adView.frame;
    adFrame.origin.y = self.view.frame.size.height-adView.frame.size.height;
    adView.frame = adFrame;
    adView.delegate =self;
    [self.view addSubview:adView];

    
        

}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    [bannerView_ removeFromSuperview];
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

-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    
    [bannerView_ removeFromSuperview];
    
}



@end
