# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix

      ./bootloader.nix
    ];


  networking.hostName = "navireborn"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # LUKS on LVM
  boot.initrd.luks.devices.crypted.device = "/dev/sda2";
  
  # Filesystem mounts
  fileSystems."/".device = pkgs.lib.mkForce "/dev/mapper/vg1-root";
  fileSystems."/home".device = pkgs.lib.mkForce "/dev/mapper/vg1-home";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/New_York";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    curl
    emacs
    feh
    git
    google-chrome
    gnumake
    htop
    inkscape
    libreoffice
    krita
    mkpasswd
    mpv
    rsync
    screenfetch
    steam
    tomahawk
    unzip
    weechat
    wget
  ];

  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.xkbOptions = "eurosign:e";

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.mutableUsers = false;
  users.extraUsers.stephen = {
    hashedPassword = "$6$.3Pw5OVF44wwCp$mZAYsZMIaaYpDbY/yrguHbl9hG7aCEuTHSAT4Jc.QzU4UZ50u9Eu5XnzNSeyvIcBADBVvegdmvbqnbyR5462V1";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    uid = 1000;
    shell = pkgs.zsh;
  };

  users.extraUsers.yiran = {
    hashedPassword = "$6$ztOW/A9nn$VMZaQi9SIo09k96Y1DyhjIFN16lrB1ylf8h5rrT73jvLJHMnksgY8G26qrNhtYVSnIDN.5LrrZaaVGRgIltLz1";
    isNormalUser = true;
    uid = 1001;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}
