(defun sejdvik-sequence (n)
  (labels ((recursion (gaps d i)
             (if (> d n)
                 gaps
                 (let* ((new-gaps (append gaps (list d)))
                        (new-d (if (evenp i)
                                   (+ (- (* 9 (expt 2 i)) (* 9 (expt 2 (/ i 2)))) 1)
                                   (+ (- (* 8 (expt 2 i)) (* 6 (expt 2 (/ (+ i 1) 2)))) 1))))
                   (recursion new-gaps new-d (+ i 1))))))
    (recursion '() 1 1)))

(defun insert (x lst)
  (cond ((null lst) (list x))
        ((<= x (car lst)) (cons x lst))
        (t (cons (car lst) (insert x (cdr lst))))))

(defun sort-sublist (lst gap)
  (if (< gap 1)
      lst
      (let ((sorted-list 
              (labels ((sort-with-gap (i)
                         (if (>= i (length lst))
                             '()
                             (let ((current-element (nth i lst)))
                               ;; Сортируем подсписок
                               (let ((sublist 
                                      (sort-with-gap (+ i gap))))
                                 ;; Вставляем текущий элемент в отсортированный подсписок
                                 (insert current-element sublist))))))
                ;; Начинаем сортировку с первого элемента
                (sort-with-gap 0))))
        ;; Создаем новый отсортированный список
        (labels ((create-new-list (i sorted new-lst)
                   (if (< i (length lst))
                       (if (= (mod i gap) 0)
                           (cons (nth i sorted) 
                                 (create-new-list (+ i 1) sorted new-lst))
                           (cons (nth i lst) 
                                 (create-new-list (+ i 1) sorted new-lst)))
                       new-lst)))
          (create-new-list 0 sorted-list '())))))

(defun shell-sort (lst)
  (let ((gaps (sejdvik-sequence (length lst))))
    ;; Рекурсивно сортируем с каждым шагом из последовательности Седжвика
    (labels ((shell-sort-aux (lst gaps)
               (if (null gaps)
                   lst
                   ;; Сортируем список с текущим шагом
                   (let ((sorted-list 
                           (sort-sublist lst (car gaps))))
                     ;; Рекурсивный вызов для оставшихся промежутков
                     (shell-sort-aux sorted-list (cdr gaps))))))
      ;; Запускаем сортировку
      (shell-sort-aux lst gaps))))

; (let ((lst '(9 1 5 3 7)))
;   (format t "Исходный список: ~a~%" lst)
;   (let ((sorted-lst (shell-sort lst)))
;     (format t "Отсортированный список: ~a~%" sorted-lst)))
