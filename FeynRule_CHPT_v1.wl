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
Table[Sum[Distribute[B1[[i,j]] . oper . B2[[k,l]]]SF[[j,k]],{j,n},{k,n}],{i,n},{l,n}]];

BbarOperBSF[B1_,B2_,SF_,oper_]:=Module[{n=Length[SF]},
Table[Sum[Distribute[B1[[i,j]] . oper . B2[[j,k]]] SF[[k,l]],{j,n},{k,n}],{i,n},{l,n}]];


(*BFOperatorSFBFPro[B1_,oper_,SF_,B2_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[k,l]]SF[[j,k]],{j,n},{k,n}],{i,n},{l,n}]];*)


(*BFOperatorBFSFPro[B1_,oper_,B2_,SF_]:=Module[{n=Length[SF]},
Table[Sum[B1[[i,j]] . oper . B2[[j,k]] SF[[k,l]],{j,n},{k,n}],{i,n},{l,n}]];*)


AntiCommutator[x_,y_]:=Module[{n=Length[x],A,B},
A=Table[Sum[x[[i,j]]y[[j,k]],{j,n}],{i,n},{k,n}];
B=Table[Sum[y[[i,j]]x[[j,k]],{j,n}],{i,n},{k,n}];
Expand[A+B]];
Commutator[x_,y_]:=Module[{n=Length[x],A,B},
A=Table[Sum[x[[i,j]]y[[j,k]],{j,n}],{i,n},{k,n}];
B=Table[Sum[y[[i,j]]x[[j,k]],{j,n}],{i,n},{k,n}];
Expand[A-B]];


BaryonMatPro[B1_,B2_]:=Table[Sum[Distribute[B1[[i,j]] . B2[[j,k]]],{j,3}],{i,3},{k,3}];

MDotM[M1_,M2_]:=Table[Expand[Sum[M1[[i,k]] M2[[k,j]],{k,3}]],{i,3},{j,3}];
BDotB[B1_,B2_]:=Table[Sum[Distribute[B1[[i,j]] . B2[[j,k]]],{j,3}],{i,3},{k,3}];
BDotM[M_,B_]:=Table[Sum[B[[i,k]]M[[k,j]],{k,3}],{i,3},{j,3}];
MDotB[M_,B_]:=Table[Sum[M[[i,k]]B[[k,j]],{k,3}],{i,3},{j,3}];


BbarOperB[B1_,B2_,Oper_]:=
Module[{n=Length[B1]},
Table[Sum[Distribute[B1[[i,j]] . Oper . B2[[j,k]]],{j,n}],{i,n},{k,n}]
];
