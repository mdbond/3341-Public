(declare-datatypes () ((Color Red Green Blue)))

(declare-const Ohio Color)
(declare-const Indiana Color)
(declare-const Michigan Color)
(declare-const Illinois Color)
(declare-const Kentucky Color)
(declare-const WestVirginia Color)
(declare-const Wisconsin Color)

(assert (distinct Ohio Indiana Michigan))
(assert (distinct Kentucky Indiana Illinois))
(assert (distinct Kentucky WestVirginia Ohio))
(assert (distinct Kentucky Ohio Indiana))
(assert (distinct Wisconsin Illinois))

(check-sat)
(get-model)
