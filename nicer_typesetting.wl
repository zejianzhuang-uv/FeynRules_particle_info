(* ::Package:: *)

SetOptions[EvaluationNotebook[],CommonDefaultFormatTypes->{"Output"->TraditionalForm}];


(* ::Section:: *)
(*Parameter*)


MakeBoxes[gg,TraditionalForm]:="g";
MakeBoxes[Dp,TraditionalForm]:="D"
MakeBoxes[Fp,TraditionalForm]:="F"
MakeBoxes[ff,TraditionalForm]:="f"
MakeBoxes[mu,TraditionalForm]:="\[Mu]"
MakeBoxes[DD,TraditionalForm]:="D";
MakeBoxes[FF,TraditionalForm]:="F";
MakeBoxes[ga,TraditionalForm]:="\[Gamma]";


MakeBoxes[b0,TraditionalForm]:="\!\(\*SubscriptBox[\(b\), \(0\)]\)"
MakeBoxes[bF,TraditionalForm]:="\!\(\*SubscriptBox[\(b\), \(F\)]\)"
MakeBoxes[bD,TraditionalForm]:="\!\(\*SubscriptBox[\(b\), \(D\)]\)"


(* ::Section:: *)
(*Momenta*)


MakeBoxes[p1,TraditionalForm]:="\!\(\*SubscriptBox[\(p\), \(1\)]\)";
MakeBoxes[p2,TraditionalForm]:="\!\(\*SubscriptBox[\(p\), \(2\)]\)";
MakeBoxes[k1,TraditionalForm]:="\!\(\*SubscriptBox[\(k\), \(1\)]\)";
MakeBoxes[k2,TraditionalForm]:="\!\(\*SubscriptBox[\(k\), \(2\)]\)";
MakeBoxes[q1,TraditionalForm]:="\!\(\*SubscriptBox[\(q\), \(1\)]\)";


(* ::Section:: *)
(*Particle*)


MakeBoxes[pip,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(+\)]\)";
MakeBoxes[pim,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(-\)]\)";
MakeBoxes[pi0,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(0\)]\)";
MakeBoxes[Kp,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(+\)]\)";
MakeBoxes[Km,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(-\)]\)";
MakeBoxes[K0,TraditionalForm]:="\!\(\*SubscriptBox[\(K\), \(0\)]\)";
MakeBoxes[eta,TraditionalForm]:="\[Eta]";
MakeBoxes[Dp,TraditionalForm]:="\!\(\*SuperscriptBox[\(D\), \(+\)]\)";
MakeBoxes[Dm,TraditionalForm]:="\!\(\*SuperscriptBox[\(D\), \(-\)]\)";
MakeBoxes[D0,TraditionalForm]:="\!\(\*SubscriptBox[\(D\), \(0\)]\)";
MakeBoxes[Dstp,TraditionalForm]:="\!\(\*SuperscriptBox[\(D\), \(*\(+\)\)]\)";
MakeBoxes[D0st,TraditionalForm]:="\!\(\*SuperscriptBox[SubscriptBox[\(D\), \(0\)], \(*\)]\)";
MakeBoxes[Dsstp,TraditionalForm]:="\!\(\*SuperscriptBox[SubscriptBox[\(D\), \(s\)], \(*\(+\)\)]\)";
MakeBoxes[Dsp,TraditionalForm]:="\!\(\*SuperscriptBox[SubscriptBox[\(D\), \(s\)], \(+\)]\)";


MakeBoxes[pipbar,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[Pi]\), \(-\)]\)"
MakeBoxes[K0bar,TraditionalForm]:="\!\(\*OverscriptBox[SubscriptBox[\(K\), \(0\)], \(_\)]\)";
MakeBoxes[Kpbar,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(-\)]\)";
MakeBoxes[Dpbar,TraditionalForm]:="\!\(\*SuperscriptBox[\(D\), \(-\)]\)";
MakeBoxes[D0bar,TraditionalForm]:="\!\(\*OverscriptBox[SubscriptBox[\(D\), \(0\)], \(_\)]\)";
MakeBoxes[Dspbar,TraditionalForm]:="\!\(\*SuperscriptBox[SubscriptBox[\(D\), \(s\)], \(-\)]\)";
MakeBoxes[Dstpbar,TraditionalForm]:="\!\(\*SuperscriptBox[\(D\), \(\(*\)\(-\)\)]\)";
MakeBoxes[D0stbar,TraditionalForm]:="\!\(\*OverscriptBox[SuperscriptBox[SubscriptBox[\(D\), \(0\)], \(*\)], \(_\)]\)";
MakeBoxes[Dsstbar,TraditionalForm]:="\!\(\*SuperscriptBox[SubscriptBox[\(D\), \(s\)], \(\(*\)\(-\)\)]\)";


MakeBoxes[Lambda,TraditionalForm]:="\[CapitalLambda]";
MakeBoxes[Sigp,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(+\)]\)";
MakeBoxes[Sigm,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(-\)]\)";
MakeBoxes[Sig0,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[CapitalSigma]\), \(0\)]\)";
MakeBoxes[Xi0,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(0\)]\)";
MakeBoxes[Xim,TraditionalForm]:="\!\(\*SuperscriptBox[\(\[CapitalXi]\), \(-\)]\)";


(* ::Section:: *)
(*Mass*)


MakeBoxes[mpi,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Pi]\)]\)"
MakeBoxes[mK,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(K\)]\)"


MakeBoxes[mpip,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(+\)]]\)";
MakeBoxes[mpim,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(-\)]]\)";
MakeBoxes[mpi0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Pi]\), \(0\)]]\)";

MakeBoxes[mKp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(+\)]]\)";
MakeBoxes[mKm,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(-\)]]\)";
MakeBoxes[mK0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(0\)]]\)";

MakeBoxes[msu3,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(SU3\)]\)";
MakeBoxes[meta,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Eta]\)]\)";

MakeBoxes[mrho0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(0\)]]\)";
MakeBoxes[mrhop,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(+\)]]\)";
MakeBoxes[mrhom,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[Rho]\), \(-\)]]\)";

MakeBoxes[mKstp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(*\(+\)\)]]\)";
MakeBoxes[mKst0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(K\), \(*\(0\)\)]]\)";
MakeBoxes[mKstm,TraditionalForm]:="\!\(\*SuperscriptBox[\(K\), \(*\(-\)\)]\)";

MakeBoxes[mphi,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Phi]\)]\)";
MakeBoxes[mome,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[Omega]\)]\)";

MakeBoxes[mDsp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SubsuperscriptBox[\(D\), \(s\), \(+\)]]\)";
MakeBoxes[mD0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(D\), \(0\)]]\)";
MakeBoxes[mDp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(D\), \(+\)]]\)";

MakeBoxes[mp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(p\)]\)"
MakeBoxes[mn,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(n\)]\)"
MakeBoxes[mLambda,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(\[CapitalLambda]\)]\)"
MakeBoxes[mSigp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(+\)]]\)"
MakeBoxes[mSigm,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(-\)]]\)"
MakeBoxes[mSig0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalSigma]\), \(0\)]]\)"
MakeBoxes[mXim,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalXi]\), \(-\)]]\)";
MakeBoxes[mXi0,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(\[CapitalXi]\), \(0\)]]\)"
MakeBoxes[mB,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), \(B\)]\)"

MakeBoxes[mDstp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[\(D\), \(*\(+\)\)]]\)";
MakeBoxes[mD0st,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[SubscriptBox[\(D\), \(0\)], \(*\)]]\)";
MakeBoxes[mDsstp,TraditionalForm]:="\!\(\*SubscriptBox[\(m\), SuperscriptBox[SubscriptBox[\(D\), \(s\)], \(*\(+\)\)]]\)";
