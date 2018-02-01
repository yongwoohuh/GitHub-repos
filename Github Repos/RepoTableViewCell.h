//
//  RepoTableViewCell.h
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

@interface RepoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)setRepoCell:(Repo *)repo;

@end
