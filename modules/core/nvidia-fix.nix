{ config, pkgs, ... }:

{
  # Разрешаем несвободные пакеты
  nixpkgs.config.allowUnfree = true;

  # Включаем графический драйвер NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Использование открытых модулей ядра (может не работать на MX350,
    # лучше оставить false для этой архитектуры)
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    # Включаем меню настроек NVIDIA
    nvidiaSettings = true;

    # Самое важное: Настройка Prime
    prime = {
      #sync.enable = true; # Карта NVIDIA будет работать всегда (макс. производительность)
      # ИЛИ вместо sync используйте offload для экономии батареи (см. ниже)

      # Укажите PCI-адреса ваших видеокарт (из вашего lspci)
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };
}
