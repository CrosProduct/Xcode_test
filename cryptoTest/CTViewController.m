//
//  CTViewController.m
//  cryptoTest
//
//  Created by Stephane Cros on 1/25/14.
//  Copyright (c) 2014 CrosProduct. All rights reserved.
//

#import "CTViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "BlowfishAlgorithm.h"

@interface CTViewController ()

@end

@implementation CTViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)encryptIBA:(UIButton*)sender
{
    switch (sender.tag) {
        case 0:
        {
            md5LBL.text = [self getMD5FromString:inputTF.text];
        }
            break;
            
        case 1:
        {
            blowfishLBL.text = [self getMD5FromString:inputTF.text];
        }
            break;
            
        default:
            break;
    }
}



-(NSString *)getMD5FromString:(NSString *)input{
    const char *src = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(src, strlen(src), result);
    NSString *ret = [[NSString alloc] initWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]
                      ];
    return [ret lowercaseString];
}


-(NSString *)getBlowfishFromString:(NSString *)input
{
    BlowfishAlgorithm *blowFish = [BlowfishAlgorithm new];
    [blowFish setMode:[BlowfishAlgorithm buildModeEnum:@"CBC"]];
    [blowFish setKey:@"20zE1E47BE57$51"];
    [blowFish setInitVector:@"1a2b3c4d"];
    [blowFish setupKey];
    
    NSString *plainText = input;
    NSString *cipherText = [blowFish encrypt:plainText];
    
    NSLog(@"plain-text: %@", plainText);
    NSLog(@"cipher-text: %@", cipherText);
    
    return cipherText;
}


-(NSString *)getBlowfishFromString0:(NSString *)input
{
    NSString *key = @"20zE1E47BE57$51";
    NSString *initVector = @"1a2b3c4d";
    NSString *modeString = @"CBC";
    BlowfishAlgorithm *blowFish = [BlowfishAlgorithm new];
    [blowFish setMode:[BlowfishAlgorithm buildModeEnum:modeString]];
    [blowFish setKey:key];
    [blowFish setInitVector:initVector];
    [blowFish setupKey];
    
    NSString *plainText = input;
    NSString *cipherText = [blowFish encrypt:plainText];
    
    NSLog(@"plain-text: %@", plainText);
    NSLog(@"cipher-text: %@", cipherText);
    
    return cipherText;
}

@end
