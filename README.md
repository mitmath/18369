# 18.369(J)/8.315(J): Mathematical Methods in Nanophotonics

This is the repository of course materials for the [18.369(J)/8.315(J)](http://student.mit.edu/catalog/m18a.html#18.369) course at MIT, taught by Prof. [Steven G. Johnson](http://math.mit.edu/~stevenj/), in Spring 2024 (This course is offered once every two years.)

Syllabus
--------

> **Tired of doing electromagnetism like it's 1865?**
>
> _Find out what solid-state physics has brought to [8.02](https://ocw.mit.edu/courses/physics/8-02-physics-ii-electricity-and-magnetism-spring-2007/) in the last 20 years, in this new course surveying the physics and mathematics of nanophotonics—electromagnetic waves in **media structured on the scale of the wavelength**._
>
> _In this regime, which is the basis for everything from iridescent butterfly wings to distributed-feedback lasers and integrated optical devices to the next generation of optical fibers, the 140–year-old analytical techniques you learned in 8.02 aren't as useful. Instead, we will cover computational methods combined with high-level algebraic techniques borrowed from solid-state quantum mechanics: linear algebra and eigensystems, group theory, Bloch's theorem and conservation laws, perturbation methods, and coupled-mode theories, to understand surprising optical phenomena from band gaps to slow light to nonlinear filters._
>
> For beginning graduate students and advanced undergraduates.

**Lectures**: Mon/Wed/Fri 2pm (2-131). **Office Hours:** Tuesdays 4-5pm [via Zoom (MIT only)](https://mit.zoom.us/j/92619576744?pwd=SjVuMHVSVjBtdDc5RW9HL1pKNHVQZz09). TA/grader: TBA.

**Handwritten notes:** Handwritten notes from each lecture will be
posted online.   You can also refer to older [handwritten notes from spring 2020](https://www.dropbox.com/s/1c3l54mf3rh8qw3/18.369%20spring%202020.pdf?dl=0) and the [notes from fall 2021](https://www.dropbox.com/s/rar1m39caqext1d/18.369%20Fall%202021.pdf?dl=0).

**Probable topics**: _Methods_: linear algebra & eigensystems for Maxwell's equations, symmetry groups and representation theory, Bloch's theorem, numerical eigensolver methods, time and frequency-domain computation, perturbation theory, coupled-mode theories, waveguide theory, adiabatic transitions. _Optical phenomena_: photonic crystals & band gaps, anomalous diffraction, mechanisms for optical confinement, optical fibers (new & old), nonlinearities, integrated optical devices.

**Grading**: 33% problem sets (weekly/biweekly). 33% take-home mid-term exam (Posted **Apr 9**, due **Apr 10**.).  34% final project (proposal due Apr 16, project due May 13).

* Psets will be submitted electronically on [the 18.369 Canvas page](https://canvas.mit.edu/courses/24364).  Submit a good-quality PDF *scan* of any handwritten solutions (and/or a PDF printout of computer output).

**Collaboration policy**: Talk to anyone you want to and read anything you want to, with three exceptions: First, you **may not refer to homework solutions from the previous terms** in which I taught 18.369. Second, make a solid effort to solve a problem on your own before discussing it with classmates or googling. Third, no matter whom you talk to or what you read, write up the solution on your own, without having their answer in front of you.  (You can use [psetpartners.mit.edu](https://psetpartners.mit.edu) to find problem-set partners.)

**Piazza forum**: you are encouraged to use the [online Piazza forum](https://piazza.com/mit/spring2024/183698315) to ask questions about the material and assignments.

**Books**: [Photonic Crystals: Molding the Flow of Light (Second Edition)](http://ab-initio.mit.edu/book) (**readable online**). (This book is at an undergraduate level and 18.369/8.315 is somewhat more advanced, but the book should provide a useful foundation.)

Useful (but not required) books (available in the library): [Group Theory and Its Applications in Physics](http://link.springer.com/book/10.1007/978-3-642-80021-4) by Inui et al. ([readable online](http://link.springer.com/book/10.1007/978-3-642-80021-4) via MIT), and _Group Theory and Quantum Mechanics_ by Michael Tinkham.

**Final projects:** A typical project will be to find some interesting nanophotonic structure/phenomenon in the literature (chapter 10 of the book may be a helpful guide to some possibilities), reproduce it (usually in 2d only, so that the simulations are quick), using (e.g.) the numerical software ([Meep](https://github.com/NanoComp/meep) and/or [MPB](https://github.com/NanoComp/mpb)) introduced in the course/psets (other useful free/open-source software: [SCUFF-EM](http://homerreid.github.io/scuff-em-documentation/) and [S4](https://web.stanford.edu/group/fan/S4/)), and extend/analyze it in some further way (try some other variation on the geometry, etc.). Then write up the results in a 7-15 page report (in the format of a journal article, ideally [Phys. Rev. A](http://pra.aps.org) style, including figures, a comprehensive review of related work, etcetera)—reports should be written for a target audience of your classmates in 18.369/8.315, and should explain what you are doing at that level. Projects should _not_ be a rehash of work you've already done in previous terms for your research (but may be some extension/digression thereof).

**Prerequisites**: 18.303, 8.07, or permission of instructor. (Basically, some experience with partial differential equations and linear algebra. e.g. 8.05, 8.07, 6.013, 3.21, 2.062 are all good background.) This is a graduate-level course aimed at beginning graduate students and suitably advanced undergraduates.

Supplementary lecture notes will be made available as the term progresses.

Lecture Summaries and Handouts
------------------------------

### Lecture 1: 5 Feb 2024

* syllabus (this web page)
* [introductory slides](notes/18.369-intro.pdf)
* [handwritten notes](https://www.dropbox.com/scl/fi/gd7m09iut5wldwkw3aznh/Maxwell-Linear-Algebra.pdf?rlkey=23v5luxtwjexn59md5h52mug6&dl=0)
* [pset 1](psets/pset1.pdf) (due Wed Feb 14)

Motivation and introduction: this class is about electromagnetism where the wavelength is neither very large (quasi-static) nor very small (ray optics), and the analytical and computational methods we can use to understand phenomena in materials that are structured on the wavelength scale. In that situation, there are very few cases that can be solved analytically, but lots of interesting phenomena that we can derive from the _structure_ of the equations.

We start by setting up the source-free Maxwell equations as a linear eigenproblem, which will allow us to bring all of the machinery of linear algebra and (eventually) group theory to bear on this problem without having to solve the PDE explicitly (which is usually impossible to do analytically).

**Further reading:** See chapter 2 of the _Photonic Crystals_ textbook for Maxwell's equations as an eigenproblem etc. For a more sophisticated treatment of Hilbert spaces, adjoints, and other topics in functional analysis, a good text is _Basic Classes of Linear Operators_ by Gohberg et al. The basics of electromagnetism in macroscopic media (ε and μ) are covered in any non-freshman electromagnetism textbook, e.g. _Classical Electrodynamics_ by Jackson or _Introduction to Electromagnetism_ by Griffiths.   See also
these [notes on function spaces and Hermitian operators](http://web.mit.edu/18.06/www/Fall07/operators.pdf) from 18.06 (Johnson).

### Lecture 2: 7 Feb 2024

* handwritten notes - link from lecture 1

Discussed the meaning of adjoints $\hat{O}^\dagger$ of linear operators $\hat{O}$ — given vector spaces with inner products ⟨u,v⟩, then the adjoint is whatever makes $\langle u, \hat{O}v\rangle = \langle \hat{O}^\dagger u, v\rangle$.  A Hermitian operator is one for which $\hat{O} = \hat{O}^\dagger$.  Reviewed the proof that Hermitian operators have real eigenvalues and orthogonal eigenvectors.

Gave the example of functions u(x) on [0,L] with u(0)=u(L)=0, and the operator $\hat{O} = \frac{d^2}{dx^2}$.  Showed that this operator is Hermitian.  (In fact, it is also negative definite.)  In this case we can explicitly write down the eigenfunctions $u\_n(x) = \sin(n\pi x/L)$ for n=1,2,… and we see that they are orthogonal (Fourier sine series basis functions) with eigenvalues $\lambda_n = -(n\pi/L)^2$ that are real (and negative).

Showed that the Maxwell eigen-operator ∇×ε⁻¹∇× is Hermitian for real ε (by showing that ∇× is Hermitian). The Maxwell operator is also positive semidefinite for ε>0, and it follows that the eigenfrequencies are real.

**Further reading:** Same as lecture 1.

### Lecture 3: 9 Feb 2024

* handwritten notes - link from lecture 1
* handwritten notes - [symmetry](https://www.dropbox.com/scl/fi/e46tis1z50oicb1p4w7ot/Maxwell-and-Symmetry.pdf?rlkey=b3hug426lqdxyoua3mlhbmgrp&dl=0)

Constructed simple one-dimensional example of fields in metallic cavity, and showed that consequences match predictions from linear algebra.

Began discussing the effect of symmetry on the solutions.  In particular, symmetry operations g that describe rotations/reflections and/or translations of
the coordinates, and the corresponding operation $\hat{g}$ on our space(s) of functions/fields.  (Later on, g will be an element of a *symmetry group G* of a problem.)   If a physical system is described by a linear operator
$\hat{O}$ (maybe combined with some boundary conditions), then we say that this problem/operator "has" a symmetry g if $\hat{g}$ **commutes** with $\hat{O}$ (and preserves any boundary conditions).  This
begins to turn symmetry into a problem of *algebra* so that we can analyze its consequences on the physical solutions.

Ultimately, the tool that we will use to describe the effect of symmetry is *group representation theory*, and we will find lots of consequences, from
conservation laws to selection rules.  For now, however, we will begin more simply, with eigenproblems, and showed the simplest possible consequence:
if g is a symmetry of the eigenproblem, then we can find **simultaneous eigenfunctions** of both $\hat{O}$ and $\hat{g}$.

Started with the simplest example of a mirror symmetry, conventionally denoted by g=σ.  In this case, the eigenfunctions of $\hat{\sigma}$ correspond to
[even and odd functions](https://en.wikipedia.org/wiki/Even_and_odd_functions) — the eigenfunctions of our symmetric $\hat{O}$ can be chosen to be
symmetric or anti-symmetric!

Next, considered *continuous translational symmetry*.  In this case, we have *many* symmetry operations corresponding to translation by any d ∈ ℝ in some direction,
but all of these symmetry operations *commute*.  In fact, $\widehat{d_1} \widehat{d_2} = \widehat{d_1+d_2} = \widehat{d_2 + d_1}$.   Showed that the corresponding
eigenvalues of $\hat{d}$ are *exponentials* $\exp(-ikd)$ for some number k (which must be real if we want to exclude exponentially growing/decaying solutions).
Corresponding eigenfunctions u(x,y,z) are of the form $u(x,y,z) = u_k(x,y) e^{ikz}$, if we are talking about translational symmetry in z.   This has far-reaching
consequences for wave propagation (and for mathematics — the relationship to symmetry is why Fourier transforms are so important).

**Further reading:** Chapter 3 of the textbook.   See the Wikipedia article on [characterizations of the exponential function](https://en.wikipedia.org/wiki/Characterizations_of_the_exponential_function), property 5, for why the property α(x+y)=α(x)α(y) can only be satisfied by exp(κx) for nonzero, anywhere-continuous functions.  Proving the existence of an everywhere-discontinuous counterexample [requires the axiom of choice](https://math.mit.edu/~stevenj/exponential.pdf) and is not constructive.

### Lecture 4: 12 Feb 2024

* [handwritten notes](https://www.dropbox.com/scl/fi/cy8p9l10e6n73rpjmchd8/Maxwell-Translational-Symmetry.pdf?rlkey=ted0itfztk5amz3vo4t4ggo74&dl=0)

Briefly reviewed material from last time — why translational symmetry in z means that we can find eigenfunctions of a translation-symmetric operator $\hat{O}$ of the form $u(x,y,z) = u_k(x,y) e^{ikz}$.

In a homogeneous medium (constant ε), symmetry implies **planewave** solutions $H_k e^{ik\cdot x -i\omega t}$, and plugging this into Maxwell's equations shows that where $H_k$ is a constant vector ⟂ k ("transverse waves"), and $\omega = \pm c|k|/\sqrt{\varepsilon}$.

Another important application of translational symmetry that we will spend a lot of time on are **waveguides**, which have translational symmetry in some direction z, but have an inhomogeneous structure in xy that *localizes (some) waves* in these transverse directions.

Introduced the "reduced" eigen-operator Θ̂ₖ=exp(-ikx)Θ̂exp(ikx) for the eigen-solutions with a particular wavevector **k**. This is also Hermitian positive semi-definite, its solutions ω(k) yield the dispersion relation (or _band structure_) of the problem.

By conjugating the eigenequation, for **real ε**, showed that ω(**k**)=ω(−**k**) in general, even for structures without mirror symmetry.  This is sometimes described as an effect of "reciprocity" or "time-reversal symmetry". Alternatively, briefly mentioned magneto-optic materials (complex-Hermitian ε, neglecting absorption) and why a static magnetic field can (locally) break time-reversal symmetry, and of use for Faraday isolators.

The simplest example of a waveguide is a hollow metallic tube, with the walls (approximated by PEC) forming "impenetrable" mirrors for light.   Explicitly solved this for the "2d" problem of waves confined between two PEC planes, which we previously solved as a "1d" problem.  Again looking for Hz-polarized solutions, we found it satisfies exactly the same eigenproblem as in our 1d case, but with ω² replaced by ω²–k², leading to dispersion relations ω(k) that are *hyperbolas*.  All of the solutions except for the 0-th one, morever, only begin at some ω>0 *cutoff* frequency.  We will explore the consequences of these features in later lectures.

A more complicated example to analyze, but which is extremely practically important (e.g. for optical fibers), are **dielectric waveguides** (in particular, via "total internal reflection" or "**index guiding**"): essentially, a high-ε region surrounded by a low-ε region, invariant along some direction.  We will begin with a simplified 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction.

**Further reading**: See the book, chapter 2 on translational symmetry and the reduced eigenproblem, and chapter 3 on index guiding. (See e.g. Jackson's _Classical Electrodynamics_ for a more traditional viewpoint on waveguides, focused on the few cases that can be solved analytically, and Marcuse's _Theory of Dielectric Optical Waveguides_ for an expanded version of this. See e.g. Ramaswami and Sivarajan, _Optical Networks_ for a nice practical overview of optical fiber technology in modern telecommunications.)

### Lecture 5: 14 Feb 2024

* continued [handwritten notes](https://www.dropbox.com/scl/fi/cy8p9l10e6n73rpjmchd8/Maxwell-Translational-Symmetry.pdf?rlkey=ted0itfztk5amz3vo4t4ggo74&dl=0) from lecture 4
* [pset 1 solutions](psets/pset1sol.pdf)
* [pset 2](psets/pset2.pdf): due Wednesday, 28 February 2024.

**Conservation of symmetry**: you saw in homework that sources which are eigenfunctions of ĝ produce fields that are also eigenfunctions of ĝ with the same eigenvalue: the symmetry eigenvalue is "conserved".   Next week, we will see a similar result for time evolution: if the initial fields
at t=0 are eigenfunctions of ĝ (along with any currents), then the fields at *all times* are eigenfunctions of ĝ with the same eigenvalue.  For example, in a system with a mirror symmetry, if you have an odd initial condition then the solutions at all later times are odd.
For translational symmetry, showed that conservation of the exp(-ikx) eigenvalue, which gives conservation of k, leads immediately to [Snell's law](https://en.wikipedia.org/wiki/Snell%27s_law) at a flat interface, as well as the "law of reflection" (reflected waves are the same angle as the incident wave).

Continued discussing **dielectric waveguides**, via the simple 2d example of a high-ε region surrounded by a low-ε region, invariant in the x direction. Explained that the solutions far from the waveguide lead to a continuous region, the _light cone_, and argued (proof to come later) that the higher-ε region pulls down localized guided modes below the light cone. Since they are localized, they form discrete bands in order to stay orthogonal.

Introduced the **min–max or "variational" theorem**, which arises for any Hermitian eigenproblem. Proved the variational theorem (with the simplifying assumption of a basis of eigenfunctions), and mentioned the derivation (in chapter 2 of the book) that all extrema of the Rayleigh quotient are eigenvalues. We will use this theorem to derive general conditions under which guided modes are guaranteed to arise in dielectric waveguides.

Began discussing how the min–max theorem can be used to prove the existence of index-guided modes (in two dimensions, for the TE/Hz polarization), for any translation-invariant structure where ε is increased "on average" in a localized region, for an appropriate definition of "on average."

**Further reading**: See the book, chapter 2, on the variational principle. See [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf) on localization in a different scalar-wave equation via the same variational method. [Bamberget and Bonnet (1990)](http://epubs.siam.org/doi/abs/10.1137/0521082) is a classic paper on the theory of dielectric waveguiding. [Lee (2008)](https://www.osapublishing.org/oe/abstract.cfm?uri=oe-16-13-9261) is an extension of the variational proof to Maxwell's equations in much more complex periodic waveguides and photonic-crystal fibers.

A point source (delta-function current) in a dielectric waveguide will generally excite _both_ guided (below the light line) and radiating (above the light line) solutions, and you might be interested in [this animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5.mp4) of a point source in a dielectric waveguide (ε=4 surrounded by air) (see also the [larger version of the same animation](https://github.com/mitmath/18303/raw/fall16/waveguide-movies/index-0.5-long.mp4)).

### Lecture 6: 16 Feb 2024

* handwritten notes - see lecture 5

Used the min–max theorem to prove the existence of index-guided modes (in two dimensions, for the TE/Hz polarization), for any translation-invariant structure where ε is increased "on average" in a localized region, for an appropriate definition of "on average."

Considered related localization theorems in quantum mechanics: an arbitrary attractive potential will always localize a bound state in 1d or 2d, but not in 3d, and sketched a simple dimensional argument in 1d and 3d (but not 2d, which is a difficult borderline case); see also [these notes](https://github.com/mitmath/18303/blob/fall16/slow-waveguides.pdf). Discussed the related theorem for 3d waveguides (2d localization); see the Bamberget and Bonnet and Lee papers above.

**Further reading**: See lecture 5.

### Lecture 7: 20 Feb 2024

**Handout:** [notes on time evolution and conservation laws](notes/time-evolution.pdf)

Defined the time-evolution operator explicitly via an exponentiated operator on the 6-component vector-field (**E**, **H**). Showed that the time-evolution operator is unitary in an appropriate inner product, for lossless materials, and that this leads to conservation of energy.

**Further reading:** See my [Notes on the algebraic structure of wave equations](notes/wave-equations.pdf) for a general discussion of many wave equations, showing that they share the common form dψ/dt D ψ where D is anti-Hermitian. For Poynting's theorem, see any graduate-level book on electromagnetism, e.g. Jackson's _Classical Electrodynamics_. The result is summarized in chapter 2 of the textbook. Beware that matters are more complicated for dispersive media (ones in which ε and μ depend on ω), as discussed briefly in Jackson. A much more complete review of passive dispersive media, including the consequences of passivity for causality etcetera, can be found in our 2014 paper [Speed-of-light limitations in passive linear media](http://math.mit.edu/~stevenj/papers/Welters14.pdf): see in particular the discussion of passivity in section II.B and of "dynamical" energy density in section V.A.

### Lecture 8: 21 Feb 2024

Continuing from lecture 7: dispersive media, passivity, and dissipation.
