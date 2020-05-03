//
//  ZZZIconsToDrag.m
//  ProviderNote
//
//  Created by Qi Mu on 6/10/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "ZZZIconToDrag.h"

@implementation ZZZIconToDrag {
  CGPoint currentPoint;
  CGPoint currentCenter;
  CGFloat iconsXLocation[7];
  //  ZZZProviderNoteViewController *parent;
}

- (id)initWithImage:(UIImage *)image {
  if (self = [super initWithImage:image])
    self.userInteractionEnabled = YES;

  self.userInteractionEnabled = YES;

  iconsXLocation[0] = 635;
  iconsXLocation[1] = 565;
  iconsXLocation[2] = 491;
  iconsXLocation[3] = 420;
  iconsXLocation[4] = 339;
  iconsXLocation[5] = 278;
  iconsXLocation[6] = 207;

  currentCenter.x = 385;
  currentCenter.y = 32;

  //  parent = parentPassed;
  return self;
}

- (void)refreshCenterIcon {

  CGFloat x = currentCenter.x;

  // make the current circle always in the middle when the user life the finger
  if (x <= iconsXLocation[0] || x >= 570 ) {
    currentCenter.x = 601;
  }
  if (x <= iconsXLocation[1]) {
    currentCenter.x = 531;
  }
  if (x <= iconsXLocation[2]) {
    currentCenter.x = 459;
  }
  if (x <= iconsXLocation[3]) {
    currentCenter.x = 385;
  }
  if (x <= iconsXLocation[4]) {
    currentCenter.x = 318;
  }
  if (x <= iconsXLocation[5]) {
    currentCenter.x = 243;
  }
  if (x <= iconsXLocation[6]) {
    currentCenter.x = 172;
  }

  self.center = currentCenter;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  currentPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self refreshCenterIcon];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint activePoint = [[touches anyObject] locationInView:self];

  CGPoint newPoint = CGPointMake(
      self.center.x + (activePoint.x - currentPoint.x), self.center.y);

  NSLog(@"newPoint.x: %f", newPoint.x);
  NSLog(@"newPoint.y: %f", newPoint.y);

  [self refreshIcon];

  self.center = newPoint;
  currentCenter = newPoint;
}

- (void)refreshIcon {

  CGFloat x = self.center.x;

  if (x <= iconsXLocation[0]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_dna_hover"];
    // NSLog(@"%@", parent.class);
    self.fieldLabelFromParent.text = @"DNA";
  }
  if (x <= iconsXLocation[1]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_assessment_hover"];
    self.fieldLabelFromParent.text = @"Assessment";
  }
  if (x <= iconsXLocation[2]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_prescription_hover"];
    self.fieldLabelFromParent.text = @"Prescription";
  }
  if (x <= iconsXLocation[3]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_plan_hover"];
    self.fieldLabelFromParent.text = @"Plan & Disposition";
  }
  if (x <= iconsXLocation[4]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_vitals_hover"];
    self.fieldLabelFromParent.text = @"Vitals";
  }
  if (x <= iconsXLocation[5]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_labs_hover"];
    self.fieldLabelFromParent.text = @"Labs";
  }
  if (x <= iconsXLocation[6]) {
    self.image = [UIImage imageNamed:@"bar_icons_all_pathology_hover"];
    self.fieldLabelFromParent.text = @"Pathology";
  }
}

- (void)previousIcon {
  CGPoint newCenter = currentCenter;
  newCenter.x += 70;

  currentCenter = newCenter;

  [self refreshCenterIcon];
  [self refreshIcon];
  // NSLog(@"here");
}

- (void)nextIcon {
    CGPoint newCenter = currentCenter;
    newCenter.x -= 70;
    
    currentCenter = newCenter;
    
    [self refreshCenterIcon];
    [self refreshIcon];
    // NSLog(@"here");
}

@end
