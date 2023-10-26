cask "solang" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "79faf95812c29644f3c77f531e5495277d55af05d2ff48208a4821e6eecd8c39"
    else
        sha256 "fd2a9ddacc7e1beddf7c06f523ac7100d1acc274241c4738dbfcdf819b7c0dc0"
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
