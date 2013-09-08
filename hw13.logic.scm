;;; Name:
;;; Login:
;;; TA:
;;; Section:
;;; Q1.

;;; Facts about the families of the fictional 'Harry Potter' universe.
(fact (married arthur molly))
(fact (married molly arthur))

(fact (father arthur bill))
(fact (father arthur charlie))
(fact (father arthur percy))
(fact (father arthur fred))
(fact (father arthur george))
(fact (father arthur ron))
(fact (father arthur ginny))

(fact (mother molly bill))
(fact (mother molly charlie))
(fact (mother molly percy))
(fact (mother molly fred))
(fact (mother molly george))
(fact (mother molly ron))
(fact (mother molly ginny))
  
(fact (father james harry))
(fact (mother lily harry))

(fact (married harry ginny))
(fact (married ginny harry))

(fact (father harry james_sirius))
(fact (father harry albus_severus))
(fact (father harry lily_luna))

(fact (mother ginny james_sirius))
(fact (mother ginny albus_severus))
(fact (mother ginny lily_luna))

(fact (married ron hermione))
(fact (married hermione ron))

(fact (father ron rose))
(fact (father ron hugo))

(fact (mother hermione rose))
(fact (mother hermione hugo))

(fact (married bill fleur))
(fact (married fleur bill))

(fact (father bill victoire))
(fact (father bill louis))
(fact (father bill dominique))

(fact (mother fleur victoire))
(fact (mother fleur louis))
(fact (mother fleur Dominique))

(fact (parent ?who ?child)
      (father ?who ?child))
  
(fact (parent ?who ?child)
      (mother ?who ?child))


(query (mother molly ?child))
; expect Success! ; child: bill ; child: charlie ; child: percy ; child: fred ; child: george ; child: ron ; child: ginny


(query (married ?x ?y))
; expect Success! ; x: arthur	y: molly ; x: molly	y: arthur ; x: harry	y: ginny ; x: ginny	y: harry ; x: ron	y: hermione ; x: hermione	y: ron ; x: bill	y: fleur ; x: fleur	y: bill

(fact (sibling ?one ?two)
		(parent ?who ?one)
		(parent ?who ?two))

;;; Q1 tests
(query (sibling ron fred))
; expect Success!
(query (sibling fred ?who))
; expect Success! ; who: bill ; who: charlie ; who: percy ; who: fred ; who: george ; who: ron ; who: ginny ; who: bill ; who: charlie ; who: percy ; who: fred ; who: george ; who: ron ; who: ginny

;;; Q2.

;;; Facts about DNA
(fact (complementary t a))
(fact (complementary a t))
(fact (complementary c g))
(fact (complementary g c))

;;; List manipulation
(fact (equal-lists () ()))
(fact (equal-lists (?e . ?r) (?e . ?s))
      (equal-lists ?r ?s))

(fact (append () ?a ?a))
(fact (append (?x . ?r) ?b (?x . ?c))

      (append ?r ?b ?c))

(fact (member ?x (?x . ?r)))
(fact (member ?x (?y . ?r))
      (member ?x ?r))

(fact (reverse () ()))
(fact (reverse (?x . ?r) ?y)
      (reverse ?r ?s)
      (append ?s (?x) ?y)
      )



(fact (rev-comp-strand () ()))
(fact (rev-comp-strand (?x . ?r) ?y)
      (complementary ?x ?z)
      (rev-comp-strand ?r ?s)
      (append ?s (?z) ?y))

;;; Q2 tests
(query (rev-comp-strand (t c t g a) ?what))
; expect Success! ; what: (t c a g a)


;;; Q3.

(fact (back ?a () ?a))
(fact (back ?b (?x . ?r) (?x . ?c))
		(back ?b ?r ?c))

(fact (add-to-all ?check () ()))
(fact (add-to-all ?check (?x . ?r) ?huh) 
		(add-to-all ?check ?r ?s)
		(append (?check) ?x ?meh)
		(back ?s (?meh) ?huh))


;;; Q3 tests
(query (add-to-all a ((b) (c d)) ((a b) (a c d))))
; expect Success!
(query (add-to-all a ((b c) (b) (foo)) ?what))
; expect Success! ; what: ((a b c) (a b) (a foo))
(query (add-to-all ?what ((c) (d e) ()) ((b c) (b d e) (b))))
; expect Success! ; what: b
(query (add-to-all ?what ?list ((b c) (b e) (b))))
; expect Success! ; what: b	list: ((c) (e) ())
(query (add-to-all ?what ?list ((b c) (d e) (b))))
; expect Failed.


;;; Q4.



;;; Q4 tests
(query (sublists (1 2 3) ?what))
; expect Success! ; what: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))


;;; Q5.


; (fact (unzip ?a () ?a))
; (fact (unzip (?x ?b . ?s) (?x . ?r) (?b . ?r1))
; 		(unzip ?s ?r ?r1))

(fact (even () ()))
(fact (odd () ()))
(fact (odd (?a ?b . ?r) (?a . ?r2))
		(odd ?r ?r2))
(fact (even (?a ?b . ?r) (?b . ?r2))
		(even ?r ?r2))
(fact (unzip ?x ?y ?z)
		(even ?x ?z)
		(odd ?x ?y))


;;; Q5 tests
(query (unzip (a b c d e f) ?odds ?evens))
; expect Success! ; odds: (a c e)	evens: (b d f)
(query (unzip ?what (a b c) (d e f)))
; expect Success! ; what: (a d b e c f)


;;; Q6.

(fact (+ ?left ?right ?what)
		(append ?left ?right ?what))

;;; + tests
(query (+ (1 1 1) (1 1) ?what))
; expect Success! ; what: (1 1 1 1 1)
(query (+ (1 1 1) ?what (1 1 1 1 1 1 1)))
; expect Success! ; what: (1 1 1 1)


(fact (- ?left ?right ?what)
		(append ?what ?right ?left))

;;; - tests
(query (- (1 1 1) (1 1) ?what))
; expect Success! ; what: (1)
(query (- (1 1 1 1 1 1 1) ?what (1 1 1)))
; expect Success! ; what: (1 1 1 1)

(fact (* ?left () ()))
(fact (* ?left (?right . ?r) ?what)
		(* ?left ?r ?s)
		(append ?s ?left ?what))

;;; * tests
(query (* (1 1 1) (1 1) ?what))
; expect Success! ; what: (1 1 1 1 1 1)


(fact (> ?input ?output)
		(append ?output (1) ?output1)
		(- ?input ?output1 ?what))

(fact (< ?input ?output)
		(append ?input (1) ?input1)
		(- ?output ?input1 ?what))

(fact (>= ?input ?output)
		(- ?input ?output ?what))

(fact (<= ?input ?output)
		(- ?output ?input ?what))

;;; <, >, <=, <= tests
(query (> (1 1 1 1) (1 1 1)))
; expect Success!
(query (< (1 1 1 1) (1 1 1)))
; expect Failed.
(query (> (1 1) (1 1 1)))
; expect Failed.
(query (< (1 1) (1 1 1)))
; expect Success!
(query (> (1 1 1) (1 1 1)))
; expect Failed.
(query (< (1 1 1) (1 1 1)))
; expect Failed.
(query (>= (1 1 1 1) (1 1 1)))
; expect Success!
(query (<= (1 1 1 1) (1 1 1)))
; expect Failed.
(query (>= (1 1) (1 1 1)))
; expect Failed.
(query (<= (1 1) (1 1 1)))
; expect Success!
(query (>= (1 1 1) (1 1 1)))
; expect Success!
(query (<= (1 1 1) (1 1 1)))
; expect Success!


(fact (= ?left ?right)
		(equal-lists ?left ?right))

(fact (!= ?left ?right)
		(< ?left ?right))
(fact (!= ?left ?right)
		(> ?left ?right))

;;; =, != tests
(query (= (1 1 1 1) (1 1 1)))
; expect Failed.
(query (!= (1 1 1 1) (1 1 1)))
; expect Success!
(query (= (1 1 1 1) (1 1 1 1)))
; expect Success!
(query (!= (1 1 1 1) (1 1 1 1)))
; expect Failed.
(query (= (1 1 1) (1 1 1 1)))
; expect Failed.
(query (!= (1 1 1) (1 1 1 1)))
; expect Success!

(fact (/ () ?output () ()))
(fact (/ ?input (?output . ?r) ?quo ?rem)
		(- ?input (?output . ?r) ?value)
		(append ?quo ?output ?s)
		(/ ?value (?output . ?r) ?s ?rem))

		

;;; / tests
(query (/ (1 1 1 1 1 1) (1 1 1) ?quo ?rem))
; expect Success! ; quo: (1 1)	rem: ()
(query (/ (1 1 1 1 1 1) (1 1 1 1) ?quo ?rem))
; expect Success! ; quo: (1)	rem: (1 1)


