cask "brew-browser-native" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   :no_check,
         intel: :no_check

  url "https://github.com/msitarzewski/brew-browser/releases/download/v0.6.0/BrewBrowser-#{version}-#{arch}.dmg",
      verified: "github.com/msitarzewski/brew-browser/"
  name "Brew Browser"
  desc "Native SwiftUI GUI for Homebrew"
  homepage "https://github.com/msitarzewski/brew-browser"

  livecheck do
    url "https://github.com/msitarzewski/brew-browser/releases/latest"
    regex(/native[^\d]+(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Brew Browser.app"

  zap trash: [
    "~/Library/Application Support/brew-browser",
    "~/Library/Caches/com.zerologic.brew-browser-native",
    "~/Library/Preferences/com.zerologic.brew-browser-native.plist",
    "~/Library/Saved Application State/com.zerologic.brew-browser-native.savedState",
  ]
end
