# LulzBot Mini

## Starting Gcode
This Gcode was copied from Cura on the computer used to control the LulzBot Mini. Use this if you are printing from your own computer, but be sure to replace the variables (shown in `{curly braces}`) if you are not using Cura.
```
;This Gcode has been generated specifically for the LulzBot Mini
;Basic settings: Layer height: {layer_height} Walls: {wall_thickness} Fill: {fill_density}
;Filament Diameter: {filament_diameter}
;Nozzle Size: {nozzle_size}
G21                          ; metric values
G90                          ; absolute positioning
M82                          ; set extruder to absolute mode
M107                         ; start with the fan off
G92 E0                       ; set extruder position to 0
M140 S{print_bed_temperature}; get bed heating up
G28                          ; home all
M109 S140                    ; set to cleaning temp and wait
G1 Z150 E-30 F75             ; suck up XXmm of filament
M109 S140                    ; heat up rest of way
G1 X45 Y174 F11520           ; move behind scraper
G1 Z0  F1200                 ; CRITICAL: set Z to height of top of scraper
G1 X45 Y174 Z-.5 F4000       ; wiping ; plunge into wipe pad
G1 X55 Y172 Z-.5 F4000       ; wiping
G1 X45 Y174 Z0 F4000         ; wiping
G1 X55 Y172 F4000            ; wiping
G1 X45 Y174 F4000            ; wiping
G1 X55 Y172 F4000            ; wiping
G1 X45 Y174 F4000            ; wiping
G1 X55 Y172 F4000            ; wiping
G1 X60 Y174 F4000            ; wiping
G1 X80 Y172 F4000            ; wiping
G1 X60 Y174 F4000            ; wiping
G1 X80 Y172 F4000            ; wiping
G1 X60 Y174 F4000            ; wiping
G1 X90 Y172 F4000            ; wiping
G1 X80 Y174 F4000            ; wiping
G1 X100 Y172 F4000           ; wiping
G1 X80 Y174 F4000            ; wiping
G1 X100 Y172 F4000           ; wiping
G1 X80 Y174 F4000            ; wiping
G1 X100 Y172 F4000           ; wiping
G1 X110 Y174 F4000           ; wiping
G1 X100 Y172 F4000           ; wiping
G1 X110 Y174 F4000           ; wiping
G1 X100 Y172 F4000           ; wiping
G1 X110 Y174 F4000           ; wiping
G1 X115 Y172 Z-0.5 F1000     ; wipe slower and bury noz in cleanish area
G1 Z10                       ; raise z
G28 X0 Y0                    ; home x and y
M109 S140                    ; set to probing temp
M204 S300                    ; Set probing acceleration
G29                          ; Probe
M204 S2000                   ; Restore standard acceleration
G1 X5 Y15 Z10 F5000          ; get out the way
G4 S1                        ; pause
M400                         ; clear buffer
M109 S{print_temperature}    ; set extruder temp and wait
G4 S15                       ; wait for bed to temp up
G1 Z2 E0 F75                 ; extrude filament back into nozzle
M140 S{print_bed_temperature}; get bed temping up during first layer
```

## Ending GCode

```
M400
M104 S0                                      ; hotend off
M140 S0                                      ; heated bed heater off (if you have it)
M107                                         ; fans off
G92 E5                                       ; set extruder to 5mm for retract on print end
G1 X5 Y5 Z156 E0 F10000                      ; move to cooling positioning
M190 R50                                     ; wait for bed to cool
M104 S0                                      ;
G1 X145 Y175 Z156 F1000                      ; move to cooling positioning
M84                                          ; steppers off
G90                                          ; absolute positioning
;{profile_string}
```
