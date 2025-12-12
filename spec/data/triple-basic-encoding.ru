PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

DELETE {
  ?s ?rel <<( ?ppn_s ?ppn_p ?ppn_o )>> .
}
INSERT {
  ?s ?rel ?ppn .
  ?ppn a rdf:PropositionForm ;
    rdf:propositionFormSubject ?ppn_s ;
    rdf:propositionFormPredicate ?ppn_p ;
    rdf:propositionFormObject ?ppn_o .
}
WHERE {
  ?s ?rel <<( ?ppn_s ?ppn_p ?ppn_o )>> .
  OPTIONAL {
    ?existing_ppn a rdf:PropositionForm ;
      rdf:propositionFormSubject ?ppn_s ;
      rdf:propositionFormPredicate ?ppn_p ;
      rdf:propositionFormObject ?ppn_o .
  }
  BIND(COALESCE(?existing_ppn, BNODE()) as ?ppn)
}
