(* ::Package:: *)

pim=anti[pip];
Km=anti[Kp];


\[Phi]:={{pi0/Sqrt[2]+eta/Sqrt[6],pip,Kp},
	{pim,-pi0/Sqrt[2]+eta/Sqrt[6],K0},
	{Km,K0bar,-2/Sqrt[6] eta}}


B:={{Sig0/Sqrt[2]+Lambda/Sqrt[6],Sigp,p},
	{Sigm,-Sig0/Sqrt[2]+Lambda/Sqrt[6],n},
	{Xim,Xi0,-2/Sqrt[6] Lambda}}


Bbar:=Table[anti[B[[i,j]]],{i,3},{j,3}]//Transpose
