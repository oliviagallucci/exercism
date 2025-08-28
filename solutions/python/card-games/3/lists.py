"""Functions for tracking poker hands and assorted card tasks.

Python list documentation: https://docs.python.org/3/tutorial/datastructures.html
"""

from typing import List

def get_rounds(number: int) -> List[int]:
    """Create a list containing the current and next two round numbers.

    :param number: int - current round number.
    :return: list - current round and the two that follow.
    """

    p1: int = number + 1
    p2: int = number + 2
    
    return [number, p1, p2]


def concatenate_rounds(rounds_1, rounds_2):
    """Concatenate two lists of round numbers.

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.
    """

    for element in rounds_2: 
        rounds_1.append(element)

    return rounds_1


def list_contains_round(rounds, number):
    """Check if the list of rounds contains the specified number.

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return: bool - was the round played?
    """

    if number in rounds: 
        return True 
    return False 


def card_average(hand: List[int]) -> float:
    """Calculate and returns the average card value from the list.

    :param hand: list - cards in hand.
    :return: float - average value of the cards in the hand.
    """

    size: int = len(hand)
    sum_hand: int = 0 

    for element in hand: 
        sum_hand += int(element)

    return sum_hand / size


def approx_average_is_average(hand: List[int]) -> bool:
    """Return if the (average of first and last card values) OR ('middle' card) == calculated average.

    :param hand: list - cards in hand.
    :return: bool - does one of the approximate averages equal the `true average`?
    """

    first: int = hand[0]
    last: int = hand[-1]
    avg_1: int = (first + last) / 2

    avg_2 = len(hand) // 2
    avg_2 = int(hand[avg_2])
    
    true_avg: int = card_average(hand)

    if true_avg in [avg_1, avg_2]: 
        return True 

    return False 


def average_even_is_average_odd(hand: List[int]) -> bool:
    """Return if the (average of even indexed card values) == (average of odd indexed card values).

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """
    even_sum: List[int] = []
    odd_sum: List[int] = []
    
    for card_index in range(len(hand)): 
        if card_index % 2 == 0: 
            even_sum.append(hand[card_index])
        else: 
            odd_sum.append(hand[card_index])

    even_avg: int = sum(even_sum) / len(even_sum)
    odd_avg: int = sum(odd_sum) / len(odd_sum)
    true_avg = card_average(hand)
    
    if true_avg in [even_avg, odd_avg]: 
        return True
    return False

def maybe_double_last(hand: List[int]) -> List[int]:
    """Multiply a Jack card value in the last index position by 2.

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """

    last_card = hand[-1] 
    if int(last_card) == 11: 
        hand[-1] = 22

    return hand