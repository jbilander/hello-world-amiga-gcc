# hello-world-amiga-gcc
Amiga Hello World with Bebbo's amiga-gcc

![hello-world-amiga-gcc](https://github.com/jbilander/hello-world-amiga-gcc/assets/1673918/7c1ad178-1c0b-4311-b57e-7703e16a6031)


![HelloWorldWB13](https://github.com/jbilander/hello-world-amiga-gcc/assets/1673918/1e0195c0-c0cb-4516-bd76-dc401b6460af)


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
