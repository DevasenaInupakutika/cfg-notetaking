//
//  NoteViewController.m
//  notetaking
//
//  Created by David Haber on 2/1/15.
//  Copyright (c) 2015 David Haber. All rights reserved.
//

#import "NoteViewController.h"

#import "NoteAdapter.h"

@interface NoteViewController ()

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!self.note) {
        // no note has been passed to this VC, user wants to create a new one
        [self.textView setText:@""];
    }
    else {
        // display note
        [self.textView setText:[self.note text]];
    }
}

- (IBAction)saveButtonPressed:(id)sender {
    NoteAdapter *noteAdapter = [[NoteAdapter alloc] init];
    
    NSString *noteTitle = @"Title";
    NSString *noteText = self.textView.text;
    
    if (!self.note && [noteText length] > 0) {
        // Create new note
        [noteAdapter createNotewithTitle:noteTitle withText:noteText];
    } else if ([noteText length] > 0) {
        // Update existing note
        [noteAdapter updateNote:self.note withTitle:noteTitle withText:noteText];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
