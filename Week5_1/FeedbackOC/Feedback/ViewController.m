//
//  ViewController.m
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "ViewController.h"
#import "OneButtonCell.h"
#import "ATextViewCell.h"
#import "LabelTextFieldCell.h"

@interface ViewController ()
{
    NSArray *contactInfos;
    NSMutableDictionary *postDic;
    UIActivityIndicatorView *indicatorView;
}
@end

@implementation ViewController
- (IBAction)submitBtnClicked:(id)sender {
    ATextViewCell *textViewCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    LabelTextFieldCell *labelTextFieldCell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [labelTextFieldCell1.textField resignFirstResponder];
    
    LabelTextFieldCell *labelTextFieldCell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [labelTextFieldCell2.textField resignFirstResponder];
    
    LabelTextFieldCell *labelTextFieldCell3 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    [labelTextFieldCell3.textField resignFirstResponder];
    
    [textViewCell.aTextview resignFirstResponder];
    [self setEditing:NO animated:YES];
    Feedback *feedback = [[Feedback alloc] init];
    feedback.delegate = self;
    
    NSString *tel = [postDic valueForKey:@"tel"];
    NSString *qq = [postDic valueForKey:@"qq"];
    NSString *email = [postDic valueForKey:@"mail"];
    NSString *content = [postDic valueForKey:@"content"];
    [feedback postFeedback:tel.intValue qq:qq.intValue email:email content:content];
    
//    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    [self.view addSubview:indicatorView];
//    [indicatorView startAnimating];
}
#pragma mark - FeedbackPostDidSuccess
-(void)dismissActivityIndicator {
    [indicatorView stopAnimating];
    [indicatorView removeFromSuperview];
}
#pragma mark - TextField Delegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (!postDic) {
        postDic = [[NSMutableDictionary alloc] init];
    }
    
    switch (textField.tag) {
        case 1:
        {
            [postDic setValue:textField.text forKey:@"tel"];
        }
            break;
        case 2:
        {
            [postDic setValue:textField.text forKey:@"qq"];
        }
            break;
        case 3:
        {
            [postDic setValue:textField.text forKey:@"mail"];
        }
            break;
        default:
            break;
    }
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView {
    if (!postDic) {
        postDic = [[NSMutableDictionary alloc] init];
    }
    
    [postDic setValue:textView.text forKey:@"content"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    contactInfos = @[@"电话",@"QQ",@"邮件"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
          LabelTextFieldCell *labelTextFieldCell = [tableView dequeueReusableCellWithIdentifier:@"LabelTextFieldCell"];
            labelTextFieldCell.titleLbl.text = [contactInfos objectAtIndex:indexPath.row];
            return labelTextFieldCell;
        }
            break;
        case 1:
        {
            ATextViewCell *aTextViewCell =[tableView dequeueReusableCellWithIdentifier:@"ATextViewCell"];
            aTextViewCell.aTextview.text = @"";
            return aTextViewCell;
        }
            break;
        case 2:
        {
            OneButtonCell *oneButtonCell = [tableView dequeueReusableCellWithIdentifier:@"OneButtonCell"];
            [oneButtonCell.aButton setTitle:@"提交" forState:UIControlStateNormal];
            return oneButtonCell;
        }
            break;
        default:
        {
            OneButtonCell *oneButtonCell = [tableView dequeueReusableCellWithIdentifier:@"OneButtonCell"];
            return oneButtonCell;
        }
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 1:
            return 100;
            break;
        
        default:
            return 44;
            break;
    }
    
}
@end
