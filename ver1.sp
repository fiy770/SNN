.protect
.lib 'rf018.l' TT
.unprotect
.include 'RPO_NEW.spi'
.option post acout=0 accurate


M1 vm1 vrest vdd vdd pch w=1u l=0.5u m=1
M2 gnd vthr vm1 vdd pch w=2u l=0.5u m=1
M3 vm2 vm2 vm1 vdd pch w=2u l=0.5u m=1
M4 vm2 vtau gnd gnd nch w=1u l=0.5u m=1
*****leak_current****
M11 vp2 vp1 vdd vdd pch w=0.8u l=1u m=1
M12 vp1 vp1 vdd vdd pch w=0.8u l=1u m=1
M13 vm2 v31 vp2 vdd pch w=0.8u l=1u m=1
M14 vm2 vspk gnd gnd nch w=1u l=3u m=1
M15 v31 vm2 vp1 vdd pch w=1u l=0.4u m=1
M16 v31 vm2 vi2 gnd nch w=1u l=0.4u m=1
M17 vi2 vi3 gnd gnd nch w=2u l=1u m=1
M18 v311 v311 vdd vdd pch w=1u l=0.5u m=1
M19 vspk v31 v311 vdd pch w=2u l=0.5u m=1
M20 vspk v31 vi3 gnd nch w=1u l=0.5u m=1
M21 vi3 vrf gnd gnd nch w=1u l=0.5u m=1
**M22 vimem vm2 gnd gnd nch w=1u l=0.5u m=1

Cmem vm2 gnd 1pF
Crf vspk gnd 1pF
*****adaptation******
M5 va13 v31 vdd vdd pch w=0.4u l=8u m=1
M6 va12 vadap va13 vdd pch w=2u l=1u m=1
M7 gnd vthra va12 vdd pch w=2u l=1u m=1
M8 va11 va11 va12 vdd pch w=2u l=1u m=1
M9 vm2 va11 gnd gnd nch w=2u l=1u m=1
M10 va11 valk gnd gnd nch w=2u l=1u m=2
Cadap va11 gnd 2pF
Vadap vadap gnd 1.2V 
Vthra vthra gnd 1.3v
Valk valk gnd 0.2V
*****noise_sup****
MN1 vi4 vi4 gnd gnd nch w=4u l=0.2u m=1
MN2 vi4 vn1 vdd vdd pch w=1u l=1u m=1
Mn3 vn1 vn1 vdd vdd pch w=2u l=0.2u m=1
X1 vn1 vrpoi gnd RPO_NEW
*vtest vm2 gnd 0.9v
Vsup vdd gnd 1.8V
Vthr vthr gnd 0.5V
Vtau vtau gnd 0.25V
Vrest vrest gnd 1.7V
Vrf vrf gnd 0.35V 
vi3 vi3 gnd sin 0.3 0.001 1K *1/300 noise is ok for spike
I1 vdd vm1 pulse (0nA 10nA 50ns 0 0 0.3ms 1.13ms) *0.3ms stop
Vrpoi vrpoi gnd 0.1v
*Inoise vi2 gnd sin(0.001nA 10000)
*.dc vtest 0 1.8 0.01
.op
.probe V(vm2)
.tran 1ns 40ms 
.plot V(vm2)
.probe I(M2) I(M3) I(M5) I(I1) I(M17) I(M9) I(M6) I(M7) I(M8) I(M9) I(M10) I(M11) I(M14)
.probe v(v31) I(M12) I(Cmem)
.probe V(vi4) I(MN1) I(MN2) I(MN3) 
.end
