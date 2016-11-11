.protect
.lib 'rf018.l' TT
.unprotect
.option post acout=0 accurate


M1 vm1 vrest vdd vdd pch w=1u l=0.5u m=1
M2 gnd vthr vm1 vdd pch w=2u l=0.5u m=1
M3 vm2 vm2 vm1 vdd pch w=2u l=0.5u m=1
M4 vm2 vtau gnd gnd nch w=1u l=0.5u m=1
*****leak_current****
M11 vp2 vp1 vdd vdd pch w=1u l=1u m=1
M12 vp1 vp1 vdd vdd pch w=1.5u l=5u m=1
M13 vm2 v31 vp2 vdd pch w=1u l=1u m=1
M14 vm2 vspk gnd gnd nch w=1.5u l=5u m=1
M15 v31 vmd3 vp1 vdd pch w=1.25u l=0.18u m=1
M16 v31 vmd3 vi2 gnd nch w=0.25u l=0.18u m=1
M17 vi2 vi2 gnd gnd nch w=2u l=2u m=1
M18 v311 v311 vdd vdd pch w=1u l=0.5u m=1
M19 vspk v31 v311 vdd pch w=2u l=0.5u m=1
M20 vspk v31 vi3 gnd nch w=1u l=0.5u m=1
M21 vi3 vrf gnd gnd nch w=1u l=0.5u m=1
**M22 vimem vm2 gnd gnd nch w=1u l=0.5u m=1

Cmem vm2 gnd 1pF
Crf vspk gnd 1pF
*****adaptation******
M5 va13 v31 vdd vdd pch w=0.4u l=8u m=1
M6 va12 vadap va13 vdd pch w=0.5u l=2u m=1
M7 gnd vthra va12 vdd pch w=0.5u l=2u m=1
M8 va11 va11 va12 vdd pch w=0.5u l=2u m=1
M9 vm2 va11 gnd gnd nch w=0.5u l=2u m=1
M10 va11 valk gnd gnd nch w=0.5u l=2u m=1
Cadap va11 gnd 2pF
Vadap vadap gnd 1.2V 
Vthra vthra gnd 1.4v
Valk valk gnd 0.25V
*****differential_amp*****
MD1 vmd2 vm2 vmdi gnd nch w=0.5u l=0.3u m=1
MD2 vmd3 vthr2 vmdi gnd nch w=0.5u l=0.3u m=1
MD3 vmd3 vmd2 vp1 vdd pch w=1.2u l=0.3u m=1
MD4 vmd2 vmd2 vp1 vdd pch w=1.2u l=0.3u m=1
MDI vmdi vcur gnd gnd nch w=0.5u l=0.3u m=2
Vcur vcur gnd 0.2V
Vthr2 vthr2 gnd 0.4V

*vtest vm2 gnd 0.9v
Vsup vdd gnd 1.8V
Vthr vthr gnd 0.3V

Vtau vtau gnd 0.2V
Vrest vrest gnd 1.7V
Vrf vrf gnd 0.35V 
I1 vdd vm1 pulse (0nA 50nA 50ns 0 0 5ms 10ms)**(0nA 50nA 50ns 0 0 0.5ms 2ms) 
*.dc vtest 0 1.8 0.01
.op
.probe V(vm2)
.tran 1ns 10ms 
.plot V(vm2)
.probe I(M2) I(M3) I(M5) I(I1) I(M17) I(M9) I(M6) I(M7) I(M8) I(M9) I(M10) I(M11) I(M14)
.probe v(v31) I(M12) I(Cmem)
.probe V(vmd3) V(vmd2) I(MD1) I(MD2) 
.end
