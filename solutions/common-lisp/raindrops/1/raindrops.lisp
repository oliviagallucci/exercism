(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (let ((endstring ""))
  (if (= (mod n 3) 0)
      (setf endstring (concatenate 'string endstring "Pling")))
       
    (if (= (mod n 5) 0)
       (setf endstring (concatenate 'string endstring "Plang")))
        
        (if (= (mod n 7) 0)
            (setf endstring (concatenate 'string endstring "Plong")))

      (if (string= endstring "")
        (write-to-string n)
        (print endstring)))
    
  )
