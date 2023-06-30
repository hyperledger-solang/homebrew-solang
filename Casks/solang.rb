cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "3170a95ce507aa430c44c1bf0358931b7881211d48b48d04adea940ade836d97"
    else
        sha256 "8b3b7180be26ad6ec0e1a5e5d8506950c266279263dcdcdb75bc5df3e91ad119"
    end

    version "0.3.1"
    url "https://github.com/hyperledger/solang/releases/download/v#{version}/solang-mac-#{arch}"
    name "Solang"
    desc "Solidity Compiler for Solana and Substrate"
    homepage "https://solang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/solang-mac-#{arch}"
    end

    binary "solang-mac-#{arch}", target: "solang"

end
