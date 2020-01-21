; Example MPB input file for 18.325, illustrating a simple 2d dielectric
; waveguide along the x direction.  Run it with:
;        mpb 2dwaveguide.ctl > 2dwaveguide.out
; to produce an output file 2dwaveguide.out (as well as some .h5 data files).
; As described in the manual, you can extract the eigenfrequencies
; by doing "grep freqs: 2dwaveguide.out" at the Unix shell.

; (Note that anything after a ";" on a line is ignored by MPB.)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; First, we will define some parameters describing our structure.  Defining
; them symbolically here makes it easier to change them.  (e.g. we
; can change the dielectric constant from the command line via
; "mpb eps-hi=13 2dwaveguide.ctl".)  We then use these parameters below

(define-param eps-hi 12) ; the waveguide dielectric constant
(define-param eps-lo 1) ; the surrounding low-dielectric material
(define-param h 1) ; the thickness of the waveguide (arbitrary units)

(define-param Y 10) ; the size of the computational cell in the y direction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Define the structure and the computational cell

; Here we define the size of the computational cell.  Since it is 2d,
; it has no-size in the z direction.  Because it is a waveguide in the
; x direction, then the eigenproblem at a given k has no-size in the
; x direction as well.
(set! geometry-lattice (make lattice (size no-size Y no-size)))

; the default-material is what fills space where we haven't placed objects
(set! default-material (make dielectric (epsilon eps-lo)))

; a list of geometric objects to create structures in our computational cell:
; (in this case, we only have one object, a block to make the waveguide)
(set! geometry
      (list (make block ; a dielectric block (a rectangle)
	      (center 0 0 0) ; centered at origin
	      (size infinity h infinity) ; block is finite only in y direction
	      (material (make dielectric (epsilon eps-hi))))))

; MPB discretizes space with a given resolution.   Here, we set
; a resolution of 32 pixels per unit distance.  Thus, with Y=10
; our comptuational cell will be 320 pixels wide.  In general,
; you should make the resolution fine enough so that the pixels
; are much smaller than the wavelength of the light.
(set-param! resolution 32)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tell MPB what eigenmodes we want to compute.

; Generally, we want omega(k) for a range of k values.  MPB
; can automatically interpolate a set of k values between any
; given bounds.  Here, we will interpolate 10 k's between 0 and 2.
(define-param kmin 0)
(define-param kmax 2)
(define-param k-interp 10)
; k-points is the list of k values that MPB computes eigenmodes at.
; (vector3 x y z) specifies a vector.  (k is in units of 2 pi/distance)
(set! k-points (interpolate k-interp 
			    (list (vector3 kmin 0 0) (vector3 kmax 0 0))))

; we also need to specify how many eigenmodes we want to compute, given
; by "num-bands":
(set-param! num-bands 5)

; to compute *all* the modes, we now simply type (run).
; However, it is convenient to compute only one symmetry of mode
; at a time.  In particular, we will compute only TM (E in z direction)
; modes, and separately compute even and odd modes with respect to the
; y=0 mirror symmetry plane.
(run-tm-yeven)
(run-tm-yodd)
; (If we don't have y=0 mirror symmetry we should just use run-tm).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; That's it!  We're done!  However, suppose we now want to get the
; *fields* at a given k.  To do this, we'll call the run function
; again, this time giving it an option to output the modes.

(define-param k 1) ; the k value where we'll output the modes
(set! k-points (list (vector3 k 0 0))) ; compute only a single k now

; output-efield-z does just what it says.  There are also options
; to output any other field component we care to examine.
(run-tm output-efield-z)
