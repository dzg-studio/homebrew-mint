cask "mint" do
  version "1.0.10"
  sha256 "c08eb264db9ba02c9743685d33a5f028248d16dbe51c61dee962851bdc565049"

  url "https://github.com/dzg-studio/mint-releases/releases/download/v#{version}/Mint-#{version}-macOS.dmg",
      verified: "github.com/dzg-studio/mint-releases/"
  name "Mint"
  desc "On-device cleanup and file organizer"
  homepage "https://mint.dzgapp.com/"

  livecheck do
    url "https://mint.dzgapp.com/appcast.xml"
    regex(%r{<sparkle:shortVersionString>(\d+(?:\.\d+)+)</sparkle:shortVersionString>}i)
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Mint.app"
  binary "#{appdir}/Mint.app/Contents/Resources/mint-cli", target: "mint-cli"

  zap trash: [
    "~/Library/Application Support/Mint",
    "~/Library/Caches/com.mint.app",
    "~/Library/HTTPStorages/com.mint.app",
    "~/Library/Preferences/com.mint.app.plist",
    "~/Library/Saved Application State/com.mint.app.savedState",
  ]
end
