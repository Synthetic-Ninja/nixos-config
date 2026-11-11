{ ... }:
{
  # UTM -> Sharing -> VirtFS; mount tag is always "share".
  # If no directory is configured in UTM, nofail avoids a fatal boot failure.
  fileSystems."/mnt/shared" = {
    device = "share";
    fsType = "9p";
    options = [
      "trans=virtio"
      "version=9p2000.L"
      "rw"
      "_netdev"
      "nofail"
    ];
  };
}
