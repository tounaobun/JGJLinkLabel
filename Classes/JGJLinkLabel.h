//
//  JGJLinkLabel.h
//  mix
//
//  Created by Benson Tommy on 2020/6/11.
//  Copyright © 2020 JiZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickLinkHandler)(void);
typedef void(^ClickLinkGlobalHandler)(NSString *linkText);

@interface JGJLinkLabel : UILabel

/// Link text color, default color to UILabel textColor
@property (nonatomic, strong) UIColor *linkColor;

@property (nonatomic, copy) ClickLinkGlobalHandler clickLinkGlobalHandler;

/// Add link to specified text
/// @param linkText linked text with underscore
/// @param clickHandler callback called when click the linked text.
- (void)addLinkText:(NSString *)linkText clickHandler:(ClickLinkHandler)clickHandler;

@end

