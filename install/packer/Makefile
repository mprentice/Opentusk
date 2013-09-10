osvendor=centos
osversion=5
osarch=x64
osflavor=$(osvendor)-$(osversion)_$(osarch)
vboxname=tusk-$(osflavor)

jsonfile=$(osflavor)-vagrant-vbox.json

ksfile=www/$(osflavor)-vagrant-vbox-ks.cfg

provfiles=provisioners/$(osflavor)/install-vbox-guest-additions.sh provisioners/$(osflavor)/install-packages.sh provisioners/$(osflavor)/clean-empty-space.sh provisioners/$(osflavor)/vagrant.sh

all: $(vboxname)-vagrant-vbox.box

$(vboxname)-vagrant-vbox.box: $(jsonfile) $(ksfile) $(provfiles)
	packer build $(jsonfile)

clean:
	VBoxManage controlvm $(vboxname) poweroff || true
	sleep 2
	VBoxManage unregistervm $(vboxname) || true
	sleep 2
	rm -rf output-* || true
	rm -rf "$(HOME)/VirtualBox VMs/$(vboxname)" || true
	rm -f $(vboxname)-vagrant-vbox.box || true
	sed -i".bak" '/$(vboxname)/d' "$(HOME)/Library/VirtualBox/VirtualBox.xml"
