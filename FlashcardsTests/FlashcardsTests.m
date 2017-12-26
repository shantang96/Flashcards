//
//  FlashcardsTests.m
//  FlashcardsTests
//
//  Created by Shantanu Gupta on 10/22/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlashcardsModel.h"

@interface FlashcardsTests : XCTestCase

@property (strong, nonatomic) FlashcardsModel *testModel;

@end

@implementation FlashcardsTests

- (void)setUp {
    [super setUp];
    
    _testModel = [[FlashcardsModel alloc] init ];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testInit
{
    //if it initialized in setUp then numberOfFlashcards should be 5
    XCTAssertEqual(5, [_testModel numberOfFlashcards]);
}

- (void) testSharedModel
{
    FlashcardsModel *m1 = [FlashcardsModel sharedModel];
    FlashcardsModel *m2 = [FlashcardsModel sharedModel];
    
    [m1 insertWithQuestion:@"TEST QUESTION" answer:@"TEST ANSWER" favorite:YES];
    
    XCTAssertEqual([m1 numberOfFlashcards], [m2 numberOfFlashcards]);
    
}

- (void)testNumberOfFlashCards
{
    NSUInteger n = [_testModel numberOfFlashcards];
    XCTAssertEqual(n, 5);
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testRandomFlashCard
{
    Flashcard *f1 = [_testModel randomFlashcard];
    XCTAssertEqual(5, [_testModel numberOfFlashcards] ); //Doesn't change number of Flashcards
}

- (void) testFlashCardAtIndex
{
    Flashcard *f1 = [_testModel flashcardAtIndex:5];
    XCTAssertEqualObjects(nil, f1);
}

- (void) testNextFlashCard
{
    NSUInteger n = [_testModel currentIndex];
    [_testModel nextFlashcard];
    n++;
    XCTAssertEqual(n, [_testModel currentIndex]);
}

- (void) testPrevFlashCard
{
    NSUInteger n = [_testModel currentIndex];
    [_testModel prevFlashcard];
    XCTAssertEqual(n, 0);
}

- (void) testInsertWithQuestion
{
    NSUInteger n = [_testModel numberOfFlashcards];
    [_testModel insertWithQuestion:@"Test Question" answer:@"Test Answer" favorite:NO];
    n++;
    XCTAssertEqual(n, [_testModel numberOfFlashcards]);
}

- (void) testInsertWithQuestionAtIndex
{
    NSUInteger n = [_testModel numberOfFlashcards];
    [_testModel insertWithQuestion:@"Test Question" answer:@"Test Answer" favorite:NO atIndex:3];
    n++;
    XCTAssertEqual(n, [_testModel numberOfFlashcards]);
}

- (void) testRemoveFlashcard
{
    NSUInteger n = [_testModel numberOfFlashcards];
    [_testModel removeFlashcard];
    n--;
    XCTAssertEqual(n, [_testModel numberOfFlashcards]);
}

- (void) testRemoveFlashcardAtIndex
{
    NSUInteger n = [_testModel numberOfFlashcards];
    [_testModel removeFlashcardAtIndex:2];
    n--;
    XCTAssertEqual(n, [_testModel numberOfFlashcards]);
}

- (void) testToggleFavorite
{
    BOOL x = [_testModel flashcardAtIndex:[_testModel currentIndex]].isFavorite;
    [_testModel toggleFavorite];
    XCTAssertEqual(!x, [_testModel flashcardAtIndex:[_testModel currentIndex]].isFavorite);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
