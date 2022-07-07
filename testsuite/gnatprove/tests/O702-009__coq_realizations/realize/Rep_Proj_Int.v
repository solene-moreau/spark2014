(* This file is generated by Why3's Coq-realize driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

Require Import ClassicalEpsilon.

(* range_pred can have an arbitrary value in this realization,
   provided the range is inhabited *)

Definition range_pred: Z -> Prop.
Admitted.

Definition range_inhabited : {x | range_pred x}.
Admitted.

Definition range_pred_dec: forall x: Z, {range_pred x} + {~range_pred x}.
intro r.
destruct (excluded_middle_informative (range_pred r)) as [P | P];
[left | right]; auto.
Qed.

(* Why3 goal *)
Definition t : Type.
exact (sig range_pred).
Defined.

(* Why3 goal *)
Definition to_rep : t -> Numbers.BinNums.Z.
intros [r P].
exact r.
Defined.

(* Why3 goal *)
Definition of_rep : Numbers.BinNums.Z -> t.
intro r.
destruct (range_pred_dec r) as [P | P].
exact (exist range_pred r P).
apply range_inhabited.
Defined.

(* Why3 goal *)
Definition in_range : Numbers.BinNums.Z -> Prop.
exact range_pred.
Defined.

(* Why3 goal *)
Lemma inversion_axiom : forall (x:t), ((of_rep (to_rep x)) = x).
intros [r P].
unfold to_rep, of_rep.
destruct (range_pred_dec r) as [Q | Q].
rewrite (proof_irrelevance (range_pred r) Q P).
auto.
contradict Q; auto.
Qed.

(* Why3 goal *)
Lemma range_axiom : forall (x:t), in_range (to_rep x).
intros [r P]; unfold to_rep; auto.
Qed.

(* Why3 goal *)
Lemma coerce_axiom :
  forall (x:Numbers.BinNums.Z), in_range x -> ((to_rep (of_rep x)) = x).
intros r P.
unfold to_rep, of_rep.
destruct (range_pred_dec r) as [Q | Q]; auto.
contradict Q; auto.
Qed.
