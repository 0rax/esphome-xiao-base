NAME	:= esphome-xiao-base
GITROOT	:= $(shell git rev-parse --show-toplevel)
KIBOT	:= $(GITROOT)/.kibot/bin/kibot

default: clean pcb addons step

test:
	$(info + [$(NAME)] $@)
	$(KIBOT) -c .kibot/test.kibot.yaml -b ./pcb/pcb.kicad_pcb

export: pcb addons

pcb:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/pcb
	$(KIBOT) -c .kibot/pcb.kibot.yaml -d output/pcb -b ./pcb/pcb.kicad_pcb

addons: aqstation sensorboard

aqstation:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/addons/aqstation
	$(KIBOT) -c .kibot/pcb.kibot.yaml -d output/addons/aqstation -b ./addons/aqstation/aqstation.kicad_pcb

sensorboard:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/addons/sensorboard
	$(KIBOT) -c .kibot/pcb.kibot.yaml -d output/addons/sensorboard -b ./addons/sensorboard/sensorboard.kicad_pcb

step:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/step
	$(KIBOT) -c .kibot/pcb.kibot.yaml -d output -b ./pcb/pcb.kicad_pcb 3d_step

clean:
	$(info + [$(NAME)] $@)
	rm -rf output/pcb output/addons/aqstation output/addons/sensorboard output/step

.PHONY: default test export pcb addons aqstation sensorboard step clean
