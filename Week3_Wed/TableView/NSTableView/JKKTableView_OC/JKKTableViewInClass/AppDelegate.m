//
//  AppDelegate.m
//  JKKTableViewInClass
//
//  Created by trainer on 1/20/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "AppDelegate.h"
#import "Movie.h"
@interface AppDelegate ()<NSTableViewDataSource,NSTableViewDelegate>
@property (nonatomic, copy) NSArray *movies;
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}

-(void)awakeFromNib {
    _movies = [Movie movies];
    for (Movie *m in _movies) {
        NSLog(@"title: %@",m.title);
    }
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
   return _movies.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
  NSTableCellView *cell = (NSTableCellView *)[tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSTextField *textField = cell.textField;
    Movie *movie = _movies[row];
    
    if ([tableColumn.identifier isEqualToString:@"Title"]) {
        textField.stringValue = movie.title;
    } else if ([tableColumn.identifier isEqualToString:@"Duration"]) {
        float duration = movie.duration;
        textField.stringValue = [NSString stringWithFormat:@"%2d:%2d",(int)duration/60,(int)duration%60];
        
    }
    
    return cell;
}
-(void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors {
    
   for ( NSSortDescriptor *descriptor in
        [[tableView sortDescriptors]reverseObjectEnumerator]) {
    //  _movies = [_movies sortedArrayUsingDescriptors:
     //   [NSArray arrayWithObject:descriptor]];
       
       
    _movies  = [_movies sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
          return [descriptor compareObject:obj1 toObject:obj2];
       }];
   }
    
    [self.tableView reloadData];
}



@end
