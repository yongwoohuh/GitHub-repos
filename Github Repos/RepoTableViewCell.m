//
//  RepoTableViewCell.m
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "RepoTableViewCell.h"

@interface RepoTableViewCell ()
@property (nonatomic, strong) Repo* repo;
@end

@implementation RepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setRepoCell:(Repo *)repo
{
//    self.repo = repo;
    self.nameLabel.text = repo.name;
    self.repo = repo;
    
}

@end
