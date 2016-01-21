//
//  ViewController.m
//  CodeTableView-OC
//
//  Created by kongyunpeng on 1/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell =(TableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (cell == nil) {
//        NSLog(@"cell is nil");
//    }
    cell.label.text = @"test";
  
    return cell;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView registerClass:[TableViewCell self] forCellReuseIdentifier:@"Cell"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
