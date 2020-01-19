//
//  AppDelegate.h
//  Cocoa Table View
//
//  Created by Nikola Grujic on 14/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTableViewDelegate>
{
    NSMutableArray *footballClubs;
    IBOutlet NSTableView *tableView;
}

@property (weak) IBOutlet NSWindow *window;

- (IBAction)addClub:(id)sender;
- (IBAction)removeClub:(id)sender;

- (void)setTableViewDataSource;
- (void)setTableViewDelegate;
- (void)setColumnsIdentifiers;
- (void)setColumnsSortDescriptors;

- (void)fillTestData;

@end

