cask "mint" do
  version "1.2.4"
  sha256 "b463e56ef7b068dec420358ceb231bee579baf891ea7dd9b44772d56db2054dd"

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
