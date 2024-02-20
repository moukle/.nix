{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      inputs.nix-gc-env.nixosModules.default

      ./hardware-configuration.nix

      ../../modules/nixos/fonts.nix
    ];


    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
      nvidia = {
        modesetting.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        open = false;
        powerManagement.enable = false;
        nvidiaSettings = true;
      };

      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        # extraPackages = [pkgs.nvidia-vaapi.driver];
      };
      # opengl.driSupport = true;
      # opengl.driSupport32Bit = true;
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      BROWSER = "firefox";

      WLR_NO_HARDWARE_CURSORS = "1";
    };

    # Bootloader.
    boot.loader.grub.enable = true;
    # boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.devices = [ "nodev" ];
    boot.loader.grub.useOSProber = true;

    # boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";

    nix.gc = {
      automatic = true;
      dates = "weekly";
      delete_generations = "+5";
    };

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "nodeadkeys";
    };

    # Configure console keymap
    # console.keyMap = "de-latin1-nodeadkeys";
    console.keyMap = "us";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mori = {
      isNormalUser = true;
      description = "Mori";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
      packages = with pkgs; [];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users.mori = {
        imports = [./home.nix];
        _module.args.theme = import ../../theme;
      };
    };

  # Enable automatic login for the user.
  services.getty.autologinUser = "mori";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Add unstable channel
  # nixpkgs.config.packageOverrides = pkgs: {
  #   unstable = import (fetchTarball {
  #     url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  #     sha256 = "";
  #   });
  # };

  environment.systemPackages = with pkgs; [
    # system guis
    pavucontrol
    networkmanagerapplet

    # apps
    firefox
    teams-for-linux
    discord

    # games
    ddnet
    vulkan-headers
    vulkan-tools
    steam

    # cli
    python3
    ripgrep
    fzf
    yazi
    eza
    zoxide
    gh
    alejandra

    wl-clipboard
  ];



  programs.fish.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
    bluez_monitor.properties = {
      ["bluez5.enable-sbc-xq"] = true,
      ["bluez5.enable-msbc"] = true,
      ["bluez5.enable-hw-volume"] = true,
      ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
    }
    '';
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
