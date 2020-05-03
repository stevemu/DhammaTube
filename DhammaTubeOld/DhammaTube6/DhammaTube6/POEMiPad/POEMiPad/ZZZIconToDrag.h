//
//  ZZZIconsToDrag.h
//  ProviderNote
//
//  Created by Qi Mu on 6/10/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZZProviderNoteViewController.h"

@interface ZZZIconToDrag : UIImageView

@property UILabel *fieldLabelFromParent;

- (id)initWithImage:(UIImage *)image;
- (void)previousIcon;
- (void)nextIcon;

@end
