cask "ntfsbridge" do
  version "1.0.7"
  sha256 "17b103cb47f1e470040bb6598d13a2b452787169c904a463364c6ba41cdca9e5"

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
