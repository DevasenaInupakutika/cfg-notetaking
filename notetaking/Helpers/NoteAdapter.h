//
//  NoteAdapter.h
//  notetaking
//
//  Created by David Haber on 2/1/15.
//  Copyright (c) 2015 David Haber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteAdapter : NSObject

/*
 *  Creates a note with title and test
 */
- (void)createNotewithTitle:(NSString*)title withText:(NSString*)text;

/*
 *  Removes note with title (does nothing if not exists)
 */
- (void)removeNote:(NSString*)title;

/*
 *  Retrieves all notes.
 */
- (NSArray*)allNotes;

@end
