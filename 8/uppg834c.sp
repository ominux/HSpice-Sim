Simulering av inverterare med lastkapacitans motsvarande tre inverterare och ledning

* MOSFET-modeller
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0.04 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0.05 Phi=0.8

* Matningspanning
* Td = tid fran t=0 tills logikpuls startar
* Trf = stigtid = falltid
* Tp = periodtid for puls
.Param SupplyV=3.3V Td=50p Trf=5p Tp=200p
*.Param SupplyV=3.3V Td=0p Trf=5p Tp=200p

.Options CAPTAB Post

* Transistorer, natdeklaration
MP1 ut in Vdd Vdd P W=4.4u L=1u AD='4.4u*2u' AS='4.4u*2u'
MN1 ut in 0 0 N W=2u L=1u AD='2u*2u' AS='2u*2u'

* Lastkapacitans
* CL ut 0 6.7049fF

VVdd Vdd 0 DC SupplyV
* Vin in 0 SupplyV
Vin in 0 Pulse(0 SupplyV Td Trf Trf 'TP/2-Trf' Tp)

* Transientsimulering under hel periodtid
.Tran 0.01p Tp

.End
