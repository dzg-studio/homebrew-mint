cask "mint" do
  version "1.1.1"
  sha256 "4bc2c5784a6c8406930d5eddde37651a649fcd803c7c175bfcb54896119ae15a"

  url "https://github.com/dzg-studio/mint-releases/releases/download/v#{version}/Mint-#{version}-macOS.dmg"
  name "Mint"
  desc "On-device cleanup and file organizer"
  homepage "https://mintstorage.app/"

  livecheck do
    url "https://mint.dzgapp.com/appcast-paid.xml"
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
