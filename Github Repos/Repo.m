//
//  Repo.m
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithName:(NSString *)name URL:(NSString *)html_url Description:(NSString *)repoDescription
{
    self = [super init];
    if (self) {
        _name = name;
        _html_url = html_url;
        _repoDescription = repoDescription;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@\n html_url : %@\n repo Descrition: %@",
            self.name, self.html_url, self.repoDescription];
}

@end
