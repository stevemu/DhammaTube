//
//  MyInfoPicCell.h
//  ZobreusMedical
//
//  Created by Sebastian Aguirre on 6/10/14.
//  Copyright (c) 2014 George Reyes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoPicCell : UITableViewCell

@property NSString * photoName;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@end
