#import "Show.h"
#import "Trakt.h"

@implementation Show

@synthesize tvdbID;
@synthesize title;
@synthesize overview;
@synthesize posterURL;
@synthesize thumbURL;
@synthesize poster;
@synthesize thumb;
@synthesize year;

- (id)initWithDictionary:(NSDictionary *)showDict {
  if (self = [super init]) {
    self.tvdbID    = [[showDict valueForKey:@"tvdb_id"] copy];
    self.title     = [[showDict valueForKey:@"title"] copy];
    self.overview  = [[showDict valueForKey:@"overview"] copy];
    self.posterURL = [NSURL URLWithString:[showDict valueForKey:@"poster"]];
    self.thumbURL  = [NSURL URLWithString:[showDict valueForKey:@"thumb"]];
    self.year      = [[showDict valueForKey:@"year"] integerValue];
  }
  return self;
}

- (void)ensurePosterIsLoaded:(void (^)())downloadedBlock {
  // important to first check if we already have the poster loaded for performance!
  if (self.poster == nil) {
    [[Trakt sharedInstance] showPosterForURL:self.posterURL block:^(UIImage *thePoster, BOOL cached) {
      self.poster = thePoster;
      if (!cached) {
        //NSLog(@"Downloaded show poster with tvdb ID: %@", tvdbID);
        downloadedBlock();
      }
      //else {
        //NSLog(@"Loaded show poster from cache with tvdb ID: %@", tvdbID);
      //}
    }];
  }
}

- (void)ensureThumbIsLoaded:(void (^)())downloadedBlock {
  // important to first check if we already have the thumb loaded for performance!
  if (self.thumb == nil) {
    [[Trakt sharedInstance] showThumbForURL:self.thumbURL block:^(UIImage *theThumb, BOOL cached) {
      self.thumb = theThumb;
      if (!cached) {
        //NSLog(@"Downloaded show thumb with tvdb ID: %@", tvdbID);
        downloadedBlock();
      }
      //else {
        //NSLog(@"Loaded show thumb from cache with tvdb ID: %@", tvdbID);
      //}
    }];
  }
}


@end
