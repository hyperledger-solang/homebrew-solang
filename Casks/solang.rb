cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "779b5373736eb61ba1c4358d2fae2251b39fd5f3e4e0c13a6ea5f655732213d5"
    else
        sha256 "c94c58ceb46bec575246cb11fb1d2ca305ef93954d0a2d81f4ef5a472264732b"
    end

    version "0.2.3"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
