//
//  ViewController.h
//  FeedTheBear
//

//  Copyright (c) 2014 Nabhan maswood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>
#import "GADBannerView.h"
@interface ViewController : UIViewController <ADBannerViewDelegate,GADBannerViewDelegate>{

GADBannerView *bannerView_;
    

}

@end
