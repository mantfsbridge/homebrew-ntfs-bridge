cask "ntfsbridge" do
  version "1.0.0"
  sha256 "f9424302b6d5be3f2b23c852c627649eefe2f19e9e4ea86026fa094fe6d7d1bd"

  url "https://github.com/mantfsbridge/ntfs-bridge-releases/releases/download/v#{version}/NTFSBridge-#{version}.dmg",
      verified: "github.com/mantfsbridge/ntfs-bridge-releases/"
  name "NTFS Bridge"
  desc "Read and write NTFS drives on Apple Silicon Macs"
  homepage "https://ntfsbridge.app/"

  livecheck do
    url "https://ntfsbridge.app/appcast.xml"
    strategy :sparkle
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NTFSBridge.app"

  uninstall launchctl: "com.macntfsbridge.NTFSBridge.helper"

  zap trash: [
    "~/Library/Application Support/MacNTFSBridge",
    "~/Library/Caches/com.macntfsbridge.NTFSBridge",
    "~/Library/Preferences/com.macntfsbridge.NTFSBridge.plist",
  ]
end
