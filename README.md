# ESPHome XIAO Base

[![License](https://img.shields.io/badge/License-CERN--OHL--S--2.0-0099B0?style=for-the-badge&logo=opensourcehardware&logoColor=white)](/LICENSE)
[![KiCad](https://img.shields.io/badge/KiCad-v9-orange?style=for-the-badge&logo=kicad&logoColor=white&logoSize=auto)](https://www.kicad.org/)

The ESPHome XIAO Base is a custom PCB designed to be used with the [ESPHome](https://esphome.io/) firmware as a base for creating new sensors.

It was made as a carrier board for the XIAO series of microcontrollers with an OLED display and three switches while providing an easy-to-access header on the back for standard communication protocols (I²C, UART and SPI).

A cutout has also been left for the underside of the XIAO to allow access to the battery pads available on the underside of some modules (such as the [XIAO ESP32C6]).

## PCB

|           Render            |           Front           |          Back           |
| :-------------------------: | :-----------------------: | :---------------------: |
| [![PCB Render]][PCB Render] | [![PCB Front]][PCB Front] | [![PCB Back]][PCB Back] |

[PCB Render]: output/img/pcb-render.png
[PCB Front]: output/img/pcb-top.png
[PCB Back]: output/img/pcb-bottom.png

The PCB has been designed in [KiCad EDA 9.0](https://www.kicad.org/).

You can preview the project files using [KiCanvas](https://kicanvas.org/?github=https%3A%2F%2Fgithub.com%2Flambdakb%keyboard-lk7d%2Fblob%2Fmain%2Fpcb%2Flk7d-pcb.kicad_pro) directly in your browser and download the latest fabrication files for JLCPCB from the [latest release](https://github.com/lambdakb/trackball-lk7d/releases/latest/).

The exported schematic is also available under [`output/schematics`](output/schematics/).

### PCB Order

The necessary Gerber files to order the PCB are available in the [`output/fabrication/jlcpcb`](output/fabrication/jlcpcb) directory. They have been generated specifically for [JLCPCB](https://jlcpcb.com/) using [KiBot](https://kibot.readthedocs.io/). They should be compatible with other PCB manufacturers too.

Here is the list of parameters to use for the PCB order:

| Parameters                           | Value                  | Parameters                     | Value                        |
| ------------------------------------ | ---------------------- | ------------------------------ | ---------------------------- |
| **Base Material**                    | FR4                    | **Copper Weight**              | 1 oz                         |
| **Layers**                           | 2                      | **Via Covering**               | Tented                       |
| **Dimensions**                       | 40 × 30 mm             | **Min Via Hole Size**          | 0.3 mm                       |
| **PCB Thickness**                    | 1.2 or 1.6 mm          | **Board Outline Tolerance**    | ± 0.2 mm                     |
| **PCB Color** [^pcb-color]           | Black                  | **Mark on PCB** [^jlcpcb-mark] | 2D Barcode (Serial Number)   |
| **Silkscreen**                       | White                  |                                | > Printing: Number Only      |
| **Surface Finish** [^surface-finish] | Lead Free HASL or ENIG |                                | > Position: Specify Position |

[^pcb-color]: You can select any PCB color you want but some manufacturers such as JLCPCB may charge you more for uncommon combos (such as Blue PCB + ENIG Surface Finish).
[^surface-finish]: The "HASL (with lead)" option is extremely discouraged due to the risk of lead poisoning. We strongly recommend paying the premium for the "Lead Free HASL" option.
[^jlcpcb-mark]: JLCPCB specific option, a pre-configured footprint has been added for a serial number to be printed on the back of the PCB.

### BOM

| Part            | Ref.                                                         | Quantity | Remarks                                                                                                                                       |
| --------------- | ------------------------------------------------------------ | :------: | --------------------------------------------------------------------------------------------------------------------------------------------- |
| PCB             | [ESPHome XIAO Base PCB](./README.md#pcb)                     |    1     | See the previous section on how to order it.                                                                                                  |
| XIAO Controller | [XIAO ESP32C3], [XIAO ESP32C6] or [XIAO ESP32S3]             |    1     | Any ESPHome compatible XIAO controller should work.                                                                                           |
| Tactile Switch  | [SCHURTER 1301.9303]                                         |    3     | Any 6 × 6 mm thru-hole tactile switch should work. We recommend a model with a stem length of 3 mm or more.                                   |
| OLED Display    | [SSD1306 0.91" OLED Display] or [SSD1107 0.96" OLED Display] |    1     | Any SSD1306 or SSD1106 I²C based display should work. The PCB was designed to accommodate both 0.91" (128 × 32) and 0.96" (64 × 128) modules. |

[SSD1306 0.91" OLED Display]: https://www.aliexpress.com/item/32777216785.html
[SSD1107 0.96" OLED Display]: https://aliexpress.com/item/1005005814186982.html
[XIAO ESP32C3]: https://www.seeedstudio.com/Seeed-XIAO-ESP32C3-p-5431.html
[XIAO ESP32C6]: https://www.seeedstudio.com/Seeed-Studio-XIAO-ESP32C6-p-5884.html
[XIAO ESP32S3]: https://www.seeedstudio.com/XIAO-ESP32S3-p-5627.html
[SCHURTER 1301.9303]: https://www.digikey.com/en/products/detail/schurter-inc/1301-9303/3189753

## ESPHome

Example ESPHome configuration files can be found in the [`esphome`](esphome/) directory.

Two are provided for the [XIAO ESP32C6] and [XIAO ESP32S3] with two different type of OLED display.
They should be easily modifiable to fit any ESPHome compatible XIAO microcontrollers and displays.

## Notes

### Potential Modifications

- The XIAO microcontroller is currently soldered at the front of the PCB making the OLED display require a double stacked header for clearance as well as force the use of switches with extended stem. Moving it to the back of the PCB would allow for everything in the front to be made smaller but would make access to the battery pads on the back of the XIAO more difficult.
- Adding some sort of STEMMA QT / Qwiic connector to the back of the PCB would make it easier to integration some sensors.

## License

This design is licensed under the [CERN Open Hardware Licence Version 2 – Strongly Reciprocal (CERN-OHL-S-2.0)](https://opensource.org/license/cern-ohl-s).

You are free to use, modify, and distribute this design for any purpose, provided that:

- **Attribution**: Appropriate credit is given, a link to the license is provided, and any modifications are clearly indicated.
- **Reciprocity**: Any derivative works must be released under the same license.

If you are a retailer or business interested in producing or selling this design or related products, I’d love to discuss it! Please feel free to reach out so we can explore potential arrangements.
