FROM qspack/u1604-base

RUN /usr/local/src/spack/bin/spack install openmpi
RUN echo "PATH=\${PATH}:$(/usr/local/src/spack/bin/spack location --install-dir openmpi)/bin" |tee -a /etc/spack.env 
COPY src/hello_mpi.c src/ring.c /usr/local/src/mpi/
RUN . /etc/spack.env \
 && mpicc -o /usr/local/bin/hello /usr/local/src/mpi/hello_mpi.c \
 && mpicc -o /usr/local/bin/ring /usr/local/src/mpi/ring.c
