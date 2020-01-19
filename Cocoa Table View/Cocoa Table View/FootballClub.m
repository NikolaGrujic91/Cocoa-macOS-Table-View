//
//  FootballClub.m
//  Cocoa Array Controller
//
//  Created by Nikola Grujic on 13/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import "FootballClub.h"

@implementation FootballClub

@synthesize name;
@synthesize foundationYear;

- (id) init
{
    self = [super init];
    
    if (self)
    {
        name = @"FC Generic";
        foundationYear = @"2020";
    }
    
    return self;
}

@end
