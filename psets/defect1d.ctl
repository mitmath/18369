; MPB input file to simulate a "point defect" state formed by modifying
; a single eps2 layer in a periodic structure formed by two materials
; eps1 and eps2.  The change in eps2 is controlled by the parameter deps2.
;
; To model a defect, we have to use a "supercell" with N copies of the unit
; cell, where one of the copies has been changed.  This also means that we
; need to compute N times as many bands, because of the "band folding"
; (the reduction of the Brillouin zone).
;
; As usual, we choose units of the periodicity a (so that a=1).

(define-param eps1 12)
(define-param eps2 1)

; note that you can change deps2 on the command-line by e.g.:
;     mpb deps2=0.1 defect1d.ctl
(define-param deps2 0) ; the change in one eps2 layer (default is 0)

; use quarter-wave thickness by default
(define-param d1 (/ (sqrt eps2) (+ (sqrt eps1) (sqrt eps2))))
(define d2 (- 1 d1))

(define-param N 15) ; the size of the supercell
(set! geometry-lattice (make lattice (size N no-size no-size)))

(set! default-material (make dielectric (epsilon eps1)))

; this is just one block of eps2 at the center... we duplicate it below
(set! geometry (list (make block 
		       (center 0)
		       (size d2 infinity infinity)
		       (material (make dielectric (epsilon eps2))))))

; to create the geometry, we have to repeat the epsilon 1 block N times,
; and we can do this using the geometric-objects-lattice-duplicates
; function (see the MPB manual).  This function takes the geometry
; list and duplicates it as many times as necessary to fill up
; the lattice (with a duplicate appearing at every unit-vector shift).
(set! geometry (geometric-objects-lattice-duplicates geometry))

; Finally, we have to create the defect.  We'll do this by appending
; a new object with eps2 + deps2 at the end of the geometry list
; -- note that later objects take precedence over earlier objects,
;    so by putting it at the end we ensure that the defect "overwrites"
;    the whatever was previously there.
(set! geometry (append
		geometry
		(list (make block
                       (center 0)
                       (size d2 infinity infinity)
                       (material (make dielectric
				   (epsilon (+ eps2 deps2))))))))


(set-param! resolution 32) ; 32 pixels/a

; for the defect mode, k does matter (if the supercell is big enough),
; so we just set it to zero.
(set! k-points (list (vector3 0)))

; because of the folding, the first band (before the gap) will be folded
; N times.  So, we need to compute N bands plus some extra bands to
; get whatever defect states lie in the gap.  We'll just use 1 extra band,
; but you'll need to increase this to see higher-order defect modes.
(set! num-bands (+ N 1))

(run-tm output-efield-z) ; run, outputting Ez
