cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "9c53033df14622f0589b19f6731803bd76b8fd3a455bdd4449c1cf71a63bf09c"
    else
        sha256 "e7be5d2e369d5c3cfd6635dc6f3f52a1e8277c2d0c00788cb3e9af698c49b938"
    end

    version "0.1.12"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana, Substrate, and ewasm"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
