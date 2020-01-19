//
//  AppDelegate.m
//  Cocoa Table View
//
//  Created by Nikola Grujic on 14/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import "AppDelegate.h"
#import "FootballClub.h"

@implementation AppDelegate

- (id)init
{
    self = [super init];
    
    if (self)
    {
        footballClubs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setTableViewDataSource];
    [self setTableViewDelegate];
    [self setColumnsIdentifiers];
    [self setColumnsSortDescriptors];
    
    [self fillTestData];
}

#pragma mark Table view dataSource methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [footballClubs count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
                      row:(NSInteger)row
{
    NSString *columnIdentifier = [tableColumn identifier];
    FootballClub *club = [footballClubs objectAtIndex:row];
    
    return [club valueForKey:columnIdentifier];
}

- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    NSString *identifier = [tableColumn identifier];
    FootballClub *club = [footballClubs objectAtIndex:row];
    [club setValue:object forKey:identifier];
}


#pragma mark Table view sortDescriptor methods

- (void)tableView:(NSTableView *)aTableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    [footballClubs sortUsingDescriptors:[aTableView sortDescriptors]];
    [aTableView reloadData];
}

#pragma mark Action methods

- (IBAction)addClub:(id)sender
{
    FootballClub *club = [[FootballClub alloc] init];
    [footballClubs addObject:club];
    [tableView reloadData];
}

- (IBAction)removeClub:(id)sender
{
    NSIndexSet *rows = [tableView selectedRowIndexes];
    
    if ([rows count] == 0)
    {
        return;
    }
    
    [footballClubs removeObjectsAtIndexes:rows];
    [tableView reloadData];
}

#pragma mark Additional methods

- (void)setTableViewDataSource
{
    [tableView setDataSource: (id)self];
}

- (void)setTableViewDelegate
{
    [tableView setDelegate:self];
}

- (void)setColumnsIdentifiers
{
    NSArray<NSTableColumn*> *columns = [tableView tableColumns];
    int firstColumn = 0;
    int secondColumn = 1;
    
    for (int i = 0; i < [columns count]; i++)
    {
        NSTableColumn *column = [columns objectAtIndex:i];
        
        if (i == firstColumn)
        {
            [column setIdentifier:@"name"];
        }
        else if (i == secondColumn)
        {
            [column setIdentifier:@"foundationYear"];
        }
    }
}

- (void)setColumnsSortDescriptors
{
    NSArray<NSTableColumn*> *columns = [tableView tableColumns];
    
    for (int i = 0; i < [columns count]; i++)
    {
        NSTableColumn *column = [columns objectAtIndex:i];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:[column identifier]
                                                                         ascending:YES
                                                                          selector:@selector(caseInsensitiveCompare:)];
        [column setSortDescriptorPrototype:sortDescriptor];
    }
}

- (void)fillTestData
{
    FootballClub *club1 = [[FootballClub alloc] init];
    [club1 setName:@"Manchester United"];
    [club1 setFoundationYear:@"1878"];
    
    FootballClub *club2 = [[FootballClub alloc] init];
    [club2 setName:@"Liverpool"];
    [club2 setFoundationYear:@"1892"];
    
    FootballClub *club3 = [[FootballClub alloc] init];
    [club3 setName:@"Real Madrid"];
    [club3 setFoundationYear:@"1902"];
    
    FootballClub *club4 = [[FootballClub alloc] init];
    [club4 setName:@"Barcelona"];
    [club4 setFoundationYear:@"1899"];
    
    [footballClubs addObject:club1];
    [footballClubs addObject:club2];
    [footballClubs addObject:club3];
    [footballClubs addObject:club4];
}

@end
