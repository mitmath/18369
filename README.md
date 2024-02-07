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

**Lectures**: Mon/Wed/Fri 2pm (2-131). **Office Hours:** TBA. TA/grader: TBA.

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
