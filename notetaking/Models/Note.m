//
//  Note.m
//  notetaking
//
//  Created by David Haber on 2/1/15.
//  Copyright (c) 2015 David Haber. All rights reserved.
//

#import "Note.h"


@implementation Note

@dynamic title;
@dynamic text;
@dynamic date_created;
@dynamic date_updated;
@dynamic category;

-(void)awakeFromInsert {
    [super awakeFromInsert]; // call superclass method (important!)
    
    [self setDate_created:[NSDate date]];
    [self setDate_updated:[NSDate date]];
}

@end
