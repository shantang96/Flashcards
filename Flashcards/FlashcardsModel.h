//
//  FlashcardsModel.h
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"


@interface FlashcardsModel : NSObject

@property (nonatomic, strong) NSMutableArray* flashcards;
@property (readonly, nonatomic) NSUInteger currentIndex;

- (instancetype)init;
+ (instancetype) sharedModel;
- (NSUInteger) numberOfFlashcards;

- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav
                    atIndex: (NSUInteger) index;

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav;

- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;

- (void) toggleFavorite;

- (NSArray *) favoriteFlashcards;

@end
