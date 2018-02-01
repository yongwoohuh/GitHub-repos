//
//  ViewController.m
//  Github Repos
//
//  Created by Yongwoo Huh on 2018-02-01.
//  Copyright © 2018 YongwooHuh. All rights reserved.
//

#import "ViewController.h"
#import "RepoTableViewCell.h"
#import "RepoDetailViewController.h"
#import "Repo.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray<Repo *> *repos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/yongwoohuh/repos"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.waitsForConnectivity = YES;
    configuration.allowsCellularAccess = NO;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        
        NSArray<NSDictionary *> *reposFullData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            // Handle the json error
            NSLog(@"json Error: %@", jsonError.localizedDescription);
            return;
        }
        
        // If we reach this point, we have sucessfully retrived the JSON from the API
        self.repos = [@[] mutableCopy];
        for (NSDictionary *repoData in reposFullData) {
            Repo *repo = [[Repo alloc] initWithName:repoData[@"name"] URL:repoData[@"html_url"] Description:repoData[@"description"]];
            [self.repos addObject:repo];
        }
        
        
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            [self.tableView reloadData];
        }];
        
    }];
    
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repos.count;
}

- (RepoTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repoCell" forIndexPath:indexPath];
    
    [cell setRepoCell:self.repos[indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

 #pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"repoDetailSegue"]) {
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         Repo *repo = self.repos[indexPath.row];
         RepoDetailViewController *controllor = (RepoDetailViewController *)[segue destinationViewController];
         [controllor setRepoDetail:repo];
     }
     
     
 }


@end
