//
//  YoutubeAPICommunicator.m
//  PositionRememberingYoutubePlayer
//
//  Created by Qi Mu on 12/27/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://www.googleapis.com/youtube/v3/playlists part=snippet&channelId=UC10gOUiIlfStwK3MyC8UG0w&maxResults=50&key=AIzaSyC-kjLHrmVx__KdQ5hkjqO2j3WTo9_jYLI"] //2


#import "YoutubeAPICommunicator.h"
//#import "GTLYouTube.h"


@implementation YoutubeAPICommunicator
{
//    GTLServiceYouTube *youTubeService;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//        youTubeService = [[GTLServiceYouTube alloc] init];
//
//        youTubeService.APIKey = @"AIzaSyC-kjLHrmVx__KdQ5hkjqO2j3WTo9_jYLI";
//
//        [self channelDetails];
//
//    }
//    return self;
//}
//
//- (void) channelDetails {
//    GTLServiceYouTube *service = [[GTLServiceYouTube alloc] init];
//    service.APIKey = @"AIzaSyD6sODNn6FsqioOFFebvYlPJUGxKh7DcGM";
//    GTLQueryYouTube *query = [GTLQueryYouTube queryForChannelsListWithPart:@"contentDetails"];
//    query.forUsername = @"bauscym";
//    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
//        if (!error) {
//            GTLYouTubeChannelListResponse *items = object;
//            for (GTLYouTubeChannelListResponse * item in items){
//                NSLog(@"item: %@", item.JSON[@"contentDetails"]);
//            }
//        } else{
//            NSLog(@"%@", error);
//        }
//    }];
//}
//
//-(NSArray *)getPlaylistsForUser:(NSString *)user
//{
//
//    GTLServiceYouTube *service = youTubeService;
//
//    GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistsListWithPart:@"snippet"];
//    query.channelId = @"UC10gOUiIlfStwK3MyC8UG0w";
//    query.maxResults = 50;
//
//    GTLServiceTicket *channelListTicket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket,
//                                                                                          GTLYouTubeChannelListResponse *channelList,
//                                                                                          NSError *error) {
//
//        NSLog(@"%@", channelList);
//        NSLog(@"%@", ticket);
//
//
//    }];
////
////    NSURL *url = [NSURL URLWithString:@"https://www.googleapis.com/youtube/v3/playlists?part=snippet&channelId=UC10gOUiIlfStwK3MyC8UG0w&maxResults=50&key=AIzaSyC-kjLHrmVx__KdQ5hkjqO2j3WTo9_jYLI"];
////
//////    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
////
////    NSString *w = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
////
////    NSLog(@"%@", w);
////
//////    NSData *data = [NSData dataWithContentsOfURL:url];
//////
//////    NSLog(@"%@", data);
////
//////    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
//////
//////    NSLog(@"%@", json);
//
////    NSString *urlstring = @"http://www.googleapis.com/";
////
////    NSString *sringMore = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////
////    NSURL *url = [NSURL URLWithString:urlstring];
////
////    NSLog(@"%@", url);
////
////
////    dispatch_async(kBgQueue, ^{
////        NSData* data = [NSData dataWithContentsOfURL:url];
////
////        NSLog(@"%@", data);
////
//////        [self performSelectorOnMainThread:@selector(fetchedData:)
//////                               withObject:data waitUntilDone:YES];
////    });
////
//
//
//
//
//    return nil;
//}
//
////- (void)fetchedData:(NSData *)responseData {
////    //parse out the json data
////    NSError* error;
////    NSDictionary* json = [NSJSONSerialization
////                          JSONObjectWithData:responseData //1
////
////                          options:kNilOptions
////                          error:&error];
////
////    NSLog(@"%@", json);
////
////
//////    NSArray* latestLoans = [json objectForKey:@"loans"]; //2
//////    
//////    NSLog(@"loans: %@", latestLoans); //3
////}

@end
