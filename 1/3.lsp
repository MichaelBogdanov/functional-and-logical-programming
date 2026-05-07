(defun process-lists (first-list second-list)
  (if (and (numberp (first first-list))
           (integerp (first first-list))
           (>= (first first-list) 0))
      second-list
      (cons (first second-list)
            (rest first-list))))

; (setf list1 '(10 a b c d e f g h i j k l m n o p q r s t u v w x y z))
; (setf list2 '(q w e r t y u i o p))

; (format t "~a~%" (process-lists list1 list2))

; (setf list1 '(x a b c d e f g h i j k l m n o p q r s t u v w x y z))
; (setf list2 '(q w e r t y u i o p))

; (format t "~a~%" (process-lists list1 list2))
