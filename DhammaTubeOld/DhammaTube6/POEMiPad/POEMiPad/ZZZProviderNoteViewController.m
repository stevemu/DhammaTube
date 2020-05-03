//
//  ZZZProviderNoteViewController.m
//  ProviderNote3
//
//  Created by Qi Mu on 6/10/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//

#import "ZZZProviderNoteViewController.h"
#import "SWRevealViewController.h"

@interface ZZZProviderNoteViewController ()

@property(weak, nonatomic) IBOutlet UILabel *speciesNav;

@end

@implementation ZZZProviderNoteViewController {

  ZZZIconToDrag *iconsImageView;
  NSArray *planNav;
  NSArray *barIconLabels;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}
- (IBAction)previousIcon:(id)sender {

  [iconsImageView previousIcon];
}
- (IBAction)nextIcon:(id)sender {

  [iconsImageView nextIcon];
}

- (void)viewDidLoad {
  [super viewDidLoad];

    
    self.title = NSLocalizedString(@"PROVIDER NOTE", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    
    //[revealController panGestureRecognizer];
    //[revealController tapGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"subMenuButton_half"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;

    
  // initialization

  // icon labels
  barIconLabels = @[
    @"DNA",
    @"Assessment",
    @"Prescription",
    @"Plan & Disposition",
    @"Vitals",
    @"Labs",
    @"Pathology"
  ];

    //NSLog(@"%@", barIconLabels[3]); //debug
    
  // navigation labels, first sub for icon, second for navs
  NSArray *navLabels = @[
    @[ @"dna1", @"dna2" ], // for dna
    @[ @"asse1", @"ass2" ], // for assessment ...
    @[ @"p1", @"p2" ],
    @[ @"Plan", @"Disposition" ],
    @[ @"Vitals1", @"Vitals2" ],
    @[ @"Labs1", @"Labs2" ],
    @[ @"Pathology2", @"Pathology2" ],
  ];

  //  NSLog(@"%@", navLabels[0][1]);
    
  NSDictionary *iconToLablesDict;

  for (int i = 0; i < barIconLabels.count; i++) {
    [iconToLablesDict setValue:barIconLabels[i] forKey:navLabels[i]];
  }
    
    //test
    
    //NSLog(iconToLablesDict[@"DNA"]);

  //NSString *value = array[1][0];


  // Do any additional setup after loading the view from its nib.

  //[self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen]
  // applicationFrame]]];

  // NSLog(@"%@", self.class);

  CGRect barRect = CGRectMake(0, 120, 1024, 65);
  CGRect fieldRect = CGRectMake(
      385, 94, 10,
      10); // 10 by 10, just let it be there, the actual size does not matter

  UIView *barview = [[UIView alloc] initWithFrame:barRect];
  UIView *fieldView = [[UIView alloc] initWithFrame:fieldRect];

  // debug
  // barview.backgroundColor = [UIColor darkGrayColor];
  // fieldView.backgroundColor = [UIColor darkGrayColor];

  // create an instance of the icon image to drag

  UIImage *planHoverImage =
      [UIImage imageNamed:@"bar_icons_all_plan_hover"]; // an UIImage for
                                                        // initializing the
                                                        // IconToDrag
  // an image view
  iconsImageView = [[ZZZIconToDrag alloc] initWithImage:planHoverImage];
  iconsImageView.center = CGPointMake(385, 32); // set the image view initial
                                                // location: change when the
                                                // total number of icons changes
  iconsImageView.userInteractionEnabled = YES;
  [barview addSubview:iconsImageView]; // add the image view to the UIView

  // create an instance of the background field
  UIImage *planFieldBackgroundImage =
      [UIImage imageNamed:@"planDispositionField_small"];
  ZZZFieldBackground *backgroundFieldImageView =
      [[ZZZFieldBackground alloc] initWithImage:planFieldBackgroundImage];
  backgroundFieldImageView.center = CGPointMake(0, 0);
  // backgroundFieldImageView.backgroundColor = [UIColor grayColor];
  [fieldView addSubview:backgroundFieldImageView];

  self.fieldLabel.text = @"Plan & Disposition";
  iconsImageView.fieldLabelFromParent = self.fieldLabel;

  // planDispositionField

  [self.view addSubview:barview];
  [self.view addSubview:fieldView];
  [self.view bringSubviewToFront:self.fieldLabel];


  // deal with the content
    for (int i = 0; i < barIconLabels.count; i++) {
        if ([self.fieldLabel.text compare:[iconToLablesDict objectForKey:barIconLabels[i]]] == NSOrderedSame) {
            NSLog(@"here");
        }
    }
    

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  // test the current location for debugging
  CGPoint activePoint = [[touches anyObject] locationInView:self.view];
  NSLog(@"x: %f", activePoint.x);
  NSLog(@"y: %f", activePoint.y);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
