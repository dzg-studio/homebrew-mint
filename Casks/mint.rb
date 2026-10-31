cask "mint" do
  version "1.1.2"
  sha256 "1d92a25d7cbbde9403e37527bd3789fd41a2ca7e3d9ac4e508e675769125636a"

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
