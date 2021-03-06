OPENCV3FLAGS=`pkg-config --cflags opencv3`
OPENCV3LIBS=`pkg-config --libs opencv3`
OPENCV2FLAGS=`pkg-config --cflags opencv`
OPENCV2LIBS=`pkg-config --libs opencv`
SOURCES=stereo/stereo_v2.cpp stereo_v3.cpp canny/canny.cpp edgesToPng/transpTest.cpp calibration/correctImage.cpp
BINS=stereo2 stereo3 canny transpTest correctImage
BINDIR=bin
CFLAGS=-lstdc++ -w -O3
CXX_COMPILER=gcc

.PHONY: stereo2 stereo3 canny transpTest correctImage

all: stereo2 stereo3 canny transpTest correctImage

stereo2: $(BINDIR)/stereo2

stereo3: $(BINDIR)/stereo3

canny: $(BINDIR)/canny

transpTest: $(BINDIR)/transpTest

correctImage: $(BINDIR)/correctImage


$(BINDIR)/stereo2: stereo/stereo_v2.cpp
	$(CXX_COMPILER) -o $(BINDIR)/stereo2 ${OPENCV2FLAGS} ${OPENCV2LIBS} $(CFLAGS) $<
$(BINDIR)/stereo3: stereo/stereo_v3.cpp
	$(CXX_COMPILER) -o $(BINDIR)/stereo3 ${OPENCV3FLAGS} ${OPENCV3LIBS} $(CFLAGS) $<
$(BINDIR)/canny: canny/canny.cpp
	$(CXX_COMPILER) -o $(BINDIR)/canny ${OPENCV3FLAGS} ${OPENCV3LIBS} $(CFLAGS) $<
$(BINDIR)/transpTest: edgesToPng/transpTest.cpp
	$(CXX_COMPILER) -o $(BINDIR)/transpTest ${OPENCV2FLAGS} ${OPENCV2LIBS} $(CFLAGS) $<
$(BINDIR)/correctImage: calibration/correctImage.cpp
	$(CXX_COMPILER) -o $(BINDIR)/correctImage ${OPENCV3FLAGS} ${OPENCV3LIBS} $(CFLAGS) $<
clean:
	$(RM) $(addprefix $(BINDIR)/, $(BINS))
