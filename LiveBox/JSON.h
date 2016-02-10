//
//  JSON.h
//  iPwnStore
//
//  Created by Jerry Leung on 22/09/2014.
//  Copyright (c) 2014 iPwnTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSON : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *insight;
@property (strong, nonatomic)NSString *developer;
@property (strong, nonatomic)NSString *versioning;
@property (strong, nonatomic)NSString *thumbnail;
@property (strong, nonatomic)NSString *icon;
@property (strong, nonatomic)NSString *about;
@property (strong, nonatomic)NSString *lastupdated;
@property (strong, nonatomic)NSString *category;
@property (strong, nonatomic)NSString *itmslink;

- (id)initWithName:(NSString *)aName
           insight:(NSString *)aInsight
         developer:(NSString *)aDeveloper
        versioning:(NSString *)aVersioning
         thumbnail:(NSString *)aThumbnail
              icon:(NSString *)aIcon
             about:(NSString *)aAbout
       lastupdated:(NSString *)aLastupdated
          category:(NSString *)aCategory
          itmslink:(NSString *)aItmslink;

- (id)initWithDictionary:(NSDictionary *)dic;


@end
