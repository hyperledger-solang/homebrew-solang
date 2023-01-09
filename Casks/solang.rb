cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "3aca655fcbb157dc67df3ab7c1c04c8faaa9b8578f59b72b77c69f5481ec288f"
    else
        sha256 "7b959eb158f6cefb313fef566693a70faaa50502c4d81d006484bda011f6ef52"
    end

    version "0.2.1"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
