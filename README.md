# 18.369(J)/8.315(J): Mathematical Methods in Nanophotonics

This is the repository of course materials for the [18.369(J)/8.315(J)](http://student.mit.edu/catalog/m18a.html#18.369) course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Spring 2018.

Syllabus
--------

> **Tired of doing electromagnetism like it's 1865?**
>
> _Find out what solid-state physics has brought to [8.02](https://ocw.mit.edu/courses/physics/8-02-physics-ii-electricity-and-magnetism-spring-2007/) in the last 20 years, in this new course surveying the physics and mathematics of nanophotonics—electromagnetic waves in **media structured on the scale of the wavelength**._
>
> _In this regime, which is the basis for everything from iridescent butterfly wings to distributed-feedback lasers and integrated optical devices to the next generation of optical fibers, the 140–year-old analytical techniques you learned in 8.02 aren't as useful. Instead, we will cover computational methods combined with high-level algebraic techniques borrowed from solid-state quantum mechanics: linear algebra and eigensystems, group theory, Bloch's theorem and conservation laws, perturbation methods, and coupled-mode theories, to understand surprising optical phenomena from band gaps to slow light to nonlinear filters._
>
> For beginning graduate students and advanced undergraduates.


**Lectures**: MWF 3–4pm (2-135). **Office Hours:** Thurs. 4–5pm (2-345). TA/grader: [Ethan Jaffe](http://math.mit.edu/~eyjaffe/).

**Probable topics**: _Methods_: linear algebra & eigensystems for Maxwell's equations, symmetry groups and representation theory, Bloch's theorem, numerical eigensolver methods, time and frequency-domain computation, perturbation theory, coupled-mode theories, waveguide theory, adiabatic transitions. _Optical phenomena_: photonic crystals & band gaps, anomalous diffraction, mechanisms for optical confinement, optical fibers (new & old), nonlinearities, integrated optical devices.

**Grading**: 33% problem sets (weekly/biweekly). 33% mid-term exam (**April 18**: 2-4pm _or_ 3-5pm in 13-1143). 34% final project (proposal due April 13, project due May 16).

**Books**: [Photonic Crystals: Molding the Flow of Light (Second Edition)](http://ab-initio.mit.edu/book) (**readable online**). (This book is at an undergraduate level and 18.369/8.315 is somewhat more advanced, but the book should provide a useful foundation.)

Useful (but not required) books (available in the library): [Group Theory and Its Applications in Physics](http://link.springer.com/book/10.1007/978-3-642-80021-4) by Inui et al. ([readable online](http://link.springer.com/book/10.1007/978-3-642-80021-4) via MIT), and _Group Theory and Quantum Mechanics_ by Michael Tinkham.

**Final projects:** A typical project will be to find some interesting nanophotonic structure/phenomenon in the literature (chapter 10 of the book may be a helpful guide to some possibilities), reproduce it (usually in 2d only, so that the simulations are quick), using (e.g.) the numerical software ([Meep](https://github.com/stevengj/meep) and/or [MPB](https://github.com/stevengj/mpb)) introduced in the course/psets (other useful free/open-source software: [SCUFF-EM](http://homerreid.dyndns.org/scuff-em/) and [S4](https://web.stanford.edu/group/fan/S4/)), and extend/analyze it in some further way (try some other variation on the geometry, etc.). Then write up the results in a 7-15 page report (in the format of a journal article, ideally [Phys. Rev. A](http://pra.aps.org) style, including figures, a comprehensive review of related work, etcetera)—reports should be written for a target audience of your classmates in 18.369/8.315, and should explain what you are doing at that level. Projects should _not_ be a rehash of work you've already done in previous terms for your research (but may be some extension/digression thereof).

**Prerequisites**: 18.303, 8.07, or permission of instructor. (Basically, some experience with partial differential equations and linear algebra. e.g. 8.05, 8.07, 6.013, 3.21, 2.062 are all good background.) This is a graduate-level course aimed at beginning graduate students and suitably advanced undergraduates.

Supplementary lecture notes will be made available as the term progresses.

Lecture Summaries and Handouts
------------------------------

### Lecture 1: 6 Feb 2018

**Handouts:** syllabus (this web page), [introductory slides](notes/18.369-intro.pdf), [collaboration policy](homework-policy.pdf), [pset 1](psets/pset1-spring18.pdf) (due Wed Feb 14).

Motivation and introduction: this class is about electromagnetism where the wavelength is neither very large (quasi-static) nor very small (ray optics), and the analytical and computational methods we can use to understand phenomena in materials that are structured on the wavelength scale. In that situation, there are very few cases that can be solved analytically, but lots of interesting phenomena that we can derive from the _structure_ of the equations.

We start by setting up the source-free Maxwell equations as a linear eigenproblem, which will allow us to bring all of the machinery of linear algebra and (eventually) group theory to bear on this problem without having to solve the PDE explicitly (which is usually impossible to do analytically).

Notational introductions: Hilbert spaces (vector space + inner product), notation for inner products and states (magnetic fields etc.). Defined the adjoint (denoted †) of linear operators and Hermitian operators (Â=Â†).

**Further reading:** See chapter 2 of the _Photonic Crystals_ textbook for Maxwell's equations as an eigenproblem etc. For a more sophisticated treatment of Hilbert spaces, adjoints, and other topics in functional analysis, a good text is _Basic Classes of Linear Operators_ by Gohberg et al. The basics of electromagnetism in macroscopic media (ε and μ) are covered in any non-freshman electromagnetism textbook, e.g. _Classical Electrodynamics_ by Jackson or _Introduction to Electromagnetism_ by Griffiths.

### Lecture 2: 9 Feb

Showed that the Maxwell eigen-operator ∇×ε⁻¹∇× is Hermitian for real ε (by showing that ∇× is Hermitian). The Maxwell operator is also positive semidefinite for ε>0, and it follows that the eigenfrequencies are real.

Simple one-dimensional example of fields in metallic cavity, showed that consequences match predictions from linear algebra.

**Further reading:** See chapter 2 of the textbook.

### Lecture 3: 12 Feb

**Handouts:** [representation theory summary](notes/representation-theory.pdf)

Discussed consequences of symmetry, and in particular showed that mirror symmetry implies even/odd solutions. Discussed subtleties of mirror symmetries for electromagnetism: although the E and H fields seem to have opposite symmetry, they don't, because H is a pseudovector. Defined general rotation operators _R̂_ for vector and pseudovector fields.

Gave a simple 2d example of fields in a 2d metal box, and showed that the symmetries are more complicated, and may include degeneracies. In order to understand this, we need to understand the relationship of different symmetry operations to one another — this relationship is expressed more precisely by the _group_ of symmetry operators, which we will get to next time.

**Further reading:** Chapter 3 of the photonic-crystals text. See the Inui textbook, or many similar sources, on group theory; the most helpful in this context are the many "group theory in physics" books.

### Lecture 4: 14 Feb

**Handouts:** [pset 2](psets/pset2-spring18.pdf) (due Mon, Feb 26), [pset 1 solutions](psets/pset1sol-spring18.pdf)

Defined groups, and group representations, irreducibility, and partner functions, conjugacy classes and most of the other things on the handout, with some examples (the square symmetry group and the mirror symmetry group). (Briefly covered everything on the handout _except_ Great Orthogonality Theorem, character tables, projection operators, and product representations.)

We will show next that eigenfunctions are partner functions of representations of the symmetry group. For example, even and odd functions in a mirror-symmetric system correspond precisely to the two irreducible representations of the {E,σ} group.

Claimed that all eigenfunctions can be chosen to transform as partner functions of an irreducible representation of the symmetry group (also called a "basis" of the representation), with the dimension of the representation given by the degree of degeneracy of the eigenvalue. Proof next lecture.

**Further reading:** Chapter 3 of the text, but this doesn't get into representation theory. See e.g. _Group Theory and Its Applications in Physics_ by Inui et al. (especially sections 4.1, 6.1, and 6.2) or _Group Theory and Quantum Mechanics_ by Michael Tinkham (especially sections 3-1 and 3-6), or any book with a similar title.

### Lecture 5: 16 Feb

Proved that all eigenfunctions can be chosen to transform as partner functions of an irreducible representation of the symmetry group (also called a "basis" of the representation), with the dimension of the representation given by the degree of degeneracy of the eigenvalue. Proved that all representations derived from a given eigenvalue are equivalent. Noted that orthonormal eigenfunctions give a unitary representation (outlined proof but did not work it through).

If the representation is irreducible, then the degeneracy comes from the symmetry of the system. If the representation is reducible, then we call it an **accidental degeneracy** (not coming from symmetry). Accidental degeneracies rarely happen by accident—usually the degeneracy has somehow been forced—so generically we only expect degeneracies if there are >1 dimensional irreps.

Build the simple character table for the {E,σ} mirror-symmetry group, reprising the previous result that in mirror-symmetric systems we expect even/odd eigenfunctions, and we don't expect (non-accidental) degeneracies (unless there are additional symmetries).

Using the rules from the representation theory handout, we build up the character table for the symmetry group of the square (called _C_4v). Then, look at the eigenfunction solutions that we previously had for this case, and show how we could classify them into the various irreducible representations.

**Further reading:** Character tables for all of the common symmetry groups are tabulated in both textbooks and online, e.g. see this [page on the C4v group](http://symmetry.jacobs-university.de/cgi-bin/group.cgi?group=404&option=4). See Inui section 6.6 on projection operators.

### Lecture 6: 20 Feb

**Handout:** [notes on decomposition of functions into partner functions](notes/irrep-decompose.pdf)

Looked at the projection operator (see handout) in more detail and gave some graphical examples of how we can use it to decompose a function into partner functions.

Used the projection operator to classify the modes of the square cavity, and in particular found that some of the modes are accidental degeneracies. In this way, we are able to find representatives of all five irreps. Conversely, by looking at the irreps, we can guess some of the types of eigenfunctions that should appear, inferring the sign pattern from the character table.

Showed how we can apply the projection operator to "random" functions to find partners of different irreps, even without an eigenproblem, and to "sketch" the qualitative features that we expect to find in the eigenfunctions. And, once we have partner functions, we can obtain representation matrices for each irrep (useful for 2+ dimensional irreps). As an example, looked at ψ(x,y)=1, x, and x2; found in particular that the 2d irrep transforms like {x,y}, i.e. the ordinary 2d rotation matrices.

Next time, we will show the irreducible representation is conserved over time in a linear system, by showing that the projection operator commutes with the time-evolution operator.

### Lecture 7: 22 Feb

**Handout:** [notes on time evolution and conservation laws](notes/time-evolution.pdf)

The irreducible representation is "conserved" over time in a linear system, because the projection operator commutes with the time-evolution operator.

Defined the time-evolution operator explicitly via an exponentiated operator on the 6-component vector-field (**E**, **H**). Showed that the time-evolution operator is unitary in an appropriate inner product, for lossless materials, and that this leads to conservation of energy.

**Further reading:** See my [Notes on the algebraic structure of wave equations](notes/wave-equations.pdf) for a general discussion of many wave equations, showing that they share the common form dψ/dt D ψ where D is anti-Hermitian. For Poynting's theorem, see any graduate-level book on electromagnetism, e.g. Jackson's _Classical Electrodynamics_. The result is summarized in chapter 2 of the textbook. Beware that matters are more complicated for dispersive media (ones in which ε and μ depend on ω), as discussed briefly in Jackson. A much more complete review of passive dispersive media, including the consequences of passivity for causality etcetera, can be found in our 2014 paper [Speed-of-light limitations in passive linear media](http://math.mit.edu/~stevenj/papers/Welters14.pdf): see in particular the discussion of passivity in section II.B and of "dynamical" energy density in section V.A.

### Lecture 8: 24 Feb

More from last lecture's handout.

Derived Poynting's theorem in order to define electromagnetic energy and flux in general, and showed that we got the same quantity as we did from unitarity. For time-harmonic fields, showed that |E|2/2 and |H|2/2 and Re\[E\*×H\]/2 are time averages of the corresponding real oscillating fields Re(E) and Re(H). Showed that the time-average energies in the E and H fields are the same.

Talked a little about a more general formulation of the time-dependent problem, including arbitrary dispersion, and derived that the susceptibility χ needs to be a "passive convolution operator" for energy to be non-increasing. It turns out that this has lot of interesting consequences, which we mostly won't have time to get into.

**Translational symmetry:** Showed that for continuous translational symmetry, the representations are exponential functions exp(ikx) for some number k (real for unitary representations; in weird cases, k may be a nondiagonalizable matrix with imaginary eigenvalues, but these solutions are not needed in periodic or translationally invariant systems).

**Further reading:** Textbook, chapter 3 on continuous translational symmetry.

### Lecture 9: 26 Feb

**Handouts:** [pset 2 solutions](psets//pset2sol-spring18.pdf), [pset 3](psets/pset3-spring18.pdf) (due March 9)

Explained how conservation of the exp(-ikx) representation, which gives conservation of k, means that planewaves are produced by a line-current source Jz(x,y)=δ(x) exp[-i(ky-ωt)] in 2d, assuming outgoing (radiation) boundary conditions.

Explained how conservation of the exp(-ikx) representation, which gives conservation of k, leads immediately to Snell's law at a flat interface.

Introduced **dielectric waveguides**, via the simple 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction.

Introduced the "reduced" eigenproblem Θₖ=exp(-ikxΘ)exp(ikx) for the modes of a particular wavevector **k**. This is also Hermitian, its solutions ω(k) yield the dispersion relation (or _band structure_) of the problem.

Explained how mirror symmetry in _z_ means that _z_-invariant solutions in "2d" structures ε(x,y) can be segregated into two polarizations: even Hz-polarized (what the book calls "TE") and odd Ez-polarized (what the book calls "TM"). (Note that the literature is split on the terminology here: many authors call the former TM and the latter TE.)

**Further reading**: See the book, chapter 3, on index guiding and the variational principle. (See e.g. Jackson's _Classical Electrodynamics_ for a more traditional viewpoint on dielectric waveguides, focused on the two cases that can be solved analytically, and Marcuse's _Theory of Dielectric Optical Waveguides_ for an expanded version of this. See e.g. Ramaswami and Sivarajan, _Optical Networks_ for a nice practical overview of dielectric waveguiding in modern telecommunications.)

### Lecture 9: 28 Feb

Continued discussing **dielectric waveguides**, via the simple 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction. Explained that the solutions far from the waveguide lead to a continuous region, the _light cone_, and argued (proof to come later) that the higher-ε region pulls down localized guided modes below the light cone. Since they are localized, they form discrete bands in order to stay orthogonal.

Introduced the **min–max or "variational" theorem**, which arises for any Hermitian eigenproblem. Proved the variational theorem (with the simplifying assumption of a basis of eigenfunctions), and mentioned the derivation (in chapter 2 of the book) that all extrema of the Rayleigh quotient are eigenvalues. We will use this theorem to derive general conditions under which guided modes are guaranteed to arise in dielectric waveguides.

Used the min–max theorem to prove the existence of index-guided modes (in two dimensions, for the TE/Hz polarization), for any translation-invariant structure where ε is increased "on average" in a localized region, for an appropriate definition of "on average."

**Further reading**: See the book, chapter 2, on the variational principle. See [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf) on localization in a different scalar-wave equation via the same variational method. [Bamberget and Bonnet (1990)](http://epubs.siam.org/doi/abs/10.1137/0521082) is a classic paper on the theory of dielectric waveguiding. [Lee (2008)](https://www.osapublishing.org/oe/abstract.cfm?uri=oe-16-13-9261) is an extension of the variational proof to Maxwell's equations in much more complex periodic waveguides and photonic-crystal fibers. A point source (delta-function current) in a dielectric waveguide will generally excite _both_ guided (below the light line) and radiating (above the light line) solutions, and you might be interested in [this animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5.mp4) of a point source in a dielectric waveguide (ε=4 surrounded by air) (see also the [larger version of the same animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5-long.mp4)).

### Lecture 10: 2 Mar

Considered related localization theorems in quantum mechanics: an arbitrary attractive potential will always localize a bound state in 1d or 2d, but not in 3d, and sketched a simple dimensional argument in 1d and 3d (but not 2d, which is a difficult borderline case); see also [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf). Discussed the related theorem for 3d waveguides (2d localization); see the Bamberget and Bonnet and Lee papers above.

**Discrete translational symmetry:**

Started by considering a periodic "waveguide" in two dimensions: a sequence of dielectric rods in air. By analogy with ray-optics and total-internal reflection, it seems that this could not support guided modes. However, it does (chapter 7 of the book), and to understand this we need to understand discrete translational symmetry.

Showed that the representations of the discrete translation group are again exponentials, and thereby proved **Bloch's theorem**: the eigenfunctions can be chosen in the form of a planewave multipled by a periodic function.

As a corollary, the Bloch wavevector **k** is conserved, and mentioned how this relates to a famous mystery from the 19th century: electrons in a pure conductor act almost like a dilute gas, because they scatter only from impurities/imperfections that break the periodicity.

Qualitative description of the resulting band diagrams in 1d-periodic systems.

**Further reading**: Chapter 3 of the textbook on 1d periodicity, and chapter 7 of the textbook on periodic waveguides.

### Lecture 11: 5 Mar

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. This means that we only need to look at the "unit cell" in k-space to get the band diagram. Talked about a few different ways to think about this: 2π/a gives the same irrep, it gives the same PDE for the Bloch modes, and the Bloch modes can be expanded as a Fourier series with components at k+2πm/a for all integers m.

Discussed the band diagram, light cone, and guided modes of a periodic dielectric waveguide.

As an application of conservation of k (up to addition of reciprocal lattice vectors) in periodic systems, discussed reflection (specular and diffractive) from a periodic surface, and minimum-frequency/maximum-wavelength cutoffs for various diffracted orders.

**Further reading:** Chapter 3 and appendix B of the textbook on 1d periodicity. Chapter 7 on periodic dielectric waveguides. Chapter 10 has a section on reflection/diffraction from a periodic surface.

### Lecture 12: 7 Mar

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. Defined the reciprocal lattice vectors, and gave examples for 1d periodicity and for a 2d square lattice, and a 2d hexagonal lattice.

Considered interaction of rotational symmetries with **k**: showed that rotations R transform a solution at **k** into solution at R**k**, and hence ω(k)=ω(Rk).

Discussed the "little group of **k**:" the subset of the rotations that preserve **k** (up to addition of a reciprocal lattice vector), hence the symmetry group of Θ̂ₖ. This group is important to understand the solutions that are possible at each **k**, and will be especially important in higher dimensions to understand at which **k** non-accidental degeneracies are possible.

**Further reading:** Chapter 3 of the textbook. See appendix B for more on the reciprocal lattice, a topic we will return to later.

### Lecture 13: 9 Mar

**Handouts:** [pset 3 solutions](pset3sol-spring18.pdf), [pset 4](pset4-spring18.pdf) (due Fri March 23; the files [bandgap1d.ctl](bandgap1d.ctl) and [defect1d.ctl](defect1d.ctl) are used)

By conjugating the eigenequation, for real ε, showed that ω(**k**)=ω(−**k**) in general, even for structures without mirror symmetry. Connected this to time-reversal symmetry: the conjugated mode corresponds to running time backwards, which still solves the same Maxwell's equation. One way to break time-reversal symmetry is by introducing absorption loss (complex ε, which time-reverses into gain). Alternatively, briefly mentioned magneto-optic materials (complex-Hermitian ε, neglecting absorption) and why a static magnetic field can (locally) break time-reversal symmetry, and of use for Faraday isolators.

Began new topic: **photonic crystals in one dimension**. Sketched the form of the dispersion relation (band structure) and explained several qualitative features we can predict without solving:

*   From symmetry and periodicity, ω(k)=ω(-k)=ω(k+2π/a), and consequently ω(π/a-k)=ω(π/a+k) (i.e., ω is symmetric around both k=0 and k=π/a)
*   Because ω(k) is smooth except at crossings, we expect the bands to have zero slope at k=0 and k=&pi/a (around which they are even-symmetric)
*   ωa<<1 corresponds to the long-wavelength limit, at which the waves don't "see" the periodic structure and instead see some "average" homogeneous ε (an "effective medium" or "metamaterial"; also called "homogenization theory"). Hence around (ω,k)=(0,0) the bands should approach straight lines (the solutions in a homogeneous medium).
*   Because the 1d Maxwell equations are a 2nd-order ODE, and the eigenproblem at a given ω is a 2-point boundary-value problem, there can be only two solutions at each ω. It follows that the bands ω(k) must be _monotonic_ in (0,π/a).
*   Because the symmetry group at each k has at most a mirror symmetry, which has no 2d irreps, we do not generically expect degeneracies. (By playing with the parameters, it turns out that you can force accidental degeneracies at k=0.)
*   The combination of the last two points mean that we generically expect _band gaps_ to arise: ranges of ω in which there are no solutions (at least, not at real values of k).
*   Although I haven't shown it yet, it turns out the bands have slopes that alternate in sign: the first band has positive slope in (0,π/a), the second band negative, the third positive, and so on.

Next time, we will use perturbation theory to derive the magnitude of the gap and other features by starting with a homogeneous medium and then adding a little bit of periodic ε contrast.

**Further reading:** Chapter 4 of the textbook.

### Lecture 14: 12 Mar

A quantitative estimate of the size of the band gap in 1d, via perturbation theory. In particular, derived first-order perturbation theory for the eigenvalue of any Hermitian operator with some small change, by expanding the eigenvalue and eigenfunction as power series in the change and solving order-by-order. We then write down this perturbative expression for the Maxwell operator, and see that the fractional change in frequency is just the fractional change in index multiplied by the fraction of electric-field energy in the changed material.

Discussed how perturbation theory can be used to derive the effect of absorption losses (to lowest order): adding a small imaginary part to ε yields a corresponding imaginary part in ω, giving loss or gain depending on the sign.

**Further reading:** For the same derivation of perturbation theory, see "time-independent perturbation theory" in any quantum-mechanics text, e.g. Cohen-Tannoudji. See also the section on small perturbations in chapter 2 of the book. See chapter 4 of the book on the origin of the 1d gap, and on the special formulas for quarter-wave stacks in 1d (discussed in more detail in Yeh's _Optical Waves in Layered Media_).

### Lecture 15: 14 Mar

To apply perturbation to the opening of the gap, there is a slight complication because the cos(πx/a) and sin(πx/a) modes of the unperturbed (homogeneous) system are degenerate. This creates an ambiguity: to which linear combination of these eigenfunctions (i.e., what 0-th order solution) do we apply our perturbation analysis to? For a general perturbation with L-fold degeneracy, there is a technique called _degenerate perturbation theory_ that solves this problem by reducing it to an L×L eigenproblem. Here, however, we can solve the problem by symmetry: since the perturbed problem still has mirror symmetry around x=0, we know that the perturbed eigenfunctions must still be even/odd, so we must start with the cos/sin solutions.

Discussed reflection of light from a semi-infinite 1d crystal, at a frequency in the gap. We have no propagating solutions in the crystal, so by conservation of energy we must have 100% reflection. However, showed by analytical continuation of the band edge that we expect exponentially decaying "evanescent" solutions in the crystal, with a complex wavevector k ≈ sqrt(Δω/α) + π/a, where Δω is how far we are into the gap and α is the band-edge curvature.

Discussion of localization of modes by defects in 1d crystals, discussing how a positive Δε "pulls down" a mode from the upper edge of the gap, and a negative Δε "pushes up" a mode from the lower edge. In general, we expect a discrete set of frequencies for such "bound states", and the number of bound states in a given gap should grow asymptotically proportional to the volume of the defect (the diameter in 1d), but for an arbitrarily weak defect we still generically expect at least one bound state.

Computationally, e.g. in MPB, we often compute localized cavity modes by imposing periodic boundary conditions in a **supercell** consisting of many unit cells, plus a defect. Explained how, in the absence of a defect, such a supercell leads to the original band structure "folded" into the new Brillouin zone. A defect then pulls one of these foldings into the gap, with a cosine-like dispersion relation that becomes flat exponentially fast as the supercell size is increased.

**Further reading:** For evanescent waves and defect cavities, see chapter 4 of the textbook. For a proof of localization in gaps by arbitrarily weak defects in 1d and 2d, for the Schrodinger equation, see [Parzygnat et al. (2010)](http://link.aps.org/doi/10.1103/PhysRevB.81.155324).

### Lecture 16: 16 Mar

**Handouts:** [MPB demo](notes/mpb-demo.pdf) (see also [the MPB home page](https://github.com/NanoComp/mpb)) and example files: [2dwaveguide.ctl](notes/2dwaveguide.ctl) and [2dwaveguide-periodic.ctl](notes/2dwaveguide-periodic.ctl); [IJulia notebook](http://nbviewer.jupyter.org/url/math.mit.edu/~stevenj/18.369/MPB-demo.ipynb)

Gave demo of MPB eigensolver software for 2d dielectric waveguide (available on Athena, e.g. in the clusters or via ssh to `athena.dialup.mit.edu`).

In the handout, I gave the plotting code in Matlab. Because the output of MPB is either [comma-delimited text](https://en.wikipedia.org/wiki/Comma-separated_values) (ω vs. k) or [HDF5](https://en.wikipedia.org/wiki/Hierarchical_Data_Format) (field data), essentially any modern plotting software should be able to handle it. In class, I used [Julia](http://julialang.org/), a Matlab-like language with C-like performance in an [IJulia notebook](https://github.com/JuliaLang/IJulia.jl) with the [PyPlot](https://github.com/stevengj/PyPlot.jl) plotting library (which calls the Python [matplotlib](http://matplotlib.org/) under the hood). You can use whatever you want.

**Further reading:** The [MPB manual page](http://mpb.readthedocs.io/en/latest/), and Appendix D of the textbook (on numerical methods).

### Lecture 17: 19 Mar

Wave propagation velocity: defined phase velocity (along homogeneous directions) and group velocity. Explained why phase velocity is not uniquely defined in a periodic medium (and even in a uniform waveguide it can easily be infinite). Showed that group velocity is the velocity of propagation of wave packets, by considering a narrow-bandwidth packet and Taylor-expanding the dispersion ω(k) to first order.

Another viewpoint is that group velocity is the energy-propagation velocity (in a lossless medium), and explained the general principle that the velocity of any "stuff" can be expressed as the ratio of the flux rate of the stuff to the density of the stuff...we will show that in the electromagnetic case, this ratio gives exactly dω/dk. In particular, we will apply the Hellmann-Feynman theorem to our Θ**k** eigenproblem to show that the group velocity dω/dk is precisely the energy velocity (ratio of energy flux to energy density, averaged over time and the unit cell).

**Further reading:** See chapter 3 of the book, section on phase and group velocity. See the footnotes in that section, e.g. Jackson, _Classical Electrodynamics_, for a derivation of group velocity from the Fourier perspective; see also my [notes on wave velocity and Fourier transforms](https://github.com/mitmath/18303/blob/fall16/fourier-dispersion.pdf) from [18.303](https://github.com/mitmath/18303/tree/fall16). A much more complete review of velocity in lossy and dispersive media can be found in our 2014 paper [Speed-of-light limitations in passive linear media](http://math.mit.edu/~stevenj/papers/Welters14.pdf).

### Lecture 18: 21 Mar

Applied the Hellmann-Feynman theorem to our Θ**k** eigenproblem to show that the group velocity dω/dk is precisely the energy velocity (ratio of energy flux to energy density, averaged over time and the unit cell).

From the energy velocity expression, proved that this group velocity is always ≤c for ε≥1. (At a deeper level, it turns out that you can prove this for any passive media.) Also gave a simple proof that the "front velocity" (the rate at which the wave "front" of nonzero fields can move) is bounded by the upper bound of the energy velocity.

Discussed group-velocity dispersion, qualitatively.

**Further reading:** See chapter 3 of the book for a similar Hellman-Ferynman approach, and the [Welters (2014) paper](http://math.mit.edu/~stevenj/papers/Welters14.pdf) for much more on group and front velocity bounds. For a discussion of dispersion (and dispersion compensation) as it applies in optical fibers, see e.g. R. Ramaswami and K. N. Sivarajan, _Optical Networks: A Practical Perspective_.

### Lecture 19: 23 Mar

**Handouts:** [TE/TM projected band diagram and omnidirectional reflection](notes/omni-bands.pdf) (from book chapter 4, figure 15), pset 4 solutions, pset 5 coming soon.

Off-axis propagation, projected band diagrams for multilayer films, Fabry-Perot defect modes, and surface states. Omnidirectional reflection.

**Further reading:** For off-axis propagation in multilayer films, see chapter 4 of the textbook. See also [projected TM band diagram](http://jdj.mit.edu/book/chapter4-fig10-14-corrected.pdf) from multilayer film (corrected from figure 10 of chapter 4 in the book). See chapter 4 of the book, final section on omnidirectional reflection; see any book on optics or advanced electromagnetism for Brewster's angle (e.g. Jackson or Hecht).

### Lecture 20: 2 April

**Handout:** [pset 4 solutions](psets/pset4sol-spring18.pdf), [pset 5](psets/pset5-spring18.pdf) (due next Monday), figures 2 and 3 from book, chapter 5, [2d square/triangular-lattice Brillouin zones](notes/2d-brillouin.png) (from appendix B of the book)

Finished discussing surface states and Fabry-Perot waveguides from last lecture.

New topic: **2d periodicity**

Reviewed Bloch's theorem, the primitive lattice vectors, the [Bravais lattice](http://en.wikipedia.org/wiki/Bravais_lattice), the primitive reciprocal lattice vectors, and the reciprocal lattice, for 2d periodicity. Reviewed the periodicity in k-space (reciprocal space), the Brillouin zone, and the irreducible Brillouin zone.

Gave the examples of the square-lattice B.Z. and the triangular-lattice B.Z., constructed in this way, and reduced the latter to the I.B.Z. for a 6-fold symmetrical (C6v) structure.

Considered the TM band diagram of the square lattice of rods (figure 1 of the handout). Furthermore, from the symmetry of the points between Γ and M or Γ and X, explained why we have zero group velocity at the X and M points, and why the local maxima (usually) lie along the I.B.Z. boundaries.

**Further reading:** beginning of chapter 5 of the book (2d photonic crystals), and appendix B on the reciprocal lattice and Brillouin zone. See [this paper](http://arxiv.org/abs/math-ph/0702035) for some counterexamples and further discussion regarding the occurrence of band extrema at the edges of the I.B.Z.

### Lecture 21: 4 April

**Handout:** [2d photonic-crystal slides](notes/2d.pdf)

Considered the TM band diagram of the square lattice of rods (figure 1 of the handout). Discussed the origin of the gap from the variational theorem (explaining the band-edge field patterns in figure 2), and the reason for a minimum index contrast to get a gap (the differing periodicities and hence differing gaps in different directions). Showed that Γ and M have the full symmetry of the lattice, whereas X has a reduced symmetry group, which is why we have non-accidental degeneracies at those points.

Influence of boundary conditions on TE vs TM gaps, and why TE gaps prefer "hole" (connected) structures to "rod" (disconnected) structures. Mentioned TE+TM gap in hexagonal lattice of rodes. Discussed why higher symmetry (Brillouin zones closer to circles/spheres) typically makes it easier to get a gap. (In 3d, the closest B.Z. to a sphere is from an fcc lattice, and most 3d gaps are in fcc-like structures.)

Point-defect states in the square lattice of rods. Either decreasing the radius of a rod to push up a "monopole" state, or increasing the radius of a rod to pull down a "dipole" state. Showed how we can easily predict the qualitative field patterns and symmetries from the corresponding bands of the bulk crystal. Related the defect modes to the 5 irreps of the C4v symmetry group, and showed how we can easily guess the field patterns and degeneracies that we will get.

**Further reading:** textbook, chapter 5.

### Lecture 22: 9 April

**Handout:** [computational photonics slides](notes/Computation-18.369.pdf), [pset 5 solutions](psets/pset5sol-spring18.pdf)

New topic: **Computational photonics**. Began by categorizing computational methods along three axes: what problem is solved, what basis/discretization is used to reduce the problem to finitely many unknowns, and how are the resulting finitely many equations solved? Discussed three categories of problems: full time-dependent Maxwell solvers, responses to time-harmonic currents J(x) e\-iωt, and eigenproblems (finding ω from k or vice-versa). Emphasized that there is no "best" method; each method has its strengths and weaknesses, and there are often strong tradeoffs (e.g. between generality/simplicity and efficiency).

**Frequency-domain eigensolvers**, e.g. MPB.

Explained the **Galerkin method** to turn linear differential/integral equation, plus a finite-basis approximation, into a finite set of N equations in N unknowns. Showed that Galerkin methods preserve nice properties like positive-definiteness and Hermitian-ness, but generally turn ordinary eigenproblems into generalized ones (unless you happen to have an orthonormal basis).

Talked about solving the frequency-domain eigenproblem in a planewave (spectral) basis, ala MPB. One big motivation for using a planewave basis is that it makes it trivial to enforce the transversality constraint (∇ċH=0), which is diagonal in Fourier space.

In order to solve this equation, we could simply throw it directly at Matlab or LAPACK (LAPACK is the standard free linear-algebra library that everyone uses). With N degrees of freedom, however, this requires O(N2) storage and O(N3) time, and this quickly gets out of hand. Instead, since we only want a few low-frequency eigenvalues (not N!), we use **iterative methods**, which start with a guess for the solution (e.g. random numbers) and then iteratively improve it to converge to any desired accuracy. Most iterative solvers require only a black-box routine that computes matrix times vector.

For Hermitian eigenproblems, one class of iterative techniques is based on minimizing the Rayleigh quotient: given any starting guess, if we "go downhill" in the Rayleigh quotient then we will end up at the lowest eigenvalue and corresponding eigenvector. We can find subsequent eigenvalues/eigenvectors by _deflation_: repeating the process in the subspace orthogonal to the previous eigenvectors. A very simple optimization technique is steepest-descent: repeated line searches in the downhill direction given by the gradient of the Rayleigh quotient. In practice, there are better optimization methods for this problem than steepest descent, such as the nonlinear conjugate-gradient method, and preconditioning, but they have a similar flavor. Showed the effect of the different iteration schemes on convergence rate (see handout).

The key to applying iterative methods efficiently for this problem is to use fast Fourier transforms (FFTs) to perform the Θk matrix-vector product in O(N log N) time and O(N) storage.

A planewave basis actually converges exponentially fast if everything is a smooth (analytic) periodic function, but this is not true if ε is discontinuous (as it usually) is: the Fourier series of a discontinuous function converges only at a linear rate (error ~ 1/#terms in 1d). The planewave basis is dual to a uniform grid under a discrete Fourier transform (DFT), so we can equivalently think of "staircasing" of interface, and in general the question is what ε to assign to pixels straddling the boundaries. Intuitively, boundary pixels should be assigned some intermediate ε value, which is equivalent to discretizing a _smoothed_ structure—but then we face the problem that the act of smoothing changed the structure, and itself introduces a 1st-order error in general. Argued (see handout) that the right thing to do is to assign an _anisotropic_ ε to interfaces: one can show that the proper anisotropic ε corresponds to a smoothing that introduces zero 1st-order error, and hence leads to 2nd-order convergence as shown in the handout.

**Further reading** Textbook, appendix D. See [our paper on MPB](http://math.mit.edu/~stevenj/papers/JohnsonJo01.pdf) for more detail on planewave-based eigensolvers for electromagnetism. Spectral methods, Galerkin, etcetera: J. P. Boyd, [_Chebyshev and Fourier Spectral Methods_](http://www-personal.umich.edu/~jpboyd/BOOK_Spectral2000.html). Iterative eigensolver methods: Bai et al, [_Templates for the Solution of Algebraic Eigenvalue Problems_](http://www.cs.utk.edu/~dongarra/etemplates/index.html); also [_Numerical Linear Algebra_](http://www.amazon.com/Numerical-Linear-Algebra-Lloyd-Trefethen/dp/0898713617) by Trefethen and Bau ([readable online](http://owens.mit.edu:8888/sfx_local?bookid=9436&rft.genre=book&sid=Barton:Books24x7) with MIT certificates). See e.g. [this paper on subpixel-smoothing and perturbation theory](http://math.mit.edu/~stevenj/papers/KottkeFa08.pdf).

### Lecture 23: 11 April

[FDFD lecture notes](notes/FDFD.pdf)

The finite-difference frequency-domain method (FDFD), guest lecture by Wonseok Shin.

**Further reading:** Free [MaxwellFDFD code](http://www.mit.edu/~wsshin/maxwellfdfd.html) and [FD3D code](http://www.mit.edu/~wsshin/fd3d.html) by W. Shin. See e.g. these [notes on finite-difference approximations](https://github.com/mitmath/18303/blob/fall16/difference-approx.pdf) for the basic ideas of center differences etc.

### Lecture 24: 13 April

**Handout:** See slides from lecture 22.

Switched problems to **time-domain solvers**: find the time-dependent fields in response to an arbitrary time-dependent current, for some initial conditions. This is the most general solution technique, and can handle things like nonlinearities and time-dependent media in which frequency is not conserved (a problem for frequency-domain methods). On the other hand, when a more specialized method (e.g. a frequency-domain eigensolver) is available, often it is easier and more bulletproof than using the most general tool.

In particular, talked about **finite-difference time-domain** (FDTD) methods, in which space and time are broken up into uniform grids. Started with 1+1 dimensions (1 space + 1 time). Mentioned the second-order accuracy of center-difference approximations, and in order to utilize this in FDTD concluded that we need to store H and E on grids staggered in time and space: a [Yee grid](http://ab-initio.mit.edu/wiki/index.php/Yee_grid). Wrote down the general "leapfrog" scheme for time-stepping the fields.

Mentioned, but did not derive, the [CFL stability condition](http://en.wikipedia.org/wiki/Courant%E2%80%93Friedrichs%E2%80%93Lewy_condition) (in 1d) relating Δt to Δx. As a consequence, if we make the spatial discretization finer, we must also make the time discretization finer. e.g. in 3d this means that doubling the spatial resolution increases the total simulation time by (at least) a factor of 16=24.

Discussed absorbing boundary conditions and **perfectly matched layers** (PML); see notes below and slide handout above. Introduced PML as an analytic continuation of the solution and equations into complex coordinates in the direction perpendicular to the boundary. Showed how this transforms oscillating solutions into decaying ones without introducing reflections (in theory). Showed how we transform back to real coordinates, and the entire PML implementation can be summarized by a single equation: ∂/∂x → (1+iσ/ω)−1∂/∂x, where σ(x) is some function that is positive in the PML and zero elsewhere, characterizing the strength of the decay.

Discussed fact (to be proved later, see notes below) that _any_ coordinate transformation (including the complex one for PML) can be represented as merely a change in ε and μ, while keeping Maxwell's equations in Cartesian form. This means that PML can be interpreted simply as an anisotropic absorbing material ("UPML").

Limitations of PML. Discussed fact that PML is no longer reflectionless in discretized equations, but this is compensated for by turning on the absorption (e.g.) quadratically over a wavelength or so. (_Any_ absorption, turned on slowly enough, has negligible reflections; this idea is used e.g. in [anechoic chambers](http://en.wikipedia.org/wiki/Anechoic_chamber).) Note that PML requires Maxwell's equations to be invariant in the direction ⊥ to the PML, which excludes photonic crystals from having any true PML. Briefly discussed (see slides for more detail) on how this fact has sometimes been confused in the literature, since the lack of a true PML can be disguised if you turn on the PML gradually enough (over many periods).

**Further reading:** For FDTD in general, see e.g. Allen Taflove and Susan C. Hagness, _Computational Electrodynamics: The Finite-Difference Time-Domain Method_ (Artech, 2005). For the CFL condition in general, see e.g. this [book chapter by Trefethen](http://people.maths.ox.ac.uk/trefethen/4all.pdf). See also our [free FDTD software: Meep](https://github.com/NanoComp/meep), and in particular the introduction and tutorial sections of the Meep manual. [Notes on PML](notes/pml.pdf); see also e.g. the discussion of PML in Taflove's book. [Notes on coordinate transforms in electromagnetism](notes/coordinate-transform.pdf); see also [slides on transformation optics](notes/transformation-slides.pdf)

### Midterm: 18 April

[midterm](exams/midterm18.pdf) and [solutions](exams/midterm18sol.pdf).

### Lecture 25: 20 April

Went over the Principle and Equivalence, mode sources, and integral-equation methods; see slides from lecture 22.

**Further reading:** [SCUFF-EM](http://homerreid.dyndns.org/scuff-EM/), Homer Reid's free BEM code for electromagnetic scattering problems. See also this [SCUFF video tutorial](https://brown.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=a7449e51-2fe1-4d95-a53a-a9050106c542) (June 2018).

### Lecture 26: 23 April

**Handouts:** Section 4.4 (LDOS) of [Electromagnetic Wave Source Conditions](http://arxiv.org/abs/1301.5366).

Alternatively, an approach that lets us talk about the "local" spectrum of finite periodic structures, open resonators, and other lossy cases, is the **local density of states**. Began discussing section 4.4 of the handout (DOS and LDOS), and showed that the LDOS is also proportional to the power radiated by a dipole source at a given position and frequency: this latter definition has the advantage of being much easier to generalize, and easier to connect to other physical processes like spontaneous emission or antennas.

Discussed the "principle of limiting absorption:" the "right" way to define a "lossless" system is to add a little bit of loss everywhere and take the limit as this loss goes to zero from above (Im ωε = 0+). This allows us to rigorously deal with poles on the real-ω axis, and also automatically gives us outgoing ("radiation" or "Sommerfield") boundary conditions. It also allows us to correctly derived the LDOS connection to the power.

**Further reading:** See the Snyder and Love textbook for leaky modes via saddle-point ("steepest-descent") integration. For the limiting absorption principle, see e.g. [Schulenberger and Wilcox (1971).](http://texas.math.ttu.edu/~gilliam/jrschul_home/schul_3.pdf) See section 4.4 of the handout and references therein for more information on DOS and LDOS.

### Lecture 27: 25 April

**Handout:** [TCMT slides](notes/TCMT.pdf)

Continued discussing LDOS (from the notes): connected to the famous Q/V formula for Purcell enhancment, and discussed the per-period LDOS and DOS in periodic systems with the connection to van Hove singularities.

New topic: **temporal coupled-mode theory** (TCMT). Started with a canonical device, a waveguide-cavity-waveguide filter, and began to derive how the universal behavior of device in this class can be derived from very general principles such as conservation of energy, parameterized only by the (geometry-dependent) frequency and lifetime of the cavity mode. Began with a high-level overview (see slides), with derivations to come next time.

Furthermore defined the **quality factor** Q of the cavity, which is simply a dimensionless lifetime Q=ω0τ/2.

Analyzed the time-delay in a waveguide-cavity system described by TCMT and showed that: it is given by dφ/dω (the derivative of the phase) if we have a narrow-band pulse near the transmission maximum (so that amplitude is independent of frequency to first order), and that this time delay is precisely 2τ (the lifetime of the cavity mode).

**Further reading:** chapter 10 of the book.

### Lecture 28: 28 April

TCMT derivation.

Began by parameterizing the unknowns: the amplitude A in the cavity and the incoming/outgoing wave amplitudes sk± in each channel _k_, normalized so that |A|2 is energy in the cavity and |sk±|2 is power. Then wrote down the most general linear time-invariant equation relating A and the incoming wave from a single input port: A(ω)=g(ω) s1+(ω), where g(ω) is some function of frequency in the frequency domain (a type of Green's function or generalized susceptibility). The key assumption of TCMT is **resonance**: we assume that there is a resonant mode, corresponding to a pole in g(ω) (or the LDOS) at a complex frequency ω0−i/τ, and that 1/τ<<ω0 so that g(ω)≈α/(iω-iω0−1/τ), where α/i is the residue of the pole (i.e. g is dominated near ω0 by the contribution of the pole, and far from ω0 the amplitude A is so small that we will neglect it). In time domain, this corresponds to a simple ODE dA/dt = -i ω0A − A/τ + αs1+, where α is a constant to be determined.

Also wrote down the most general linear time-invariant relation for the outgoing amplitude s1−\=βs1++γA for some constants β and γ in the freuqency domain. If we are only interested in the response of the system near resonance, then we can approximate β and γ by their values at ω0, in which case they are constants and the s1−\=βs1++γA is valid in the time domain as well.

What remains is to eliminate the unknowns α, β, and γ. Do this by the method in chapter 10 of the book: apply energy conservation to find γ=√(2/τ) (up to an arbitrary phase choice), and then time-reversal symmetry (or reciprocity) to find β=−1 and γ=√(2/τ). Hence, the only geometry- and physics- dependent parameters in the problem are ω0 and τ.

Showed that the transmission in a waveguide-cavity-waveguide system is always a Lorentzian curve peaked at 100% (for symmetric decay) with a width inversely proportional to the lifetime, and showed that this happens because of a resonant cancellation in the reflected wave.

Analyzed effect of absorption in resonant filter, and why narrow-band filters require very low loss. Discussed resonant absorption by forcing the decay rates to match ("impedance matching").

**Further reading:** chapter 10 of the book.

### Lecture 29: 2 May

**Handouts:** pages 120–135 of [my photonic-crystal tutorial slides](notes/spie-course-latest.pdf)

More applications of TCMT (see slides). Nonlinear effects.

New topic **periodic dielectric waveguides** and **photonic-crystal slabs** (chapters 7-8).

**Further reading:** chapter 7-8 of the book, slides on photonic-crystal slabs.

### Lecture 30: 4 May

Partial confinement of light by defects, and intrinsic radiation losses due to coupling to light-line mode. Tradeoff between localization and loss (due to Fourier components inside the light cone). Discussed two mechanisms for large radiation Q despite the incomplete gap: delocalization and cancellation.

Finished discussing delocalization and cancellation mechanisms for high Q slab cavities.

**Further reading:** chapter 8 of the book, tutorial slides on photonic-crystal slabs.

### Lecture 31: 7 May

New topic: photonic-crystal fibers. Discussed the various types from the handouts: photonic-bandgap vs. index guiding, and 2d-periodic vs. Bragg fibers (concentric "1d" crystals). Emphasized the importance of the band gap lying above the light line of air.

**Further reading:** chapter 9 of the book, tutorial slides on photonic-crystal fibers.

### Lecture 32: 9 May

The short-wavelength scalar approximation and its consequences for holey fibers.

Discussed consequences of the scalar limit. First for a dielectric waveguide with a square or rectangular cross-section (which maps to the square TM metallic cavity of pset 2), and then for a holey fiber with a solid core (which maps to a 2d metallic photonic crystal). In both cases, applied product representation theory to the relationship between the scalar LP modes and the vector modes. Noted that holey fibers will support only a finite number of guided modes (and can even be "endlessly single mode" for the right parameters).

Discussed the origin of band gaps in the holey-fiber light cone, from the scalar limit, and band-gap guidance in hollow-core fibers.

**Further reading:** chapter 9 (section on index-guiding holey fibers and the scalar limit). For a rigorous derivation of the scalar limit, see [this 1994 paper by Bonnet-Bendhia and Djellouli](http://dx.doi.org/doi:10.1093/imamat/52.3.271).

### Lecture 33: 11 May

**Handouts:** [notes](notes/beta-eigenproblem.pdf), first few pages of [our 2002 adiabatic-theorem paper](http://math.mit.edu/~stevenj/papers/JohnsonBi02.pdf)

**New topic (see notes)**: Going full-circle back to the beginning of the course, we again derive an algebraic (linear operator / eigenproblem) formulation of Maxwell's equations. This time, however, we do so for constant-ω separating out the _z_ derivative and the corresponding **k** component (for _z_\-periodic structures) _kz_ (denoted β). That is, we write Maxwell's equations in the form:

**A** ψ = -_i_ **B** ∂ψ/∂_z_

where ψ is a four-component vector field consisting of (_Ex_, _Ey_, _Hx_, _Hy_), and **A** and **B** are linear operators. This is the most convenient formulation for considering problems of propagation in the _z_ direction along a waveguide, where perturbations may break translational symmetry but frequency is still conserved. Showed that **A** and **B** are Hermitian (but _not_ positive-definite) for real ε and μ.

Discussed orthogonality of modes and unconjugated "inner products," propagating vs. evanescent modes (showing that the latter carry zero power)

### Lecture 34: 14 May

β eigenproblem for z-periodic problems.

Coupled-wave equations for _nearly_ uniform cross sections: small perturbations, slowly varying perturbations, and the adiabatic theorem.

Connected the adiabatic limit to the rate of convergence of the Fourier transform of the rate of change. See section 2.1 of [Oskooi et al. (2012)](https://www.osapublishing.org/oe/abstract.cfm?URI=oe-20-19-21558).

### Lecture 33: 16 May

### Lecture 35: 11 May

**Slides:** my [slides](notes/Laser-Math@18.369.pdf) from some research seminars

Discussed a basic picture of lasers: the Maxwell-Bloch equations, the SALT nonlinear eigenproblem for the steady-state modes, recent SALT computational methods, and laser linewidth limits due to quantum/thermal noise.

**Further reading:** See e.g. [Haken's _Laser Theory_](http://www.springer.com/us/book/9783540121886) for the Maxwell-Bloch equations, [Ge, Chong, & Stone (2010)](http://journals.aps.org/pra/abstract/10.1103/PhysRevA.82.063824) on SALT, [Esterhazy et al. (2014)](http://math.mit.edu/~stevenj/papers/EsterhazyLiu14.pdf) on computational SALT, [Pick et al. (2014)](http://dx.doi.org/doi:10.1103/PhysRevA.91.063806) and references therein on laser linewidth.