//
//  RepoDetailViewController.m
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "RepoDetailViewController.h"

@interface RepoDetailViewController ()

@end

@implementation RepoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setRepoDetail:(Repo *)repo
{
    self.repo = repo;
}

- (void)configureView {
    // Update the user interface for the detail item.
        self.nameLabel.text = [NSString stringWithFormat:@"Repo Name : %@", self.repo.name];
        self.htmlUrlLabel.text = [NSString stringWithFormat:@"url: %@", self.repo.html_url];
        self.repoDescriptionLabel.text = [NSString stringWithFormat:@"Repo Description: %@", self.repo.repoDescription];
}


@end
