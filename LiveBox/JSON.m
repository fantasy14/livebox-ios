//
//  JSON.m
//  iPwnStore
//
//  Created by Jerry Leung on 22/09/2014.
//  Copyright (c) 2014 iPwnTech. All rights reserved.
//

#import "JSON.h"

@implementation JSON


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
 {
    self = [super init];
    
    if (self) {
        self.name = aName;
        self.insight = aInsight;
        self.developer = aDeveloper;
        self.versioning = aVersioning;
        self.thumbnail = aThumbnail;
        self.icon = aIcon;
        self.about = aAbout;
        self.lastupdated = aLastupdated;
        self.category = aCategory;
        self.itmslink = aItmslink;
        
    }
    
    return self;
}



- (id)initWithDictionary:(NSDictionary *)dic {
    self = [self initWithName:dic[@"name"] insight:dic[@"insight"] developer:dic[@"developer"]  versioning:dic[@"versioning"] thumbnail:dic[@"thumbnail"] icon:dic[@"icon"] about:dic[@"about"] lastupdated:dic[@"lastupdated"] category:dic[@"category"] itmslink:dic[@"itmslink"]];
    return self;
}



- (id)init {
    self = [self initWithName:@"Undifined" insight:@"Undifined" developer:@"Undifined" versioning:@"Undifined" thumbnail:@"Undifined" icon:@"Undifined" about:@"Undifined" lastupdated:@"Undifined" category:@"Undifined" itmslink:@"Undifined"];
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.name, self.description];
}




@end
