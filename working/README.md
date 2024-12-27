# Example VMs

## Description
This repo contains some example VMs which cannot shared outside the company.

### windows-boot-sources.yaml

This is an example how to populate the default boot sources for Windows 10 and Windows 11.

### windows11.yaml

This is an example VM booting from a generalized golden image, and using
`Unattend.xml` to provide the input for the Out of Box Experience (OOBE) wizard
during the first boot. The boot disk is cloned from the PVC created by
`windows-boot-sources.yaml`, to enable the VM to be created quickly.


### windows10.yaml and windows11-legacy.yaml

This is an example VM booting from a generalized golden image, and using
`Unattend.xml` to provide the input for the Out of Box Experience (OOBE) wizard
during the first boot. The boot disk is created from the containerdisk, and
instancetypes and perferences are not used. This way these two files can be used
as an example on OpenShift Virtualization < 4.14 .

### windows11-installer.yaml

This is an example to install Windows 11. The input for the Windows installer is
provided by the embedded `autounattend.xml`.

> **Note**
> Please note that the first boot of the Windows 11 ISO requires pressing a key
> manually. For a completely automatic installation, additional automation like
> the [OpenShift Virtualization Windows UEFI installer](https://artifacthub.io/packages/tekton-pipeline/redhat-pipelines/windows-efi-installer) is required.


### legacy.yaml

This is an example how to run an unsupported legacy guest like Windows XP.
Please find more information in https://issues.redhat.com/browse/CNV-46822 .
This example requires a sidecar, which has to be enabled by
```
oc annotate --overwrite -n openshift-cnv hco kubevirt-hyperconverged kubevirt.kubevirt.io/jsonpatch='[{"op": "add", "path": "/spec/configuration/developerConfiguration/featureGates/-", "value": "Sidecar" }]'
```

## Usage
```
git clone https://gitlab.cee.redhat.com/dholler/example-vms.git
cd example-vms
oc apply -f windows-boot-sources.yaml
oc apply -f windows11.yaml
```
