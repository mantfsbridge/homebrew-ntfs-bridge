cask "ntfsbridge" do
  version "1.0.0"
  sha256 "dd1577bfe752010be39fa99ceee8c4229df944f8dccc05de86c22ce8713b9801"

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
