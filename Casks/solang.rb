cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "688d31f309b4a5901e7b28f2da5b10c66a111f68646582b971815f8dcd32cfc7"
    else
        sha256 "8a4f31b07214e2bc3afe7d9d39151324974dfaaa586240210ccfec4d15b18edb"
    end

    version "0.3.2"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
