//
//  ViewController.h
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashcardsModel.h"

@interface ViewController : UIViewController

- (void) singleTapRecognized: (UITapGestureRecognizer *) recognizer;

- (void) doubleTapRecognized: (UITapGestureRecognizer *) recognizer;

- (void) swipeLeftRecognized: (UITapGestureRecognizer *) recognizer;

- (void) swipeRightRecognized: (UITapGestureRecognizer *) recognizer;


@end

