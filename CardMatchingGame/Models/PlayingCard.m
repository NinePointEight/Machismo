//
//  PlayingCard.m
//  CardMatchingGame
//
//  Created by Charlie Massry on 2/1/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards {
    int score = 0;
    for (PlayingCard *otherCard in otherCards) {
        if ([self.suit isEqualToString:otherCard.suit]) {
            score ++;
        } else if (otherCard.rank == self.rank) {
            score += 4;
        } else {
            score = 0;
            break;
        }
    }
    return score;
}

@synthesize suit = _suit;

-(instancetype)initWithRank:(NSUInteger)rank suit:(NSString *)suit {
    self = [super init];
    
    if (self) {
        [self setRank:rank];
        [self setSuit:suit];
    }
    
    return self;
}

-(NSString *)contents {
    NSArray *ranks = [self.class rankStrings];
    return [ranks[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

+(NSArray *)validSuits {
    return @[@"♥", @"♦", @"♠", @"♣"];
}

-(void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit {
    return _suit ? _suit : @"?";
}

-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(NSString *)description {
    return self.contents;
}
@end