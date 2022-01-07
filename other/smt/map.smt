(declare-datatypes () ((Color Red Green Blue)))

(declare-const OH Color)
(declare-const IN Color)
(declare-const KY Color)
(declare-const WV Color)
(declare-const VA Color)
(declare-const MD Color)
(declare-const PA Color)

(assert (distinct KY WV OH))
(assert (distinct KY OH IN))
(assert (distinct WV VA MD))
(assert (distinct PA WV MD))
(assert (distinct PA OH WV))
(assert (distinct KY WV VA))

(check-sat)
(get-model)
