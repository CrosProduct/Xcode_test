//
//  CTViewController.h
//  cryptoTest
//
//  Created by Stephane Cros on 1/25/14.
//  Copyright (c) 2014 CrosProduct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTViewController : UIViewController{
    IBOutlet UILabel *md5LBL, *blowfishLBL;
    IBOutlet UITextField *inputTF;
}

-(IBAction)encryptIBA:(UIButton*)sender;

@end
