CLOUDIMG_DESTINATION_DIRECTORY="/tmp/cloudinit_img"
VM_STORAGE_LOCATION="data0"
VM_MEMORY=2048
VM_CORES=2
VM_SOCKETS=1

echo "NOTICE: download iso"
mkdir -p $CLOUDIMG_DESTINATION_DIRECTORY
wget -O $CLOUDIMG_DESTINATION_DIRECTORY/$VM_NAME.img $CLOUDIMG_SOURCE_URL

echo "NOTICE: create vm"
qm create $VM_ID \
  -name "$VM_NAME" \
  -memory $VM_MEMORY \
  -net0 virtio,bridge=vmbr0 \
  -cores $VM_CORES \
  -sockets $VM_SOCKETS \
  -cpu cputype=kvm64 \
  -kvm 1 \
  -numa 1 \
  -onboot 1 \
  -hotplug disk,network,usb,memory,cpu
  
echo "NOTICE: import disk to vm $VM_ID"
qm importdisk $VM_ID "$CLOUDIMG_DESTINATION_DIRECTORY/$VM_NAME.img" "$VM_STORAGE_LOCATION"

echo "NOTICE: set main disk to vm"
qm set $VM_ID \
  -scsihw virtio-scsi-pci \
  -scsi0 "$VM_STORAGE_LOCATION":$VM_ID/vm-$VM_ID-disk-0.raw

echo "NOTICE: set cloud-init device to vm"
qm set $VM_ID \
  -ide2 "$VM_STORAGE_LOCATION":cloudinit \
  -serial0 socket \
  -vga serial0

echo "NOTICE: set vm boot to main disk"
qm set $VM_ID \
  -boot c \
  -bootdisk scsi0

echo "NOTICE: convert vm to template"
qm template $VM_ID

echo "NOTICE: removing downloaded image"
rm "$CLOUDIMG_DESTINATION_DIRECTORY/$VM_NAME.img"