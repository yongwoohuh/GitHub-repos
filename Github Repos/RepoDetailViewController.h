//
//  RepoDetailViewController.h
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "ViewController.h"
#import "Repo.h"

@interface RepoDetailViewController : ViewController
@property (nonatomic, strong) Repo *repo;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *htmlUrlLabel;
@property (weak, nonatomic) IBOutlet UILabel *repoDescriptionLabel;

//@property (nonatomic, strong) Repo *repo;

- (void)setRepoDetail:(Repo *)repo;
@end
