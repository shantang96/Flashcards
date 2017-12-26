//
//  FlashcardsModel.m
//  Flashcards
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "FlashcardsModel.h"



@implementation FlashcardsModel

-(instancetype)init
{
    _flashcards = [[NSMutableArray alloc] init];
    Flashcard *f1 = [[Flashcard alloc] initWithQuestion:@"What is the answer to life, the universe and everything?" answer:@"42"];
    Flashcard *f2 = [[Flashcard alloc] initWithQuestion:@"What did the Buddhist ask the hot dog vendor?" answer:@"Make me one with everything"];
    Flashcard *f3 = [[Flashcard alloc] initWithQuestion:@"What does a pepper do when it gets angry?" answer:@"It gets jalapeno face"];
    Flashcard *f4 = [[Flashcard alloc] initWithQuestion:@"How did the hipster burn his mouth?" answer:@"He ate the pizza before it was cool"];
    Flashcard *f5 = [[Flashcard alloc] initWithQuestion:@"What's a pirate's favorite letter?" answer:@"You'd think it'd be R but it be the C"];
    [_flashcards insertObject:f1 atIndex:0];
    [_flashcards insertObject:f2 atIndex:1];
    [_flashcards insertObject:f3 atIndex:2];
    [_flashcards insertObject:f4 atIndex:3];
    [_flashcards insertObject:f5 atIndex:4];
    
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString* documentsDirectory = [paths objectAtIndex:0];
//    NSString* filepath = [documentsDirectory stringByAppendingPathComponent:@"savedData.plist"];
//
//
//    if(![_flashcards writeToFile:filepath atomically:YES])
//    {
//        printf("DIDNT WRITE PROPERLY.");
//    }
    //DIDNT WORK. writeToFile returns NO, no file in documents.


//    _flashcards = [NSMutableArray arrayWithContentsOfFile:filepath];

    
    _currentIndex = 0;
    return self;
}

+ (instancetype) sharedModel
{
    static FlashcardsModel *_sharedModel = nil;
    
    if(_sharedModel == nil)
    {
        _sharedModel = [[self alloc] init];
    }
    return _sharedModel;
}

- (NSUInteger) numberOfFlashcards
{
    NSUInteger n = [_flashcards count];
    return n;
}

- (Flashcard *) randomFlashcard
{
    NSUInteger n = [_flashcards count];
    uint32_t random = arc4random_uniform((uint32_t)n);
    _currentIndex = random;
    if([self numberOfFlashcards] > random)
    {
        return [_flashcards objectAtIndex:random];
    }
    else
    {
        return nil;
    }
}

- (Flashcard *) flashcardAtIndex: (NSUInteger) index
{
    if(index < [self numberOfFlashcards])
    {
        return [_flashcards objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

- (Flashcard *) nextFlashcard
{
    if(_currentIndex+1 < [self numberOfFlashcards] )
    {
        Flashcard* f1 =  [_flashcards objectAtIndex:_currentIndex+1];
        _currentIndex += 1;
        return f1;
    }
    else
    {
        return nil;
    }
}

- (Flashcard *) prevFlashcard
{
    if(_currentIndex != 0)
    {
        
        Flashcard* f1 =  [_flashcards objectAtIndex:_currentIndex-1];
        _currentIndex -= 1;
        return f1;
    }
    else
    {
        return nil;
    }
}

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav
                    atIndex: (NSUInteger) index
{
    if(index <= (NSUInteger)[self numberOfFlashcards])
    {
        Flashcard *f1 = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
        [_flashcards insertObject:f1 atIndex:index];
    }
}

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav
{
        Flashcard *f1 = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
        [_flashcards insertObject:f1 atIndex:[self numberOfFlashcards]];

}

- (void) removeFlashcard
{
    [_flashcards removeObjectAtIndex:_currentIndex];
    _currentIndex++;
}

- (void) removeFlashcardAtIndex: (NSUInteger) index
{
    if( index < [self numberOfFlashcards])
    {
        [_flashcards removeObjectAtIndex:index];
    }
}

- (void) toggleFavorite
{
    Flashcard *f1 = [_flashcards objectAtIndex:_currentIndex];
    if (f1.isFavorite)
    {
        f1.isFavorite = false;
    }
    else
    {
        f1.isFavorite = true;
    }
}

- (NSArray *) favoriteFlashcards
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    for (NSUInteger i=0; i < [self numberOfFlashcards]; i++)
    {
        Flashcard *temp = [_flashcards objectAtIndex:i];
        if(temp.isFavorite)
        {
            [returnArray addObject:temp];
        }
    }
    return returnArray;
}

@end
