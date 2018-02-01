//
//  Repo.h
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *html_url;
@property (nonatomic, copy) NSString *repoDescription;
//@property (nonatomic, assign) BOOL isPrivate;

-(instancetype)initWithName:(NSString *)name URL:(NSURL *)html_url Description:(NSString *)repoDescription;

@end
