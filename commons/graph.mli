
(* graph of polymorphic nodes *)
type 'a graph

(* graph construction *)
val create : 
  unit -> 'a graph
val add_vertex_if_not_present : 
  'a -> 'a graph -> unit
val add_edge : 
  'a -> 'a -> 'a graph -> unit
(* this will also remove its associated edges *)
val remove_vertex:
  'a -> 'a graph -> unit
(* many algorithms works by side effect on the graph so need a copy function *)
val copy: 
  'a graph -> 'a graph


(* graph access *)
val nodes:
  'a graph -> 'a list
val succ: 'a -> 'a graph -> 'a list
val pred: 'a -> 'a graph -> 'a list
val out_degree: 'a -> 'a graph -> int
val in_degree: 'a -> 'a graph -> int

(* internal vertex number *)
val ivertex: 'a -> 'a graph -> int

(* algorithms *)
val shortest_path: 
  'a -> 'a -> 'a graph -> 'a list
val transitive_closure:
  'a graph -> 'a graph
val strongly_connected_components:
  'a graph -> ('a list array * ('a, int) Hashtbl.t)
val strongly_connected_components_condensation:
  'a graph -> ('a list) graph

(* debugging support *)
val print_graph_generic :
  ?launch_gv:bool ->
  ?extra_string:string ->
  str_of_key:('a -> string) -> 
  Common.filename -> 
  'a graph -> unit

val display_with_gv:
  'a graph -> unit
val display_strongly_connected_components :
  str_of_key:('a -> string) -> ('a, int) Hashtbl.t -> 'a graph -> unit


(* internals *)

(*
val vertex_of_key : 'a -> 'a graph -> OG.V.t
val key_of_vertex : OG.V.t -> 'a graph -> 'a
*)
