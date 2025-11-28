{
  programs.mangohud = {
    enable = true;
    settings = {
      cpu_temp = true;
      gpu_temp = true;
      vram = true;
      ram = true;
      fps = true;
      fps_metrics = "avg,0.01,0.001";
      output_folder = "~/Documents/mangohud";
    };
  };
}
