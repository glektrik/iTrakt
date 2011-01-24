#import <Foundation/Foundation.h>
#import "BroadcastDate.h"

@interface Episode : NSObject {
  id delegate;
  BroadcastDate *broadcastDate;

  NSData *episodeData;
  NSDictionary *episodeDict;

  UIImage *banner;
  NSString *bannerURL;
  NSData *bannerData;

  UIImage *poster;
  NSData *posterData;

  NSString *tvdbID;
  NSString *title;
  NSUInteger season;
  NSUInteger number;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BroadcastDate *broadcastDate;

@property (nonatomic, retain) UIImage *banner;
@property (nonatomic, retain) NSString *bannerURL;
@property (nonatomic, retain) NSData *bannerData;

@property (nonatomic, retain) UIImage *poster;
@property (nonatomic, retain) NSData *posterData;

@property (nonatomic, retain) NSString *tvdbID;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) NSUInteger season;
@property (nonatomic, assign) NSUInteger number;

- (id)initWithDictionary:(NSDictionary *)dict;

- (NSString *)numberText;

@end
