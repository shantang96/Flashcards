//
//  ViewController.m
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, readwrite) FlashcardsModel *flashcardsModel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _flashcardsModel = [FlashcardsModel sharedModel];
    Flashcard* f1 = [_flashcardsModel randomFlashcard];
    
    if(f1 == nil)
    {
        _questionLabel.text = @"There are no more flashcards.";
    }
    //Animation
    else
    {
        _questionLabel.alpha = 0;
        _questionLabel.textColor = [UIColor yellowColor];
        _questionLabel.text = f1.question;
    }
    [UIView animateWithDuration: 1.0 animations:^{
        
        _questionLabel.alpha = 1;
    }];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];

    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) singleTapRecognized: (UITapGestureRecognizer *) recognizer
{
    Flashcard* f1 = [_flashcardsModel randomFlashcard];
    
    if(f1 == nil)
    {
        
        _questionLabel.text = @"There are no more flashcards.";
        return;
    }
    
    [UIView animateWithDuration: 1.0 animations:^{
        
        _questionLabel.alpha = 0;
    } completion:^(BOOL finished) {
        _questionLabel.text = f1.question;
        _questionLabel.textColor = [UIColor yellowColor];
        
        [UIView animateWithDuration:1.0 animations:^{
            _questionLabel.alpha = 1;
        }];

    }];

}

- (void) doubleTapRecognized: (UITapGestureRecognizer *) recognizer
{
    [UIView animateWithDuration: 1.0 animations:^{
        
        _questionLabel.alpha = 0;
    } completion:^(BOOL finished) {
        if([_flashcardsModel flashcardAtIndex:[_flashcardsModel currentIndex] ] != nil)
        {
        _questionLabel.text = [_flashcardsModel flashcardAtIndex:[_flashcardsModel currentIndex] ].answer;
        }
        else
        {
            _questionLabel.text = @"Please add some flashcards.";
        }
        _questionLabel.textColor = [UIColor greenColor];
        [UIView animateWithDuration: 1.0 animations:^{
            
            _questionLabel.alpha = 1;
        }];
    }];
    
}

- (void) swipeLeftRecognized: (UITapGestureRecognizer *) recognizer
{
    Flashcard *f1 = [_flashcardsModel nextFlashcard];
    if(f1 != nil)
    {
        [UIView animateWithDuration: 1.0 animations:^{
            
            _questionLabel.alpha = 0;
        } completion:^(BOOL finished) {
            _questionLabel.text = f1.question;
            _questionLabel.textColor = [UIColor yellowColor];
            [UIView animateWithDuration: 1.0 animations:^{
                
                _questionLabel.alpha = 1;
            }];
        }];
        
    }
    else
    {
        _questionLabel.text = @"There are no more flashcards.";
    }
    
    
}
- (void) swipeRightRecognized: (UITapGestureRecognizer *) recognizer
{
    Flashcard *f1 = [_flashcardsModel prevFlashcard];
    if( f1 != nil)
    {

        [UIView animateWithDuration: 1.0 animations:^{
            
            _questionLabel.alpha = 0;
        } completion:^(BOOL finished) {
            _questionLabel.text = f1.question;
            _questionLabel.textColor = [UIColor yellowColor];
            
            [UIView animateWithDuration: 1.0 animations:^{
                
                _questionLabel.alpha = 1;
            }];
        }];
        
    }
    else
    {
        _questionLabel.text = @"There are no more flashcards.";
    }
}



@end
