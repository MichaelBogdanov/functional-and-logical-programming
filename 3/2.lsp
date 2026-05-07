;; Функция для вставки элемента в отсортированный список
(defun insert-element (element sorted-list)
  (cond ((null sorted-list) (list element)) ; Если список пуст, добавляем элемент
        ((< element (car sorted-list)) (cons element sorted-list)) ; Если элемент меньше первого, добавляем его в начало
        (t (cons (car sorted-list) (insert-element element (cdr sorted-list)))))) ; Рекурсивно вставляем дальше

;; Основная функция сортировки простыми включениями
(defun insertion-sort (lst)
  (if (null lst) ; Если список пуст, возвращаем его
      lst
      (insert-element (car lst) (insertion-sort (cdr lst))))) ; Рекурсивно сортируем хвост списка и вставляем голову

; (print (insertion-sort '(56 43 12 78 42 93 16 55)))
