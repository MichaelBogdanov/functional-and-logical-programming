(defun create-new-list (lists numbers)
  (mapcar (lambda (lst idx) (nth idx lst)) lists numbers))

; (setf lists '((Y U I) (G1 G2 G3) (KK LL MM JJJ)))
; (setf numbers '(2 2 3))

; (print (create-new-list lists numbers))