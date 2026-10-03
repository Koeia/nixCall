{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    gcc
    llvmPackages_latest.clang
    lua-language-server
    nil
    nixd
    nodejs
    python3
    typescript
    typescript-language-server
  ];

}
