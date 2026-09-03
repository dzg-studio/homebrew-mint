cask "mint" do
  version "1.0.25"
  sha256 "3d34e5262bc03eebdfcfd17c9c0e1297c70fdf5cc1d316dd3fa4779dca0ffdbb"

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
