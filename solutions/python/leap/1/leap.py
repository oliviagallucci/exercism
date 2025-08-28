def leap_year(year):
    # if divisable by 4
    if (year % 4 == 0): 
        # if divisable by 100
        if (year % 100 == 0):
            # if divisable by 400
            if (year % 400 == 0):
                return True
            else: 
                return False
        else: 
            return True 
    else: 
        return False 
