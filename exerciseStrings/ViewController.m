//
//  ViewController.m
//  exerciseStrings
//
//  Created by Robert Figueras on 7/20/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"REVERSE RESULT: %@", [self reverseString:@"help"]);

    NSLog(@"SORT RESULT: %@", [self sortStringCharactersAlphabetically:@"help"]);

    NSLog(@"REMOVE VOWELS RESULT: %@", [self removeVowelsFromString:@"help"]);

    NSLog(@"REMOVE CONSONANTS RESULT: %@", [self removeConsonantsFromStringUsingPredicate:@"ignacious"]);

    NSLog(@"ODD WORD RESULT: %@", [self solvePhraseForOddWordProblem:@"This is an odd word problem solver."]);

    NSLog(@"COMPRESS WORD TEST: %@", [self compressString:@"Compressss this string to aaaaa93kddeeeeccccc"]);

}


- (NSString*) reverseString: (NSString*)inputString
{
    NSMutableArray *arrayOfCharactersInInputString = [NSMutableArray array];

    for (int i=0; i<inputString.length; i++)
    {
        NSString *eachCharacter =[NSString stringWithFormat:@"%C",[inputString characterAtIndex:i]];
        [arrayOfCharactersInInputString addObject:eachCharacter];
    }

    NSString *stringToBeReturned = @"";

    for (NSString *eachCharacter in [arrayOfCharactersInInputString reverseObjectEnumerator])
    {
        stringToBeReturned = [stringToBeReturned stringByAppendingString:eachCharacter];
    }

    return stringToBeReturned;
}


- (NSString *) sortStringCharactersAlphabetically: (NSString *)inputString
{
    NSMutableArray *arrayOfCharacters = [NSMutableArray array];

    for (int x = 0; x<inputString.length; x++)
    {
        NSString *eachCharacter = [NSString stringWithFormat:@"%C", [inputString characterAtIndex:x]];
        [arrayOfCharacters addObject:eachCharacter];
    }

    NSSortDescriptor *sortAlphabetically = [[NSSortDescriptor alloc] initWithKey:@"description" ascending:YES];
    NSArray *resultArray = [arrayOfCharacters sortedArrayUsingDescriptors:@[sortAlphabetically]];
    NSString *sortedString = [resultArray componentsJoinedByString:@""];
    return sortedString;
}


- (NSString *) removeVowelsFromString: (NSString *)inputString
{
    NSMutableArray *arrayOfStringCharacters = [NSMutableArray array];
    for (int n=0; n<inputString.length; n++)
    {
        NSString *eachCharacter = [[NSString stringWithFormat:@"%C",[inputString characterAtIndex:n]]lowercaseString];
        if (![eachCharacter isEqualToString:@"a"] && ![eachCharacter isEqualToString:@"e"] && ![eachCharacter isEqualToString:@"i"] && ![eachCharacter isEqualToString:@"o"] && ![eachCharacter isEqualToString:@"u"])
        {
            [arrayOfStringCharacters addObject:eachCharacter];
        }
    }

    NSString *stringWithNoVowels = [arrayOfStringCharacters componentsJoinedByString:@""];
    return stringWithNoVowels;
}


- (NSString *) removeConsonantsFromStringUsingPredicate: (NSString *)inputString
{

    NSMutableArray *arrayOfCharacters = [NSMutableArray array];
    for (int i=0; i<inputString.length; i++)
    {
        NSString *eachCharacter = [NSString stringWithFormat:@"%C", [inputString characterAtIndex:i]];
        [arrayOfCharacters addObject:eachCharacter];
    }

    NSPredicate *filterForConsonants = [NSPredicate predicateWithFormat:@"SELF == 'a' OR SELF == 'e' OR SELF == 'i' OR SELF == 'o' OR SELF == 'u'"];

    NSArray *filteredArray = [arrayOfCharacters filteredArrayUsingPredicate:filterForConsonants];
    NSString *returnStringWithoutConsonants = [filteredArray componentsJoinedByString:@""];

    return returnStringWithoutConsonants;
}


- (NSString *) solvePhraseForOddWordProblem: (NSString *)inputString
{

    NSMutableArray *arrayOfWords = [NSMutableArray array];
    arrayOfWords = (NSMutableArray *)[inputString componentsSeparatedByString:@" "];

    for (int i = 0; i<arrayOfWords.count; i++)
    {
        if (i%2)
        {
            NSString *currentOddWord = [arrayOfWords objectAtIndex:i];
            currentOddWord = [self reverseString:currentOddWord];
            [arrayOfWords removeObjectAtIndex:i];
            [arrayOfWords insertObject:currentOddWord atIndex:i];
        }
    }

    NSString *stringOfResult = [arrayOfWords componentsJoinedByString:@" "];
    return stringOfResult;
}


- (NSString *) compressString: (NSString *)inputString
{
    NSMutableArray *arrayOfFixedWords = [NSMutableArray array];

    // separate phrase into array of words
    NSArray *arrayOfWords = [NSArray array];
    arrayOfWords = [inputString componentsSeparatedByString:@" "];

    // get each word and pass it to a checker method
    for (NSString *eachWord in arrayOfWords) {
        NSString *fixedWord = [self fixWord:eachWord];

        // add the fixed word to a new array
        [arrayOfFixedWords addObject:fixedWord];
    }

    // join the array components back into a string phrase

    return nil;
}


- (NSString *) fixWord: (NSString *)inputWord
{

    NSMutableArray *arrayOfFixedLetters = [NSMutableArray array];
    int indexOfFirstRepeatedLetter = 0;

    for (int i=0; i<inputWord.length; i++) {
        NSString *eachLetter = [NSString stringWithFormat:@"%C", [inputWord characterAtIndex:i]];

        // get number of occurences for each letter

        NSUInteger numberOfOccurrences = [[inputWord componentsSeparatedByString:eachLetter] count] - 1;
        NSLog(@"numberOfOccurrences of %@ is %i", eachLetter, numberOfOccurrences);

        if (numberOfOccurrences == 1)
        {
            [arrayOfFixedLetters addObject:eachLetter];
        }
        else 
        {
            indexOfFirstRepeatedLetter = i;
            [arrayOfFixedLetters addObject:eachLetter];

        }


    }




    return nil;
}

@end
