//
//  YoutubeAPICommunicator.m
//  PositionRememberingYoutubePlayer
//
//  Created by Qi Mu on 12/27/14.
//  Copyright (c) 2014 Zobreus. All rights reserved.
//
//#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
//#define kLatestKivaLoansURL [NSURL URLWithString:@"http://www.googleapis.com/youtube/v3/playlists part=snippet&channelId=UC10gOUiIlfStwK3MyC8UG0w&maxResults=50&key=AIzaSyC-kjLHrmVx__KdQ5hkjqO2j3WTo9_jYLI"] //2


#import "YoutubeAPICommunicator.h"
//#import "GTLYouTube.h"

static NSString *apiKey = @"AIzaSyD6sODNn6FsqioOFFebvYlPJUGxKh7DcGM";


@implementation YoutubeAPICommunicator
/*{
    GTLServiceYouTube *youTubeService;
    NSString *apiKey;
}

- (instancetype)init
{
    self = [super init];
    if (self) {


        //reference: get channel id with a username
//        [self channelIdWithUsername:@"bauscym" completionBlock:^(NSString *val) {
//            NSLog(@"%@", val);
//
//        }];

//        [self playlistsWithChannelId:@"UC10gOUiIlfStwK3MyC8UG0w" completion:^(NSArray *titles, NSArray *playlistIds) {
//            NSLog(@"%@", titles);
//            NSLog(@"%@", playlistIds);
//
//        }];

    }
    return self;
}

+ (void) videosWithPlaylistId:(NSString *)playlistId completion:(void(^)(NSArray *, NSArray *))completion{

    GTLServiceYouTube *service = [[GTLServiceYouTube alloc] init];
    service.APIKey = apiKey;

    //get ids of those playlists

    NSString *part = @"contentDetails";

    GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistItemsListWithPart:part];

    query.maxResults = 50;
    query.playlistId = playlistId;

    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if (!error) {
            NSMutableArray *ids = [[NSMutableArray alloc] init];

            GTLYouTubeChannelListResponse *items = object;
            for (GTLYouTubeChannelListResponse * item in items){
                NSDictionary *currentItem = item.JSON[part];
                NSString *videoid = currentItem[@"videoId"];
                [ids addObject:videoid];            }

//            NSLog(@"%@", ids);

//            NSLog(@"%@", ids);

            //get titles of those playlists

            NSString* part = @"snippet";

            GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistItemsListWithPart:part];
            query.maxResults = 50;
            query.playlistId = playlistId;

            [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                if (!error) {

                    NSMutableArray *titles = [[NSMutableArray alloc] init];

                    GTLYouTubeChannelListResponse *items = object;
                    for (GTLYouTubeChannelListResponse * item in items){
                        NSDictionary *currentItem = item.JSON[part];
                        NSString *title = currentItem[@"title"];
                        [titles addObject:title];
                    }
//                                        NSLog(@"%@", titles);

                    //pass arrays back

                    completion(titles, ids);
                    
                    
                } else{
                    NSLog(@"%@", error);
                }
            }];

            
            
        } else{
            NSLog(@"%@", error);
        }
    }];
    
    
    
}

+ (void) playlistsWithChannelId:(NSString *)channelId completion:(void(^)(NSArray *, NSArray *))completion{

    GTLServiceYouTube *service = [[GTLServiceYouTube alloc] init];
    service.APIKey = apiKey;

    //get ids of those playlists

    NSString *part = @"id";

    GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistsListWithPart:part];
    query.channelId = channelId;
    query.maxResults = 50;

    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if (!error) {
            NSMutableArray *ids = [[NSMutableArray alloc] init];

            GTLYouTubeChannelListResponse *items = object;
            for (GTLYouTubeChannelListResponse * item in items){
                [ids addObject:item.JSON[part]];
            }
//            NSLog(@"%@", ids);


            //get titles of those playlists

            NSString* part = @"snippet";

            GTLQueryYouTube *query = [GTLQueryYouTube queryForPlaylistsListWithPart:part];
            query.channelId = channelId;
            query.maxResults = 50;

            [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                if (!error) {

                    NSMutableArray *titles = [[NSMutableArray alloc] init];

                    GTLYouTubeChannelListResponse *items = object;
                    for (GTLYouTubeChannelListResponse * item in items){
                        NSDictionary *currentItem = item.JSON[part];
                        NSString *title = currentItem[@"title"];
                        [titles addObject:title];
                    }
//                    NSLog(@"%@", titles);


                    //pass arrays back

                    completion(titles, ids);


                } else{
                    NSLog(@"%@", error);
                }
            }];



        } else{
            NSLog(@"%@", error);
        }
    }];



}


+(void) channelIdWithUsername:(NSString *)username
              completionBlock:(void(^)(NSString *))completion{

    GTLServiceYouTube *service = [[GTLServiceYouTube alloc] init];
    service.APIKey = apiKey;

    NSString *part = @"id";

    GTLQueryYouTube *query = [GTLQueryYouTube queryForChannelsListWithPart:part];

    query.forUsername = username;

    [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        if (!error) {
            GTLYouTubeChannelListResponse *items = object;
            for (GTLYouTubeChannelListResponse * item in items){
                completion(item.JSON[part]);
            }
        } else{
            NSLog(@"%@", error);
        }
    }];

}*/

@end
