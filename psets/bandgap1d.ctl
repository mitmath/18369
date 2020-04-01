; MPB input file to compute the band diagram (and gaps) of a
; 1d periodic structure consisting of two layers eps1 and eps2 with
; thicknesses d1 and d2.  As usual, we choose the period a=1, i.e.
; "a" is our unit of distance.

; unit cell is just size 1 in x direction and no-size in y and z.
(set! geometry-lattice (make lattice (size 1 no-size no-size)))

; way more resolution than we usually need, but it's so fast that why not?
(set-param! resolution 1024)

(define-param eps1 12)
(define-param eps2 1)

; We'll make the default d1 equal to the quarter-wave thickness.  You
; can change that by changing this line, or even easier, by running:
;       mpb d1=0.3 bandgap1d.ctl
; or whatever.  (define-param is a command to define parameters that
; can be varied from the command line like this.)
(define-param d1 (/ (sqrt eps2) (+ (sqrt eps1) (sqrt eps2))))
(define d2 (- 1 d1))

; we could define the unit cell by two objects (eps1 and eps2), but it
; is easier just to set the default material to eps2 and then add one
; object for eps1.
(set! default-material (make dielectric (epsilon eps2)))
(set! geometry (list (make block 
		       (center 0)
		       (size d1 infinity infinity)
		       (material (make dielectric (epsilon eps1))))))

; Let's set up the k points we want to compute.  Actually, to get the
; band gap we really only need k = pi/a, but we'll compute a range
; of k's in the irreducible Brillouin zone just so that we can make
; nice plots if we want.  Note that k is in units of 2pi/a, so, k=pi/a
; is just given as k=0.5.
(define-param k-interp 9)
(set! k-points (interpolate k-interp (list (vector3 0) (vector3 0.5))))

; the number of bands to compute (you may want more or less)
(set-param! num-bands 5)

(run-tm) ; TM and TE are equivalent in 1d, so we'll just do TM
