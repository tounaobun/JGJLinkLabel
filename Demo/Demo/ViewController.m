//
//  ViewController.m
//  Demo
//
//  Created by Benson Tommy on 2020/6/11.
//  Copyright © 2020 demo. All rights reserved.
//

#import "ViewController.h"
#import "JGJLinkLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo];
}

- (void)demo {
    
    JGJLinkLabel *linkLabel = [[JGJLinkLabel alloc] initWithFrame:CGRectMake(65, 50, [UIScreen mainScreen].bounds.size.width - 130, 0)];
    linkLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:linkLabel];
    linkLabel.numberOfLines = 0;
    linkLabel.linkColor = [UIColor redColor];
    linkLabel.text = @"By tapping ‘Register’, you have read and agree to the Terms of Use and Privacy Policy";
    
    [linkLabel addLinkText:@"Terms of Use" clickHandler:^{
        NSLog(@"Clicked Terms of Use.");
    }];
    [linkLabel addLinkText:@"Privacy Policy" clickHandler:nil];
    
    [linkLabel setClickLinkGlobalHandler:^(NSString *linkText) {
        NSLog(@"Clicked %@", linkText);
    }];
    [linkLabel sizeToFit];
}


@end
