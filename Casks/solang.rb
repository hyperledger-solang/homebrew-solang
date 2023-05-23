cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "79d205de600d5a1bd6720aa4d38d766bd0782d55551e54874ebab36afd024fe0"
    else
        sha256 "f599e8b389e68c3f65d95610a33ccc33ab5c3c30fab9536015be9415da1b3193"
    end

    version "0.3.0"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
