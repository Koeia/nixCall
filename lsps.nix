{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    gcc
    nil
    nixd
    nodejs
    lua-language-server
    llvmPackages_latest.clang
  ];

}
