(* ::Package:: *)

pdMatField[\[Phi]_,\[Mu]_]:=
Module[{n=Length[\[Phi]]},
Table[del[\[Phi][[i,j]],\[Mu]],{i,n},{j,n}]];
pdVecField[P_,\[Mu]_]:=
Module[{n=Length[P]},
Table[del[P[[i]],\[Mu]],{i,n}]];
ScalarFieldMatPro[A_,B_]:=
Module[{n=Length[A]},
Table[Sum[A[[i,k]]B[[k,j]],{k,n}],{i,n},{j,n}]];


ScalarPro[P_,A_,Pd_]:=
Module[{n=Length[A]},
Sum[P[[i]]A[[i,j]]Pd[[j]],{i,n},{j,n}]];
