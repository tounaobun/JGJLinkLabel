# JGJLinkLabel
Add link text to label and make it clickable
multiple lines are also supported.

# Support Cocoapods.
```
pod 'JGJLinkLabel'
```
# Usage:
```
    JGJLinkLabel *linkLabel = [[JGJLinkLabel alloc] init];
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
```
# Screenshot:

![alt text](https://github.com/tounaobun/JGJLinkLabel/blob/master/screenshot.png)
