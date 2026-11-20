cask "ntfsbridge" do
  version "1.0.0"
  sha256 "5ab616c6632d925808cb4ce6edf74a6ca481b358c5bfc27eed1c728478bbd87e"

  url "https://github.com/apneastallion/ntfs-bridge/releases/download/v#{version}/NTFSBridge-#{version}.dmg",
      verified: "github.com/apneastallion/ntfs-bridge/"
  name "NTFS Bridge"
  desc "Read and write NTFS drives on Apple Silicon Macs"
  homepage "https://ntfsbridge.app/"

  livecheck do
    url "https://ntfsbridge.app/appcast.xml"
    strategy :sparkle
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "NTFSBridge.app"

  uninstall launchctl: "com.macntfsbridge.NTFSBridge.helper"

  zap trash: [
    "~/Library/Application Support/MacNTFSBridge",
    "~/Library/Caches/com.macntfsbridge.NTFSBridge",
    "~/Library/Preferences/com.macntfsbridge.NTFSBridge.plist",
  ]
end
