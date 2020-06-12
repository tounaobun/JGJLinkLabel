//
//  JGJLinkLabel.m
//  mix
//
//  Created by Benson Tommy on 2020/6/11.
//  Copyright © 2020 JiZhi. All rights reserved.
//

#import "JGJLinkLabel.h"

@interface JGJLinkLabel ()

@property (nonatomic, strong) NSMutableDictionary *linkDictionary;

@end

@implementation JGJLinkLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addTapGesture];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        [self addTapGesture];
    }
    return self;
}

- (void)addTapGesture {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLink:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapGesture];
}

- (void)tapLink:(UITapGestureRecognizer *)recognizer {

    CGPoint tapLocation = [recognizer locationInView:self];

    // init text storage
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.attributedText];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];

    // init text container
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) ];
    textContainer.lineFragmentPadding  = 0;
    textContainer.maximumNumberOfLines = self.numberOfLines;
    textContainer.lineBreakMode        = self.lineBreakMode;

    [layoutManager addTextContainer:textContainer];

    CGFloat fraction = 0;
    NSUInteger characterIndex = [layoutManager characterIndexForPoint:tapLocation
                                    inTextContainer:textContainer
                                    fractionOfDistanceBetweenInsertionPoints:&fraction];
    
    for (NSString *key in self.linkDictionary.allKeys) {
        
        NSRange targetRange = [self.text rangeOfString:key];
        
        if (targetRange.location != NSNotFound && NSLocationInRange(characterIndex, targetRange)) {
            ClickLinkHandler handler = self.linkDictionary[key];
            handler();
            !self.clickLinkGlobalHandler?:self.clickLinkGlobalHandler(key);
        }
        
    }
}

- (void)addLinkText:(NSString *)linkText clickHandler:(ClickLinkHandler)clickHandler {

    
    [self.linkDictionary setValue:clickHandler?:^{} forKey:linkText]; // duplicate linkText will be overrided.

    NSMutableArray *targetRanges = @[].mutableCopy;
    for (NSString *linkText in self.linkDictionary) {
        NSRange targetRange = [self.text rangeOfString:linkText];
        if (targetRange.location != NSNotFound) {
            [targetRanges addObject:[NSValue valueWithRange:targetRange]];
        }
    }
    
    NSDictionary *attributes = @{
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
        NSForegroundColorAttributeName: self.linkColor ?: self.textColor,
    };
    
    NSMutableAttributedString *attrStr;
    if (self.attributedText) {
        attrStr = self.attributedText.mutableCopy;
    } else {
        attrStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    
    for (NSValue *range in targetRanges) {
        [attrStr addAttributes:attributes range:range.rangeValue];
    }
    self.attributedText = attrStr;
    
}


#pragma mark - Property Getters

- (NSMutableDictionary *)linkDictionary {
    
    if (!_linkDictionary) {
        _linkDictionary = @{}.mutableCopy;
    }
    return _linkDictionary;
}

@end
