; Definition of HB: program order & synchronization order & transitive

(declare-fun program-order ((Int) (Int)) Bool)
(declare-fun sync-order ((Int) (Int)) Bool)
(declare-fun happens-before ((Int) (Int)) Bool)

(assert (forall ((e1 Int) (e2 Int))
          (=> (program-order e1 e2)
              (happens-before e1 e2)
)       ) )

(assert (forall ((e1 Int) (e2 Int))
          (=> (sync-order e1 e2)
              (happens-before e1 e2)
)       ) )

(assert (forall ((e1 Int) (e2 Int) (e3 Int))
          (=> (and (happens-before e1 e3) (happens-before e3 e2))
              (happens-before e1 e2)
)       ) )

; An example execution and program-order and sync-order facts about it:

(define-const T1_wr_x  Int 1)
(define-const T1_rel_m Int 2)
(define-const T2_acq_m Int 3)
(define-const T2_wr_x  Int 4)
(define-const T1_rd_x  Int 5)

(assert (program-order T1_wr_x T1_rel_m))
(assert (program-order T1_rel_m T1_rd_x))
(assert (program-order T2_acq_m T2_wr_x))

(assert (sync-order T1_rel_m T2_acq_m))

; Some properties we can check:
; (assert (not (happens-before T1_wr_x T2_wr_x)))
; (assert (not (happens-before T2_wr_x T1_rd_x)))

(check-sat)
; (get-model)
