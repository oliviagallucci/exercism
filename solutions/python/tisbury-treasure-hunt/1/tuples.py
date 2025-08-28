"""Functions to help Azara and Rui locate pirate treasure."""

from typing import Tuple, Union, List 

def get_coordinate(record: Tuple) -> str:
    """Return coordinate value from a tuple containing the treasure name, and treasure coordinate.

    :param record: tuple - with a (treasure, coordinate) pair.
    :return: str - the extracted map coordinate.
    """

    mc: str = str(record[1])

    return mc


def convert_coordinate(coordinate: str) -> Tuple:
    """Split the given coordinate into tuple containing its individual components.

    :param coordinate: str - a string map coordinate
    :return: tuple - the string coordinate split into its individual components.
    """

    return (coordinate[0], coordinate[1])


def compare_records(azara_record: Tuple, rui_record: Tuple) -> bool:
    """Compare two record types and determine if their coordinates match.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, tuple(coordinate_1, coordinate_2), quadrant) trio.
    :return: bool - do the coordinates match?
    """

    azara_coord: str = azara_record[1]

    rui_coord: str = "".join(rui_record[1])

    return azara_coord == rui_coord


def create_record(azara_record: Tuple, rui_record: Tuple) -> Union[Tuple, str]:
    """Combine the two record types (if possible) and create a combined record group.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, coordinate, quadrant) trio.
    :return: tuple or str - the combined record (if compatible), or the string "not a match" (if incompatible).
    """

    result: bool = compare_records(azara_record, rui_record)

    if result: 
        combined: Tuple = azara_record + rui_record
        return combined

    return "not a match"


def clean_up(combined_record_group: Tuple) -> str:
    """Clean up a combined record group into a multi-line string of single records.

    :param combined_record_group: tuple - everything from both participants.
    :return: str - everything "cleaned", excess coordinates and information are removed.

    The return statement should be a multi-lined string with items separated by newlines.

    (see HINTS.md for an example).
    """
    new_list: List = [] 

    for record in combined_record_group: 
        record_list: List = list(record)
        record_list.remove(record[1])
        new_list.append(str(tuple(record_list)))

    one_string: str = ""

    for element in new_list: 
        one_string += element + "\n"

    return one_string
