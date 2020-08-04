(define (triple n)
  (+ n (+ n n))
)

(define (myeven? x)
  (cond ((= x 0) #t)
        ((= x 1) #f)
		(#t (myeven? (- x 2)))))

(define (mbr? x list)
  (cond ((null? list) #f)
        ((equal? x (car list)) #t)
        (#t (mbr? x (cdr list)))))

(define (uni s1 s2)
  (cond
    ((null? s1) s2)
    ((mbr? (car s1) s2) (uni (cdr s1) s2))
	(#t (cons (car s1) (uni (cdr s1) s2)))
  )
)

(define (maxlist list)
  (cond
    ((null? (cdr list)) (car list))
	(#t (let ((m (maxlist (cdr list))))
	      (cond
            ((> (car list) m)
		     (car list))
	        (#t m)
		  )
		)
    )
  )
)

(define (mymap f list)
  (cond
    ((null? list) '())
    (#t (cons (f (car list)) (mymap f (cdr list))))
  )
)

(define (cmp-lists-by-length a b) (<= (length a) (length b)))

(define (qsort list)
  (cond
    ((null? list) '())
    (#t (let ((pivot (car list)))
	      (append
	        (qsort (sublist cmp-lists-by-length
                  		    (cdr list)
			                pivot))
		    (cons pivot '())
		    (qsort (sublist (lambda (a b) (> (length a) (length b)))
			                (cdr list)
							pivot))
          )
    )   )
  )
)

(define (sublist f list x)
  (cond
    ((null? list) '())
    ((f (car list) x) (cons (car list) (sublist f (cdr list) x)))
    (#t (sublist f (cdr list) x))
  )
)


(let ((x 2) (y 3))
  (let ((x 7) (z (+ x y)))
    (* z x)))

(define (makelist f n)
  (cond ((= n 0) '())
        (#t (cons f (makelist f (- n 1))))))

(define (newmap x list)
  (cond ((null? list) '())
        (#t (cons ((car list) x) (newmap x (cdr list))))))
  
; (unique '(2 2 9 6 7 7 8 9 7 9 10))
  
(define (unique f list)
  (cond
    ((null? (cdr list)) list)
    ((f (car list) (cdr list)) (unique f (cdr list)))
    (#t (cons (car list) (unique f (cdr list))))))

; (define (f x rest)
  
(define (myinterpreter prog-list)
  (cons (eval-plan-expr (cadar prog-list) '()) '())
)
(define (eval-plan-expr expr bindings)
  (cond
    ((integer? expr) expr)
	((equal? (car expr) 'myadd) (+ (cadr expr) (caddr expr)))
  )
)  

( myinterpreter
 '( (prog (myadd 3 5))
    (prog 5)
    (prog (myadd 3 (myadd 6 8)))
    (prog (mylet z (myadd 4 5) (mymul z 2)))
  )
)  

(define (rev l)
  (cond ((null? l) '())
        (#t (append (rev (cdr l)) (list (car l))))))

(define (flatten l)
  (cond ((null? l) '())
        ((list? (car l)) (append (flatten (car l)) (flatten (cdr l))))
        (#t (cons (car l) (flatten (cdr l))))))
