**Can I use FortranCL to run my Fortran code on a GPU?**

Yes, you just need FortranCL and a OpenCL capable GPU (for example a recent graphics card from AMD or Nvidia).

**Do I need a GPU to use FortranCL?**

No. There are OpenCL implementations that can run on CPUs like the ones from AMD, Intel or IBM.

**Is FortranCL the "official" interface of OpenCL for Fortran?**

No. FortranCL is an independent effort and is not endorsed in any way by the Khronos group or other institution related to OpenCL or Fortran.

**Does FortranCL use the Fortran 2003 C interoperability features?**

No. FortranCL aims to work with all Fortran compilers and Fortran 2003 is not widely implemented yet, we prefer to stay with Fortran 90. For users this is not a disadvantage, since FortranCL offers a native Fortran interface.

**Which Fortran compilers are supported by Fortran 90?**

In principle, FortranCL should work with any Fortran 90 compiler. It is mainly tested with GNU gfortran and the Intel Fortran compiler. If you find issues with any compiler, please let us know.

**Which OpenCL implementations are supported?**

Since OpenCL is a standard, FortranCL should work with all implementations. For the moment it has been tested with Nvidia (GPU) and AMD OpenCL (GPU and CPU) implementations.

**What do I need to compile FortranCL?**

You need a C compiler and a Fortran compiler. The Fortran compiler must be the same you will use to compile your application. You cannot mix Fortran compilers. You also need an OpenCL implementation for your hardware. You can use a single compilation with different OpenCL implementations.

**How do I compile FortranCL?**

The compilation is based on the GNU Autotools, so it is fairly standard. It can be as simple as `./configure; make; make install`. However, you might need to specify your Fortran compiler and flags with the `FC` and `FCFLAGS` variables and the desired installation path with the `--prefix` configure flag. Check the `README` and `INSTALL` files in the distribution tarball for details.

**How do I compile a program that uses FortranCL?**

When you compile you need to specify the location of the FortranCL module. In many compilers this is done with the `-I` flag. When linking you need to specify the location of the library (with the `-L` flag) and `-lfortrancl -lOpenCL`. For example this is the line you need to compile a single file FortranCL program with Gfortran:
```
gfortran -I<fortrancl_prefix>/include program.f90 -o program -L<fortrancl_prefix>/lib -lfortrancl -lOpenCL
```
Where we assume that FortranCL was installed in `<fortrancl_prefix>`.