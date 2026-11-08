cask "mint" do
  version "1.2.0"
  sha256 "3ca6c1a9a7e9f4c4fd5768e9d966fc9fbfe1b4cfd903b59510077c14ea4af5ae"

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
