# 18.369(J)/8.315(J): Mathematical Methods in Nanophotonics

This is the repository of course materials for the [18.369(J)/8.315(J)](http://student.mit.edu/catalog/m18a.html#18.369) course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Fall 2021.  (This course is offered once every two years.)

Syllabus
--------

> **Tired of doing electromagnetism like it's 1865?**
>
> _Find out what solid-state physics has brought to [8.02](https://ocw.mit.edu/courses/physics/8-02-physics-ii-electricity-and-magnetism-spring-2007/) in the last 20 years, in this new course surveying the physics and mathematics of nanophotonics—electromagnetic waves in **media structured on the scale of the wavelength**._
>
> _In this regime, which is the basis for everything from iridescent butterfly wings to distributed-feedback lasers and integrated optical devices to the next generation of optical fibers, the 140–year-old analytical techniques you learned in 8.02 aren't as useful. Instead, we will cover computational methods combined with high-level algebraic techniques borrowed from solid-state quantum mechanics: linear algebra and eigensystems, group theory, Bloch's theorem and conservation laws, perturbation methods, and coupled-mode theories, to understand surprising optical phenomena from band gaps to slow light to nonlinear filters._
>
> For beginning graduate students and advanced undergraduates.

**Lectures**: Tues-Thurs 9:30–11am (2-132). **Office Hours:** Mondays 4–5pm ([virtual/zoom](https://mit.zoom.us/j/94231408634?pwd=T0R2d3N1RnhjWUgwS2pxMG53QkVpQT09)). TA/grader: Mo Chen (mochen ατ mit.edu).

**Handwritten notes:** [Handwritten notes](https://www.dropbox.com/s/rar1m39caqext1d/18.369%20Fall%202021.pdf?dl=0) from each lecture are
available online.   You can also refer to older [handwritten notes from spring 2020](https://www.dropbox.com/s/1c3l54mf3rh8qw3/18.369%20spring%202020.pdf?dl=0).

**Probable topics**: _Methods_: linear algebra & eigensystems for Maxwell's equations, symmetry groups and representation theory, Bloch's theorem, numerical eigensolver methods, time and frequency-domain computation, perturbation theory, coupled-mode theories, waveguide theory, adiabatic transitions. _Optical phenomena_: photonic crystals & band gaps, anomalous diffraction, mechanisms for optical confinement, optical fibers (new & old), nonlinearities, integrated optical devices.

**Grading**: 33% problem sets (weekly/biweekly). 33% take-home mid-term exam (Posted **Nov 9**, due **Nov 10**.).  34% final project (proposal due Nov 16, project due Dec 9).

* Psets will be submitted electronically on [the 18.369 Canvas page](https://canvas.mit.edu/courses/10376).  Submit a good-quality PDF *scan* of any handwritten solutions (or a PDF printout of computer output).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.369. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.

**Books**: [Photonic Crystals: Molding the Flow of Light (Second Edition)](http://ab-initio.mit.edu/book) (**readable online**). (This book is at an undergraduate level and 18.369/8.315 is somewhat more advanced, but the book should provide a useful foundation.)

Useful (but not required) books (available in the library): [Group Theory and Its Applications in Physics](http://link.springer.com/book/10.1007/978-3-642-80021-4) by Inui et al. ([readable online](http://link.springer.com/book/10.1007/978-3-642-80021-4) via MIT), and _Group Theory and Quantum Mechanics_ by Michael Tinkham.

**Final projects:** A typical project will be to find some interesting nanophotonic structure/phenomenon in the literature (chapter 10 of the book may be a helpful guide to some possibilities), reproduce it (usually in 2d only, so that the simulations are quick), using (e.g.) the numerical software ([Meep](https://github.com/NanoComp/meep) and/or [MPB](https://github.com/NanoComp/mpb)) introduced in the course/psets (other useful free/open-source software: [SCUFF-EM](http://homerreid.github.io/scuff-em-documentation/) and [S4](https://web.stanford.edu/group/fan/S4/)), and extend/analyze it in some further way (try some other variation on the geometry, etc.). Then write up the results in a 7-15 page report (in the format of a journal article, ideally [Phys. Rev. A](http://pra.aps.org) style, including figures, a comprehensive review of related work, etcetera)—reports should be written for a target audience of your classmates in 18.369/8.315, and should explain what you are doing at that level. Projects should _not_ be a rehash of work you've already done in previous terms for your research (but may be some extension/digression thereof).

**Prerequisites**: 18.303, 8.07, or permission of instructor. (Basically, some experience with partial differential equations and linear algebra. e.g. 8.05, 8.07, 6.013, 3.21, 2.062 are all good background.) This is a graduate-level course aimed at beginning graduate students and suitably advanced undergraduates.

Supplementary lecture notes will be made available as the term progresses.

Lecture Summaries and Handouts
------------------------------

### Lecture 1: 9 Sep 2021

**Handouts:** syllabus (this web page), [introductory slides](notes/18.369-intro.pdf), [pset 1](psets/pset1.pdf) (due Thur Sep 16 at noon).

Motivation and introduction: this class is about electromagnetism where the wavelength is neither very large (quasi-static) nor very small (ray optics), and the analytical and computational methods we can use to understand phenomena in materials that are structured on the wavelength scale. In that situation, there are very few cases that can be solved analytically, but lots of interesting phenomena that we can derive from the _structure_ of the equations.

We start by setting up the source-free Maxwell equations as a linear eigenproblem, which will allow us to bring all of the machinery of linear algebra and (eventually) group theory to bear on this problem without having to solve the PDE explicitly (which is usually impossible to do analytically).

Notational introductions: Hilbert spaces (vector space + inner product), notation for inner products and states (magnetic fields etc.). Defined the adjoint (denoted †) of linear operators and Hermitian operators (Â=Â†).  Showed that Hermitian operators have real eigenvalues and orthogonal eigenvectors/functions/states.

Gave simple example of Â=d²/dx² on u(x) with u(0)=u(L)=0.  This is Hermitian, and has orthogonal eigenfunctions uₙ=sin(nπx/L) and real
eigenvalues λₙ=–(πn/L)², corresponding to the [Fourier sine series](https://en.wikipedia.org/wiki/Fourier_sine_and_cosine_series) basis.

**Further reading:** See chapter 2 of the _Photonic Crystals_ textbook for Maxwell's equations as an eigenproblem etc. For a more sophisticated treatment of Hilbert spaces, adjoints, and other topics in functional analysis, a good text is _Basic Classes of Linear Operators_ by Gohberg et al. The basics of electromagnetism in macroscopic media (ε and μ) are covered in any non-freshman electromagnetism textbook, e.g. _Classical Electrodynamics_ by Jackson or _Introduction to Electromagnetism_ by Griffiths.   See also
these [notes on function spaces and Hermitian operators](http://web.mit.edu/18.06/www/Fall07/operators.pdf) from 18.06 (Johnson).


### Lecture 2: 14 September

* [Lecture notes](https://www.dropbox.com/s/rar1m39caqext1d/18.369%20Fall%202021.pdf?dl=0) for 18.369 are now available online.

Showed that the Maxwell eigen-operator ∇×ε⁻¹∇× is Hermitian for real ε (by showing that ∇× is Hermitian). Also showed that the Maxwell operator is positive semidefinite for ε>0, and it follows that the eigenfrequencies ±ω are real, corresponding to *oscillating solutions*.

Constructed simple one-dimensional example of fields in metallic cavity, and showed that consequences match predictions from linear algebra.

**Further reading:** Chapter 2 of the photonic-crystals text.

### Lecture 3: 16 September
* [pset 1 solutions](psets/pset1sol.pdf)
* [pset 2](psets/pset2.pdf) (due Tuesday Oct 5 at noon)

Discussed consequences of symmetry, and in particular showed that mirror symmetry implies even/odd solutions. Discussed subtleties of mirror symmetries for electromagnetism: although the E and H fields seem to have opposite symmetry, they don't, because H is a pseudovector. Defined general rotation operators _R̂_ for vector and pseudovector fields.

Gave a simple 2d example of fields in a 2d metal box, and showed that the symmetries are more complicated, and may include degeneracies. In order to understand this, we need to understand the relationship of different symmetry operations to one another — this relationship is expressed more precisely by the _group_ of symmetry operators, which we will get to next time.

**Further reading:** Chapter 3 of the photonic-crystals text. See the Inui textbook, or many similar sources, on group theory; the most helpful in this context are the many "group theory in physics" books.

### Lecture 4: 21 September

* [representation theory summary](notes/representation-theory.pdf)

Defined groups, and group representations, irreducibility, and partner functions, conjugacy classes and most of the other things on the handout, with some examples (the square symmetry group and the mirror symmetry group). (Briefly covered everything on the handout _except_ Great Orthogonality Theorem, character tables, projection operators, and product representations.)

Proved that all eigenfunctions can be chosen to transform as partner functions of an irreducible representation of the symmetry group (also called a "basis" of the representation), with the dimension of the representation given by the degree of degeneracy of the eigenvalue. Proved that all representations derived from a given eigenvalue are equivalent. Noted that orthonormal eigenfunctions give a unitary representation (outlined proof but did not work it through).

If the representation is irreducible, then the degeneracy comes from the symmetry of the system. If the representation is reducible, then we call it an **accidental degeneracy** (not coming from symmetry). Accidental degeneracies rarely happen by accident—usually the degeneracy has somehow been forced—so generically we only expect degeneracies if there are >1 dimensional irreps.

Build the simple character table for the {E,σ} mirror-symmetry group, reprising the previous result that in mirror-symmetric systems we expect even/odd eigenfunctions, and we don't expect (non-accidental) degeneracies (unless there are additional symmetries).

Using the rules from the representation theory handout, we can build up the character table for the symmetry group of the square (called _C_4v).  Or we can just look it up.  Either way, there are 5 irreps, one of which is 2d … so we expect 2-fold non-accidental degeneracies.

**Further reading:** Chapter 3 of the text, but this doesn't get into representation theory. See e.g. _Group Theory and Its Applications in Physics_ by Inui et al. (especially sections 4.1, 6.1, and 6.2) or _Group Theory and Quantum Mechanics_ by Michael Tinkham (especially sections 3-1 and 3-6), or any book with a similar title.  Character tables for all of the common symmetry groups are tabulated in both textbooks and online, e.g. see this [page on the C4v group](http://symmetry.jacobs-university.de/cgi-bin/group.cgi?group=404&option=4). See Inui section 6.6 on projection operators.

### Lecture 5: 23 September

* [computational photonics slides](http://math.mit.edu/~stevenj/18.369/Computation-18.369.pdf)
* [Meep square-cavity simulations](https://nbviewer.jupyter.org/github/mitmath/18369/blob/master/notes/meep-square-cavity.ipynb)
* Run this Meep notebook in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mochen4/meepdocker/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18369%26urlpath%3Dtree%252F18369%252Fnotes%252Fmeep-square-cavity.ipynb%26branch%3Dmaster)

Look at the eigenfunction solutions that we previously had for the square case, and show how we could classify them into the various irreducible representations.   In fact, we could even "guess" what the lowest-ω solutions might look like.   An even better way to do this classification, and many other tasks involving symmetry, is to use "projection operators," which we will get to soon.

Began talking about computational electromagnetism (first few slides), then jumped straight to time-domain FDTD simulations (slide 38).  We won't go into much detail now other than that FDTD solves the "full" time-dependent Maxwell equations (and hence can handle nonlinearies, arbitrary time-varying sources, materials, etcetera) by discretizing both space and time (on a funny "staggered" grid) and "marching" forward in time.   I jumped straight into some example simulations — of our familiar square cavity! — using [Meep, our free/open-source FDTD software](https://meep.readthedocs.io/en/latest/).

**Further reading:**  For FDTD in general, see e.g. Allen Taflove and Susan C. Hagness, _Computational Electrodynamics: The Finite-Difference Time-Domain Method_ (Artech, 2005). For the CFL condition in general, see e.g. this [book chapter by Trefethen](http://people.maths.ox.ac.uk/trefethen/4all.pdf). See also our [free FDTD software: Meep](https://github.com/NanoComp/meep), and in particular the introduction and tutorial sections of the Meep manual.

### Lecture 6: 28 September

* [notes on decomposition of functions into partner functions](notes/irrep-decompose.pdf)
* [notes on orthogonality of partner functions](notes/irrep-orthog.pdf)

Discussed three key facts:

• **Any function** (not just eigenfunctions) can be decomposed into a **sum of partner** functions of the irreps of *any* symmetry group whose operations are applicable.  (See handout.)
* These partner-function components can be obtained by applying the **projection operator**, which is just a linear combination of the symmetry operators with coefficients taken from the character table and/or representation matrices.  (See representation-theory handout.)
* Partner functions of different irreps are always **orthogonal** (under any inner product that is invariant under the symmetry group, i.e. for which the group operations are unitary).

The projection operator (which we will soon see is a kind of "generalized Fourier transform") is useful for lots of things.   It can be used to check which irrep(s) an eigenfunction falls into, or whether degeneracies are accidental.  By projecting "random" functions, it allows you to *construct* partner functions using only the character table, to obtain basis matrices and to see that an irrep "looks like".   We will also use it to derive *conservation laws* soon.

Used the projection operator to classify the modes of the square cavity, and in particular found that some of the modes are accidental degeneracies. In this way, we are able to find representatives of all five irreps. Conversely, by looking at the irreps, we can guess some of the types of eigenfunctions that should appear, inferring the sign pattern from the character table.

Showed how we can apply the projection operator to "random" functions to find partners of different irreps, even without an eigenproblem, and to "sketch" the qualitative features that we expect to find in the eigenfunctions. And, once we have partner functions, we can obtain representation matrices for each irrep (useful for 2+ dimensional irreps). As an example, looked at ψ(x,y)=1, x, and x2; found in particular that the 2d irrep transforms like {x,y}, i.e. the ordinary 2d rotation matrices.

Introduced the **min–max** (or "variational") **theorem**, which arises for any Hermitian eigenproblem. "Proved" the min–max theorem (with the simplifying assumption of a basis of eigenfunctions), and mentioned the derivation (in chapter 2 of the book) that all extrema of the Rayleigh quotient are eigenvalues.  This gives us some intuition about the lowest-ω eigenfunctions — they "want" to oscillate as little as possible and they "want" to concentrate in high-ε regions.  These two goals are often in conflict, so the eigenfunctions balance a tradeoff.

**Further reading**: See Inui section 6.6 on projection operators.  See the *Photonic Crystals* book, chapter 2, on the variational principle.

### Lecture 7: 30 September

Summarized orthogonality of partner functions (see notes from lecture 6).

**Translational symmetry:** Showed that for continuous translational symmetry, the representations are exponential functions exp(ikx) for some real number k (for unitary representations).

In a uniform (homogeneous) medium, this gives **planewave** solutions.  For scalar ε and μ, we obtain "transverse" waves (H ⟂ E ⟂ k) with a dispersion relation ω(k) = c|k|/n, where the refractive index n is given by n²=ɛμ.

More generally, in any z-invariant medium (ε is a function of xy only), we obtain **separable** solutions H=Hₖ(x,y)eⁱᵏᶻ, reducing the problem to a 2d PDE in the xy plane for each k, yielding eigenvalues ω(k).   For example, this is a key step in understanding *waveguides* such as optical fibers.

Discussed "**conservation of irrep**": a (current) source that is a partner of an irrep must produce solutions (fields) that are partners of the same irrep, and initial conditions that are partners produce solutions that are always partners.  Showed some examples from the [Meep square-cavity notebook](https://nbviewer.jupyter.org/github/mitmath/18369/blob/master/notes/meep-square-cavity.ipynb).

Conservation of the exp(-ikx) irrep, which gives conservation of k, leads immediately to Snell's law at a flat interface.

**Further reading:** Textbook, chapter 3 on continuous translational symmetry.


### Lecture 8: 5 October

* [pset 2 solutions](psets/pset2sol.pdf)
* [pset 3](psets/pset3.pdf) (due October 21)
* [notes on time evolution and conservation laws](notes/time-evolution.pdf)

The irreducible representation is "conserved" over time in a linear system, because the projection operator commutes with the time-evolution operator.

Defined the time-evolution operator explicitly via an exponentiated operator on the 6-component vector-field (**E**, **H**). Showed that the time-evolution operator is unitary in an appropriate inner product, for lossless materials, and that this leads to conservation of energy.

**Further reading:** See my [Notes on the algebraic structure of wave equations](notes/wave-equations.pdf) for a general discussion of many wave equations, showing that they share the common form dψ/dt D ψ where D is anti-Hermitian. For Poynting's theorem, see any graduate-level book on electromagnetism, e.g. Jackson's _Classical Electrodynamics_. The result is summarized in chapter 2 of the textbook. Beware that matters are more complicated for dispersive media (ones in which ε and μ depend on ω), as discussed briefly in Jackson. A much more complete review of passive dispersive media, including the consequences of passivity for causality etcetera, can be found in our 2014 paper [Speed-of-light limitations in passive linear media](http://math.mit.edu/~stevenj/papers/Welters14.pdf): see in particular the discussion of passivity in section II.B and of "dynamical" energy density in section V.A.

### Lecture 9: 6 October

Finished time-evolution notes from previous lecture.

Introduced **dielectric waveguides**, via the simple 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction.

A point source (delta-function current) in a dielectric waveguide will generally excite _both_ guided (below the light line) and radiating (above the light line) solutions, and you might be interested in [this animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5.mp4) of a point source in a dielectric waveguide (ε=4 surrounded by air) (see also the [larger version of the same animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5-long.mp4)).

Introduced the "reduced" eigenproblem Θ̂ₖ=exp(-ikx)Θ̂exp(ikx) for the modes of a particular wavevector **k**. This is also Hermitian, its solutions ω(k) yield the dispersion relation (or _band structure_) of the problem.   The rotational symmetries are now reduced for Θ̂ₖ to the "little group of *k*", the symmetries that preserve *k*.

Explained how mirror symmetry in _z_ means that _z_-invariant solutions in "2d" structures ε(x,y) can be segregated into two polarizations: even Hz-polarized (what the book calls "TE") and odd Ez-polarized (what the book calls "TM"). (Note that the literature is split on the terminology here: many authors call the former TM and the latter TE.)

By conjugating the eigenequation, for real ε, showed that ω(**k**)=ω(−**k**) in general, even for structures without mirror symmetry. Connected this to time-reversal symmetry: the conjugated mode corresponds to running time backwards, which still solves the same Maxwell's equation. One way to break time-reversal symmetry is by introducing absorption loss (complex ε, which time-reverses into gain). Alternatively, briefly mentioned magneto-optic materials (complex-Hermitian ε, neglecting absorption) and why a static magnetic field can (locally) break time-reversal symmetry, and of use for Faraday isolators.

Continued discussing **dielectric waveguides**, via the simple 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction. Explained that the solutions far from the waveguide lead to a continuous region, the _light cone_, and argued (proof to come later) that the higher-ε region pulls down localized guided modes below the light cone. Since they are localized, they form discrete bands in order to stay orthogonal.

**Further reading**: See the book, chapter 3, on index guiding and the variational principle. (See e.g. Jackson's _Classical Electrodynamics_ for a more traditional viewpoint on dielectric waveguides, focused on the two cases that can be solved analytically, and Marcuse's _Theory of Dielectric Optical Waveguides_ for an expanded version of this. See e.g. Ramaswami and Sivarajan, _Optical Networks_ for a nice practical overview of dielectric waveguiding in modern telecommunications.)

### Lecture 10: 11 October

Used the min–max theorem to prove the existence of index-guided modes (in two dimensions, for the TE/Hz polarization), for any translation-invariant structure where ε is increased "on average" in a localized region, for an appropriate definition of "on average."

Considered related localization theorems in quantum mechanics: an arbitrary attractive potential will always localize a bound state in 1d or 2d, but not in 3d, and sketched a simple dimensional argument in 1d and 3d (but not 2d, which is a difficult borderline case); see also [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf). Discussed the related theorem for 3d waveguides (2d localization); see the Bamberget and Bonnet and Lee papers above.

**Further reading**: See the book, chapter 2, on the variational principle. See [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf) on localization in a different scalar-wave equation via the same variational method. [Bamberget and Bonnet (1990)](http://epubs.siam.org/doi/abs/10.1137/0521082) is a classic paper on the theory of dielectric waveguiding. [Lee (2008)](https://www.osapublishing.org/oe/abstract.cfm?uri=oe-16-13-9261) is an extension of the variational proof to Maxwell's equations in much more complex periodic waveguides and photonic-crystal fibers.

**Discrete translational symmetry:**

Started by considering a periodic "waveguide" in two dimensions: a sequence of dielectric rods in air. By analogy with ray-optics and total-internal reflection, it seems that this could not support guided modes. However, it does (chapter 7 of the book), and to understand this we need to understand discrete translational symmetry.

Showed that the representations of the discrete translation group are again exponentials, and thereby proved **Bloch's theorem**: the eigenfunctions can be chosen in the form of a planewave multipled by a periodic function.

As a corollary, the Bloch wavevector **k** is conserved, and mentioned how this relates to a famous mystery from the 19th century: electrons in a pure conductor act almost like a dilute gas, because they scatter only from impurities/imperfections that break the periodicity.

Qualitative description of the resulting band diagrams in 1d-periodic systems.

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. This means that we only need to look at the "unit cell" in k-space to get the band diagram. Talked about a few different ways to think about this: 2π/a gives the same irrep, it gives the same PDE for the Bloch modes, and the Bloch modes can be expanded as a Fourier series with components at k+2πm/a for all integers m.

**Further reading**: Chapter 3 and appendix B of the textbook on 1d periodicity.

### Lecture 11: 14 October

**Discrete translational symmetry:**

Continued from last lecture.

Qualitative description of the resulting band diagrams in 1d-periodic systems.

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. This means that we only need to look at the "unit cell" in k-space to get the band diagram. Talked about a few different ways to think about this: 2π/a gives the same irrep, it gives the same PDE for the Bloch modes, and the Bloch modes can be expanded as a Fourier series with components at k+2πm/a for all integers m.

Discussed the band diagram, light cone, and guided modes of a periodic dielectric waveguide.

As an application of conservation of k (up to addition of reciprocal lattice vectors) in periodic systems, discussed reflection (specular and diffractive) from a periodic surface, and minimum-frequency/maximum-wavelength cutoffs for various diffracted orders.

**Further reading**: Chapter 7 on periodic dielectric waveguides. Chapter 10 has a section on reflection/diffraction from a periodic surface.

Began new topic: **photonic crystals in one dimension**. Sketched the form of the dispersion relation (band structure) and explained several qualitative features we can predict without solving:

*   From symmetry and periodicity, ω(k)=ω(-k)=ω(k+2π/a), and consequently ω(π/a-k)=ω(π/a+k) (i.e., ω is symmetric around both k=0 and k=π/a)
*   Because ω(k) is smooth except at crossings, we expect the bands to have zero slope at k=0 and k=&pi/a (around which they are even-symmetric)
*   ωa<<1 corresponds to the long-wavelength limit, at which the waves don't "see" the periodic structure and instead see some "average" homogeneous ε (an "effective medium" or "metamaterial"; also called "homogenization theory"). Hence around (ω,k)=(0,0) the bands should approach straight lines (the solutions in a homogeneous medium).
*   Because the 1d Maxwell equations are a 2nd-order ODE, and the eigenproblem at a given ω is a 2-point boundary-value problem, there can be only two solutions at each ω. It follows that the bands ω(k) must be _monotonic_ in (0,π/a).
*   Because the symmetry group at each k has at most a mirror symmetry, which has no 2d irreps, we do not generically expect degeneracies. (By playing with the parameters, it turns out that you can force accidental degeneracies at k=0.)
*   The combination of the last two points mean that we generically expect _band gaps_ to arise: ranges of ω in which there are no solutions (at least, not at real values of k).
*   Although I haven't shown it yet, it turns out the bands have slopes that alternate in sign: the first band has positive slope in (0,π/a), the second band negative, the third positive, and so on.

We can use perturbation theory to quantitatively derive the magnitude of the gap and other features by starting with a homogeneous medium and then adding a little bit of periodic ε contrast.

**Further reading:** Chapter 4 of the textbook.