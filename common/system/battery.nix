{ config, pkgs, ... }:

{
  /* ---- POWER MANAGEMENT ---- */
  # Use 1) auto-cpufreq OR 2) TLP (instead of default Gnome PPD)
  services.power-profiles-daemon.enable = false;
  
  # 1) auto-cpufreq
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  
  # 2) TLP
  /* services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "balanced";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      
      # Optional: helps save long term battery health
      # START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  }; */
  
  # Power monitoring and analysis tool
  powerManagement.powertop.enable = true; # --auto-tune enabled by default
  
  # Temperature monitoring and controlling on Intel CPUs
  services.thermald.enable = true;
}
