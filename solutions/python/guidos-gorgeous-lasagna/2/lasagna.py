"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


EXPECTED_BAKE_TIME = 40

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


# You might also consider using 'PREPARATION_TIME' here, if you have it defined.

def preparation_time_in_minutes(number_of_layers): 
    """Calculate the time to create a given number of layers. 

    :param number_of_layers: int - two minutes each 
    :return: int - the prepreation time in mintutes. 

    Function that takes the layer the lasagna has as
    an argument and returns how many minutes the lasagna will take to be 
    prepared. 
    """
    
    return 2 * number_of_layers
    


# Remember to add a docstring (you can copy and then alter the one from bake_time_remaining.)

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time): 
    """Calculate the time spend making the lasagna.

    :param number_of_layers: int - two minutes each 
    :parem elapsed_bake_time: int - minutes in the oven so far
    :return: int - the time someone has spent on the lasagna thus far in mintutes. 

    Function that takes the layers of the lasagna and the elapsed bake time as
    arguments and returns how many minutes the lasagna has been spent on so far
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
    
