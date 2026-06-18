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
    typescript-language-server
    typescript
    llvmPackages_latest.clang
    python3
  ];

}
