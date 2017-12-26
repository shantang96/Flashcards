//
//  Flashcard.m
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "Flashcard.h"

@implementation Flashcard

- (instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans
{
    _question = question;
    _answer = ans;
    return self;
}

- (instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans isFavorite:(BOOL)isFav
{
    _question = question;
    _answer = ans;
    _isFavorite = isFav;
    return self;
}

@end
