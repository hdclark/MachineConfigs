# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-runtime-ext
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "skip"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
## The following can also be provided by stdenv.
#    coreutils-full
#    findutils
#    diffutils
#    cmake
    bash
    wget
    vim
    ncurses
    htop
    rsync
    screen
    git
    gitAndTools.git-annex
    meld
    gnome3.gedit
    gccStdenv
    boost
    clang-tools
    clang-analyzer
    man-db
    zip
    unzip
    okular
    mupdf
    inkscape
    meshlab
    gimp
    pandoc
    libreoffice
    ffmpeg-full
    mplayer
    mpv
    youtube-dl
    openssh
    autossh
    gnuplot
    browsh
    firefox-bin
    docker
    qemu
    qemu-utils
    ntfs3g
    _9pfs
    python3
    xorg.xf86videoamdgpu
    xorg.xrandr
    dwm
    st
    dmenu
    gmrun
    imagemagick
    alsaUtils
    alsaTools
    rxvt-unicode
    mesa
    clinfo
  ];

  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  virtualisation.docker.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.startDbusSession = true;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable a default desktop environment.
  services.xserver.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm.enable = true;
  services.openssh.forwardX11 = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hal = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
    #openssh.authorizedKeys.keys = [ "ssh-dss AAAAB3Nza... hal@halclark.ca" ];
  };

  security.sudo.extraConfig = ''
    # User privilege specification
    root ALL=(ALL) ALL
    hal ALL=(ALL) NOPASSWD: ALL
  '';

  environment.variables.EDITOR = "vim";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

