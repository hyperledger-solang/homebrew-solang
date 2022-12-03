cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "a2ef1747351b8077c1da91f88b732261b0b35e8b771afd03ad5a016d36f76a81"
    else
        sha256 "94dc0a711db8d151fcee74240a8ba699dbb52ac5ea46dfd546eece791af0656b"
    end

    version "0.2.0"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
