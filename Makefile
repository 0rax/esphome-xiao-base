NAME	:= esphome-xiao-base
GITROOT	:= $(shell git rev-parse --show-toplevel)
KIBOT	:= $(GITROOT)/.kibot/bin/kibot

default: clean pcb step

test:
	$(info + [$(NAME)] $@)
	$(KIBOT) -c .kibot/test.kibot.yaml -b ./pcb/pcb.kicad_pcb

export: pcb

pcb:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/pcb
	$(KIBOT) -c .kibot/pcb.kibot.yaml  -b ./pcb/pcb.kicad_pcb

step:
	$(info + [$(NAME)] $@)
	mkdir -p ./output/step
	$(KIBOT) -c .kibot/pcb.kibot.yaml  -d output -b ./pcb/pcb.kicad_pcb 3d_step

clean:
	$(info + [$(NAME)] $@)
	rm -rf output/pcb output/step

.PHONY: default test export pcb clean
