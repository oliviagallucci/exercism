"""Functions to help play and score a game of blackjack.

How to play blackjack:    https://bicyclecards.com/how-to-play/blackjack/
"Standard" playing cards: https://en.wikipedia.org/wiki/Standard_52-card_deck
"""


def value_of_card(card: str) -> int:
    """Determine the scoring value of a card.

    :param card: str - given card.
    :return: int - value of a given card.  See below for values.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """

    if card in ['J', 'Q' ,'K']: 
        return 10
        
    if card in ['A']:
        return 1

    if int(card): 
        return int(card) 


def higher_card(card_one: str, card_two: str):
    """Determine which card has a higher value in the hand.

    :param card_one, card_two: str - cards dealt in hand.  See below for values.
    :return: str or tuple - resulting Tuple contains both cards if they are of equal value.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """

    val1: int = value_of_card(card_one)
    val2: int = value_of_card(card_two)

    if val1 == val2: 
        return card_one, card_two

    if val1 > val2:
        return card_one

    return card_two


def value_of_ace(card_one: str, card_two: str) -> int:
    """Calculate the most advantageous value for the ace card.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: int - either 1 or 11 value of the upcoming ace card.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """

    val1: int = value_of_card(card_one)
    val2: int = value_of_card(card_two)
    sum_val: int = val1 + val2 
    
    if val2 == 1 or val1 == 1:
        sum_val += 10 
    

    ace_aff: int = sum_val + 11

    if ace_aff > 21:
        return 1

    return 11



def is_blackjack(card_one: str, card_two: str) -> bool:
    """Determine if the hand is a 'natural' or 'blackjack'.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: bool - is the hand is a blackjack (two cards worth 21).

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """

    ten_cards: list[str] = ['J', 'Q',  'K', '10']
    
    if 'A' in [card_one, card_two]: 
        if card_one in ten_cards or card_two in ten_cards:
            return True 

    return False 




def can_split_pairs(card_one: str, card_two: str) -> bool:
    """Determine if a player can split their hand into two hands.

    :param card_one, card_two: str - cards dealt.
    :return: bool - can the hand be split into two pairs? (i.e. cards are of the same value).
    """

    ten_cards: list[str] = ['J', 'Q',  'K', '10']

    if card_one in ten_cards and card_two in ten_cards: 
        return True

    if value_of_card(card_one) == value_of_card(card_two): 
        return True 

    return False 



def can_double_down(card_one: str, card_two: str) -> bool:
    """Determine if a blackjack player can place a double down bet.

    :param card_one, card_two: str - first and second cards in hand.
    :return: bool - can the hand can be doubled down? (i.e. totals 9, 10 or 11 points).
    """

    sum_val: int = value_of_card(card_one) + value_of_card(card_two)

    if 9 <= sum_val <= 11: 
        return True 

    return False 