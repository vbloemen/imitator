(************************************************************
 *
 *                       IMITATOR
 * 
 * LIPN, Université Paris 13, Sorbonne Paris Cité (France)
 * 
 * Module description: Abstract tiles manager class to manage the tiles received in the cartography algorithms.
 * 
 * File contributors : Étienne André
 * Created           : 2016/08/15
 * Last modified     : 2016/08/30
 *
 ************************************************************)


(************************************************************)
(* Modules *)
(************************************************************)

(************************************************************)
(************************************************************)
(* Class-independent functions *)
(************************************************************)
(************************************************************)

(*------------------------------------------------------------*)
(** 'good_or_bad_constraint_union_assign good_or_bad_constraint1 good_or_bad_constraint2' performs the union of two good_or_bad_constraint, by assigning the result to the first and leaving the second unchanged *)
(*------------------------------------------------------------*)
val good_or_bad_constraint_union_assign : Result.good_or_bad_constraint -> Result.good_or_bad_constraint -> unit


(*------------------------------------------------------------*)
(** Check if a good_or_bad_constraint is sound *)
(*------------------------------------------------------------*)
val is_good_or_bad_constraint_sound : Result.good_or_bad_constraint -> bool


(*------------------------------------------------------------*)
(** Check if a parameter valuation belongs to a good_or_bad_constraint *)
(*------------------------------------------------------------*)
val pval_in_good_or_bad_constraint : PVal.pval -> Result.good_or_bad_constraint -> bool


(************************************************************)
(************************************************************)
(* Class definition *)
(************************************************************)
(************************************************************)
class virtual tilesManager:
	object

		(************************************************************)
		(* Class variables *)
		(************************************************************)


		(************************************************************)
		(* Class methods *)
		(************************************************************)

		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		(* Initialize the manager *)
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		method virtual initialize : unit
		
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		(* Get the number of results processed and stored *)
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		method virtual get_nb_results : int
		
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		(* Check if a parameter valuation belongs to the tiles *)
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		method virtual pval_in_tiles : PVal.pval -> bool

		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		(* Process a new tile, i.e., add it to the tiles *)
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		method virtual process_tile : Result.abstract_point_based_result -> unit
		
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		(* Process the result of the cartography *)
		(* If forced_coverage_option <> None, then the coverage is set to this argument; otherwise, it is computed as exepected (*** NOTE: used in Random to force the coverage to Unknown ***) *)
		(*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*)
		method virtual process_result : float -> NumConst.t -> int -> Result.bc_algorithm_termination -> Result.bc_coverage option -> Result.imitator_result

(************************************************************)
end
(************************************************************)
