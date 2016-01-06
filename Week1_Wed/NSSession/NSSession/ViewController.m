//
//  ViewController.m
//  NSSession
//
//  Created by trainer on 1/6/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *dataArr;
}
@end

@implementation ViewController

-(void)addTableViewConstraints {
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *tableViewMap = @{@"tableView":_tableView};
    NSArray *horizontalContraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tableView]-|" options:0 metrics:nil views:tableViewMap];
    [self.view addConstraints:horizontalContraints];
    
    NSArray *verticalConstraits = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[tableView]-|" options:0 metrics:nil views:tableViewMap];
    [self.view addConstraints:verticalConstraits];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getPaperInfo.php"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       // NSString *receviedStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"%@",receviedStr);
        dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
       // NSLog(@"%@",arr.description);

        dispatch_async(dispatch_get_main_queue(), ^{
          [self addTableViewConstraints];
            _tableView.delegate = self;
            _tableView.dataSource = self;
        });
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *Cell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
   NSDictionary *paperDic = dataArr[indexPath.row];
   NSString *title = [paperDic valueForKey:@"title"];
    
    cell.textLabel.text = title;
    return cell;
}

@end
