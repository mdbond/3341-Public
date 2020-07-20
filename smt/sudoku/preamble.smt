(declare-fun grid ((Int) (Int)) Int)

(define-fun in-range ((i Int)) Bool
  (and (>= i 1) (<= i 9))
)

(assert (forall ((i Int) (j Int))
           (=> (and (in-range i) (in-range j))
               (in-range (grid i j))
)       )  )

(assert (forall ((i Int) (j Int) (k Int))
          (=> (and (in-range i) (in-range j) (in-range k) (= (grid i j) (grid i k)))
              (= j k)
)       ) )

(assert (forall ((i Int) (j Int) (k Int))
          (=> (and (in-range i) (in-range j) (in-range k) (= (grid i j) (grid k j)))
              (= i k)
)       ) )

(assert (forall ((i Int) (j Int))
          (=> (and (or (= i 1) (= i 4) (= i 7)) (or (= j 1) (= j 4) (= j 7)))
              (distinct (grid (+ i 0) (+ j 0)) (grid (+ i 0) (+ j 1)) (grid (+ i 0) (+ j 2))
                        (grid (+ i 1) (+ j 0)) (grid (+ i 1) (+ j 1)) (grid (+ i 1) (+ j 2))
                        (grid (+ i 2) (+ j 0)) (grid (+ i 2) (+ j 1)) (grid (+ i 2) (+ j 2))
)       ) )   )

