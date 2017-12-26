//
//  AddViewController.m
//  Flashcards
//
//  Created by Shantanu Gupta on 11/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "AddViewController.h"
#import "FlashcardsModel.h"


@interface AddViewController () <UITextViewDelegate> 

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, readwrite) FlashcardsModel *flashcardsModel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) NSString* questionString;
@property (weak, nonatomic) NSString* answerString;
- (IBAction)cancelButtonAction:(id)sender;
- (IBAction)saveButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
- (IBAction)backgroundWasTouched:(id)sender;

@end

@implementation AddViewController

- (IBAction)cancelButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)saveButtonAction:(id)sender
{
    //see if there is any text in the textfields,
    //else grey it out.
    if(![_textView.text isEqualToString:@""]  && ![_textField.text isEqualToString:@""])
    {
        [_flashcardsModel insertWithQuestion:_textView.text answer:_textField.text favorite:NO];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else
    {
        _saveButton.enabled = NO;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _flashcardsModel = [FlashcardsModel sharedModel];
    _saveButton.enabled = NO;
    _textView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView
{
    if(![_textView.text isEqualToString:@""]  && ![_textField.text isEqualToString:@""])
    {
        _saveButton.enabled = YES;
    }
    else
    {
        _saveButton.enabled = NO;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editingDidEndTextField:(id)sender {
    
    if(![_textView.text isEqualToString:@""]  && ![_textField.text isEqualToString:@""])
    {
        _saveButton.enabled = YES;
    }
    else
    {
        _saveButton.enabled = NO;
    }
}

- (IBAction)editingChangedTextField:(id)sender
{
    if(![_textView.text isEqualToString:@""]  && ![_textField.text isEqualToString:@""])
    {
        _saveButton.enabled = YES;
    }
    else
    {
        _saveButton.enabled = NO;
    }
    
}

- (IBAction)backgroundWasTouched:(id)sender {
    [self.view endEditing:YES];

}
@end
