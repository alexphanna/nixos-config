{ pkgs, ... }: 
{
  programs.mangohud = {
    enable = true;
    settings = {
      cpu_temp = true;
      cpu_power = true;
      gpu_temp = true;
      gpu_power = true;
      vram = true;
      ram = true;
      fps = true;
    };
  };
}