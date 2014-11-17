NVCC= nvcc
ARCH= -arch=sm_30
OPT= -O3

INCLUDE=./include
VERBOSE=-lineinfo --ptxas-options=-v
VERBOSE=

all: clean GPU-DTW GPU-LDTW GPU-ED

clean:
	-rm bin/*

GPU-DTW: GPU-dtw.cu $(INCLUDE)/cdtw.cuh $(BOILERPLATE)
	$(NVCC) $(OPT) $(ARCH) GPU-dtw.cu -o bin/GPU-DTW $(VERBOSE)

GPU-LDTW: GPU-ldtw.cu $(INCLUDE)/ldtw.cuh $(BOILERPLATE)
	$(NVCC) $(OPT) $(ARCH) GPU-ldtw.cu -o bin/GPU-LDTW $(VERBOSE)

GPU-ED: GPU-ed.cu $(INCLUDE)/ed.cuh $(BOILERPLATE)
	$(NVCC) $(OPT) $(ARCH) GPU-ed.cu -o bin/GPU-ED -lcufft $(VERBOSE)


# you can find the files in the test folder
#test_dtw: test_dtw.cu
#	$(NVCC) $(OPT) $(ARCH) test_dtw.cu -o test_dtw $(VERBOSE) -Xcompiler -fopenmp

#test_dtwbounds: test_dtwbounds.cu
#	$(NVCC) $(OPT) $(ARCH) test_dtwbounds.cu -o test_dtwbounds $(VERBOSE)
