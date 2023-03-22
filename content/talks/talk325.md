---
title: "Computational and experimental representation of simplified gas turbine bearing chamber geometries"
bookToc: false
---

# Computational and experimental representation of simplified gas turbine bearing chamber geometries

**Ahmad Attia, B Chandra, C A Toomer**

11:50 Wednesday in 4Q07.

Part of the *[Granular and multiphase flows]({{< relref "/sessions/session51" >}})* session.

## Abstract

Gas turbine engines use bearing chambers to provide support for the engine’s rotating parts. The bearings are coated in oil to enable efficient movement and to remove excess heat. However, ensuring that a bearing is sufficiently and continually coated in the correct amount of oil is difficult, resulting in an excess of oil used and losses in oil from the chamber whilst the aircraft is in flight. Similarly, the design of an efficient, minimal oil loss chamber in which to house the bearings and the oil films is a challenge due to the complex multiphase flows present in the chamber. The uncertainties in the flow behaviour and which flow patterns would be most successful involves understanding the heat transfer properties of the oil and the residence time of the oil flow molecules. Viewing the bearing chamber flows whilst the engine is operating is difficult experimentally due to the 3D nature of the flow. Also, computational fluid dynamics (CFD) modelling is not fully able to accurately predict the continuous and non-continuous nature of the flows. 
The purpose of this study is to improve the CFD modelling of bearing chamber flows and in doing so more accurately predict the residence time of the oil flow, leading to a better understanding of bearing chamber design. The first testcase in the series is a flat rectangular channel where the simplicity of the geometry assists in allowing the essential nature of the oil film development to be modelled, validated and error analyses to be conducted. The second testcase is to incline this channel  so that the effect of gravity acts on the flow motion. A corresponding experimental rig has been built to provide qualitative flow evolution as well as the validation data. Water is currently being used in both the experiment and the CFD as water has similar properties to oil and is safer. Oil will be introduced at a later stage in the project. 
The software chosen is ANSYS Fluent due to other studies where the modelling of the oils flows has been successively improved (Peduto,2015). The channel is 1.4m long with internal dimensions of 30mm height, width 50mm, and 0.6mm inlet height. The Volume of Fluid (VOF) model was selected for the multiphase flow, with water as the secondary phase and air as the primary phase. The transitional Shear Stress Transport (SST-Gamma-Reynolds-Theta) was selected for the viscosity model. The channel was initialized as air, with water entering the domain from the start of the experiment. It was observed that the pressure on the outside parts of the channel was higher than that on the inside before the start of the simulation. This was solved by patching the pressure.
Bearing chamber oil movement speed depends on several factors such as the bearing design, lubricant viscosity, operating conditions, and the bearing rotational speed. The oil movement is characterized by both rotational and axial flow, with the oil film thickness varying around the bearing circumference. Where the shaft speed was set at 9105 rpm and temperature of 100 degrees Celsius, the oil volume feed was 20 l/min. The water inlet was assigned as a velocity inlet with a magnitude of 1 m/s or a flow rate of 2 l/min, while openings were considered pressure outlets and walls were stationary and no-slip.
The rig inclination angles varied from 0 to 39 degrees with both 2D and 3D CFD cases run. Overall, the qualitative results for the 2D cases were promising, however the 3D simulation did not fully produce the Tolmien-Schlictling waves observed in the experiment. 
In conclusion, CFD simulations of the inclined plane test rig were successfully performed using Ansys Fluent. The simulation considered multiple factors such as flow uncertainties, accuracy, post-processing output requirements, and pressure patching to ensure a correct solution was achieved. The results of the simulation provided valuable insights into the flow dynamics of the inclined plane test rig and can be used for further studies.



