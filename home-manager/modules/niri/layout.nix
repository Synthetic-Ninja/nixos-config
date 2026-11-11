{ ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;

    layout = {
      # Расстояние между окнами и краями экрана
      gaps = 8;

      # Не добавляем дополнительные внешние отступы
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };

      # Отключаем стандартное выделение
      focus-ring.enable = false;

      # Тонкие рамки
      border = {
        enable = true;
        width = 0.5;

        active.gradient = {
          from = "#65D5EF";
          to = "#A78BFA";
          angle = 45;
        };

        inactive.color = "#343B4B";
      };

      center-focused-column = "never";

      default-column-width = {
        proportion = 0.5;
      };
    };

    # Скругление всех окон
    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };

        clip-to-geometry = true;
      }
    ];
  };
}
