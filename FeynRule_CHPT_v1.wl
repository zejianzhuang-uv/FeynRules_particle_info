(* ::Package:: *)

pdMatSF[\[Phi]_,\[Mu]_]:=pdMatScalarField[\[Phi],\[Mu]];
pdVecSF[\[Phi]_,\[Mu]_]:=pdVecScalarField[\[Phi],\[Mu]];
SFMatPro[A_,B_]:=ScalarFieldMatPro[A,B];





pdMatScalarField[\[Phi]_,\[Mu]_]:=
Module[{n=Length[\[Phi]]},
Table[del[\[Phi][[i,j]],\[Mu]],{i,n},{j,n}]];

pdVecScalarField[P_,\[Mu]_]:=
Module[{n=Length[P]},
Table[del[P[[i]],\[Mu]],{i,n}]];

ScalarFieldMatPro[A_,B_]:=
Module[{n=Length[A]},
Table[Sum[A[[i,k]]B[[k,j]],{k,n}],{i,n},{j,n}]];


ScalarPro[P_,A_,Pd_]:=
Module[{n=Length[A]},
Sum[P[[i]]A[[i,j]]Pd[[j]]//Expand,{i,n},{j,n}]];


BbarOperSFB[B1_,B2_,SF_,oper_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[k,l]]SF[[j,k]],{j,n},{k,n}],{i,n},{l,n}]];

BbarOperBSF[B1_,B2_,SF_,oper_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[j,k]] SF[[k,l]],{j,n},{k,n}],{i,n},{l,n}]];


(*BFOperatorSFBFPro[B1_,oper_,SF_,B2_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[k,l]]SF[[j,k]],{j,n},{k,n}],{i,n},{l,n}]];*)


(*BFOperatorBFSFPro[B1_,oper_,B2_,SF_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[j,k]] SF[[k,l]],{j,n},{k,n}],{i,n},{l,n}]];*)
