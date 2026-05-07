;; Функция для определения, является ли объект атомом
(defun atom-p (obj)
  (not (consp obj)))

;; Функция для поиска подсписка на заданной глубине
(defun sublistp-at-depth (lst1 lst2 depth)
  (cond
    ((null lst1) nil)                 ;; Основной список исчерпан, подсписка нет
    ((eq depth 0)                     ;; Достигли нужной глубины
     (equal lst1 lst2))               ;; Сравниваем списки
    ((atom-p (car lst1))              ;; Первый элемент — атом
     (sublistp-at-depth (cdr lst1) lst2 depth)) ;; Переходим к следующему элементу
    (t                                ;; Первый элемент — список
     (or (sublistp-at-depth (car lst1) lst2 (- depth 1)) ;; Рекурсивно спускаемся глубже
         (sublistp-at-depth (cdr lst1) lst2 depth)))))   ;; Или идем дальше по списку

; (let ((lst1 '(a (b (c (d e f) g) h) i))
;       (lst2 '(d e f))
;       (depth 3))
;   (print (sublistp-at-depth lst1 lst2 depth)))