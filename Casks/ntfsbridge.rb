cask "ntfsbridge" do
  version "1.0.0"
  sha256 "2aaf5177388e3cee4bc2d2ec412e96f6cb375467281315db2b2f5290f47390f8"

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
