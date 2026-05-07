(defun merge-sorted-lists (list1 list2)
  (cond
    ((null list1) list2)
    ((null list2) list1)
    ((< (car list1) (car list2))   ;; Если первый элемент первого списка меньше,
     (cons (car list1)             ;; Добавляем его в результат и продолжаем сравнение оставшихся частей
       (merge-sorted-lists (cdr list1) list2)))
    (t                             ;; В противном случае,
     (cons (car list2)             ;; Добавляем первый элемент второго списка и продолжаем сравнение оставшихся частей
       (merge-sorted-lists list1 (cdr list2))))))

; (let ((list1 '(1 3 5 7))
;       (list2 '(2 4 6 8)))
;   (print (merge-sorted-lists list1 list2)))
