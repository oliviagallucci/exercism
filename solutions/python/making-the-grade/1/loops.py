"""Functions for organizing and calculating student exam scores."""

from typing import List

def round_scores(student_scores: List[float]) -> List[int]:
    """Round all provided student scores.

    :param student_scores: list - float or int of student exam scores.
    :return: list - student scores *rounded* to nearest integer value.
    """
    rounded_scores: List[int] = []
    
    for score in student_scores: 
        rounded_score: int = round(score, 0)
        rounded_scores.append(rounded_score)

    return rounded_scores


def count_failed_students(student_scores: List[int]) -> int:
    """Count the number of failing students out of the group provided.

    :param student_scores: list - containing int student scores.
    :return: int - count of student scores at or below 40.
    """

    failed_students: int = 0
    for score in student_scores:
        if score <= 40:
            failed_students += 1

    return failed_students


def above_threshold(student_scores: List[int], threshold: int) -> List[int]:
    """Determine how many of the provided student scores were 'the best' based on the provided threshold.

    :param student_scores: list - of integer scores.
    :param threshold: int - threshold to cross to be the "best" score.
    :return: list - of integer scores that are at or above the "best" threshold.
    """

    best_students: List[int] = []
    for score in student_scores: 
        if score >= threshold: 
            best_students.append(score)
    return best_students


def letter_grades(highest: int) -> List[int]:
    """Create a list of grade thresholds based on the provided highest grade.

    :param highest: int - value of highest exam score.
    :return: list - of lower threshold scores for each D-A letter grade interval.
            For example, where the highest score is 100, and failing is <= 40,
            The result would be [41, 56, 71, 86]:

            41 <= "D" <= 55
            56 <= "C" <= 70
            71 <= "B" <= 85
            86 <= "A" <= 100
    """

    # find the range we are working with 
    f_grade: int = 41
    working_range: int = highest - f_grade
    grade_separation: int = round(working_range / 4)
    
    grade_range: List[int] = [41]
    for i in range(3): 
        f_grade += grade_separation
        grade_range.append(f_grade)

    return grade_range


def student_ranking(student_scores: List[int], student_names: List[str]) -> List[str]:
    """Organize the student's rank, name, and grade information in descending order.

    :param student_scores: list - of scores in descending order.
    :param student_names: list - of string names by exam score in descending order.
    :return: list - of strings in format ["<rank>. <student name>: <score>"].
    """
    line: str = ""
    lines: List[str] = []
    
    for rank in range(len(student_scores)): 
        line += str(rank+1) + ". " + student_names[rank] + ": " + str(student_scores[rank])
        lines.append(line)
        line = ""
    return lines


def perfect_score(student_info: List[List]) -> List[List]:
    """Create a list that contains the name and grade of the first student to make a perfect score on the exam.

    :param student_info: list - of [<student name>, <score>] lists.
    :return: list - first `[<student name>, 100]` or `[]` if no student score of 100 is found.
    """
    for student in student_info:
        score: int = student[1]
        if score == 100: 
            return student

    empty_list: List[None] = []
    return empty_list
