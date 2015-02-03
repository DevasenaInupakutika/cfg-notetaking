//
//  NoteAdapter.m
//  notetaking
//
//  Created by David Haber on 2/1/15.
//  Copyright (c) 2015 David Haber. All rights reserved.
//

#import "NoteAdapter.h"
#import "Note.h"

#import "AppDelegate.h"

@implementation NoteAdapter

- (void)createNotewithTitle:(NSString*)title withText:(NSString*)text {
    // Get our managed object context - the world our objects live in
    NSManagedObjectContext *moc = [self managedObjectContext];
    
    // Obtain entity description
    NSManagedObjectModel *managedObjectModel = [[moc persistentStoreCoordinator] managedObjectModel];
    NSEntityDescription *entity = [[managedObjectModel entitiesByName] objectForKey:@"Note"];
    
    // Create a new note
    Note *note = [[Note alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    
    // Set attributes for new note
    [note setTitle:title];
    [note setText:text];
    
    // Store new note persisently
    [self saveChanges];
}

- (void)removeNote:(NSString*)title {
    // we'll do this one later
}

- (NSArray*)allNotes {
    // Get our managed object context - the world our objects live in
    NSManagedObjectContext *moc = [self managedObjectContext];
    
    // Define which objects we want to retrieve - Notes in this case
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Note" inManagedObjectContext:moc];
    
    // Create a request which retrieves our notes
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // Execute request, retrieve notes, handle error
    NSError *error;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    if (array == nil)
    {
        NSLog(@"There has been an error while retrieving notes from Core Data");
    }
    
    return array;
}

- (NSManagedObjectContext*)managedObjectContext {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (void)saveChanges {
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] saveContext];
}

@end