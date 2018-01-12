# MiniOctBem
A small, simple boundary element code for octave. The code was written as a blueprint for exercise classes of a summer school. 
It is based on an indirect single layer approach and supports both a collocation and a Galerkin approach.

**Why share this Code?**
This code is not really deep. It is actually quite simple. This is indeed by design: It was first implemented as a blueprint for programming exercises as part of a summer school, see
http://dasfoundation.md/en/2017/04/25/summer-sun-and-studying-the-jyvaskyla-summer-school-2017/, COM1.

I often hear of interesting topics regarding boundary element methods (i.e. specific couplings, preconditioning, refinement strategies, simulation of exterior problems in engineering etc.) that could easily be turned into an interesting thesis or project. However, if the student in question is not already familiar with the concept of BEM, the initial hurdle is quite high. 
Thus, supervisors often are hesitant to hand out topics related to boundary element methods.
This code might, in some cases, fix this issue: It is small enough to know every routine by heart after a short study of the sources and simple enough to start experimenting right away.
Also: It is standalone in nature, thus not relying on external libraries. 

Maybe, this code might enable someone to start a thesis, which otherwise might not be feasible w.r.t. to the time required by, for example, getting to know more extensive BEM codes, i.e. (BEM++, BETL, ...); or to start with a blank slate and cover the basics.

**If you use this code**
let me know. It might make my day. Also, if you add stuff, let me know. I will check it out, and if it satisfies the requirements I have for this code, i.e.,
* Its simple to understand,
* It does not rely on external libraries,
* It can be open sourced and put up here,
i will add it.

I will soon add a .tex file and .pdf of a small documentation, with suitable references to the established literature. If you use this code, that can also be used as a citation.    
