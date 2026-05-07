(defun weird-reverse-lists (lst)
  (loop for tail on lst
        append (reverse tail)
  )
)

; (print(weird-reverse-lists '(1 2 3)))
; (print(weird-reverse-lists '(1 2 3 4 5 6)))