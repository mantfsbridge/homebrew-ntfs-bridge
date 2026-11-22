cask "ntfsbridge" do
  version "1.0.0"
  sha256 "1ba4eac46be251f1e414aa470df07e8f81863e8fd637da523b65f8b103e004d0"

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

  app "NTFS Bridge.app"

  uninstall launchctl: "com.macntfsbridge.NTFSBridge.helper"

  zap trash: [
    "~/Library/Application Support/MacNTFSBridge",
    "~/Library/Caches/com.macntfsbridge.NTFSBridge",
    "~/Library/Preferences/com.macntfsbridge.NTFSBridge.plist",
  ]
end
