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

**Lectures**: Mon/Wed/Fri 2pm (2-131). **Office Hours:** Tuesdays 4-5pm [via Zoom (MIT only)](https://mit.zoom.us/j/92619576744?pwd=SjVuMHVSVjBtdDc5RW9HL1pKNHVQZz09). TA/grader: Mo Chen (mochen ατ mit.edu).

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

### Lecture 9: 23 Feb 2024 (via Zoom)

* [slides](https://docs.google.com/presentation/d/1U2ujGOLvJAAsbJoknLs9GKJKuc8T47vx2_RdTHBTlMw/edit?usp=sharing)

Guest lecture by [Dr. Pengning Chao](https://math.mit.edu/directory/profile.html?pid=2576) on upper bounds on light–matter interactions from conservation laws.

**Further reading**: For reviews of these topics, see e.g. Dr. Chao's PhD thesis, ["Probing fundamental performance limits in photonics design"](http://arks.princeton.edu/ark:/88435/dsp01pr76f6729) (2023), the review article ["Physical limits in electromagnetism" (Chao et al., 2022)](https://www.nature.com/articles/s42254-022-00468-w), and the review article ["Fundamental limits to the near-field optical response" (Miller, 2023)](https://arxiv.org/abs/2304.07253).

### Lecture 10: 28 Feb 2024, [via Zoom (MIT only)](https://mit.zoom.us/j/92619576744?pwd=SjVuMHVSVjBtdDc5RW9HL1pKNHVQZz09)

* [handwritten notes](https://www.dropbox.com/scl/fi/rijnupibe6n0w4i9mmro4/Periodic-Maxwell.pdf?rlkey=3xy22sjziy98l47lttnehxibh&dl=0)
* [video recording (MIT only)](https://mit.zoom.us/rec/share/L5dHd2Lykg1JeGqJRL2Iy6Id12vX5MIZiG4nRibakFRut5B3cnwrIY_j_ccDfFOg.LmyQP8FP6Sie30je?startTime=1709147095000)
* [pset 2 solutions](psets/pset2sol.pdf)
* [pset 3](psets/pset3.pdf): due Wed Mar 6

**Discrete translational symmetry:**

Started by considering a periodic "waveguide" in two dimensions: a sequence of dielectric rods in air. By analogy with ray-optics and total-internal reflection, it seems that this could not support guided modes. However, it does (chapter 7 of the book), and to understand this we need to understand discrete translational symmetry.

Showed that the representations of the discrete translation group are again exponentials, and thereby proved **Bloch's theorem**: the eigenfunctions can be chosen in the form of a planewave multipled by a periodic function.

As a corollary, the Bloch wavevector **k** is conserved, and mentioned how this relates to a famous mystery from the 19th century: electrons in a pure conductor act almost like a dilute gas, because they scatter only from impurities/imperfections that break the periodicity.

Qualitative description of the resulting band diagrams in 1d-periodic systems.

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. This means that we only need to look at the "unit cell" in k-space to get the band diagram. Talked about a few different ways to think about this: 2π/a gives the same irrep, it gives the same PDE for the Bloch modes, and the Bloch modes can be expanded as a Fourier series with components at k+2πm/a for all integers m.

Derived the periodicity of the Bloch wavevector **k** in one dimension. Adding 2π/a does not change the irrep, and is only a relabeling of the eigensolution. This means that we only need to look at the "unit cell" in k-space to get the band diagram. Talked about a few different ways to think about this: 2π/a gives the same irrep, it gives the same PDE for the Bloch modes, and the Bloch modes can be expanded as a Fourier series with components at k+2πm/a for all integers m.

Discussed the band diagram, light cone, and guided modes of a periodic dielectric waveguide.

**Further reading**: Chapter 3 and appendix B of the textbook on 1d periodicity. Chapter 7 on periodic dielectric waveguides.

### Lecture 11: 1 Mar 2024 (via Zoom)

* [handwritten notes](https://www.dropbox.com/scl/fi/rijnupibe6n0w4i9mmro4/Periodic-Maxwell.pdf?rlkey=3xy22sjziy98l47lttnehxibh&dl=0)
* [video recording (MIT only)](https://mit.zoom.us/rec/share/zHuBNta87GWcHBPpgFS-WsoO3kBqg1eXtW7iqaHr0kf_9bvrzZwdkCsC6VCY2yWn.tgm72a5ws8mpmKTu?startTime=1709320076000)

As an application of conservation of k (up to addition of reciprocal lattice vectors) in periodic systems, discussed reflection (specular and diffractive) from a periodic surface, and minimum-frequency/maximum-wavelength cutoffs for various diffracted orders.

Began new topic: **photonic crystals in one dimension**. Sketched the form of the dispersion relation (band structure) and explained several qualitative features we can predict without solving:

*   From symmetry and periodicity, ω(k)=ω(-k)=ω(k+2π/a), and consequently ω(π/a-k)=ω(π/a+k) (i.e., ω is symmetric around both k=0 and k=π/a)
*   Because ω(k) is smooth except at crossings, we expect the bands to have zero slope at k=0 and k=&pi/a (around which they are even-symmetric)
*   ωa<<1 corresponds to the long-wavelength limit, at which the waves don't "see" the periodic structure and instead see some "average" homogeneous ε (an "effective medium" or "metamaterial"; also called "homogenization theory"). Hence around (ω,k)=(0,0) the bands should approach straight lines (the solutions in a homogeneous medium).
*   Because the 1d Maxwell equations are a 2nd-order ODE, and the eigenproblem at a given ω is a 2-point boundary-value problem, there can be only two solutions at each ω. It follows that the bands ω(k) must be _monotonic_ in (0,π/a).
*   We generically expect _band gaps_ to arise: ranges of ω in which there are no solutions (at least, not at real values of k).
*   The bands have slopes that alternate in sign: the first band has positive slope in (0,π/a), the second band negative, the third positive, and so on.

Qualitatively considered starting with a constant-ε system and gradually "turning on" a periodic modulation, which allows us to understand how the solutions of a periodic system relate to the familiar planewave solutions of homogeneous materials, and where gaps come from.

We can use perturbation theory to quantitatively derive the magnitude of the gap and other features by starting with a homogeneous medium and then adding a little bit of periodic ε contrast.

**Further reading**: Chapter 10 has a section on reflection/diffraction from a periodic surface.  Chapter 4 of the textbook on 1d-periodic systems.

### Lecture 12: 4 Mar 2024

* [handwritten notes](https://www.dropbox.com/scl/fi/rijnupibe6n0w4i9mmro4/Periodic-Maxwell.pdf?rlkey=3xy22sjziy98l47lttnehxibh&dl=0)

A quantitative estimate of the size of the band gap in 1d, via perturbation theory. In particular, derived first-order perturbation theory for the eigenvalue of any Hermitian operator with some small change, by expanding the eigenvalue and eigenfunction as power series in the change and solving order-by-order. We then write down this perturbative expression for the Maxwell operator, and see that the fractional change in frequency is just the fractional change in index multiplied by the fraction of electric-field energy in the changed material.

Discussed how perturbation theory can be used to derive the effect of absorption losses (to lowest order): adding a small imaginary part to ε yields a corresponding imaginary part in ω, giving loss or gain depending on the sign.

To apply perturbation to the opening of the gap, there is a slight complication because the cos(πx/a) and sin(πx/a) modes of the unperturbed (homogeneous) system are degenerate. This creates an ambiguity: to which linear combination of these eigenfunctions (i.e., what 0-th order solution) do we apply our perturbation analysis to? For a general perturbation with L-fold degeneracy, there is a technique called _degenerate perturbation theory_ that solves this problem by reducing it to an L×L eigenproblem. Here, however, we can solve the problem by symmetry: since the perturbed problem still has mirror symmetry around x=0, we know that the perturbed eigenfunctions must still be even/odd, so we must start with the cos/sin solutions.

Discussed reflection of light from a semi-infinite 1d crystal, at a frequency in the gap. We have no propagating solutions in the crystal, so by conservation of energy we must have 100% reflection. However, showed by analytical continuation of the band edge that we expect exponentially decaying "evanescent" solutions in the crystal, with a complex wavevector k ≈ sqrt(Δω/α) + π/a, where Δω is how far we are into the gap and α is the band-edge curvature.

**Further reading:** For the same derivation of perturbation theory, see "time-independent perturbation theory" in any quantum-mechanics text, e.g. Cohen-Tannoudji. See also the section on small perturbations in chapter 2 of the book. See chapter 4 of the book on the origin of the 1d gap, and on the special formulas for quarter-wave stacks in 1d (discussed in more detail in Yeh's _Optical Waves in Layered Media_). For evanescent waves and defect cavities, see chapter 4 of the textbook.

### Lecture 13: 6 Mar 2024

* [handwritten notes](https://www.dropbox.com/scl/fi/rijnupibe6n0w4i9mmro4/Periodic-Maxwell.pdf?rlkey=3xy22sjziy98l47lttnehxibh&dl=0)
* [pset 3 solutions](psets/pset3sol.pdf)

Off-axis propagation, projected band diagrams for multilayer films, Fabry-Perot defect modes, and surface states. Omnidirectional reflection.

**Further reading:** For defect modes, surface states, and off-axis propagation in multilayer films, see chapter 4 of the textbook. See also [projected TM band diagram](http://jdj.mit.edu/book/chapter4-fig10-14-corrected.pdf) from multilayer film (corrected from figure 10 of chapter 4 in the book). See chapter 4 of the book, final section on omnidirectional reflection; see any book on optics or advanced electromagnetism for Brewster's angle (e.g. Jackson or Hecht).

### Lecture 14: 8 Mar 2024

* [handwritten notes](https://www.dropbox.com/scl/fi/jy5g9zbt8bov1km10d67y/Wave-Velocity.pdf?rlkey=jhkhevgzuckkf0p9eobdcotua&dl=0)

Wave propagation velocity: defined phase velocity (along homogeneous directions) and group velocity. Explained why phase velocity is not uniquely defined in a periodic medium (and even in a uniform waveguide it can easily be infinite). Showed that group velocity is the velocity of propagation of wave packets, by considering a narrow-bandwidth packet and Taylor-expanding the dispersion ω(k) to first order.

Another viewpoint is that group velocity is the energy-propagation velocity (in a lossless medium), and explained the general principle that the velocity of any "stuff" can be expressed as the ratio of the flux rate of the stuff to the density of the stuff...we will show that in the electromagnetic case, this ratio gives exactly dω/dk. In particular, we will apply the Hellmann-Feynman theorem to our Θ̂ₖ eigenproblem to show that the group velocity dω/dk is precisely the energy velocity (ratio of energy flux to energy density, averaged over time and the unit cell).

Applied the Hellmann-Feynman theorem to our Θₖ eigenproblem to show that the group velocity dω/dk is precisely the energy velocity (ratio of energy flux to energy density, averaged over time and the unit cell).

From the energy velocity expression, proved that this group velocity is always ≤c for ε≥1. (At a deeper level, it turns out that you can prove this for any passive media.) Also gave a simple proof that the "front velocity" (the rate at which the wave "front" of nonzero fields can move) is bounded by the upper bound of the energy velocity.

**Further reading:** See chapter 3 of the book, section on phase and group velocity. See the footnotes in that section, e.g. Jackson, _Classical Electrodynamics_, for a derivation of group velocity from the Fourier perspective; see also my [notes on wave velocity and Fourier transforms](https://github.com/mitmath/18303/blob/fall16/fourier-dispersion.pdf) from [18.303](https://github.com/mitmath/18303/tree/fall16). A much more complete review of velocity in lossy and dispersive media can be found in our 2014 paper [Speed-of-light limitations in passive linear media](http://math.mit.edu/~stevenj/papers/Welters14.pdf).  For a discussion of dispersion (and dispersion compensation) as it applies in optical fibers, see e.g. R. Ramaswami and K. N. Sivarajan, _Optical Networks: A Practical Perspective_.

### Lecture 15: 11 Mar 2024

* [handwritten notes: 2d periodicity](https://www.dropbox.com/scl/fi/6ajalyt9wr4tlp4hz3yll/2D-Periodic-Maxwell.pdf?rlkey=9014uzcxfsltxsy9dt6c2bval&dl=0)
* [handwritten notes: symmetry](https://www.dropbox.com/scl/fi/je8czfdtr1uq3w66wrgab/Symmetry-and-Representation-Theory.pdf?rlkey=oe8zil4vn52nrc4wvs48c8264&dl=0)

Discussed group-velocity dispersion: when the group velocity depends on frequency (true for any non-scale-invariant system), wave packets spread out as they propagate.  This can be quantified (to lowest order) in terms of the "dispersion parameter" D.

New topic: **2d periodicity**

Reviewed Bloch's theorem, the primitive lattice vectors, the [Bravais lattice](http://en.wikipedia.org/wiki/Bravais_lattice), the primitive reciprocal lattice vectors, and the reciprocal lattice, for 2d periodicity. Reviewed the periodicity in k-space (reciprocal space), the Brillouin zone, and the irreducible Brillouin zone.

Gave the example of the square lattice, its Brillouin zone, and its irreducible Brillouin zone for structures with the same (C₄ᵥ) symmetry as the lattice.

Considered the TM band diagram of the square lattice of rods.  Pointed out that there are lots of interesting features — not only gaps, but the fact that the band extrema all occur at "high symmetry" k points, and the existence of 2-fold degeneracies only at the high-symmetry Γ and M points.  To understand this, we need to return to the general subject of symmetry in physics and give it a more comprehensive treatment.

New topic: **Symmetry, redux**.  Began by reviewing what we learned previously of symmetry, but more carefully looked at how symmetry operations apply to electromagnetic fields.  Previously, we had showed that mirror symmetry implies even/odd solutions. Now, however, discuss subtleties of mirror symmetries (and other improper rotations) for electromagnetism: although the E and H fields seem to have opposite symmetry, they don't, because H is a [pseudovector](https://en.wikipedia.org/wiki/Pseudovector). Defined general rotation operators _R̂_ for vector and pseudovector fields.

**Further reading:**  For a discussion of dispersion (and dispersion compensation) as it applies in optical fibers, see e.g. R. Ramaswami and K. N. Sivarajan, _Optical Networks: A Practical Perspective_.

### Lecture 16: 13 Mar 2024

* [handwritten notes: symmetry](https://www.dropbox.com/scl/fi/je8czfdtr1uq3w66wrgab/Symmetry-and-Representation-Theory.pdf?rlkey=oe8zil4vn52nrc4wvs48c8264&dl=0)
* [representation theory summary](notes/representation-theory.pdf)
* [pset 4](psets/pset4.pdf)

Gave a simple 2d example of fields in a 2d metal box, and showed that the symmetries are more complicated, and may include degeneracies. In order to understand this, we need to understand the relationship of different symmetry operations to one another — this relationship is expressed more precisely by the _group_ of symmetry operators.

Defined groups, and group representations, irreducibility, and partner functions, conjugacy classes and most of the other things on the handout, with some examples (the square symmetry group and the mirror symmetry group). (Briefly covered everything on the handout _except_ Great Orthogonality Theorem, character tables, projection operators, and product representations.)

Proved that all eigenfunctions can be chosen to transform as partner functions of an irreducible representation of the symmetry group (also called a "basis" of the representation), with the dimension of the representation given by the degree of degeneracy of the eigenvalue. Proved that all representations derived from a given eigenvalue are equivalent. Noted that orthonormal eigenfunctions give a unitary representation (outlined proof but did not work it through).

If the representation is irreducible, then the degeneracy comes from the symmetry of the system. If the representation is reducible, then we call it an **accidental degeneracy** (not coming from symmetry). Accidental degeneracies rarely happen by accident—usually the degeneracy has somehow been forced—so generically we only expect degeneracies if there are >1 dimensional irreps.

**Further reading:** Chapter 3 of the text, but this doesn't get into representation theory. See e.g. _Group Theory and Its Applications in Physics_ by Inui et al. (especially sections 4.1, 6.1, and 6.2) or _Group Theory and Quantum Mechanics_ by Michael Tinkham (especially sections 3-1 and 3-6), or any book with a similar title.


### Lecture 17: 15 Mar 2024

* notes from lecture 15.

Discuss character tables, as a systematic way to list and characterize (no pun intended) all possible irreps of a symmetry group.

Build the simple character table for the {E,σ} mirror-symmetry group, reprising the previous result that in mirror-symmetric systems we expect even/odd eigenfunctions, and we don't expect (non-accidental) degeneracies (unless there are additional symmetries).

Using the rules from the representation theory handout, we build up the character table for the symmetry group of the square (called _C_4v). Then, look at the eigenfunction solutions that we previously had for this case, and show how we could classify them into the various irreducible representations.

Looked at the projection operator (see handout) in more detail and gave some graphical examples of how we can use it to decompose a function into partner functions.

Used the projection operator to classify the modes of the square cavity, and in particular found that some of the modes are accidental degeneracies. In this way, we are able to find representatives of all five irreps. Conversely, by looking at the irreps, we can guess some of the types of eigenfunctions that should appear, inferring the sign pattern from the character table.

Showed how we can apply the projection operator to "random" functions to find partners of different irreps, even without an eigenproblem, and to "sketch" the qualitative features that we expect to find in the eigenfunctions. And, once we have partner functions, we can obtain representation matrices for each irrep (useful for 2+ dimensional irreps). As an example, looked at ψ(x,y)=1, x, and x2; found in particular that the 2d irrep transforms like {x,y}, i.e. the ordinary 2d rotation matrices.

**Further reading:**  Character tables for all of the common symmetry groups are tabulated in both textbooks and online, e.g. see this [page on the C4v group](http://symmetry.jacobs-university.de/cgi-bin/group.cgi?group=404&option=4). See Inui section 6.6 on projection operators.


### Lecture 18: 18 Mar 2024

* notes from lectures 14-15.

Used the projection operator to classify the modes of the square cavity, and in particular found that some of the modes are accidental degeneracies. In this way, we are able to find representatives of all five irreps. Conversely, by looking at the irreps, we can guess some of the types of eigenfunctions that should appear, inferring the sign pattern from the character table.

Discuss how rotational symmetries affect the dispersion relation: if R is a rotational symmetry, then ω(Rk)=ω(k).     For example, in band diagrams of 1d-periodic systems, this implies ω(k)=ω(-k)=ω(k+2π/a), and consequently ω(π/a-k)=ω(π/a+k) (i.e., ω is symmetric around both k=0 and k=π/a), and (except at crossings) we expect the bands to have zero slope at k=0 and k=π/a.

Considered the TM band diagram of the square lattice of rods. From the symmetry of the points between Γ and M or Γ and X, explained why we have degeneracies at Γ and M, zero group velocity at the Γ and X and M points except at degeneracies, and why the band extrema *usually* lie along the I.B.Z. boundaries.  Showed that Γ and M have the full symmetry of the lattice, whereas X has a reduced symmetry group, which is why we have non-accidental degeneracies at those points.

**Further reading:** Beginning of chapter 5 of the book (2d photonic crystals), and appendix B on the reciprocal lattice and Brillouin zone. See [this paper](http://arxiv.org/abs/math-ph/0702035) for some counterexamples and further discussion regarding the occurrence of band extrema at the edges of the I.B.Z.

### Lecture 19: 20 Mar 2024

* [handwritten notes from lecture 14: 2d periodicity](https://www.dropbox.com/scl/fi/6ajalyt9wr4tlp4hz3yll/2D-Periodic-Maxwell.pdf?rlkey=9014uzcxfsltxsy9dt6c2bval&dl=0)
* [slides on 2d gaps](notes/2d-gaps.pdf)

Influence of boundary conditions on TE vs TM gaps, and why TE gaps prefer "hole" (connected) structures to "rod" (disconnected) structures. Mentioned TE+TM gap in hexagonal lattice of rodes.

Discussed the more general definition of a Brillouin zone as a Wigner–Seitz/Voronoi cell in the reciprocal lattice.  As an example, considered the Brillouin zone and irreducible Brillouin zone of a hexagonal lattice.

Higher symmetry (Brillouin zones closer to circles/spheres) typically makes it easier to get a gap. (In 3d, the closest B.Z. to a sphere is from an fcc lattice, and most 3d gaps are in fcc-like structures.)

**Further reading:** Chapter 5 of the textbook.

### Lecture 20: 22 Mar 2024

* [pset 4 solutions](psets/pset4sol.pdf)
* [pset 5](psets/pset5.pdf): due Wed April 3

Point-defect states in the square lattice of rods. Either decreasing the radius of a rod to push up a "monopole" state, or increasing the radius of a rod to pull down a "dipole" state. Showed how we can easily predict the qualitative field patterns and symmetries from the corresponding bands of the bulk crystal. Related the defect modes to the 5 irreps of the C4v symmetry group, and showed how we can easily guess the field patterns and degeneracies that we will get.

Discussed waveguides and projected band diagrams formed by line defects and surfaces in 2d photonic crystals and gaps.

**Further reading:** Chapter 5 of the textbook.   A more precise analysis of defect "pushing up" or "pulling down" solutions in the gap can be obtained by the min–max theorem, similar to what we did for dielectric waveguides but with a shifted and squared operator, as discussed by [Parzygnat et al. (2010)](http://doi.org/10.1103/PhysRevB.81.155324).

### Lecture 21: 24 Mar 2024

* [computational photonics slides](http://math.mit.edu/~stevenj/18.369/Computation-18.369.pdf)

Began talking about computational electromagnetism: part 1, band diagrams and dispersion relations.

**Further reading:** The [MPB manual page](http://mpb.readthedocs.io/en/latest/), and Appendix D of the textbook (on numerical methods).


### Lecture 22: 3 Apr 2024

* [Jupyter notebook](https://nbviewer.jupyter.org/github/mitmath/18369/blob/master/notes/MPB-demo.ipynb); see also [the MPB home page](https://github.com/NanoComp/mpb) and documentation.  You can run this MPB notebook in the cloud: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mochen4/meepdocker/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fmitmath%252F18369%26urlpath%3Dtree%252F18369%252Fnotes%252FMPB-demo.ipynb%26branch%3Dmaster)
* [pset 5 solutions](psets/pset5sol.pdf)

Gave demo of MPB eigensolver software for 2d dielectric waveguide.  (If you installed Meep via the Anaconda Python packages, then you also have MPB.  You can also run it in the cloud via mybinder.)

**Further reading:** The [MPB manual page](http://mpb.readthedocs.io/en/latest/), and Appendix D of the textbook (on numerical methods).

### Lecture 23: 5 Apr 2024

* [computational photonics slides](http://math.mit.edu/~stevenj/18.369/Computation-18.369.pdf), continued.

Discussion of resonant modes, FDTD time-domain methods, and PML absorbing layers.

**Further reading** Textbook, appendix D. For FDTD in general, see e.g. Allen Taflove and Susan C. Hagness, _Computational Electrodynamics: The Finite-Difference Time-Domain Method_ (Artech, 2005). For the CFL condition in general, see e.g. this [book chapter by Trefethen](http://people.maths.ox.ac.uk/trefethen/4all.pdf). See also our [free FDTD software: Meep](https://github.com/NanoComp/meep), and in particular the introduction and tutorial sections of the Meep manual. [Notes on PML](notes/pml.pdf); see also e.g. the discussion of PML in Taflove's book.

### Lecture 24: 8 Apr 2024

* [computational photonics slides](http://math.mit.edu/~stevenj/18.369/Computation-18.369.pdf)

Discussed PML absorbing layers, began discussing principal of equivalence.

**Further reading** [Notes on PML](notes/pml.pdf); see also e.g. the discussion of PML in Taflove's book. [Notes on coordinate transforms in electromagnetism](notes/coordinate-transform.pdf); see also [slides on transformation optics](notes/transformation-slides.pdf).   See also the [Meep PML](https://meep.readthedocs.io/en/latest/Perfectly_Matched_Layer/) manual for some examples, caveats, and rules of thumb.   See the review article [Electromagnetic Wave Source Conditions](http://arxiv.org/abs/1301.5366), section 4.2, on equivalent currents.

### Take-home Midterm: April 9, 3pm

A take-home midterm exam will be posted **at 3pm** on Apr. 9, **due 3pm Apr. 10**, and will cover everything through **pset 5** and **Lecture 20**.  It will be designed to be do-able in 2 hours, but you can take as much time as you like.  The exam will be **open notes** but "closed internet" — you can **only use course materials** (the course textbooks, posted notes, pset solutions, and your own notes).

* [Midterm exam](psets/midterm.pdf) and [solutions](psets/midtermsol.pdf).

Previous midterms include:
[2006 midterm](https://math.mit.edu/~stevenj/18.369/fall05/midterm.pdf) (was way too long) and [solutions](https://math.mit.edu/~stevenj/18.325/pset5sol.pdf);
[2007 midterm](https://math.mit.edu/~stevenj/18.369/spring07/midterm.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring07/midterm-sol.pdf);
[2009 midterm](https://math.mit.edu/~stevenj/18.369/spring09/midterm09.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring09/midterm09-sol.pdf);
[2010 midterm](https://math.mit.edu/~stevenj/18.369/spring10/midterm-spring10.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring10/midtermsol-spring10.pdf);
[2012 midterm](https://math.mit.edu/~stevenj/18.369/spring12/midterm-spring12.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring12/midtermsol-spring12.pdf);
[2014 midterm](https://math.mit.edu/~stevenj/18.369/spring14/midterm14.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring14/midterm14sol.pdf);
[2016midterm](https://math.mit.edu/~stevenj/18.369/spring16/midterm16.pdf) and [solutions](https://math.mit.edu/~stevenj/18.369/spring16/midtermsol16.pdf) (also [problem 1 notebook](http://nbviewer.jupyter.org/url/math.mit.edu/~stevenj/18.369/midtermsol16.ipynb));
[2018 midterm](https://github.com/mitmath/18369/blob/spring18/exams/midterm18.pdf) and [solutions](https://github.com/mitmath/18369/blob/spring18/exams/midterm18sol.pdf)

### Lecture 25: 10 Apr 2024 (Dr. [Nick Rivera](https://scholar.harvard.edu/nrivera))

* [notes on radiation](notes/radiation.pdf)
* [slides on scintillation](notes/scintillation.pdf)

Radiation of electromagnetic waves by current sources. Green's functions and their eigenmode representation, and application to radiation by time-harmonic dipoles, moving charges, and fluctuating current sources. Purcell effect and Q/V enhancement, Cherenkov and Smith-Purcell radiation by free electrons, and fluctuational electrodynamics effects such as blackbody radiation. Discussed an example of radiation by fluctuating sources in the context of scintillators (slides), and the use of electromagnetic reciprocity to relate light emission to light in-coupling from the far field.

**Further reading**: See the review article ["Free-electron–light interactions in nanophotonics" (2023)](Free-electron–light interactions in nanophotonics).  The review [Electromagnetic wave source conditions (2013)](https://arxiv.org/abs/1301.5366) also discusses Purcell enhancement.

### Lecture 26: 12 Apr 2024

* [computational photonics slides](http://math.mit.edu/~stevenj/18.369/Computation-18.369.pdf)

Went over the Principle and Equivalence, mode sources, and integral-equation methods; see slides.

**Further reading:** See the review article[Electromagnetic Wave Source Conditions](http://arxiv.org/abs/1301.5366).  See also [SCUFF-EM](https://github.com/HomerReid/scuff-em), Homer Reid's free BEM code for electromagnetic scattering problems. See also this [SCUFF video tutorial](https://brown.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=a7449e51-2fe1-4d95-a53a-a9050106c542) (June 2018).     The Stanford [Spins code](https://nqp.stanford.edu/inverse-design-photonics) is software for topology optimization in photonics, and the [Meep adjoint solver](https://meep.readthedocs.io/en/latest/Python_Tutorials/AdjointSolver/) can also be used for topology optimization.

### Lecture 27: 17 Apr 2024

Discussed optimization problems in photonics from the computation slides — general overview of optimization problems/algorithms, topology optimization, and discussion of "adjoint" methods for computing gradients.

**Further reading:** There are many textbooks on [nonlinear optimization](http://www.athenasc.com/nonlinbook.html) algorithms of various sorts, including specialized books on [convex optimization](http://web.stanford.edu/~boyd/cvxbook/), [derivative-free optimization](http://bookstore.siam.org/mp08/), etcetera.  A useful review of inverse design in photonics is [Molesky et al. (2018)](https://www.nature.com/articles/s41566-018-0246-90), and of topology-optimization in particular by [Jensen and Sigmund (2010)](https://onlinelibrary.wiley.com/doi/10.1002/lpor.201000014) or [Christiansen and Sigmund (2020)](https://arxiv.org/abs/2008.11816).  Free software for inverse design includes the Stanford [SPINS-B code](https://github.com/stanfordnqp/spins-b), the [Meep adjoint solver](https://meep.readthedocs.io/en/latest/Python_Tutorials/AdjointSolver/) described in [Hammond et al. (2022)](http://doi.org/10.1364/OE.442074), the [FMMAX](https://github.com/facebookresearch/fmmax) and [grcwa](https://github.com/weiliangjinca/grcwa) differentiable scattering-matrix codes, and a growing list of other packages.

### Lecture 28: 19 Apr 2024

* [TCMT slides](notes/TCMT.pdf)

New topic: **temporal coupled-mode theory** (TCMT). Started with a canonical device, a waveguide-cavity-waveguide filter, and began to derive how the universal behavior of device in this class can be derived from very general principles such as conservation of energy, parameterized only by the (geometry-dependent) frequency and lifetime of the cavity mode.

(Recall that we had previously defined the **quality factor** Q of the cavity, which is simply a dimensionless lifetime Q=ω₀τ/2.)

Followed chapter 10 in the book to derive TCMT in the simple 2-port (port–cavity–port) case.

**Further reading:** Chapter 10 of the book and references therein.

### Lecture 29: 22 Apr 2024

More TCMT.  Discussed Q, and connection of 1/Q to fractional bandwidth.  Extensions of TCMT to include losses, nonlinearities, and various applications including channel drop filters [(Fan, 1998)](https://opg.optica.org/oe/fulltext.cfm?uri=oe-3-1-4&id=63297) and optical bistability [(Soljacic, 2002)](http://doi.org/10.1103/PhysRevE.66.055601).
