//
//  FootballClub.h
//  Cocoa Array Controller
//
//  Created by Nikola Grujic on 13/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FootballClub : NSObject
{
    NSString *name;
    NSString *foundationYear;
}

@property (readwrite, copy) NSString *name;
@property (readwrite, copy) NSString *foundationYear;

@end
