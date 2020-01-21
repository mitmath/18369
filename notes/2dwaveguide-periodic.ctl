; Example MPB input file for 18.325, for a periodic (period = 1) sequence
; of dielectric cylinders in the x direction.  (This file is otherwise
; very similar to 2dwaveguide.ctl ... refer to that file for more details.)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Some parameters:

(define-param eps-hi 12) ; the waveguide dielectric constant
(define-param eps-lo 1) ; the surrounding low-dielectric material

(define-param r 0.2) ; the radius of the cylinders

(define-param Y 10) ; the size of the computational cell in the y direction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Define the structure and the computational cell

; note that now the size in the x direction is 1 (one period)
(set! geometry-lattice (make lattice (size 1 Y no-size)))

(set! default-material (make dielectric (epsilon eps-lo)))

(set! geometry
      (list (make cylinder ; cylinder oriented along z direction
	      (center 0 0 0) ; centered at origin
	      (radius r) (height infinity)
	      (material (make dielectric (epsilon eps-hi))))))

(set-param! resolution 16)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tell MPB what eigenmodes we want to compute.

(define-param kmin 0)
(define-param kmax 2)
(define-param k-interp 60)
; k-points is the list of k values that MPB computes eigenmodes at.
; (vector3 x y z) specifies a vector.  (k is in units of 2 pi/distance)
(set! k-points (interpolate k-interp 
			    (list (vector3 kmin 0 0) (vector3 kmax 0 0))))

; we also need to specify how many eigenmodes we want to compute, given
; by "num-bands":
(set-param! num-bands 5)

(run-tm-yeven)
(run-tm-yodd)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; uncomment to output some fields at k=0.4:

(define-param k 0.4) ; the k value where we'll output the modes
(set! k-points (list (vector3 k 0 0))) ; compute only a single k now

(run-tm output-efield-z)
