gstreamer-audio-playback
========================
Sample code for playing _.wav_ or _.mp3_ audio files using Gstreamer.

Please refer the Gstreamer Application Development Manual at the below link before proceeding further:
http://gstreamer.freedesktop.org/data/doc/gstreamer/head/manual/html/index.html

Comprehensive documentation for Gstreamer: http://gstreamer.freedesktop.org/documentation/

One need to install the Open Embedded aka Yocto Project SDK in oreder to cross-compile the project.
Instructions related to building SDK are avilable in this developer article: http://developer.toradex.com/knowledge-base/linux-sdks

NOTE: Depending on the SDK path installed on development machine one will need
to change the paths in Makefile accordingly. By default the paths are set to default
SDK installation path.
e.g.: /usr/local/oecore-x86_64/

The following elements/plugins/packages are expected to be in the module image for this to work
_gstreamer
gst-plugins-base
gst-plugins-good-wavparse
gst-plugins-good-alsa
gst-plugins-good-audioconvert
gst-plugins-ugly-mad_

Pipeline to play .wav audio file from command line:
gst-launch filesrc location="location of file" ! wavparse ! alsasink 

Pipeline to play .mp3 audio file from command line:
_gst-launch filesrc location="location of file" ! mad ! audioconvert ! alsasink_

_Please note that the above pipelines are meant to be used on Colibri Vybrid VF50/VF61_

It is also assumed that the USB to Audio device is the only audio device being used on the system,
if not the  "device" parameter for alsasink will change and the parameter to be used needs to be
checked with cat /proc/asound/cards, which then needs to be set as follows:

Pipeline to play .wav audio file from command line: 

_gst-launch filesrc location="location of file" ! wavparse ! alsasink device=hw:1,0_

Pipeline to play .mp3 audio file from command line:
_gst-launch filesrc location="location of file" ! mad ! audioconvert ! alsasink device=hw:1,0_

In code initialisation in init_audio_playback_pipeline
_g_object_set (G_OBJECT (data->alsasink), "device", "hw:0,0", NULL);_
							OR
_g_object_set (G_OBJECT (data->alsasink), "device", "hw:1,0", NULL);_

The pipeline will ideally remain the same for a different audio device, only the device parameter for alsasink will change.

For gstreamer audio pipelines on other Apalis/Colibri modules refer the below link
http://developer.toradex.com/knowledge-base/audio-%28linux%29
