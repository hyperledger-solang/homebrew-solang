cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "4eb9967462535a1f001b8018750b766f6242f3ec82add79c55ec7c93294e285d"
    else
        sha256 "03405a02106e2bc616aeec6313702d63c0228356c63f86d2a336cc25349c5cc9"
    end

    version "0.3.3"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
