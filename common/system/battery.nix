{ config, pkgs, ... }:

{
  /* ---- POWER MANAGEMENT ---- */
  # Select only one of these: 2) / 3) auto-cpufreq OR 4) TLP
  # instead of default 1) Gnome PPD
  
  # 1) GNOME PPD
  services.power-profiles-daemon.enable = true;
  
  # 2) auto-cpufreq from nixpkgs
  /* services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  }; */
  
  # 3) auto-cpufreq directly from Github
  # see https://github.com/AdnanHodzic/auto-cpufreq?tab=readme-ov-file#nixos
  # (requires auto-cpufreq in inputs of flake.nix)
  /* programs.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "auto";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };      
    };
  }; */
  
  # 4) TLP
  # see https://linrunner.de/tlp/support/optimizing.html
  # and https://linrunner.de/tlp/settings/processor.html
  /* services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance"; # or "performance"
      
      # Optional: helps save long term battery health
      # START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  }; */
  
  /* ---- ADDITIONAL TOOLS ---- */
  # Power monitoring and analysis tool
  powerManagement.powertop.enable = true; # --auto-tune enabled by default
  
  # Temperature monitoring and controlling on Intel CPUs
  services.thermald.enable = true;
}
