"""Functions to help edit essay homework using string manipulation."""
from typing import List

def capitalize_title(title: str) -> str:
    """Convert the first letter of each word in the title to uppercase if needed.

    :param title: str - title string that needs title casing.
    :return: str - title string in title case (first letters capitalized).
    """
    
    string_list: List[str] = title.split(" ")
    new_title: str = ""

    for i in range(len(string_list)): 
        str_word: str = str(string_list[i])
        string_list[i]: str = str_word[0].upper() + str_word[1:]
        new_title += string_list[i]
        new_title += " "
        
    # removes trailing space
    return new_title.strip()


def check_sentence_ending(sentence: str) -> bool:
    """Check the ending of the sentence to verify that a period is present.

    :param sentence: str - a sentence to check.
    :return: bool - return True if punctuated correctly with period, False otherwise.
    """

    last_char: str = sentence[-1]

    if last_char in [".", "?", "!"]: 
        return True
    else: 
        return False 


def clean_up_spacing(sentence: str) -> str:
    """Verify that there isn't any whitespace at the start and end of the sentence.

    :param sentence: str - a sentence to clean of leading and trailing space characters.
    :return: str - a sentence that has been cleaned of leading and trailing space characters.
    """
    
    return sentence.lstrip().strip()


def replace_word_choice(sentence: str, old_word: str, new_word: str) -> str:
    """Replace a word in the provided sentence with a new one.

    :param sentence: str - a sentence to replace words in.
    :param old_word: str - word to replace.
    :param new_word: str - replacement word.
    :return: str - input sentence with new words in place of old words.
    """

    return sentence.replace(old_word, new_word)
