#
#
#

all: hull-test-model.obj hull-test-collision-object.obj

hull-test-model.stl: hull-test-model.scad
	openscad -o $@ $^

hull-test-model.obj: hull-test-model.stl
	- ivcon $^ $@


hull-test-a.stl: hull-test-a.scad
	openscad -o $@ $^

hull-test-a.obj: hull-test-a.stl
	- ivcon $^ $@

hull-test-b.stl: hull-test-b.scad
	openscad -o $@ $^

hull-test-b.obj: hull-test-b.stl
	- ivcon $^ $@

hull-test-c.stl: hull-test-c.scad
	openscad -o $@ $^

hull-test-c.obj: hull-test-c.stl
	- ivcon $^ $@


hull-test-collision-object.obj: hull-test-a.obj hull-test-b.obj hull-test-c.obj
	# see https://github.com/sethalves/wavefront-obj-tools
	wavefront-obj-tool -c -n $^ > $@


dist: all
	scp hull-test-collision-object.obj hull-test-model.obj headache:public_html/hifi/


clean:
	rm -f *~
	rm -f hull-test-model.obj hull-test-model.stl
	rm -f hull-test-a.obj hull-test-a.stl
	rm -f hull-test-b.obj hull-test-b.stl
	rm -f hull-test-c.obj hull-test-c.stl
	rm -f hull-test-collision-object.obj
