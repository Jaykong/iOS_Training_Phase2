//
//  PopViewController.m
//  JsonCData
//
//  Created by trainer on 1/6/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "PopViewController.h"
#import "PaperInfoManger.h"
@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSArray *papers = [PaperInfoManger findAllPapers];
    NSLog(@"%@",papers.description);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
