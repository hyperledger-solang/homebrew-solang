cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "6ffb0426656d8d78672ce9121787b8ba99ba5f8010081357eefcb2166541c15a"
    else
        sha256 "7d9024751bf1450234cb44f6a58f02190b44548634735c799c3facbc5850c0e5"
    end

    version "0.1.13"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
