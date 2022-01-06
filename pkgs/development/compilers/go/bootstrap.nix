{ callPackage }:
callPackage ./binary.nix {
  version = "1.17.5";
  hashes = {
    # Use `print-hashes.sh ${version}` to generate the list below
    darwin-amd64 = "2db6a5d25815b56072465a2cacc8ed426c18f1d5fc26c1fc8c4f5a7188658264";
    darwin-arm64 = "111f71166de0cb8089bb3e8f9f5b02d76e1bf1309256824d4062a47b0e5f98e0";
    linux-386 = "4f4914303bc18f24fd137a97e595735308f5ce81323c7224c12466fd763fc59f";
    linux-amd64 = "bd78114b0d441b029c8fe0341f4910370925a4d270a6a590668840675b0c653e";
    linux-arm64 = "6f95ce3da40d9ce1355e48f31f4eb6508382415ca4d7413b1e7a3314e6430e7e";
    linux-armv6l = "aa1fb6c53b4fe72f159333362a10aca37ae938bde8adc9c6eaf2a8e87d1e47de";
    linux-ppc64le = "3d4be616e568f0a02cb7f7769bcaafda4b0969ed0f9bb4277619930b96847e70";
    linux-s390x = "8087d4fe991e82804e6485c26568c2e0ee0bfde00ceb9015dc86cb6bf84ef40b";
  };
}
