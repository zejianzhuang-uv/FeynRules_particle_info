(* ::Package:: *)

particleInformation[SS_]:=Module[
{s={
(*pip*)S[1]->{-1,{1,1}},
(*pi0*)S[2]->{1,{1,0}},
(*pim*)-S[1]->{1,{1,-1}},
(*Kp*)S[3]->{1,{1/2,1/2}},
(*K0*)S[4]->{1,{1/2,-1/2}},
(*K0bar*)-S[4]->{1,{1/2,1/2}},
(*Km*)-S[3]->{-1,{1/2,-1/2}},
(*eta*)S[5]->{1,{0,0}},
(*p*)F[1]->{1,{1/2,1/2}},
(*n*)F[2]->{1,{1/2,-1/2}},
(*L*)F[3]->{1,{0,0}},
(*Sigp*)F[4]->{-1,{1,1}},
(*Sig0*)F[5]->{1,{1,0}},
(*Sigm*)F[6]->{1,{1,-1}},
(*Xi0*)F[7]->{1,{1/2,1/2}},
(*Xim*)F[8]->{-1,{1/2,-1/2}},
(*Dp*)S[6]->{1,{1/2,1/2}},
(*D0*)S[7]->{-1,{1/2,-1/2}},
(*Dsp*)S[8]->{1,{0,0}}
}},
Association[s][SS]
];


getIsoCG[Ch_,I_]:=Module[{f1,f2,is1,is2},
{f1,is1}=particleInformation[Ch[[1]]];
{f2,is2}=particleInformation[Ch[[2]]];
f1 f2 ClebschGordan[is1,is2,{I,is1[[2]]+is2[[2]]}]];


coupledBasis[Ch_,I_]:=Sum[
getIsoCG[Ch[[i]],I] ff[I,Ch[[i]]],{i,Length[Ch]}];


IsoID[Ch_,I_]:=
Table[ff[I,Ch[[i]]],{i,Length[Ch]}];


IsospinSpaceCGCoeff[Ch_,isobase_,I_]:=Table[
coupledBasis[isobase[[i]],I]//Coefficient[#,IsoID[Ch,I][[j]]]&,
{i,Length[isobase]},
{j,Length[Ch]}];
