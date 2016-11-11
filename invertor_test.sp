.prot 
.lib "rf018.l" TT
.unprot 
.parameter pw=1.2u

*M1 vout vin gnd gnd nch w=0.5u l=0.5u m=1
*M2 vout vin vdd vdd pch w=pw l=0.5u m=1
M18 v311 v311 vdd vdd pch w=1u l=0.5u m=1
M19 vspk v31 v311 vdd pch w=2u l=0.5u m=1
M20 vspk v31 vi3 gnd nch w=1u l=0.5u m=1
M21 vi3 vrf gnd gnd nch w=1u l=0.5u m=1

Vsup vdd gnd 1.8v
V31 v31 gnd 0.9v 

.op
.dc v31 0 1.8 0.01 sweep pw 0.8u 3u 0.2u
.probe V(vspk)
.end
