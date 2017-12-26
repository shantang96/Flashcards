//
//  Flashcard.h
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject

@property (readonly, nonatomic) NSString* question;
@property (readonly, nonatomic) NSString* answer;
@property (readwrite, nonatomic) BOOL isFavorite;

- (instancetype) initWithQuestion: (NSString*) question
            answer: (NSString*) ans;

- (instancetype) initWithQuestion: (NSString*) question
            answer: (NSString*) ans
        isFavorite: (BOOL) isFav;


@end
