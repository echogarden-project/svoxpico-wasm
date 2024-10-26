PROJ=svoxpico

EMCCFLAGS=-s ALLOW_MEMORY_GROWTH=1 -D linux -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_pico_initialize', '_pico_terminate','_pico_getSystemStatusMessage','_pico_getNrSystemWarnings','_pico_getSystemWarning','_pico_loadResource','_pico_unloadResource','_pico_getResourceName','_pico_createVoiceDefinition','_pico_addResourceToVoiceDefinition','_pico_releaseVoiceDefinition','_pico_newEngine','_pico_disposeEngine','_pico_putTextUtf8','_pico_getData','_pico_resetEngine','_pico_getEngineStatusMessage','_pico_getNrEngineWarnings','_pico_getEngineWarning', '_picoext_setTraceLevel']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap', 'FS']" -s MODULARIZE=1 -s EXPORT_ES6=1 -s EXPORT_NAME="SvoxPico"

all: src/picoapi.c src/picoacph.c src/picobase.c src/picocep.c src/picoctrl.c src/picodata.c src/picodbg.c src/picoextapi.c src/picofftsg.c src/picokdbg.c src/picokdt.c src/picokfst.c src/picoklex.c src/picoknow.c src/picokpdf.c src/picokpr.c src/picoktab.c src/picoos.c src/picopal.c src/picopam.c src/picopr.c src/picorsrc.c src/picosa.c src/picosig.c src/picosig2.c src/picospho.c src/picotok.c src/picotrns.c src/picowa.c
	emcc $(EMCCFLAGS) -O0 -include src/picoapi.h -include src/picodata.h -o $(PROJ).js -I src $^

.PHONY: clean
clean:
	rm -f $(PROJ).js $(PROJ).wasm
