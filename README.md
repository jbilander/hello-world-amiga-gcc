# hello-world-amiga-gcc
Amiga Hello World with Bebbo's amiga-gcc 13

<a href="pics/visual-code-amiga-gcc.jpg">
<img src="pics/visual-code-amiga-gcc.jpg" width="600" height="411">
</a>

Steps I did to build amiga-gcc with gcc 13:

Deleted old stuff:

    rm -rf /opt/amiga
    cd /home/jbilander/Projects
    rm -rf ./amiga-gcc

and clone and build:

    git clone https://github.com/bebbo/amiga-gcc
    cd amiga-gcc
    make update
    make clean
    make branch branch=amiga13.1 mod=gcc
    make all NDK=3.2 -j2
